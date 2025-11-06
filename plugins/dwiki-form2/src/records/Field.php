<?php
namespace dwiki\dwikiform2\records;

use craft\db\ActiveRecord;

class Field extends ActiveRecord
{
    public static function tableName(): string
    {
        return '{{%dwikiform2_fields}}';
    }
}
