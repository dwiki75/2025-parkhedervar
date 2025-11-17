<?php
namespace dwiki\dwikiform2;

use Craft;
use craft\base\Plugin as BasePlugin;
use craft\web\UrlManager;
use craft\web\View;
use craft\events\RegisterUrlRulesEvent;
use craft\events\RegisterTemplateRootsEvent;
use yii\base\Event;

use dwiki\dwikiform2\models\Settings;
use dwiki\dwikiform2\services\FieldsService;
use dwiki\dwikiform2\listeners\EmailOverrideListener;

class Plugin extends BasePlugin
{
    public bool $hasCpSection = true;
    public bool $hasCpSettings = true;

    public function init(): void
    {
        parent::init();

        // Szolgáltatások regisztrálása
        $this->setComponents([
            'fields' => FieldsService::class,
        ]);

        // Listener
        EmailOverrideListener::register();

        // CP URL szabályok
        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_CP_URL_RULES,
            function (RegisterUrlRulesEvent $event) {
                $event->rules['dwiki-form2'] = 'dwiki-form2/default/index';
                $event->rules['dwiki-form2/default/get-all']               = 'dwiki-form2/default/get-all';
                $event->rules['dwiki-form2/default/get']                   = 'dwiki-form2/default/get';
                $event->rules['dwiki-form2/default/save']                  = 'dwiki-form2/default/save';
                $event->rules['dwiki-form2/default/delete']                = 'dwiki-form2/default/delete';
                $event->rules['dwiki-form2/default/update-order']          = 'dwiki-form2/default/update-order';
                $event->rules['dwiki-form2/default/save-placeholder-mode'] = 'dwiki-form2/default/save-placeholder-mode';
                $event->rules['dwiki-form2/default/get-form-keys']         = 'dwiki-form2/default/get-form-keys';
            }
        );

        // Frontend URL szabályok (a form beküldéshez)
        Event::on(
            UrlManager::class,
            UrlManager::EVENT_REGISTER_SITE_URL_RULES,
            function (RegisterUrlRulesEvent $event) {
                $event->rules['actions/dwiki-form2/send'] = 'dwiki-form2/send/index';
            }
        );

        // Template útvonalak beállítása
        $this->registerTemplateRoots();
    }

    /**
     * Template root regisztrálása - mindkét frontend és CP template a plugin alatt marad
     */
    private function registerTemplateRoots(): void
    {
        $pluginRoot = dirname(__DIR__);
        $frontendTemplatePath = $pluginRoot . '/templates';
        $cpTemplatePath = $this->getBasePath() . '/templates';
    
        // Frontend template rootok regisztrálása - EGYSZERŰSÍTETT
        if (Craft::$app->getRequest()->getIsSiteRequest() && is_dir($frontendTemplatePath)) {
            // Site request esetén hozzáadjuk a plugin template könyvtárat
            Event::on(
                View::class,
                View::EVENT_REGISTER_SITE_TEMPLATE_ROOTS,
                function (RegisterTemplateRootsEvent $event) use ($frontendTemplatePath) {
                    $event->roots['dwikiform2'] = $frontendTemplatePath;
                }
            );
        }
    
        // CP template rootok regisztrálása (ez maradhat)
        Event::on(
            View::class,
            View::EVENT_REGISTER_CP_TEMPLATE_ROOTS,
            function (RegisterTemplateRootsEvent $event) use ($cpTemplatePath) {
                if (is_dir($cpTemplatePath)) {
                    $event->roots['dwikiform2'] = $cpTemplatePath;
                }
            }
        );
    }

    /**
     * Beállítások modell
     */
    protected function createSettingsModel(): ?\craft\base\Model
    {
        return new Settings();
    }

    /**
     * Beállítások template
     */
    public function settingsHtml(): ?string
    {
        return Craft::$app->getView()->renderTemplate('dwikiform2/settings', [
            'settings' => $this->getSettings(),
        ]);
    }

    /**
     * CP navigációs elem
     */
    public function getCpNavItem(): ?array
    {
        $item = parent::getCpNavItem();
        $item['label'] = 'Dwiki Form 2';
        $item['url']   = 'dwiki-form2';

        // Form ikon
        $item['icon'] = '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
            <path d="M3,3V21H21V3H3M19,19H5V5H19V19Z"/>
            <path d="M7,7H17V9H7V7M7,11H17V13H7V11M7,15H14V17H7V15Z"/>
        </svg>';

        return $item;
    }

    /**
     * Plugin telepítés utáni műveletek
     */
    public function afterInstall(): void
    {
        parent::afterInstall();
        
        // Template könyvtárak ellenőrzése és létrehozása szükség esetén
        $this->ensureTemplateDirectories();
    }

    /**
     * Template könyvtárak ellenőrzése
     */
    private function ensureTemplateDirectories(): void
    {
        $pluginRoot = dirname(__DIR__);
        $frontendTemplatePath = $pluginRoot . '/templates';
        $cpTemplatePath = $this->getBasePath() . '/templates';

        // Frontend template könyvtár létrehozása
        if (!is_dir($frontendTemplatePath)) {
            @mkdir($frontendTemplatePath, 0755, true);
        }

        // CP template könyvtár létrehozása  
        if (!is_dir($cpTemplatePath)) {
            @mkdir($cpTemplatePath, 0755, true);
        }
    }

    /**
     * Helper metódus a frontend template rendereléshez
     */
    public function renderFrontendTemplate(string $template, array $variables = []): string
    {
        $view = Craft::$app->getView();
        $oldTemplateMode = $view->getTemplateMode();
        
        try {
            $view->setTemplateMode(View::TEMPLATE_MODE_SITE);
            return $view->renderTemplate('dwikiform2/' . $template, $variables);
        } finally {
            $view->setTemplateMode($oldTemplateMode);
        }
    }
}