<?php
use Craft;

if (Craft::$app->getRequest()->getIsSiteRequest()) {
    $module = Craft::$app->getModule('dwikiapp');
    if (!$module) {
        $module = new \modules\app\Module('dwikiapp');
        Craft::$app->setModule('dwikiapp', $module);
    }
    $module->bootstrap();
}