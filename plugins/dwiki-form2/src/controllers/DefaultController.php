<?php
namespace dwiki\dwikiform2\controllers;

use Craft;
use craft\web\Controller;
use yii\web\Response;
use craft\db\Query;
use craft\web\View;
use dwiki\dwikiform2\records\Field as FieldRecord;

class DefaultController extends Controller
{
    protected array|int|bool $allowAnonymous = ['frontend-form'];

    private function resolveSiteHandle(): string
    {
        // Admin nézetben próbáljuk meg lekérni a kiválasztott nyelvet
        if (!Craft::$app->getRequest()->getIsSiteRequest()) {
            $param = Craft::$app->getRequest()->getParam('site');
            if ($param) {
                $site = Craft::$app->getSites()->getSiteByHandle($param) ?? Craft::$app->getSites()->getSiteById($param);
                if ($site) {
                    return $site->handle;
                }
            }
        }
        // Frontend vagy fallback eset
        return Craft::$app->getSites()->getCurrentSite()->handle;
    }

    /**
     *  Űrlap azonosító (formKey) feloldása GET/POST-ból, default: "default"
     */
    private function resolveFormKey(): string
    {
        $request = Craft::$app->getRequest();
        $key = $request->getParam('formKey');
        if ($key === null) {
            $key = $request->getBodyParam('formKey');
        }
        if (!$key) {
            $key = 'default';
        }
        return (string)$key;
    }

    public function beforeAction($action): bool
    {
        if (!Craft::$app->getRequest()->getIsSiteRequest()) {
            Craft::$app->getView()->getTwig()->addGlobal('title', 'Űrlap mezők kezelése');

            // CP admin felületen a kiválasztott nyelv alapján override-oljuk a jelenlegi Site-ot
            $requestedSiteHandle = Craft::$app->getRequest()->getParam('site');
            if ($requestedSiteHandle && Craft::$app->getSites()->getSiteByHandle($requestedSiteHandle)) {
                Craft::$app->getSites()->setCurrentSite($requestedSiteHandle);
            }
        }
        return parent::beforeAction($action);
    }

    /**
     * CP index – itt EGYBEN adjuk át: placeholderMode, aktuális formKey, és a formKey-lista
     */
    public function actionIndex(): \yii\web\Response
    {
        $siteHandle      = $this->resolveSiteHandle();
        $formKey         = $this->resolveFormKey();
        $placeholderMode = Craft::$app->getProjectConfig()->get('dwikiForm2.placeholderMode') ?? false;
    
        // Létező űrlap-azonosítók + darabszám az adatbázisból
        $formKeysList = $this->fetchFormKeys($siteHandle);
    
        // Csak megállapítjuk, hogy a most kiválasztott formKey szerepel-e a listában
        $currentFormInList = false;
        foreach ($formKeysList as $it) {
            if ((string)$it['formKey'] === (string)$formKey) {
                $currentFormInList = true;
                break;
            }
        }
    
        return $this->renderTemplate('dwikiform2/index', [
            'placeholderMode'   => (bool)$placeholderMode,
            'formKey'           => $formKey,
            'formKeys'          => $formKeysList,
            'currentFormInList' => $currentFormInList,
        ]);
    }

    /**
     * Frontend form renderelés - ezt hívhatják meg közvetlenül a template-ből
     */
    public function actionFrontendForm(): \yii\web\Response
    {
        $formKey = $this->resolveFormKey();
        $siteHandle = $this->resolveSiteHandle();
        
        // Ha az adott site-on nincs mező ehhez a formKey-hez, próbáljunk default-ból másolni
        $existingCount = FieldRecord::find()
            ->where(['siteHandle' => $siteHandle, 'formKey' => $formKey])
            ->count();
    
        if ($existingCount === 0 && $siteHandle !== 'default') {
            $defaultFields = FieldRecord::find()
                ->where(['siteHandle' => 'default', 'formKey' => $formKey])
                ->all();
    
            foreach ($defaultFields as $orig) {
                $clone = new FieldRecord();
                $clone->label       = $orig->label;
                $clone->type        = $orig->type;
                $clone->width       = $orig->width;
                $clone->required    = $orig->required;
                $clone->options     = $orig->options;
                $clone->cssClass    = $orig->cssClass;
                $clone->placeholder = $orig->placeholder;
                $clone->siteHandle  = $siteHandle;
                $clone->formKey     = $formKey;
                $clone->sortOrder   = $orig->sortOrder;
                $clone->save();
            }
        }
    
        // Template mode explicit beállítása SITE-ra
        $view = Craft::$app->getView();
        $oldTemplateMode = $view->getTemplateMode();
        $view->setTemplateMode(View::TEMPLATE_MODE_SITE);
        
        try {
            // Template renderelés - ugyanúgy mint a debug verzióban
            $templateContent = $view->renderTemplate('dwikiform2/frontendForm', [
                'formKey' => $formKey,
                'fields' => $this->getFieldList($formKey),
                'placeholderMode' => Craft::$app->getProjectConfig()->get('dwikiForm2.placeholderMode') ?? false,
            ]);
            
            // Manuális response létrehozás (ez volt a kulcs!)
            $response = new \yii\web\Response();
            $response->content = $templateContent;
            $response->getHeaders()->set('Content-Type', 'text/html; charset=UTF-8');
            
            return $response;
            
        } finally {
            // Template mode visszaállítása
            $view->setTemplateMode($oldTemplateMode);
        }
    }
    /**
     * Frontend form renderelés  VÉGE
     */

    public function actionGetAll(): Response
    {
        $this->requireAcceptsJson();
        $formKey    = $this->resolveFormKey();
        $siteHandle = $this->resolveSiteHandle();

        // Ha az adott site-on nincs mező ehhez a formKey-hez, próbáljunk default-ból másolni
        $existingCount = FieldRecord::find()
            ->where(['siteHandle' => $siteHandle, 'formKey' => $formKey])
            ->count();

        if ($existingCount === 0 && $siteHandle !== 'default') {
            $defaultFields = FieldRecord::find()
                ->where(['siteHandle' => 'default', 'formKey' => $formKey])
                ->all();

            foreach ($defaultFields as $orig) {
                $clone = new FieldRecord();
                $clone->label       = $orig->label;
                $clone->type        = $orig->type;
                $clone->width       = $orig->width;
                $clone->required    = $orig->required;
                $clone->options     = $orig->options;
                $clone->cssClass    = $orig->cssClass;
                $clone->placeholder = $orig->placeholder;
                $clone->siteHandle  = $siteHandle;
                $clone->formKey     = $formKey;
                $clone->sortOrder   = $orig->sortOrder;
                $clone->save();
            }
        }

        return $this->asJson([
            'success' => true,
            'fields'  => $this->getFieldList($formKey)
        ]);
    }

    public function actionGet(): Response
    {
        $this->requireAcceptsJson();
        $id         = Craft::$app->getRequest()->getBodyParam('id');
        $siteHandle = $this->resolveSiteHandle();
        $formKey    = $this->resolveFormKey();

        $field = FieldRecord::findOne(['id' => $id, 'siteHandle' => $siteHandle, 'formKey' => $formKey]);

        return $field
            ? $this->asJson(['success' => true, 'field' => $field])
            : $this->asJson(['success' => false]);
    }

    public function actionSave(): Response
    {
        $this->requireAcceptsJson();
        $post          = Craft::$app->getRequest()->getBodyParams();
        $id            = $post['id'] ?? null;
        $currentHandle = Craft::$app->sites->getCurrentSite()->handle;
        $formKey       = $this->resolveFormKey();

        $field = null;
        $isNew = false;

        if ($id) {
            $existing = FieldRecord::findOne(['id' => $id]);
            if ($existing && $existing->siteHandle === $currentHandle && $existing->formKey === $formKey) {
                $field = $existing;
            }
        }

        if (!$field) {
            $isNew = true;
            $field = new FieldRecord();
            $field->siteHandle = $currentHandle;
            $field->formKey    = $formKey;
            $field->sortOrder  = (FieldRecord::find()
                ->where(['siteHandle' => $currentHandle, 'formKey' => $formKey])
                ->max('sortOrder') ?? 0) + 1;
        }

        $field->label    = (string)($post['label'] ?? '');
        $field->type     = (string)($post['type'] ?? 'text');
        $field->width    = (string)($post['width'] ?? 'w-full');
        $field->required = (int)($post['required'] ?? 0);
        $field->options  = $this->parseOptions($field->type, $post['options'] ?? '');

        if (!$field->save()) {
            return $this->asJson(['success' => false, 'errors' => $field->getErrors()]);
        }

        // Ha új mező, klónozzuk a többi site-ra is
        if ($isNew) {
            $allSites = Craft::$app->getSites()->getAllSites();
            foreach ($allSites as $site) {
                if ($site->handle === $currentHandle) {
                    continue; // ne másoljuk vissza az aktuálisra
                }

                $exists = FieldRecord::find()
                    ->where(['siteHandle' => $site->handle, 'formKey' => $formKey, 'sortOrder' => $field->sortOrder])
                    ->exists();

                if (!$exists) {
                    $clone = new FieldRecord();
                    $clone->label       = $field->label;
                    $clone->type        = $field->type;
                    $clone->width       = $field->width;
                    $clone->required    = $field->required;
                    $clone->options     = $field->options;
                    $clone->cssClass    = $field->cssClass;
                    $clone->placeholder = $field->placeholder;
                    $clone->sortOrder   = $field->sortOrder;
                    $clone->siteHandle  = $site->handle;
                    $clone->formKey     = $formKey;
                    $clone->save();
                }
            }
        }

        return $this->asJson([
            'success' => true,
            'fields'  => $this->getFieldList($formKey)
        ]);
    }

    public function actionDelete(): Response
    {
        $this->requireAcceptsJson();
        $id         = Craft::$app->getRequest()->getBodyParam('id');
        $siteHandle = $this->resolveSiteHandle();
        $formKey    = $this->resolveFormKey();

        $field = FieldRecord::findOne(['id' => $id, 'siteHandle' => $siteHandle, 'formKey' => $formKey]);

        return ($field && $field->delete())
            ? $this->asJson(['success' => true, 'fields' => $this->getFieldList($formKey)])
            : $this->asJson(['success' => false]);
    }

    public function actionUpdateOrder(): Response
    {
        $this->requireAcceptsJson();
        $order      = Craft::$app->getRequest()->getBodyParam('order');
        $siteHandle = $this->resolveSiteHandle();
        $formKey    = $this->resolveFormKey();

        if (!is_array($order)) {
            return $this->asJson(['success' => false]);
        }

        foreach ($order as $index => $id) {
            $field = FieldRecord::findOne(['id' => $id, 'siteHandle' => $siteHandle, 'formKey' => $formKey]);
            if ($field) {
                $field->sortOrder = $index + 1;
                $field->save();
            }
        }

        return $this->asJson(['success' => true, 'fields' => $this->getFieldList($formKey)]);
    }

    public function actionSavePlaceholderMode(): Response
    {
        $this->requireAcceptsJson();
        $enabled = (bool)Craft::$app->getRequest()->getBodyParam('enabled');
        Craft::$app->getProjectConfig()->set('dwikiForm2.placeholderMode', $enabled);

        return $this->asJson(['success' => true, 'enabled' => $enabled]);
    }

    private function parseOptions(string $type, string $raw): string
    {
        if ($type === 'select') {
            $lines = array_filter(array_map('trim', explode("\n", $raw)));
            return json_encode($lines, JSON_UNESCAPED_UNICODE);
        }
        if ($type === 'static') {
            return $raw;
        }
        return '';
    }

    private function getFieldList(?string $formKey = null): array
    {
        $siteHandle = $this->resolveSiteHandle();
        if ($formKey === null) {
            $formKey = $this->resolveFormKey();
        }

        $fields = FieldRecord::find()
            ->where(['siteHandle' => $siteHandle, 'formKey' => $formKey])
            ->orderBy(['sortOrder' => SORT_ASC])
            ->all();

        return array_map(function ($f) {
            return [
                'id'       => $f->id,
                'label'    => $f->label,
                'type'     => $f->type,
                'width'    => $f->width,
                'required' => $f->required,
                'options'  => $f->options,
                'placeholder' => $f->placeholder,
                'cssClass'    => $f->cssClass,
            ];
        }, $fields);
    }

    private function fetchFormKeys(string $siteHandle): array
    {
        $rows = (new Query())
            ->select(['formKey', 'cnt' => 'COUNT(*)'])
            ->from('{{%dwikiform2_fields}}')
            ->where(['siteHandle' => $siteHandle])
            ->groupBy(['formKey'])
            ->orderBy(['formKey' => SORT_ASC])
            ->all();

        return array_map(fn($r) => [
            'formKey' => (string)$r['formKey'],
            'count'   => (int)$r['cnt'],
        ], $rows);
    }

    public function actionGetFormKeys(): Response
    {
        $this->requireCpRequest();
        $siteHandle   = $this->resolveSiteHandle();
        $formKeysList = $this->fetchFormKeys($siteHandle);

        return $this->asJson([
            'success' => true,
            'items'   => $formKeysList,
        ]);
    }

    public function actionDeleteForm(): \yii\web\Response
    {
        $this->requirePostRequest();
        $this->requireCpRequest();
    
        $request    = Craft::$app->getRequest();
        $formKey    = (string)$request->getRequiredBodyParam('formKey');
        $scope      = (string)($request->getBodyParam('scope') ?: 'site'); // 'site' | 'all'
        $siteHandle = $this->resolveSiteHandle();
    
        // Törlés mező-szinten: az adott formKey-hez tartozó sorok törlése
        if ($scope === 'all') {
            $deleted = \dwiki\dwikiform2\records\Field::deleteAll(['formKey' => $formKey]);
        } else {
            $deleted = \dwiki\dwikiform2\records\Field::deleteAll([
                'formKey'    => $formKey,
                'siteHandle' => $siteHandle,
            ]);
        }
    
        Craft::$app->getSession()->setNotice("Űrlap törölve ({$deleted} mező).");
    
        // Visszairányítás a redirect hidden input alapján (lásd Twig)
        return $this->redirectToPostedUrl();
    }
}