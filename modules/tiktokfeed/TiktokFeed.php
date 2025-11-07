<?php
namespace modules\tiktokfeed;

use yii\base\Module as BaseModule;
use Craft;
use craft\helpers\FileHelper;
use craft\helpers\Json;

class TiktokFeed extends BaseModule
{
    private string $cacheFile;

    public function init(): void
    {
        parent::init();
        $this->cacheFile = Craft::$app->path->getStoragePath() . '/tiktokfeed.json';
        Craft::info('✅ TiktokFeed module loaded', __METHOD__);
    }

    public static function getFeed(string $username, int $limit = 5): array
    {
        $module = Craft::$app->getModule('tiktokfeed');
        return $module->_getFeedInternal($username, $limit);
    }

    private function _getFeedInternal(string $username, int $limit): array
    {
        // Cache check (1 óra)
        if (file_exists($this->cacheFile) && time() - filemtime($this->cacheFile) < 3600) {
            $data = Json::decode(file_get_contents($this->cacheFile));
            if (!empty($data)) {
                return $data;
            }
        }

        $apiUrl = "https://www.tokcount.com/api/uservideos/" . urlencode($username);
        $context = stream_context_create([
            'http' => [
                'method' => 'GET',
                'header' => 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
            ]
        ]);

        $response = @file_get_contents($apiUrl, false, $context);
        if (!$response) {
            Craft::warning("❌ Nem sikerült lekérni a TikTok API-t: {$apiUrl}", __METHOD__);
            return [];
        }

        $json = Json::decode($response);
        if (empty($json['body']['ItemModule'])) {
            Craft::warning("❌ A TikTok API nem adott vissza videókat: {$apiUrl}", __METHOD__);
            return [];
        }

        $items = $json['body']['ItemModule'];
        $videos = [];

        foreach (array_slice($items, 0, $limit) as $item) {
            $id = $item['id'] ?? null;
            if (!$id) continue;
            $videos[] = [
                'id' => $id,
                'url' => "https://www.tiktok.com/@{$username}/video/{$id}",
                'desc' => $item['desc'] ?? '',
            ];
        }

        FileHelper::writeToFile($this->cacheFile, Json::encode($videos));

        return $videos;
    }
}
