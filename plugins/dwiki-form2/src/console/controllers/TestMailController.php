<?php
namespace dwiki\dwikiform2\console\controllers;

use Craft;
use yii\console\Controller;

class TestMailController extends Controller
{
    public function actionIndex(): int
    {
        $result = Craft::$app->getMailer()
            ->compose()
            ->setTo('teszt@teszt.hu')
            ->setSubject('Teszt levél')
            ->setTextBody('Ez egy teszt üzenet DDEV-ről')
            ->send();

        if ($result) {
            $this->stdout("✅ Levél sikeresen elküldve\n");
            return Controller::EXIT_CODE_NORMAL;
        } else {
            $this->stderr("❌ Levél küldése sikertelen\n");
            return Controller::EXIT_CODE_ERROR;
        }
    }
}
