<?php
namespace dwiki\dwikiform2\controllers;

use Craft;
use craft\web\Controller;
use yii\web\Response;
use yii\base\Exception;
use craft\helpers\App;
use dwiki\dwikiform2\Plugin;

class SendController extends Controller
{
    protected array|int|bool $allowAnonymous = true;

    public function actionIndex(): Response
    {

        if (getenv('CRAFT_ENVIRONMENT') === 'dev' || true) { // ideiglenesen mindig
            echo "<!-- DEBUG: SendController reached -->";
            var_dump($_POST); // POST adatok kiírása
            echo "<!-- DEBUG END -->";
        }

        $this->requirePostRequest();

        $request  = Craft::$app->getRequest();
        $postData = $request->getBodyParams();

        // ---- Honeypotok ----
        $hp1 = trim((string)$request->getBodyParam('company1', ''));
        $hp2 = trim((string)$request->getBodyParam('company2', ''));
        if ($hp1 !== '' || $hp2 !== '') {
            return $this->returnFakeSuccess($request);
        }

 // ===== CÍMZETT(ek) – robusztus parse + ENV override =====

        // ---- LABEL-ek beolvasása (_labels) ----
        $labelsRaw = $request->getBodyParam('_labels', []);
        $labels = $this->normalizeLabels($labelsRaw); // assoc: handle => "Szép Címke"

        // ---- TÍPUSOK beolvasása (_types) ----
        $types = $request->getBodyParam('_types', []);
        if (!is_array($types)) {
            $types = [];
        }

        // ---- CSAK a tényleges mezők: tisztítás + szűrés ----
        $blacklist = [
            'CRAFT_CSRF_TOKEN','action','redirect',
            'site','siteUid','siteHandle','postedHandle','postedUid',
            'company1','company2',
        ];

        $fields = [];
        foreach ($postData as $key => $val) {
            if (in_array($key, $blacklist, true)) { continue; }
            if (is_string($key) && ($key === '' || $key[0] === '_')) {
                if ($key !== '_labels' && $key !== '_types') { continue; }
            }
            if ($key === '_labels' || $key === '_types') { continue; }

            if (is_array($val)) {
                $val = implode(', ', array_filter(array_map('trim', $val), fn($v) => $v !== ''));
            } else {
                $val = trim((string)$val);
            }

            if (($types[$key] ?? null) === 'checkbox') {
                $val = ($val === '1' || $val === 'on' || $val === 1 || $val === true) ? 'Igen' : 'Nem';
            }

            if ($val === '') { continue; }

            $label = $labels[$key] ?? $this->humanize($key);
            $fields[$label] = $val;
        }

        if (empty($fields)) {
            return $this->returnFakeSuccess($request);
        }

        // ---- Tárgy + site infó ----
        $site    = Craft::$app->getSites()->getCurrentSite();
        $subject = sprintf('Új űrlap beküldés &#8211; %s', $site->name);

        // ---- Email HTML render &#8211; a plugin templates mappából ----
        $view    = Craft::$app->getView();
        $oldPath = $view->getTemplatesPath();

        $pluginTemplatesDir = Plugin::getInstance()->getBasePath() . '/templates';
        $abs = $pluginTemplatesDir . '/email/dwiki-form2.twig';
        if (!file_exists($abs)) {
            throw new Exception("Email template nem található: {$abs}");
        }

        $view->setTemplatesPath($pluginTemplatesDir);

        $rows = [];
        foreach ($fields as $niceLabel => $value) {
            $rows[] = ['label' => $niceLabel, 'value' => $value];
        }

        $html = $view->renderTemplate('email/dwiki-form2', [
            'data' => $fields,
            'rows' => $rows,
        ]);

        $view->setTemplatesPath($oldPath);

        // ---- Üzenet összeállítás ----
        $message = Craft::$app->getMailer()->compose()
            ->setTo($recipientEmails)                // &#8592; tömb!
            ->setSubject($subject)
            ->setHtmlBody($html);

        // From / Sender / Return-Path &#8594; egyezzen az SMTP userrel (elsődlegesen .env-ből)
        $fromEmail = getenv('SMTP_FROM_EMAIL') ?: getenv('SMTP_USER') ?: ($mailSettings->fromEmail ?? null) ?: 'noreply@example.com';
        $fromName  = getenv('SMTP_FROM_NAME')  ?: ($mailSettings->fromName  ?: $site->name);

        $message->setFrom([$fromEmail => $fromName]);
        if (method_exists($message, 'setSender')) {
            $message->setSender($fromEmail);
        }
        if (method_exists($message, 'setReturnPath')) {
            $message->setReturnPath($fromEmail);
        }

        // Opcionális: első érvényes e-mail a beküldött adatokból &#8594; Reply-To
        foreach ($postData as $val) {
            if (is_string($val) && filter_var($val, FILTER_VALIDATE_EMAIL)) {
                $message->setReplyTo($val);
                break;
            }
        }

        // ---- Küldés (try/catch + log) ----
        try {
            $success = Craft::$app->getMailer()->send($message);
        } catch (\Throwable $e) {
            Craft::error('Mailer send() exception: ' . $e->getMessage(), __METHOD__);
            $success = false;
        }

        Craft::$app->getSession()->setFlash(
            $success ? 'success' : 'error',
            $success ? 'Az űrlap sikeresen elküldve.' : 'Hiba történt az űrlap küldésekor.'
        );

        return $this->redirect($request->getReferrer() ?: '/');
    }

    private function humanize(string $key): string
    {
        $s = preg_replace('/[_-]+/', ' ', $key);
        $s = preg_replace('/(?<!^)([A-Z])/', ' $1', $s);
        return mb_convert_case(trim($s), MB_CASE_TITLE, 'UTF-8');
    }

    private function normalizeLabels($labelsRaw): array
    {
        if (is_array($labelsRaw) && array_keys($labelsRaw) !== range(0, count($labelsRaw) - 1)) {
            return array_map(fn($v) => trim((string)$v), $labelsRaw);
        }
        if (is_string($labelsRaw)) {
            $json = json_decode($labelsRaw, true);
            if (is_array($json)) {
                return array_map(fn($v) => trim((string)$v), $json);
            }
            $out = [];
            $parts = preg_split('/\s*,\s*/', $labelsRaw);
            foreach ($parts as $p) {
                if (strpos($p, '=') !== false) {
                    [$k,$v] = array_map('trim', explode('=', $p, 2));
                    if ($k !== '' && $v !== '') $out[$k] = $v;
                } elseif (strpos($p, ':') !== false) {
                    [$k,$v] = array_map('trim', explode(':', $p, 2));
                    if ($k !== '' && $v !== '') $out[$k] = $v;
                }
            }
            if (!empty($out)) return $out;
        }
        return [];
    }

    private function returnFakeSuccess($request): Response
    {
        Craft::$app->getSession()->setFlash('success', 'Az űrlap sikeresen elküldve.');
        return $this->redirect($request->getReferrer() ?: '/');
    }
}
