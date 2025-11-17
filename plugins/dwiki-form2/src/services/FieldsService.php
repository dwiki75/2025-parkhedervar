<?php
namespace dwiki\dwikiform2\services;

use Craft;
use craft\base\Component;
use dwiki\dwikiform2\models\Field;

class FieldsService extends Component
{
    public function getAll(): array
    {
        return (new \craft\db\Query())
            ->from('{{%dwikiform2_fields}}')
            ->orderBy(['id' => SORT_ASC])
            ->all();
    }

    public function addField(string $label, string $type, string $css = ''): bool
    {
        return Craft::$app->db->createCommand()
            ->insert('{{%dwikiform2_fields}}', [
                'label' => $label,
                'type' => $type,
                'css' => $css,
                'dateCreated' => new \yii\db\Expression('NOW()'),
                'dateUpdated' => new \yii\db\Expression('NOW()'),
                'uid' => Craft::$app->security->generateRandomString(),
            ])
            ->execute() > 0;
    }

    public function deleteField(int $id): bool
    {
        return Craft::$app->db->createCommand()
            ->delete('{{%dwikiform2_fields}}', ['id' => $id])
            ->execute() > 0;
    }
}
