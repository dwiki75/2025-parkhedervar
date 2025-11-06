<?php
use craft\helpers\App;

return [
    'aliases' => [
        '@webroot' => App::env('CRAFT_WEB_ROOT') ?: dirname(__DIR__) . '/web',
        '@web'     => App::env('CRAFT_WEB_URL')  ?: 'https://2025-parkhedervar.ddev.site',
        '@modules' => dirname(__DIR__) . '/modules',
    ],

    'modules' => [
        'dwikiapp' => [
            'class' => \modules\app\Module::class,
        ],
    ],
];
