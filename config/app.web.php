<?php
use Craft;

return [
    'bootstrap' => [
        function() {
            // csak frontend oldalon töltse be a modult
            if (Craft::$app->getRequest()->getIsSiteRequest()) {
                Craft::$app->setModule('dwikiapp', new \modules\app\Module('dwikiapp'));
                
            }
        },
    ],
];
