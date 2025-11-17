<?php
namespace dwiki\dwikiform2\models;

use craft\base\Model;

class Settings extends Model
{
    // régi egynyelvűek (opcionális fallback)
    public ?string $recipientEmail = null;
    public ?string $modalTitle = null;
    public ?string $modalMessage = null;

    // ÚJ: per-site beállítások
    /** @var array<string,array{recipientEmail?:string, modalTitle?:string, modalMessage?:string}> */
    public array $i18n = [];

    public function rules(): array
    {
        return [
            [['recipientEmail', 'modalTitle', 'modalMessage'], 'string'],
            [['i18n'], 'safe'],
        ];
    }
}