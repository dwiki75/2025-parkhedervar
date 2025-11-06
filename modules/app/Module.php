<?php
namespace modules\app;

use Craft;
use yii\base\Module as BaseModule;
use Twig\TwigFilter;

class Module extends BaseModule
{
    public function init(): void
    {
        parent::init();

        $request = Craft::$app->getRequest();

        // 1) ne adminban
        if ($request->getIsCpRequest()) {
            return;
        }

        // 2) ne console/queue alatt
        if ($request->getIsConsoleRequest()) {
            return;
        }

        // innen a régi, működő kódod 👇
        $twig = Craft::$app->getView()->getTwig();

        /* --- ICONIFY FILTER --- */
        $twig->addFilter(new TwigFilter('iconify', function (?string $html): string {
            if (!$html) {
                return '';
            }

            $view = Craft::$app->getView();
            $pattern = '/\b(ikon|icon)_([a-z0-9\-]+)\b/imu';

            $out = preg_replace_callback($pattern, function ($m) use ($view) {
                $name = strtolower($m[2]);

                // keresési sorrend: heroicons, brands
                $candidates = [
                    "includes/icons/heroicons/{$name}.svg",
                    "includes/icons/brands/{$name}.svg",
                ];

                $svg = '';
                foreach ($candidates as $path) {
                    if ($view->doesTemplateExist($path)) {
                        $svg = $view->renderTemplate($path);
                        break;
                    }
                }

                if ($svg === '') {
                    return ''; // nincs ikon → üres
                }

                // adjunk class-t, ha nincs
                if (!preg_match('/<svg[^>]*\bclass=/', $svg)) {
                    $svg = preg_replace(
                        '/<svg\b(?![^>]*\bclass=)/',
                        '<svg class="inline-block align-[-0.125em] h-[1em] w-[1em]"',
                        $svg,
                        1
                    );
                } else {
                    $svg = preg_replace(
                        '/class="([^"]*)"/',
                        'class="$1 inline-block align-[-0.125em] h-[1em] w-[1em]"',
                        $svg,
                        1
                    );
                }

                return $svg;
            }, $html);

            return $out ?? $html;
        }, ['is_safe' => ['html']]));

        /* --- LINKTARGETS FILTER --- */
        $twig->addFilter(new TwigFilter('linkTargets', function (?string $html): string {
            if (!$html) {
                return '';
            }

            $currentBase = Craft::$app->getSites()->getCurrentSite()->getBaseUrl();
            $currentHost = $currentBase ? parse_url($currentBase, PHP_URL_HOST) : null;

            $pattern = '/<a\b[^>]*\bhref=(["\'])(.*?)\1[^>]*>/i';

            $result = preg_replace_callback($pattern, function ($m) use ($currentHost) {
                $fullTag = $m[0];
                $href    = $m[2];

                // belső / speciális linkek → hagyjuk
                if (
                    $href === '' ||
                    str_starts_with($href, '#') ||
                    str_starts_with($href, 'mailto:') ||
                    str_starts_with($href, 'tel:')
                ) {
                    return $fullTag;
                }

                // relatív → hagyjuk
                if (!preg_match('#^https?://#i', $href)) {
                    return $fullTag;
                }

                // ugyanaz a host → hagyjuk
                $host = parse_url($href, PHP_URL_HOST);
                if ($currentHost && $host && strcasecmp($host, $currentHost) === 0) {
                    return $fullTag;
                }

                // target hozzáadása
                if (!preg_match('/\btarget\s*=/i', $fullTag)) {
                    $fullTag = preg_replace('/>$/', ' target="_blank">', $fullTag, 1);
                }

                // rel hozzáadása / bővítése
                if (preg_match('/\brel\s*=\s*"([^"]*)"/i', $fullTag, $rm)) {
                    $rels = array_filter(array_unique(array_merge(
                        preg_split('/\s+/', trim($rm[1])) ?: [],
                        ['noopener', 'noreferrer']
                    )));
                    $fullTag = preg_replace(
                        '/\brel\s*=\s*"([^"]*)"/i',
                        'rel="'.implode(' ', $rels).'"',
                        $fullTag,
                        1
                    );
                } else {
                    $fullTag = preg_replace(
                        '/>$/',
                        ' rel="noopener noreferrer">',
                        $fullTag,
                        1
                    );
                }

                return $fullTag;
            }, $html);

            return $result ?? $html;
        }, ['is_safe' => ['html']]));
    }
}
