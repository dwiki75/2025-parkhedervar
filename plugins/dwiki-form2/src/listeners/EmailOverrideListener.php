<?php
namespace dwiki\dwikiform2\listeners;

use Craft;
use craft\mail\Message;
use dwiki\dwikiform2\Plugin;
use craft\helpers\App;

class EmailOverrideListener
{
    public static function register()
    {
        // Ez a listener most már nem a Contact Form pluginhoz kötődik
        // Helyette saját form submission logikát használhatunk
    }
    
    /**
     * E-mail küldése saját form adatokkal
     */
    public static function sendFormEmail($formData)
    {
        if (Craft::$app->request->getIsConsoleRequest()) {
            return false;
        }

        try {
            $pluginSettings = Plugin::getInstance()->getSettings();
            $mailSettings = App::mailSettings();
            $recipientEmail = $pluginSettings->recipientEmail ?: $mailSettings->fromEmail;

            $body = "<h2>Új űrlap beküldés</h2>";
            $body .= "<table cellpadding='5' cellspacing='0' border='1' style='border-collapse: collapse;'>";

            // Form adatok feldolgozása
            foreach ($formData as $key => $value) {
                if (is_array($value)) {
                    $value = implode(', ', $value);
                }
                $label = ucfirst(str_replace('_', ' ', $key));
                $body .= "<tr><td><strong>{$label}</strong></td><td>" . nl2br(htmlspecialchars($value)) . "</td></tr>";
            }

            $body .= "</table>";

            $message = new Message();
            $message->setTo($recipientEmail);
            $message->setSubject('Új űrlap beküldés');
            $message->setHtmlBody($body);
            $message->setTextBody(strip_tags($body));

            return Craft::$app->getMailer()->send($message);

        } catch (\Exception $e) {
            Craft::error('Email sending failed: ' . $e->getMessage(), __METHOD__);
            return false;
        }
    }
}