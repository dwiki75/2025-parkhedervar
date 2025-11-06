<?php
namespace dwiki\dwikiform2\migrations;

use Craft;
use craft\db\Migration;

class Install extends Migration
{
    public function safeUp(): bool
    {
        if (!$this->db->tableExists('{{%dwikiform2_fields}}')) {
            $this->createTable('{{%dwikiform2_fields}}', [
                'id' => $this->primaryKey(),

                // ➕ Ez az új mező, nincs többé külön ágban
                'siteHandle' => $this->string(50)->notNull()->defaultValue('default'),

                /**
                 * Különböző űrlapok támogatásához tároljuk, hogy melyik
                 * űrlaphoz tartozik a mező. Az alapértelmezett érték
                 * "default" – így visszafelé kompatibilis marad.
                 */
                'formKey' => $this->string(50)->notNull()->defaultValue('default'),

                'label' => $this->string()->notNull(),
                'type' => $this->string()->notNull(),
                'cssClass' => $this->string()->null(),
                'width' => $this->string()->defaultValue('w-full'),
                'placeholder' => $this->string()->null(),
                'options' => $this->text()->null(),
                'required' => $this->boolean()->defaultValue(false),
                'sortOrder' => $this->integer()->defaultValue(0),
                'dateCreated' => $this->dateTime()->notNull(),
                'dateUpdated' => $this->dateTime()->notNull(),
                'uid' => $this->uid()
            ]);
        }

        return true;
    }

    public function safeDown(): bool
    {
        $this->dropTableIfExists('{{%dwikiform2_fields}}');
        return true;
    }
}
