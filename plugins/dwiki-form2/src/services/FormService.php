<?php
namespace dwiki\dwikiform2\services;

use Craft;
use craft\base\Component;

class FormService extends Component
{
    public function getFields(): array
    {
        return [];
    }

    public function render(): string
    {
        return Craft::$app->getView()->renderTemplate('dwikiform2/_form', [
            'fields' => $this->getFields()
        ]);
    }
}
