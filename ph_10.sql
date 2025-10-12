-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-ubu2204-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pepwshmqbefosdnfmjjlmrxxaugpualonwfo` (`primaryOwnerId`),
  CONSTRAINT `fk_pepwshmqbefosdnfmjjlmrxxaugpualonwfo` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pnoiwsjuyrfqvpaxgcwbscrzlqpjdlrgpfvh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bcdagginthriotszcrwyhpvppvlkexkuoffq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_runmhesogpwpgirowvtqyaarkxzeeyrmomgp` (`dateRead`),
  KEY `fk_tduyejkxdmwtefselkkconfbhldsewequpst` (`pluginId`),
  CONSTRAINT `fk_dbommcspndzheidbchlkeujcuayckjksssfk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tduyejkxdmwtefselkkconfbhldsewequpst` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jjackaqklgtktscorpyojhhclbnclxffqsyl` (`sessionId`,`volumeId`),
  KEY `idx_ypuwqhoejgcefqjprfetgsitqotvoyievkzo` (`volumeId`),
  CONSTRAINT `fk_aokztdkcuwlpzrxnovtjplziiezectoaiybd` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gnhfkucgemgtjkkjcrcgywpdgyueyqjldcox` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_yfqtyptcdulfalfcogstswyvbwbpqzpkmieh` (`filename`,`folderId`),
  KEY `idx_kovtqxpuaxrvdxbccwdbbvsdlzyuokqcbvum` (`folderId`),
  KEY `idx_wwkejdddvzxlkxqjahrheuhubrpnvqiwtxwh` (`volumeId`),
  KEY `fk_zahbpibrzpxrbdxgtqqbvxfoxcikohftafri` (`uploaderId`),
  CONSTRAINT `fk_bweigpmbjncfbbbjzwinihqilkukwninzgfm` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iyfidktljrdqrlvbwiaitwkqdailbvufopkr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ocyhkscyfwdidlysmfazcnlhcsqrsguzyljf` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zahbpibrzpxrbdxgtqqbvxfoxcikohftafri` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES
(13,2,2,1,'Screenshot-2025-09-06-at-14.04.16.png','image/png','image',NULL,1429,717,1538675,NULL,NULL,NULL,'2025-09-25 17:52:39','2025-09-25 17:52:39','2025-09-25 17:52:39'),
(14,2,2,1,'IMG_20210828_202521.jpg','image/jpeg','image',NULL,4000,3000,3587980,NULL,NULL,NULL,'2025-09-25 17:53:44','2025-09-25 17:53:44','2025-09-25 17:53:44'),
(15,2,2,1,'AdobeStock_1545881037.jpeg','image/jpeg','image',NULL,7680,3072,4205827,NULL,NULL,NULL,'2025-09-25 17:54:33','2025-09-25 17:54:33','2025-09-25 17:54:33'),
(16,2,2,1,'AdobeStock_244182656.jpeg','image/jpeg','image',NULL,7360,4912,13660518,NULL,NULL,NULL,'2025-09-25 17:54:35','2025-09-25 17:54:35','2025-09-25 17:54:35'),
(17,2,2,1,'AdobeStock_1547200829.jpeg','image/jpeg','image',NULL,7280,4096,9067485,NULL,NULL,NULL,'2025-09-25 17:54:35','2025-09-25 17:54:35','2025-09-25 17:54:35'),
(18,1,1,1,'park_hedervar_logo.png','image/png','image',NULL,600,344,308861,NULL,NULL,NULL,'2025-09-27 06:54:07','2025-09-27 06:54:07','2025-09-27 06:54:07'),
(19,2,2,NULL,'pico_DJI_20250703153341_0290_D.jpg','image/jpeg','image',NULL,1980,1320,943684,NULL,NULL,NULL,'2025-09-26 08:21:14','2025-09-29 06:10:02','2025-09-29 06:10:02'),
(20,2,2,NULL,'pico_DJI_20250703154444_0332_D.jpg','image/jpeg','image',NULL,1980,1320,938850,NULL,NULL,NULL,'2025-09-26 08:21:14','2025-09-29 06:10:02','2025-09-29 06:10:02'),
(21,2,2,NULL,'DSC07726.jpg','image/jpeg','image',NULL,1280,853,435344,NULL,NULL,NULL,'2025-09-26 08:21:35','2025-09-29 06:10:02','2025-09-29 06:10:02'),
(26,1,1,1,'park-panzio_logo.jpg','image/jpeg','image',NULL,1095,806,145949,NULL,NULL,NULL,'2025-09-29 13:32:07','2025-09-29 13:32:07','2025-09-29 13:32:07'),
(28,1,5,1,'DSC07726.jpg','image/jpeg','image',NULL,1280,853,435525,NULL,NULL,NULL,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-03 07:28:48'),
(29,1,5,1,'pico_DJI_20250703153341_0290_D.jpg','image/jpeg','image',NULL,1980,1320,944121,NULL,NULL,NULL,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-03 07:28:48'),
(30,1,5,1,'pico_DJI_20250703154444_0332_D.jpg','image/jpeg','image',NULL,1980,1320,938972,NULL,NULL,NULL,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-03 07:28:48'),
(31,1,5,1,'DSC07853_thalia.jpg','image/jpeg','image',NULL,1280,853,340457,NULL,NULL,NULL,'2025-10-03 07:29:25','2025-10-03 07:29:25','2025-10-03 07:29:25'),
(32,1,5,1,'DJI_20250723140426_0500_D.jpg','image/jpeg','image',NULL,1280,853,548405,NULL,NULL,NULL,'2025-10-03 07:29:37','2025-10-03 07:29:37','2025-10-03 07:29:37'),
(41,1,5,1,'hajo_fotoshop_moibil.jpg','image/jpeg','image',NULL,1200,675,304578,NULL,NULL,NULL,'2025-10-03 19:05:51','2025-10-03 19:05:51','2025-10-03 19:05:51'),
(42,1,5,1,'hajo_ocean_full_hd.jpg','image/jpeg','image',NULL,1920,1080,634318,NULL,NULL,NULL,'2025-10-03 19:05:51','2025-10-03 19:05:51','2025-10-03 19:05:51'),
(43,1,5,1,'a2f65294-6002-4e56-85a9-ae87e8bdefe7.png','image/png','image',NULL,1536,1024,2376035,NULL,NULL,NULL,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-03 19:05:52'),
(44,1,5,1,'minta.jpg','image/jpeg','image',NULL,1200,1147,377040,NULL,NULL,NULL,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-03 19:05:52'),
(53,2,2,1,'hajo_ocean_full_hd.jpg','image/jpeg','image',NULL,1920,1080,634318,NULL,NULL,NULL,'2025-10-04 09:54:05','2025-10-04 09:54:05','2025-10-04 09:54:05'),
(54,2,2,1,'pico_DSC07230.jpg','image/jpeg','image',NULL,1980,1320,1220281,NULL,NULL,NULL,'2025-10-06 10:43:21','2025-10-06 10:43:21','2025-10-06 10:43:21'),
(66,1,5,1,'DJI_0948.jpg','image/jpeg','image',NULL,1200,1802,642608,NULL,NULL,NULL,'2025-10-07 10:41:52','2025-10-07 10:41:52','2025-10-07 10:41:52'),
(68,1,6,1,'et2.doc','application/msword','word',NULL,NULL,NULL,19456,NULL,NULL,NULL,'2025-10-07 12:47:35','2025-10-07 12:47:35','2025-10-07 12:47:35'),
(72,1,6,1,'et2.txt','text/plain','text',NULL,NULL,NULL,282,NULL,NULL,NULL,'2025-10-07 12:58:50','2025-10-07 12:55:28','2025-10-07 12:58:50'),
(75,1,6,1,'et2_2025-10-07-125847_wwrw.txt','text/plain','text',NULL,NULL,NULL,282,NULL,0,0,'2025-10-07 12:58:47','2025-10-07 12:58:47','2025-10-07 12:58:47'),
(77,1,6,1,'heti_menu_2025_10_06.txt','text/plain','text',NULL,NULL,NULL,292,NULL,NULL,NULL,'2025-10-07 13:43:21','2025-10-07 13:43:21','2025-10-07 13:43:21');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text DEFAULT NULL,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_gepgatmwuzmpwpifxywdtpxtqbhstnkfkfjr` (`siteId`),
  CONSTRAINT `fk_gepgatmwuzmpwpifxywdtpxtqbhstnkfkfjr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qcvgqbnaauyzysbrropfrgercjnylyflsbls` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
INSERT INTO `assets_sites` VALUES
(13,1,NULL),
(13,2,NULL),
(14,1,NULL),
(14,2,NULL),
(15,1,NULL),
(15,2,NULL),
(16,1,NULL),
(16,2,NULL),
(17,1,NULL),
(17,2,NULL),
(18,1,NULL),
(18,2,NULL),
(19,1,NULL),
(19,2,NULL),
(20,1,NULL),
(20,2,NULL),
(21,1,NULL),
(21,2,NULL),
(26,1,NULL),
(26,2,NULL),
(28,1,NULL),
(28,2,NULL),
(29,1,NULL),
(29,2,NULL),
(30,1,NULL),
(30,2,NULL),
(31,1,NULL),
(31,2,NULL),
(32,1,NULL),
(32,2,NULL),
(41,1,NULL),
(41,2,NULL),
(42,1,NULL),
(42,2,NULL),
(43,1,NULL),
(43,2,NULL),
(44,1,NULL),
(44,2,NULL),
(53,1,NULL),
(53,2,NULL),
(54,1,NULL),
(54,2,NULL),
(66,1,NULL),
(66,2,NULL),
(68,1,NULL),
(68,2,NULL),
(72,1,NULL),
(72,2,NULL),
(75,1,NULL),
(75,2,NULL),
(77,1,NULL),
(77,2,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int(11) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aiblbmqepegydgxanuoikglgnpyltipgttzh` (`userId`),
  CONSTRAINT `fk_aiblbmqepegydgxanuoikglgnpyltipgttzh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulkopevents`
--

DROP TABLE IF EXISTS `bulkopevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulkopevents` (
  `key` char(10) NOT NULL,
  `senderClass` varchar(255) NOT NULL,
  `eventName` varchar(255) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`key`,`senderClass`,`eventName`),
  KEY `idx_sjjsjlbkpruzdkutxirtkkskfhrbzrthozsy` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulkopevents`
--

LOCK TABLES `bulkopevents` WRITE;
/*!40000 ALTER TABLE `bulkopevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulkopevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ioxmbqfcmvubpjfgoqryntqixhkedullbakd` (`groupId`),
  KEY `fk_jioqxnbgsgoyqrtniuaejtezwjjqqeoexdpr` (`parentId`),
  CONSTRAINT `fk_fiemlmviqowcnpmvmcpjtibuqhcxbbaacekd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jioqxnbgsgoyqrtniuaejtezwjjqqeoexdpr` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vxfgyhownfpctrnmqdgfhhnskpshhmkagunj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nrxqiriceocteaartswuvjkjqxoejungktom` (`name`),
  KEY `idx_lumbbaplzxltpcdgpkjbyxjnajwwyfbhhdab` (`handle`),
  KEY `idx_ijpmejzdebjvreeqqjhkhpjhfzvkihracsbw` (`structureId`),
  KEY `idx_qddpprjkzehyfklpcpunpecklmcfpiemhlfs` (`fieldLayoutId`),
  KEY `idx_nalsvedkrrbsfbcyhdpyrrlqnjhcaahbhtjc` (`dateDeleted`),
  CONSTRAINT `fk_etuaqblphwppxdigitljvigkhjgopvypqovz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ufytqzkndaxqabyjknzqkmohvbtfolvysspl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gfhntblpbehhjbnrsbvtizrgfuphubfzksly` (`groupId`,`siteId`),
  KEY `idx_sexnfavblhjfzswslvkchloafwxeabfynznb` (`siteId`),
  CONSTRAINT `fk_jgiuljcoqimgkqecjyhvibgjwrwpgrekewbb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kvrdoqblmbnyuhtrvlfdfteukpcifmuuerlk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_rlznvezsdswpxweyhxqbdwjbretiwkeqtqwb` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cufngidumvgfzxolavvqlpjeavkyfykwoagv` (`siteId`),
  KEY `fk_knkwkexkeyrmzitvqsfdrnedurzqmgovjjsz` (`userId`),
  CONSTRAINT `fk_cufngidumvgfzxolavvqlpjeavkyfykwoagv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_knkwkexkeyrmzitvqsfdrnedurzqmgovjjsz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_sntwyvbkyhgnjqgbpsnogckyjswjdtnzubtk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES
(2,1,'postDate','2025-09-23 16:47:45',0,1),
(2,1,'slug','2025-09-23 16:47:40',0,1),
(2,1,'title','2025-09-23 16:47:40',0,1),
(2,1,'uri','2025-09-23 16:47:40',0,1),
(2,2,'postDate','2025-09-23 16:47:45',1,1),
(2,2,'slug','2025-09-23 16:47:40',1,1),
(2,2,'title','2025-09-23 16:47:40',1,1),
(2,2,'uri','2025-09-23 16:47:40',1,1),
(4,1,'postDate','2025-09-23 16:47:56',0,1),
(4,1,'slug','2025-09-23 16:47:53',0,1),
(4,1,'title','2025-09-23 16:47:53',0,1),
(4,1,'uri','2025-09-23 16:47:53',0,1),
(4,2,'postDate','2025-09-23 16:47:56',1,1),
(4,2,'slug','2025-09-23 16:47:53',1,1),
(4,2,'title','2025-09-23 16:47:53',1,1),
(4,2,'uri','2025-09-23 16:47:53',1,1),
(6,1,'postDate','2025-09-23 16:48:09',0,1),
(6,1,'slug','2025-09-23 16:48:02',0,1),
(6,1,'title','2025-09-23 16:48:02',0,1),
(6,1,'uri','2025-09-23 16:48:02',0,1),
(6,2,'postDate','2025-09-23 16:48:09',1,1),
(6,2,'slug','2025-09-23 16:48:02',1,1),
(6,2,'title','2025-09-23 16:48:02',1,1),
(6,2,'uri','2025-09-23 16:48:02',1,1),
(8,1,'postDate','2025-09-23 16:48:24',0,1),
(8,1,'slug','2025-09-23 16:48:15',0,1),
(8,1,'title','2025-09-23 16:48:15',0,1),
(8,1,'uri','2025-09-23 16:48:15',0,1),
(8,2,'postDate','2025-09-23 16:48:24',1,1),
(8,2,'slug','2025-09-23 16:48:15',1,1),
(8,2,'title','2025-09-23 16:48:15',1,1),
(8,2,'uri','2025-09-23 16:48:15',1,1),
(22,1,'postDate','2025-09-29 08:33:59',0,1),
(22,1,'status','2025-09-29 08:33:59',0,1),
(22,1,'title','2025-10-06 10:43:25',0,1),
(22,2,'postDate','2025-09-29 08:33:59',1,1),
(22,2,'status','2025-09-29 08:33:59',1,1),
(22,2,'title','2025-10-06 10:43:25',1,1),
(23,1,'postDate','2025-09-29 08:33:59',0,1),
(23,1,'status','2025-09-29 08:33:59',0,1),
(23,1,'title','2025-10-06 10:43:25',0,1),
(23,2,'postDate','2025-09-29 08:33:59',1,1),
(23,2,'status','2025-09-29 08:33:59',1,1),
(23,2,'title','2025-10-06 10:43:25',1,1),
(24,1,'postDate','2025-09-29 08:38:29',0,1),
(24,1,'status','2025-09-29 08:38:29',0,1),
(24,1,'title','2025-10-06 10:43:25',0,1),
(24,2,'postDate','2025-09-29 08:38:29',1,1),
(24,2,'status','2025-09-29 08:38:29',1,1),
(24,2,'title','2025-10-06 10:43:25',1,1),
(25,1,'postDate','2025-09-29 09:20:25',0,1),
(25,1,'status','2025-09-29 09:20:25',0,1),
(25,1,'title','2025-10-06 10:43:25',0,1),
(25,2,'postDate','2025-09-29 09:20:25',1,1),
(25,2,'status','2025-09-29 09:20:25',1,1),
(25,2,'title','2025-10-06 10:43:25',1,1),
(27,1,'postDate','2025-10-03 07:30:36',0,1),
(27,1,'slug','2025-10-03 07:29:55',0,1),
(27,1,'title','2025-10-03 07:29:55',0,1),
(27,1,'uri','2025-10-03 07:29:55',0,1),
(27,2,'postDate','2025-10-03 07:30:36',1,1),
(27,2,'slug','2025-10-03 07:29:55',1,1),
(27,2,'title','2025-10-03 07:29:55',1,1),
(27,2,'uri','2025-10-03 07:29:55',1,1),
(35,1,'postDate','2025-10-03 07:31:26',0,1),
(35,1,'slug','2025-10-03 07:31:19',0,1),
(35,1,'title','2025-10-03 07:31:19',0,1),
(35,1,'uri','2025-10-03 07:31:19',0,1),
(35,2,'postDate','2025-10-03 07:31:26',1,1),
(35,2,'slug','2025-10-03 07:31:19',1,1),
(35,2,'title','2025-10-03 07:31:19',1,1),
(35,2,'uri','2025-10-03 07:31:19',1,1),
(37,1,'postDate','2025-10-03 07:32:08',0,1),
(37,1,'slug','2025-10-03 07:31:34',0,1),
(37,1,'title','2025-10-03 07:31:34',0,1),
(37,1,'uri','2025-10-03 07:31:34',0,1),
(37,2,'postDate','2025-10-03 07:32:08',1,1),
(37,2,'slug','2025-10-03 07:31:34',1,1),
(37,2,'title','2025-10-03 07:31:34',1,1),
(37,2,'uri','2025-10-03 07:31:34',1,1),
(39,1,'postDate','2025-10-03 07:32:32',0,1),
(39,1,'slug','2025-10-03 07:32:15',0,1),
(39,1,'title','2025-10-03 07:32:15',0,1),
(39,1,'uri','2025-10-03 07:32:15',0,1),
(39,2,'postDate','2025-10-03 07:32:32',1,1),
(39,2,'slug','2025-10-03 07:32:15',1,1),
(39,2,'title','2025-10-03 07:32:15',1,1),
(39,2,'uri','2025-10-03 07:32:15',1,1),
(63,1,'postDate','2025-10-07 09:23:02',0,1),
(63,1,'slug','2025-10-07 09:22:25',0,1),
(63,1,'title','2025-10-07 09:22:25',0,1),
(63,1,'uri','2025-10-07 09:22:25',0,1),
(63,2,'postDate','2025-10-07 09:23:02',1,1),
(63,2,'slug','2025-10-07 09:22:25',1,1),
(63,2,'title','2025-10-07 09:22:25',1,1),
(63,2,'uri','2025-10-07 09:22:25',1,1),
(65,1,'postDate','2025-10-07 10:42:34',0,1),
(65,1,'slug','2025-10-07 10:42:29',0,1),
(65,1,'title','2025-10-07 10:42:31',0,1),
(65,1,'uri','2025-10-07 10:42:29',0,1),
(65,2,'postDate','2025-10-07 10:42:34',1,1),
(65,2,'slug','2025-10-07 10:42:29',1,1),
(65,2,'title','2025-10-07 10:42:31',1,1),
(65,2,'uri','2025-10-07 10:42:29',1,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_hefydecleejqghuschiecvohdmoqqupbxuyh` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hqikwwqgbhurxowucgshgjvtolpcresebzru` (`siteId`),
  KEY `fk_bossqwxvdzwyabkvfqcvygeluaealuagjbze` (`fieldId`),
  KEY `fk_oqbbwhxxfpvofxosmqrecprbwvtimgkzjobg` (`userId`),
  CONSTRAINT `fk_bossqwxvdzwyabkvfqcvygeluaealuagjbze` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hqikwwqgbhurxowucgshgjvtolpcresebzru` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mqvuqkylhvvhidculueqytylgalcvlnajrdf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oqbbwhxxfpvofxosmqrecprbwvtimgkzjobg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES
(2,1,3,'4bcb5fac-022c-4683-8473-1324831488f9','2025-09-23 16:47:45',0,1),
(2,2,3,'4bcb5fac-022c-4683-8473-1324831488f9','2025-09-23 16:47:45',1,1),
(4,1,3,'4bcb5fac-022c-4683-8473-1324831488f9','2025-09-23 16:47:56',0,1),
(4,2,3,'4bcb5fac-022c-4683-8473-1324831488f9','2025-09-23 16:47:56',1,1),
(6,1,2,'8c4dad14-33e1-4b9f-9b44-a65e51756aff','2025-09-23 16:48:05',0,1),
(6,2,1,'e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8','2025-09-23 16:48:09',1,1),
(6,2,2,'8c4dad14-33e1-4b9f-9b44-a65e51756aff','2025-09-23 16:48:09',1,1),
(6,2,3,'648f1037-f818-4de3-a52c-1ede9fe8db3f','2025-09-23 16:48:09',1,1),
(6,2,4,'e436c514-bcfd-4864-861d-b2a78fea0fb6','2025-09-23 16:48:09',1,1),
(8,1,2,'8c4dad14-33e1-4b9f-9b44-a65e51756aff','2025-09-23 16:48:21',0,1),
(8,1,4,'e436c514-bcfd-4864-861d-b2a78fea0fb6','2025-09-23 16:48:17',0,1),
(8,2,1,'e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8','2025-09-23 16:48:24',1,1),
(8,2,2,'8c4dad14-33e1-4b9f-9b44-a65e51756aff','2025-09-23 16:48:24',1,1),
(8,2,3,'648f1037-f818-4de3-a52c-1ede9fe8db3f','2025-09-23 16:48:24',1,1),
(8,2,4,'e436c514-bcfd-4864-861d-b2a78fea0fb6','2025-09-23 16:48:24',1,1),
(10,1,11,'a42c773a-d749-40e5-bae8-628487af6dd5','2025-10-07 13:43:26',0,1),
(22,1,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-10-06 10:43:25',0,1),
(22,1,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-10-06 10:43:25',0,1),
(22,1,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-10-06 10:43:25',0,1),
(22,2,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-09-29 08:33:59',1,1),
(22,2,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-09-29 08:33:59',1,1),
(22,2,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-09-29 08:33:59',1,1),
(23,1,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-10-06 10:43:25',0,1),
(23,1,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-10-06 10:43:25',0,1),
(23,1,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-10-06 10:43:25',0,1),
(23,2,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-09-29 08:33:59',1,1),
(23,2,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-09-29 08:33:59',1,1),
(23,2,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-09-29 08:33:59',1,1),
(24,1,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-10-06 10:43:25',0,1),
(24,1,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-10-06 10:43:25',0,1),
(24,1,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-10-06 10:43:25',0,1),
(24,2,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-09-29 08:38:29',1,1),
(24,2,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-09-29 08:38:29',1,1),
(24,2,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-09-29 08:38:29',1,1),
(25,1,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-10-06 10:43:25',0,1),
(25,1,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-10-06 10:43:25',0,1),
(25,1,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-10-06 10:43:25',0,1),
(25,2,3,'8096a1a7-c3a2-493d-9527-a89f29bdf4e7','2025-09-29 09:20:25',1,1),
(25,2,3,'b743f491-f68a-48eb-9db6-ad3f6d50575d','2025-09-29 09:20:25',1,1),
(25,2,3,'badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b','2025-09-29 09:20:25',1,1),
(27,1,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:30:27',0,1),
(27,1,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:44',0,1),
(27,2,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:30:36',1,1),
(27,2,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:44',1,1),
(35,1,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:31:09',0,1),
(35,1,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:52',0,1),
(35,2,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:31:26',1,1),
(35,2,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:52',1,1),
(37,1,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:32:03',0,1),
(37,1,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:59',0,1),
(37,2,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:32:08',1,1),
(37,2,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:43:59',1,1),
(39,1,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:32:31',0,1),
(39,1,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:44:07',0,1),
(39,2,3,'6755a832-4602-473a-a932-b6633c4cf009','2025-10-03 07:32:32',1,1),
(39,2,7,'755d6114-457b-46a8-9106-04c302188c53','2025-10-06 10:44:07',1,1),
(63,1,2,'80238b96-825c-41e1-bf26-1c3226867f6a','2025-10-07 09:22:10',0,1),
(63,1,7,'0ec750be-83ed-48c0-b4aa-56c3ac0085db','2025-10-07 09:21:59',0,1),
(63,1,8,'e4bd36ac-58eb-4d56-bcff-ea00f775ad90','2025-10-07 09:22:46',0,1),
(63,2,2,'80238b96-825c-41e1-bf26-1c3226867f6a','2025-10-07 09:23:02',1,1),
(63,2,7,'0ec750be-83ed-48c0-b4aa-56c3ac0085db','2025-10-07 09:23:02',1,1),
(63,2,8,'e4bd36ac-58eb-4d56-bcff-ea00f775ad90','2025-10-07 09:23:02',1,1),
(63,2,10,'9068048e-5207-4d70-a037-d6f60948fa59','2025-10-07 09:23:02',1,1),
(65,1,7,'0ec750be-83ed-48c0-b4aa-56c3ac0085db','2025-10-07 10:41:54',0,1),
(65,1,8,'e4bd36ac-58eb-4d56-bcff-ea00f775ad90','2025-10-07 10:42:20',0,1),
(65,1,10,'9068048e-5207-4d70-a037-d6f60948fa59','2025-10-07 10:41:03',0,1),
(65,2,2,'80238b96-825c-41e1-bf26-1c3226867f6a','2025-10-07 10:42:34',1,1),
(65,2,7,'0ec750be-83ed-48c0-b4aa-56c3ac0085db','2025-10-07 10:42:34',1,1),
(65,2,8,'e4bd36ac-58eb-4d56-bcff-ea00f775ad90','2025-10-07 10:42:34',1,1),
(65,2,10,'9068048e-5207-4d70-a037-d6f60948fa59','2025-10-07 10:42:34',1,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentblocks`
--

DROP TABLE IF EXISTS `contentblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contentblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_njzdwvpswtacwvsxsvykmzvspfvvqjpotyin` (`primaryOwnerId`),
  KEY `idx_iezrinbkbvoisdwnhnobpjqvgvdwwcoaxspi` (`fieldId`),
  CONSTRAINT `fk_dgdfjthldjrufsmfxsumhjnwytrjgzilkdgb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dimhdwljyxyiuwgiwhcxuijjmkamytbuhjke` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wdrsxwlxrxhbdpoemlkrdfnqyyuouuhrfnpk` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentblocks`
--

LOCK TABLES `contentblocks` WRITE;
/*!40000 ALTER TABLE `contentblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `contentblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_fmjbqjpoemqgvgznocwajnfdmnkmfdcmgyol` (`userId`),
  CONSTRAINT `fk_fmjbqjpoemqgvgznocwajnfdmnkmfdcmgyol` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`traces`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ivoxtezbmyzltrhzvcdzakpihhelxxotadkk` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_amgnnrlysyfkfghmevuijsevuzeglbfqqgdh` (`creatorId`,`provisional`),
  KEY `idx_zgdbcpajxikhfppkcarwrbqjzipwvrjhopof` (`saved`),
  KEY `fk_zboesgyurzbjkvaoowxlphrdpbvgejdvhakj` (`canonicalId`),
  CONSTRAINT `fk_dhwojiwislqsducobvexvexvffhvpujeiicb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zboesgyurzbjkvaoowxlphrdpbvgejdvhakj` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_uokqigccwimqlyjbreipfilmpkdrcdddrlhn` (`elementId`,`timestamp`,`userId`),
  KEY `fk_jcgzayuitdzityllsnryopxwndfrzmdepngx` (`userId`),
  KEY `fk_xvshdvbmvnebaofhtckvgeoqfnzlwqngbqnd` (`siteId`),
  KEY `fk_nknijhlggelvkyzextskpvsgoijbvswxneaq` (`draftId`),
  CONSTRAINT `fk_jcgzayuitdzityllsnryopxwndfrzmdepngx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nknijhlggelvkyzextskpvsgoijbvswxneaq` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpyljcdzdykcccnaawkajhebrwzjwealuctk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvshdvbmvnebaofhtckvgeoqfnzlwqngbqnd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES
(2,1,1,NULL,'save','2025-09-23 16:47:45'),
(4,1,1,NULL,'save','2025-09-23 16:47:56'),
(6,1,1,NULL,'save','2025-09-23 16:48:09'),
(8,1,1,NULL,'save','2025-09-23 16:48:24'),
(10,1,1,NULL,'edit','2025-10-07 13:43:23'),
(10,1,1,NULL,'save','2025-10-07 13:43:26'),
(15,1,1,NULL,'save','2025-09-25 18:24:33'),
(27,1,1,NULL,'edit','2025-10-06 10:43:42'),
(27,1,1,NULL,'save','2025-10-06 10:43:44'),
(35,1,1,NULL,'edit','2025-10-06 10:43:50'),
(35,1,1,NULL,'save','2025-10-06 10:43:52'),
(37,1,1,NULL,'edit','2025-10-06 10:43:58'),
(37,1,1,NULL,'save','2025-10-06 10:43:59'),
(39,1,1,NULL,'edit','2025-10-06 10:44:06'),
(39,1,1,NULL,'save','2025-10-06 10:44:07'),
(63,1,1,NULL,'save','2025-10-07 09:23:02'),
(65,1,1,NULL,'save','2025-10-07 10:42:34');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pmbcwhbgrnnnmxvuclvvyazcjmpsgkrdoota` (`dateDeleted`),
  KEY `idx_hfrtjabvxgrshdtsemuykylmpjcryijkcska` (`fieldLayoutId`),
  KEY `idx_uvzcucfqgdflnkafdpkqbxxtkzdittifxhsq` (`type`),
  KEY `idx_ctmndbbnwlgrkbyumfjyeqnkqgcgefgvixxq` (`enabled`),
  KEY `idx_gftjwzsbnflfqiryoxyfbjgbbbinijcdwmkg` (`canonicalId`),
  KEY `idx_zcxjbekhbzztmuoavvphxfeyquioscyletfd` (`archived`,`dateCreated`),
  KEY `idx_ebfuxdvihnhfwfmydpvfkpuonvlaeovblcyu` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_bkdovnugyylspimestlandmyollgwybttkpq` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_djzdioxezufupvmednucrbwdvblozepsrgmw` (`draftId`),
  KEY `fk_ruzcxefgbbrkxsgrmmisdgeywlvsuaddjkxi` (`revisionId`),
  CONSTRAINT `fk_djzdioxezufupvmednucrbwdvblozepsrgmw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jptibotrahgsasmenwgbxxzfvetciasdbejl` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_obtvyspmvabcxulgxtfpuoedeqhejsdlgatr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ruzcxefgbbrkxsgrmmisdgeywlvsuaddjkxi` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-09-21 10:33:25','2025-09-21 10:33:25',NULL,NULL,NULL,'08c61689-9030-46c9-a8d4-20f20c6cfac6'),
(2,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-09-23 16:47:34','2025-09-23 16:47:45',NULL,NULL,NULL,'96da2796-cf20-4098-81a3-c1c7ff93ff79'),
(3,2,NULL,1,3,'craft\\elements\\Entry',1,0,'2025-09-23 16:47:45','2025-09-23 16:47:45',NULL,NULL,NULL,'5cf361be-620e-4928-8f1c-e767fd7b7e5b'),
(4,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-09-23 16:47:47','2025-09-23 16:47:56',NULL,NULL,NULL,'51d5e565-87a4-4f26-aad7-e6ac21f4e1fa'),
(5,4,NULL,2,3,'craft\\elements\\Entry',1,0,'2025-09-23 16:47:56','2025-09-23 16:47:56',NULL,NULL,NULL,'5afccc27-fab6-4717-8018-77b70f856d95'),
(6,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-09-23 16:47:59','2025-09-23 16:48:09',NULL,NULL,NULL,'180fa7f6-4533-4f2b-8ae9-19903de2f0c2'),
(7,6,NULL,3,4,'craft\\elements\\Entry',1,0,'2025-09-23 16:48:09','2025-09-23 16:48:09',NULL,NULL,NULL,'f0d382ae-32fc-4c7c-a33b-b7d4ebd4b586'),
(8,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2025-09-23 16:48:11','2025-09-23 16:48:24',NULL,NULL,NULL,'99ee724c-cb79-422e-9938-cbb3d89769b2'),
(9,8,NULL,4,4,'craft\\elements\\Entry',1,0,'2025-09-23 16:48:24','2025-09-23 16:48:24',NULL,NULL,NULL,'efe1ac59-a912-40b3-8615-e01ed19a641e'),
(10,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2025-09-23 17:31:44','2025-10-07 13:43:26',NULL,NULL,NULL,'134d4e1f-b19f-4bef-b1a5-62b0d54a27e1'),
(11,10,NULL,5,5,'craft\\elements\\Entry',1,0,'2025-09-23 17:31:44','2025-09-23 17:31:44',NULL,NULL,NULL,'e34ced48-6f1c-4b29-8bfc-9a67e12c81c7'),
(12,NULL,NULL,NULL,6,'craft\\elements\\GlobalSet',1,0,'2025-09-25 17:51:50','2025-10-06 10:43:25',NULL,NULL,NULL,'8d411e5c-39cc-4ade-9676-74c2aae7bcf9'),
(13,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-25 17:52:39','2025-09-25 17:52:39',NULL,NULL,NULL,'c2510ba5-c4c6-4fa4-9381-555627ce1987'),
(14,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-25 17:53:44','2025-09-25 17:53:44',NULL,NULL,NULL,'e60b3088-7409-47d4-816f-9bde94f79784'),
(15,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-25 17:54:33','2025-09-25 18:24:33',NULL,NULL,NULL,'7b53ec9c-22f6-4c68-ad92-9910a172be55'),
(16,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-25 17:54:34','2025-09-25 17:54:34',NULL,NULL,NULL,'73a1b511-41dc-4673-ab15-cae3d538525f'),
(17,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-25 17:54:35','2025-09-25 17:54:35',NULL,NULL,NULL,'5cec470c-cb41-4492-91ab-b54a43819832'),
(18,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-09-27 06:54:07','2025-09-27 06:54:07',NULL,NULL,NULL,'67052b30-daac-4e6c-8768-13dcef0c13d2'),
(19,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-29 06:10:02','2025-09-29 06:10:02',NULL,NULL,NULL,'65ada3ce-816d-4c0e-a387-9ae52a33acce'),
(20,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-29 06:10:02','2025-09-29 06:10:02',NULL,NULL,NULL,'06bd9323-b1e6-475e-a2fb-41160e6d7358'),
(21,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-09-29 06:10:02','2025-09-29 06:10:02',NULL,NULL,NULL,'6f886994-f153-429a-9bc2-956a7efa551a'),
(22,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-09-29 08:33:22','2025-10-06 10:43:25',NULL,NULL,NULL,'85dcfb6a-77d0-4c46-8722-5ada094246cf'),
(23,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-09-29 08:33:44','2025-10-06 10:43:25',NULL,NULL,NULL,'e9aaf041-1883-4f97-9484-1d32e58e0f98'),
(24,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-09-29 08:38:16','2025-10-06 10:43:25',NULL,NULL,NULL,'5ac25675-7bfd-4203-9d18-27197c6b8db6'),
(25,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2025-09-29 09:20:05','2025-10-06 10:43:25',NULL,NULL,NULL,'0ebc4442-559e-4442-b31a-665b96f9bdc2'),
(26,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-09-29 13:32:07','2025-09-29 13:32:07',NULL,NULL,NULL,'9c913efd-1a6a-4c52-a265-e27eb08c01cb'),
(27,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:28:21','2025-10-06 10:43:44',NULL,NULL,NULL,'6f306fe8-0eca-4d07-a1f3-c17e6e7affa8'),
(28,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 07:28:48','2025-10-03 07:28:48',NULL,NULL,NULL,'57d41ec3-6187-4ae4-8b5c-642b11b8b566'),
(29,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 07:28:48','2025-10-03 07:28:48',NULL,NULL,NULL,'27627dac-c26a-48eb-adfa-0175d66d1d51'),
(30,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 07:28:48','2025-10-03 07:28:48',NULL,NULL,NULL,'2d24c6b2-5507-4a67-bc08-43ccb49d7194'),
(31,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 07:29:25','2025-10-03 07:29:25',NULL,NULL,NULL,'7dd0c2c5-b6da-4a6b-960d-9a7764aaf0c4'),
(32,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 07:29:37','2025-10-03 07:29:37',NULL,NULL,NULL,'f24c0ef4-e7d8-4fb1-a267-edb2c26861bc'),
(33,27,NULL,6,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:30:36','2025-10-03 07:30:36',NULL,NULL,NULL,'e52acd62-e140-4926-827c-0cf64b08d537'),
(34,27,NULL,7,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:31:05','2025-10-03 07:31:05',NULL,NULL,NULL,'17070ecb-fdac-474e-b105-23b055a76659'),
(35,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:31:07','2025-10-06 10:43:51',NULL,NULL,NULL,'6db595ae-f1e7-49c6-bf1b-295786edd6ed'),
(36,35,NULL,8,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:31:26','2025-10-03 07:31:26',NULL,NULL,NULL,'682ba715-ea8d-4b56-a854-0643e7fca773'),
(37,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:31:28','2025-10-06 10:43:59',NULL,NULL,NULL,'c84a4526-034b-4e25-b030-c3d1e80c5bcf'),
(38,37,NULL,9,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:32:08','2025-10-03 07:32:08',NULL,NULL,NULL,'7aaff2d7-b243-4a98-962c-b38b421dd09d'),
(39,NULL,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:32:09','2025-10-06 10:44:07',NULL,NULL,NULL,'26df62a2-8159-45b0-8002-788f69505392'),
(40,39,NULL,10,8,'craft\\elements\\Entry',1,0,'2025-10-03 07:32:32','2025-10-03 07:32:32',NULL,NULL,NULL,'dcd91f6f-b1aa-4199-bb0a-8838871c248a'),
(41,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 19:05:51','2025-10-03 19:05:51',NULL,NULL,NULL,'21be3e56-0e6b-4136-b7db-cabe060a8f3e'),
(42,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 19:05:51','2025-10-03 19:05:51',NULL,NULL,NULL,'9c80c5f3-d31e-47c9-b585-fdbe3c6d055f'),
(43,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 19:05:51','2025-10-03 19:05:51',NULL,NULL,NULL,'125409b5-faa7-4aa9-b388-e917283c7661'),
(44,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-03 19:05:52','2025-10-03 19:05:52',NULL,NULL,NULL,'fd4dac94-f2c5-45a1-a2c2-b6e779e8ead4'),
(46,27,NULL,11,8,'craft\\elements\\Entry',1,0,'2025-10-03 19:06:02','2025-10-03 19:06:02',NULL,NULL,NULL,'ac98e337-10fb-4124-a0ad-1f9e1cd65be2'),
(48,35,NULL,12,8,'craft\\elements\\Entry',1,0,'2025-10-03 19:06:15','2025-10-03 19:06:15',NULL,NULL,NULL,'e9b94328-03f0-44a3-b5c8-d864bfbbaefb'),
(50,37,NULL,13,8,'craft\\elements\\Entry',1,0,'2025-10-03 19:06:24','2025-10-03 19:06:24',NULL,NULL,NULL,'747ff9cd-b04c-4fa7-8521-0004d6f80150'),
(52,39,NULL,14,8,'craft\\elements\\Entry',1,0,'2025-10-03 19:06:41','2025-10-03 19:06:41',NULL,NULL,NULL,'dbfac97f-7529-4c4f-ab80-0da415fbb805'),
(53,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-10-04 09:54:04','2025-10-04 09:54:04',NULL,NULL,NULL,'55404ef5-1ee5-448a-b37c-dffcfa05dc73'),
(54,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2025-10-06 10:43:21','2025-10-06 10:43:21',NULL,NULL,NULL,'1787312f-8a45-419a-be1f-886a6766fbf5'),
(56,27,NULL,15,8,'craft\\elements\\Entry',1,0,'2025-10-06 10:43:44','2025-10-06 10:43:44',NULL,NULL,NULL,'00701b81-b692-4a2a-91a3-becd97bd9eed'),
(58,35,NULL,16,8,'craft\\elements\\Entry',1,0,'2025-10-06 10:43:51','2025-10-06 10:43:51',NULL,NULL,NULL,'c61b0d08-b2a8-4c7a-9bac-b1140d26910f'),
(60,37,NULL,17,8,'craft\\elements\\Entry',1,0,'2025-10-06 10:43:59','2025-10-06 10:43:59',NULL,NULL,NULL,'4473e249-3ff4-41c3-afd5-4079877044ce'),
(62,39,NULL,18,8,'craft\\elements\\Entry',1,0,'2025-10-06 10:44:07','2025-10-06 10:44:07',NULL,NULL,NULL,'0f314ed2-f6e0-44cf-9f45-5557993b221b'),
(63,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-07 09:21:54','2025-10-07 09:23:02',NULL,NULL,NULL,'015d63f0-34fd-4c4b-9d59-69b094522327'),
(64,63,NULL,19,9,'craft\\elements\\Entry',1,0,'2025-10-07 09:23:02','2025-10-07 09:23:02',NULL,NULL,NULL,'df8f6b08-aeb7-4c7a-8175-e0e6eb4ee363'),
(65,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2025-10-07 10:40:58','2025-10-07 10:42:34',NULL,NULL,NULL,'a2c7a589-e47f-45fa-9797-afdf8213256d'),
(66,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-07 10:41:52','2025-10-07 10:41:52',NULL,NULL,NULL,'21a5e6c3-9d4c-40c4-aff0-5b2472873b12'),
(67,65,NULL,20,9,'craft\\elements\\Entry',1,0,'2025-10-07 10:42:34','2025-10-07 10:42:34',NULL,NULL,NULL,'b6550670-638c-407d-8ab3-e782539440de'),
(68,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-07 12:47:35','2025-10-07 12:47:35',NULL,NULL,NULL,'2945480a-636d-4be1-ba59-f91107dfe43c'),
(70,10,NULL,21,5,'craft\\elements\\Entry',1,0,'2025-10-07 12:47:43','2025-10-07 12:47:43',NULL,NULL,NULL,'5aa339cb-a8a9-4c29-926d-a92839ab060e'),
(71,10,NULL,22,5,'craft\\elements\\Entry',1,0,'2025-10-07 12:50:23','2025-10-07 12:50:23',NULL,NULL,NULL,'67164ffe-f3c1-4969-aca5-13b4fac80ee8'),
(72,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-07 12:55:28','2025-10-07 12:58:50',NULL,NULL,NULL,'30f809f6-f01a-4917-86a2-92ec00137cf4'),
(74,10,NULL,23,5,'craft\\elements\\Entry',1,0,'2025-10-07 12:55:30','2025-10-07 12:55:30',NULL,NULL,NULL,'7c50f203-5cb0-4857-94ec-7038730a4856'),
(75,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-07 12:58:47','2025-10-07 12:58:50',NULL,'2025-10-07 12:58:50',NULL,'37e142c3-9681-4366-82a5-4facdc8cb1ac'),
(76,10,NULL,24,5,'craft\\elements\\Entry',1,0,'2025-10-07 12:58:52','2025-10-07 12:58:52',NULL,NULL,NULL,'1bac3b7a-7752-4226-b3c7-7b51cce02fee'),
(77,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2025-10-07 13:43:21','2025-10-07 13:43:21',NULL,NULL,NULL,'c02657a6-f30c-46a5-90d6-70ef4545467c'),
(79,10,NULL,25,5,'craft\\elements\\Entry',1,0,'2025-10-07 13:43:26','2025-10-07 13:43:26',NULL,NULL,NULL,'ee00a050-cdee-46df-bd2e-5395c8680bb7');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_thdojhjzibqhubecdjgafgcvidzyvagygbts` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_eszcvnyfptsmjewzixrnrkyxtkceqrxktkwr` (`ownerId`),
  CONSTRAINT `fk_eszcvnyfptsmjewzixrnrkyxtkceqrxktkwr` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ubmtnyndimkhzlwysutakahnpeiilhrmkjgg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
INSERT INTO `elements_owners` VALUES
(22,12,1),
(23,12,3),
(24,12,2),
(25,12,4);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hqlfmuxwefdqaubypwpuxfobtwgcteilknoh` (`elementId`,`siteId`),
  KEY `idx_eanckbrnkzcylkerovvykoqhljvvyhaelsoa` (`siteId`),
  KEY `idx_kiwthaaqemvwfujxfdrwwfccvkrejgtbjwsl` (`title`,`siteId`),
  KEY `idx_dbexgmsjgknyaykugtvfkzuqzmffryrdnasd` (`slug`,`siteId`),
  KEY `idx_orebdzkmcuznzukchutopbkyclqwzyngozjq` (`enabled`),
  KEY `idx_coshbpfqpznbgfpxmnktutyznmwriunpmfqg` (`uri`,`siteId`),
  CONSTRAINT `fk_ahlvbyfkatootxwivdbqlilgodabinmwzqgn` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_idengrfeqxjiyoxvsqdlrausklpdfjjvlrzf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2025-09-21 10:33:25','2025-09-21 10:33:25','50d1bdeb-cb6d-44af-9aaf-9429967bf3ab'),
(2,2,1,'EGyes tesz','egyes-tesz','cikkek/egyes-tesz','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"Egyes teszt cikk\"}',1,'2025-09-23 16:47:34','2025-09-23 16:47:45','d2c057ad-ae22-4bd9-b579-90cb02dd2b49'),
(3,2,2,'EGyes tesz','egyes-tesz','artikel/egyes-tesz','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"Egyes teszt cikk\"}',1,'2025-09-23 16:47:34','2025-09-23 16:47:45','c3c7e0f7-d9a5-4939-92e2-965755a52369'),
(4,3,1,'EGyes tesz','egyes-tesz','cikkek/egyes-tesz','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"Egyes teszt cikk\"}',1,'2025-09-23 16:47:45','2025-09-23 16:47:45','66072b9b-0359-4504-9c0b-9bb3d53747c9'),
(5,3,2,'EGyes tesz','egyes-tesz','artikel/egyes-tesz','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"Egyes teszt cikk\"}',1,'2025-09-23 16:47:45','2025-09-23 16:47:45','0da934ec-14b5-4a01-bd56-cc347e95c63c'),
(6,4,1,'Kettes teszt','kettes-teszt','cikkek/kettes-teszt','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"kettes\"}',1,'2025-09-23 16:47:47','2025-09-23 16:47:56','307e75f5-41ec-4dba-a651-2d49f215024c'),
(7,4,2,'Kettes teszt','kettes-teszt','artikel/kettes-teszt','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"kettes\"}',1,'2025-09-23 16:47:47','2025-09-23 16:47:56','d0edf265-13ee-419d-86d2-317d0bca4673'),
(8,5,1,'Kettes teszt','kettes-teszt','cikkek/kettes-teszt','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"kettes\"}',1,'2025-09-23 16:47:56','2025-09-23 16:47:56','d170c1f5-ec59-484b-9d06-6c820855c30e'),
(9,5,2,'Kettes teszt','kettes-teszt','artikel/kettes-teszt','{\"4bcb5fac-022c-4683-8473-1324831488f9\":\"kettes\"}',1,'2025-09-23 16:47:56','2025-09-23 16:47:56','22204fd4-f181-40ec-83ff-c99a80d98981'),
(10,6,1,'Egyes','egyes','fomenu/egyes','{\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[2],\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\"}',1,'2025-09-23 16:47:59','2025-09-23 16:48:05','29a0a259-0940-4580-a153-ad2d64741617'),
(11,6,2,'Egyes','egyes','fomenu/egyes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[2],\"e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8\":[]}',1,'2025-09-23 16:47:59','2025-09-23 16:48:05','297876dd-b6b1-4122-8d5b-6ee3e035a65f'),
(12,7,1,'Egyes','egyes','fomenu/egyes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[2]}',1,'2025-09-23 16:48:09','2025-09-23 16:48:09','a9454732-88e3-4fab-8158-7cda40740093'),
(13,7,2,'Egyes','egyes','fomenu/egyes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[2]}',1,'2025-09-23 16:48:09','2025-09-23 16:48:09','0a4a2f9e-721a-4434-9f95-926699facb5e'),
(14,8,1,'Kettes','kettes','fomenu/kettes','{\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[4],\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\"}',1,'2025-09-23 16:48:11','2025-09-23 16:48:21','299a05d5-b25f-4322-801e-c8b55912ca64'),
(15,8,2,'Kettes','kettes','fomenu/kettes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[4],\"e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8\":[]}',1,'2025-09-23 16:48:11','2025-09-23 16:48:21','400ab9cb-fa26-4ef8-837c-4a46ee24c668'),
(16,9,1,'Kettes','kettes','fomenu/kettes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[4]}',1,'2025-09-23 16:48:24','2025-09-23 16:48:24','311f34e6-5949-4f3b-9f1b-e43ea61996b8'),
(17,9,2,'Kettes','kettes','fomenu/kettes','{\"e436c514-bcfd-4864-861d-b2a78fea0fb6\":\"post\",\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\":[4]}',1,'2025-09-23 16:48:24','2025-09-23 16:48:24','71848cb7-9d58-4830-a9cd-c2318333958b'),
(18,10,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[77]}',1,'2025-09-23 17:31:44','2025-10-07 13:43:26','b0412808-9c27-48b2-9a79-b929168ea74a'),
(19,10,2,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[]}',1,'2025-09-23 17:31:44','2025-10-07 12:47:43','02ab1ca2-d837-4f16-a2cf-760c49f35290'),
(20,11,1,'Nyitólap','nyitólap','__home__',NULL,1,'2025-09-23 17:31:44','2025-09-23 17:31:44','5ef500bf-4b8a-455f-9876-ef258ee6a102'),
(21,11,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-09-23 17:31:44','2025-09-23 17:31:44','59e937c2-fdd4-4193-96f8-bc1ef731a052'),
(22,12,1,NULL,NULL,NULL,'{\"a1a88a46-026c-4cc6-83d0-3c1066b9280b\":[18],\"3ae2041d-31e4-40a1-b403-8088b570eefd\":\"<h1>A park</h1><h2>Étterem és Panzió Héderváron</h2><p>Az  Étterem 45 fő befogadására alkalmas, télen és nyáron is nyitva vagyunk. A *** Park Panzió 5db egyedi atnoszférájú szoba várja a pihenni vágyokat melyben max 16 före tudunk szállást biztositani. </p>\",\"fe328b43-a2ee-46e2-a5fb-6eba425c1fbf\":[19,21,20,54],\"d009cf12-5da2-4730-a496-fe9859c9b720\":2,\"d4c35d65-a3f5-4b8d-849e-ea5613c25f0b\":\"document-text\",\"ed033a95-e3d2-47ec-909b-7f7302254760\":[2]}',1,'2025-09-25 17:51:50','2025-10-06 10:43:25','2650d4ee-dea5-479a-9cee-75f435761258'),
(23,12,2,NULL,NULL,NULL,'{\"a1a88a46-026c-4cc6-83d0-3c1066b9280b\":[18],\"fe328b43-a2ee-46e2-a5fb-6eba425c1fbf\":[19,21,20,54],\"d009cf12-5da2-4730-a496-fe9859c9b720\":2,\"ed033a95-e3d2-47ec-909b-7f7302254760\":[2]}',1,'2025-09-25 17:51:50','2025-10-06 10:43:25','8fff14a8-5c9b-41d8-979f-8bc3bbd39654'),
(24,13,1,'Screenshot 2025 09 06 at 14 04 16',NULL,NULL,NULL,1,'2025-09-25 17:52:39','2025-09-25 17:52:39','da34b514-bad4-4b42-a261-6bc8cd0905fe'),
(25,13,2,'Screenshot 2025 09 06 at 14 04 16',NULL,NULL,NULL,1,'2025-09-25 17:52:39','2025-09-25 17:52:39','8b235d9d-457d-4bc2-879d-f5062f3c6996'),
(26,14,1,'IMG 20210828 202521',NULL,NULL,NULL,1,'2025-09-25 17:53:44','2025-09-25 17:53:44','51982dc1-e168-4fbf-a6f6-b01051a37c27'),
(27,14,2,'IMG 20210828 202521',NULL,NULL,NULL,1,'2025-09-25 17:53:44','2025-09-25 17:53:44','c947506b-469c-4478-9bd4-3054908a25af'),
(28,15,1,'Ez a kép',NULL,NULL,'{\"6141b94c-1518-4d9d-a898-25f981ac290d\":\"TEteje tetej\"}',1,'2025-09-25 17:54:33','2025-09-25 17:54:58','27f915d1-d6eb-47fd-b982-db5d9d8509f6'),
(29,15,2,'Adobe Stock 1545881037',NULL,NULL,NULL,1,'2025-09-25 17:54:33','2025-09-25 17:54:33','980b9f94-40e9-483f-8e53-30791a280797'),
(30,16,1,'Adobe Stock 244182656',NULL,NULL,NULL,1,'2025-09-25 17:54:34','2025-09-25 17:54:34','ec990b3e-2b16-4e66-be33-1f7471689247'),
(31,16,2,'Adobe Stock 244182656',NULL,NULL,NULL,1,'2025-09-25 17:54:35','2025-09-25 17:54:35','95081fba-d5cf-4708-99c2-a651eb96ae18'),
(32,17,1,'Adobe Stock 1547200829',NULL,NULL,NULL,1,'2025-09-25 17:54:35','2025-09-25 17:54:35','97db606a-052a-419c-a4d2-1d83a92de26c'),
(33,17,2,'Adobe Stock 1547200829',NULL,NULL,NULL,1,'2025-09-25 17:54:35','2025-09-25 17:54:35','b99a7dfe-6e82-40e8-831c-88d2b7aee0a6'),
(34,18,1,'Park hedervar logo',NULL,NULL,NULL,1,'2025-09-27 06:54:07','2025-09-27 06:54:07','2ec6531f-9fc8-48fe-bf17-c432b423abec'),
(35,18,2,'Park hedervar logo',NULL,NULL,NULL,1,'2025-09-27 06:54:07','2025-09-27 06:54:07','b7eaef5f-84a7-468f-b9b1-f7b4d4f5fd75'),
(36,19,1,'Pico DJI 20250703153341 0290 D',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','1e2ff0fb-4f59-4609-85b8-46605da97403'),
(37,19,2,'Pico DJI 20250703153341 0290 D',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','37c01c54-8e6e-4517-8ee6-e66c56dec82e'),
(38,20,1,'Pico DJI 20250703154444 0332 D',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','0e05266d-7d6c-4ba4-9a86-1d944ea84509'),
(39,20,2,'Pico DJI 20250703154444 0332 D',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','e732532d-7eaf-494c-9e8d-836217fdfc1b'),
(40,21,1,'DSC07726',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','2141698e-9e15-4041-85b5-a34dedc83540'),
(41,21,2,'DSC07726',NULL,NULL,NULL,1,'2025-09-29 06:10:02','2025-09-29 06:10:02','2ad53c8f-6a0a-4bbd-bd04-9f4f8f5835f3'),
(42,22,1,NULL,'__temp_ybmrdrzfcwxwdfoqnjjnrhbklhwzmygnrjbm',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"facebook\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"https://facebook.com\"}',1,'2025-09-29 08:33:22','2025-09-29 08:33:59','2d9d3a43-1ef3-4e28-8c17-8be8e5fe7b83'),
(43,22,2,NULL,'__temp_ybmrdrzfcwxwdfoqnjjnrhbklhwzmygnrjbm',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"facebook\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"https://facebook.com\"}',1,'2025-09-29 08:33:22','2025-09-29 08:33:59','85f849d9-6b1e-4acf-ad6b-1bbbef7144bf'),
(44,23,1,NULL,'__temp_gzarqybbeydvvujidfvonmjjlopmvjaxbklv',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"phone\",\"b743f491-f68a-48eb-9db6-ad3f6d50575d\":\"+36301111111\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"tel:+36301111111\"}',1,'2025-09-29 08:33:44','2025-09-29 09:12:55','9bab5ba1-2d2d-41fd-87ec-dd137986cc9d'),
(45,23,2,NULL,'__temp_gzarqybbeydvvujidfvonmjjlopmvjaxbklv',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"phone\",\"b743f491-f68a-48eb-9db6-ad3f6d50575d\":\"+36301111111\"}',1,'2025-09-29 08:33:44','2025-09-29 08:33:59','c230966a-b25a-4bfa-9abf-750e78dbc2da'),
(46,24,1,NULL,'__temp_nuqzogyvyvlhqppkgwegkbqdkvyzejnainwh',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"tiktok\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"https://tiktok.com\"}',1,'2025-09-29 08:38:16','2025-09-29 08:38:29','76857d3e-093b-46fc-b057-84755377a2ba'),
(47,24,2,NULL,'__temp_nuqzogyvyvlhqppkgwegkbqdkvyzejnainwh',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"tiktok\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"https://tiktok.com\"}',1,'2025-09-29 08:38:16','2025-09-29 08:38:29','42a557c2-158b-4207-9c82-653a04e2ec30'),
(48,25,1,NULL,'__temp_qwelfuidhlampqiuzjdhsvxsczmwevsvdaxu',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"envelope\",\"b743f491-f68a-48eb-9db6-ad3f6d50575d\":\"info@parkhedervar.hu\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"mailto:info@parkhedervar.hu\"}',1,'2025-09-29 09:20:05','2025-09-29 09:21:20','ba7b7d7a-72be-4de3-b0b6-2aa8bae6b4bc'),
(49,25,2,NULL,'__temp_qwelfuidhlampqiuzjdhsvxsczmwevsvdaxu',NULL,'{\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\":\"envelope\",\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\":\"mailto:info@parkhedervar.hu\"}',1,'2025-09-29 09:20:05','2025-09-29 09:20:25','1dfab99f-25b0-45b7-a5f5-47bb00bd80a7'),
(50,26,1,'Park panzio logo',NULL,NULL,NULL,1,'2025-09-29 13:32:07','2025-09-29 13:32:07','796aebf7-3ab6-4d84-b0b7-55c10a9191de'),
(51,26,2,'Park panzio logo',NULL,NULL,NULL,1,'2025-09-29 13:32:07','2025-09-29 13:32:07','0f4d8cda-a9da-4dc2-9409-090231eb03c3'),
(52,27,1,'Ez egy hír','ez-egy-hír','hirek/ez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:28:21','2025-10-06 10:43:44','a4b9ab6b-2320-42ea-9ee8-f91ca0396079'),
(53,27,2,'Ez egy hír','ez-egy-hír','newsez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:28:21','2025-10-06 10:43:44','43073847-e156-4a9b-a209-022f2cf64f95'),
(54,28,1,'DSC07726',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','75093bae-a9bc-4bba-90d6-5ce8c1561ae4'),
(55,28,2,'DSC07726',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','b0f083a7-b9d5-4fc7-8c02-5b4c7c43cb57'),
(56,29,1,'Pico DJI 20250703153341 0290 D',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','9527cd34-5ddb-4dd4-a45b-60f82b6872a4'),
(57,29,2,'Pico DJI 20250703153341 0290 D',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','4c9de7ed-8e67-4baa-8850-c7977734076f'),
(58,30,1,'Pico DJI 20250703154444 0332 D',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2745361c-8da1-4a17-8b46-07c1c7288d17'),
(59,30,2,'Pico DJI 20250703154444 0332 D',NULL,NULL,NULL,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','ce8854d8-f410-4f4d-8843-8591290a1925'),
(60,31,1,'DSC07853 thalia',NULL,NULL,NULL,1,'2025-10-03 07:29:25','2025-10-03 07:29:25','9bbf08da-1355-4a28-8003-997be611ba08'),
(61,31,2,'DSC07853 thalia',NULL,NULL,NULL,1,'2025-10-03 07:29:25','2025-10-03 07:29:25','75b849cb-655b-4bde-a909-e78c29a26af5'),
(62,32,1,'DJI 20250723140426 0500 D',NULL,NULL,NULL,1,'2025-10-03 07:29:37','2025-10-03 07:29:37','f7feaf91-1290-4b65-9fa8-e972f19fd13f'),
(63,32,2,'DJI 20250723140426 0500 D',NULL,NULL,NULL,1,'2025-10-03 07:29:37','2025-10-03 07:29:37','f4194ded-cb4e-4927-934c-2b6c762e4ffc'),
(64,33,1,'Ez egy hír','ez-egy-hír','hirek/ez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:30:36','2025-10-03 07:30:36','e91c944a-d9ef-4ac0-8738-cfb00bb6dbf1'),
(65,33,2,'Ez egy hír','ez-egy-hír','newsez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:30:36','2025-10-03 07:30:36','36520dd0-a52f-4906-8cfc-9b4c4f7b9c3e'),
(66,34,1,'Ez egy hír','ez-egy-hír','hirek/ez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:31:05','2025-10-03 07:31:05','78e6a076-874b-4b86-870f-068b4d13a579'),
(67,34,2,'Ez egy hír','ez-egy-hír','newsez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 07:31:05','2025-10-03 07:31:05','b9170da5-e3c6-464f-8d9e-e50a5df7a253'),
(68,35,1,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','hirek/kettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 07:31:07','2025-10-06 10:43:51','7bbd4d83-d85b-436c-a7c3-1baa69dde926'),
(69,35,2,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','newskettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 07:31:07','2025-10-06 10:43:51','df99c46f-4c33-4ff6-97da-96b9db60c441'),
(70,36,1,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','hirek/kettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 07:31:26','2025-10-03 07:31:26','40eeaadb-a660-4e50-8384-1afe3daa6f41'),
(71,36,2,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','newskettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 07:31:26','2025-10-03 07:31:26','f2eef58c-dce1-439f-af83-83faed2125b9'),
(72,37,1,'Hármas hír is itt vna','hármas-hír-is-itt-vna','hirek/hármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 07:31:28','2025-10-06 10:43:59','b21604a6-7bb2-418f-a815-7d10c3275c1a'),
(73,37,2,'Hármas hír is itt vna','hármas-hír-is-itt-vna','newshármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 07:31:28','2025-10-06 10:43:59','18b218e6-8f91-410b-abc1-7ecaf2527468'),
(74,38,1,'Hármas hír is itt vna','hármas-hír-is-itt-vna','hirek/hármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 07:32:08','2025-10-03 07:32:08','ce8b084d-0f54-4e06-a3b1-e874ca3c5ca2'),
(75,38,2,'Hármas hír is itt vna','hármas-hír-is-itt-vna','newshármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 07:32:08','2025-10-03 07:32:08','17946ff1-efe4-4d78-bad5-75ac6e908520'),
(76,39,1,'Négyes hír','négyes-hír','hirek/négyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 07:32:09','2025-10-06 10:44:07','f9c6fa3a-0a24-4080-adbf-7a9f9a7239ac'),
(77,39,2,'Négyes hír','négyes-hír','newsnégyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 07:32:09','2025-10-06 10:44:07','74ce7d77-fa1a-4b40-a67e-817673c64656'),
(78,40,1,'Négyes hír','négyes-hír','hirek/négyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 07:32:32','2025-10-03 07:32:32','ccdd0189-1d6c-4c97-8adb-1653c68ad99a'),
(79,40,2,'Négyes hír','négyes-hír','newsnégyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 07:32:32','2025-10-03 07:32:32','9a6454cc-97ff-43e6-b28b-7bb6c8b91c25'),
(80,41,1,'Hajo fotoshop moibil',NULL,NULL,NULL,1,'2025-10-03 19:05:51','2025-10-03 19:05:51','7f75049b-15b2-4a5f-abf2-230b3d412d24'),
(81,41,2,'Hajo fotoshop moibil',NULL,NULL,NULL,1,'2025-10-03 19:05:51','2025-10-03 19:05:51','298558cf-e27f-4037-857a-277e19d1f7cc'),
(82,42,1,'Hajo ocean full hd',NULL,NULL,NULL,1,'2025-10-03 19:05:51','2025-10-03 19:05:51','247bd281-46d3-46da-908c-a20cf291fd62'),
(83,42,2,'Hajo ocean full hd',NULL,NULL,NULL,1,'2025-10-03 19:05:51','2025-10-03 19:05:51','6b914b66-691b-4c83-b6f0-867688422c98'),
(84,43,1,'A2f65294 6002 4e56 85a9 ae87e8bdefe7',NULL,NULL,NULL,1,'2025-10-03 19:05:51','2025-10-03 19:05:51','83b5cf14-5fed-446b-a048-d338a1b50ed2'),
(85,43,2,'A2f65294 6002 4e56 85a9 ae87e8bdefe7',NULL,NULL,NULL,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','43ddf46e-8020-4912-913f-9aa2cfc02de9'),
(86,44,1,'Minta',NULL,NULL,NULL,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','1ac824b5-5056-4278-b00f-89e48e6c49cd'),
(87,44,2,'Minta',NULL,NULL,NULL,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','20d03f2d-e2e7-41fd-b96b-8bc83dc4f55a'),
(90,46,1,'Ez egy hír','ez-egy-hír','hirek/ez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[41],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 19:06:02','2025-10-03 19:06:02','baeeb600-e97f-4cd1-ae2f-7d8e59eb9c4e'),
(91,46,2,'Ez egy hír','ez-egy-hír','newsez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[41],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-03 19:06:02','2025-10-03 19:06:02','8edd5839-8d45-4e43-ace0-cff9451bfce4'),
(94,48,1,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','hirek/kettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[42],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 19:06:15','2025-10-03 19:06:15','a0ba40fd-9d24-47f9-9adb-ad060000f1d8'),
(95,48,2,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','newskettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[42],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-03 19:06:15','2025-10-03 19:06:15','821e8ae3-5b48-48fe-af97-0f45ba51e0a8'),
(98,50,1,'Hármas hír is itt vna','hármas-hír-is-itt-vna','hirek/hármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[43],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 19:06:24','2025-10-03 19:06:24','8b444d5e-b67e-4e87-8973-eb9b9219ff25'),
(99,50,2,'Hármas hír is itt vna','hármas-hír-is-itt-vna','newshármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[43],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-03 19:06:24','2025-10-03 19:06:24','695ad5e3-0db0-474c-b29b-01cab3e630e4'),
(102,52,1,'Négyes hír','négyes-hír','hirek/négyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[42],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 19:06:41','2025-10-03 19:06:41','fd8aa664-2e06-4ce5-9910-ed41968a72df'),
(103,52,2,'Négyes hír','négyes-hír','newsnégyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[42],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-03 19:06:41','2025-10-03 19:06:41','9e4353c1-ca83-4756-b91c-f5b9bf9b988f'),
(104,53,1,'Hajo ocean full hd',NULL,NULL,NULL,1,'2025-10-04 09:54:04','2025-10-04 09:54:04','72ba5ae1-8bdd-4a7a-a5b2-c7e86776377c'),
(105,53,2,'Hajo ocean full hd',NULL,NULL,NULL,1,'2025-10-04 09:54:05','2025-10-04 09:54:05','e216680b-25f3-4462-adc9-6885c992decb'),
(106,54,1,'Pico DSC07230',NULL,NULL,NULL,1,'2025-10-06 10:43:21','2025-10-06 10:43:21','1cf98aa2-61c1-4d27-b80b-229c92238c73'),
(107,54,2,'Pico DSC07230',NULL,NULL,NULL,1,'2025-10-06 10:43:21','2025-10-06 10:43:21','2d1b35e8-c11c-40cd-9b24-8962772a7ebc'),
(110,56,1,'Ez egy hír','ez-egy-hír','hirek/ez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-06 10:43:44','2025-10-06 10:43:44','f004e3bf-3536-4e0d-bc35-b14d4b408312'),
(111,56,2,'Ez egy hír','ez-egy-hír','newsez-egy-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[32],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Morbi suscipit hendrerit est, at pulvinar massa ornare et. Duis ac rutrum sem. Aenean nisi sem, luctus ut vestibulum quis, vulputate eu tellus. Cras vitae pretium mi, sit amet tincidunt mauris. Proin tempus ligula erat, eu interdum sapien molestie ut.\"}',1,'2025-10-06 10:43:44','2025-10-06 10:43:44','805f49fc-0e0a-4de4-80ce-54e167dc7ce5'),
(114,58,1,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','hirek/kettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-06 10:43:51','2025-10-06 10:43:51','bd6561f4-243e-42e3-a3fc-083656057d60'),
(115,58,2,'Kettes számú hír, ami nem álhír','kettes-számú-hír-ami-nem-álhír','newskettes-számú-hír-ami-nem-álhír','{\"755d6114-457b-46a8-9106-04c302188c53\":[31],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Etiam luctus lacinia dolor, non mattis leo pellentesque quis. Sed tincidunt velit vel elit tempus tristique in nec orci. Vestibulum quis porta turpis, id rhoncus augue.\"}',1,'2025-10-06 10:43:51','2025-10-06 10:43:51','780d33cf-1ad0-4a36-ad49-ba6ad1b789e8'),
(118,60,1,'Hármas hír is itt vna','hármas-hír-is-itt-vna','hirek/hármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-06 10:43:59','2025-10-06 10:43:59','2d7a7e05-5c4f-4f6d-a021-b35e755e54c2'),
(119,60,2,'Hármas hír is itt vna','hármas-hír-is-itt-vna','newshármas-hír-is-itt-vna','{\"755d6114-457b-46a8-9106-04c302188c53\":[28],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Sed metus mauris, fermentum at neque eget, varius bibendum lectus. Mauris in enim mauris. Ut sollicitudin ligula nec dolor facilisis interdum.\"}',1,'2025-10-06 10:43:59','2025-10-06 10:43:59','8e83a910-bbc3-4a37-a33a-ad47967945b6'),
(122,62,1,'Négyes hír','négyes-hír','hirek/négyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-06 10:44:07','2025-10-06 10:44:07','f6ed78e1-2e80-446f-92b4-d6d587f35ab9'),
(123,62,2,'Négyes hír','négyes-hír','newsnégyes-hír','{\"755d6114-457b-46a8-9106-04c302188c53\":[30],\"6755a832-4602-473a-a932-b6633c4cf009\":\"Ez egy négyes, Morbi non quam vel tortor vehicula ultricies. Duis iaculis augue mauris, sit amet placerat est scelerisque at. Ut egestas dui sit amet interdum auctor.\"}',1,'2025-10-06 10:44:07','2025-10-06 10:44:07','621f26bf-6c52-415d-8dd4-03870704c1b2'),
(124,63,1,'Ez egy cikk ami teszt','ez-egy-cikk-ami-teszt','nyitolap-one-page/ez-egy-cikk-ami-teszt','{\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tortor metus, aliquet id urna sed, hendrerit dignissim risus. </p><p>Praesent pharetra, mi sit amet interdum auctor, mi diam aliquet eros, quis gravida urna mauris et lacus. In hac habitasse platea dictumst. Donec rutrum ligula ac ipsum laoreet, non lacinia velit pretium</p>\",\"80238b96-825c-41e1-bf26-1c3226867f6a\":[2],\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[32],\"9068048e-5207-4d70-a037-d6f60948fa59\":false}',1,'2025-10-07 09:21:54','2025-10-07 09:22:46','1fb35810-93ae-4309-8026-16c7f7269234'),
(125,63,2,'Ez egy cikk ami teszt','ez-egy-cikk-ami-teszt','nyitolap-one-page/ez-egy-cikk-ami-teszt','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[32],\"9068048e-5207-4d70-a037-d6f60948fa59\":false,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tortor metus, aliquet id urna sed, hendrerit dignissim risus. </p><p>Praesent pharetra, mi sit amet interdum auctor, mi diam aliquet eros, quis gravida urna mauris et lacus. In hac habitasse platea dictumst. Donec rutrum ligula ac ipsum laoreet, non lacinia velit pretium</p>\",\"80238b96-825c-41e1-bf26-1c3226867f6a\":[2]}',1,'2025-10-07 09:21:54','2025-10-07 09:22:46','cf11f117-1de8-401a-82b9-c2b14505b8cd'),
(126,64,1,'Ez egy cikk ami teszt','ez-egy-cikk-ami-teszt','nyitolap-one-page/ez-egy-cikk-ami-teszt','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[32],\"9068048e-5207-4d70-a037-d6f60948fa59\":false,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tortor metus, aliquet id urna sed, hendrerit dignissim risus. </p><p>Praesent pharetra, mi sit amet interdum auctor, mi diam aliquet eros, quis gravida urna mauris et lacus. In hac habitasse platea dictumst. Donec rutrum ligula ac ipsum laoreet, non lacinia velit pretium</p>\",\"80238b96-825c-41e1-bf26-1c3226867f6a\":[2]}',1,'2025-10-07 09:23:02','2025-10-07 09:23:02','d04c4f19-ac91-4ad9-b25f-b3a14fe6f77d'),
(127,64,2,'Ez egy cikk ami teszt','ez-egy-cikk-ami-teszt','nyitolap-one-page/ez-egy-cikk-ami-teszt','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[32],\"9068048e-5207-4d70-a037-d6f60948fa59\":false,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam tortor metus, aliquet id urna sed, hendrerit dignissim risus. </p><p>Praesent pharetra, mi sit amet interdum auctor, mi diam aliquet eros, quis gravida urna mauris et lacus. In hac habitasse platea dictumst. Donec rutrum ligula ac ipsum laoreet, non lacinia velit pretium</p>\",\"80238b96-825c-41e1-bf26-1c3226867f6a\":[2]}',1,'2025-10-07 09:23:02','2025-10-07 09:23:02','bad4dd83-ad32-45a6-a49e-43284078b04e'),
(128,65,1,'Kettes teszt cikk jön ide','kettes-teszt-cikk-jön-ide','nyitolap-one-page/kettes-teszt-cikk-jön-ide','{\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Vivamus eget est in sem posuere pulvinar a nec nunc. Aliquam dapibus lorem varius fringilla viverra. Donec elementum condimentum tempus. Duis ac lobortis neque. Quisque ac metus eu nulla iaculis maximus et nec sapien. Proin pulvinar felis a ante imperdiet, a posuere erat ultrices. Fusce sit amet magna tristique mi maximus aliquet. Nunc in magna justo. </p><p>Nunc sagittis ullamcorper est, vitae imperdiet erat commodo molestie. Nulla ut leo tincidunt, molestie mi non, sollicitudin metus. In imperdiet mollis lacus vitae suscipit. Ut turpis metus, tempor ut neque a, dignissim iaculis odio. Vivamus porta tempor nunc, vel accumsan urna posuere a. Praesent sodales nisl eget viverra finibus.</p>\",\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[66],\"9068048e-5207-4d70-a037-d6f60948fa59\":true}',1,'2025-10-07 10:40:58','2025-10-07 10:42:31','0eebae8f-dff8-4e7e-a8f8-2c53ad050df6'),
(129,65,2,'Kettes teszt cikk jön ide','kettes-teszt-cikk-jön-ide','nyitolap-one-page/kettes-teszt-cikk-jön-ide','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[66],\"9068048e-5207-4d70-a037-d6f60948fa59\":true,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Vivamus eget est in sem posuere pulvinar a nec nunc. Aliquam dapibus lorem varius fringilla viverra. Donec elementum condimentum tempus. Duis ac lobortis neque. Quisque ac metus eu nulla iaculis maximus et nec sapien. Proin pulvinar felis a ante imperdiet, a posuere erat ultrices. Fusce sit amet magna tristique mi maximus aliquet. Nunc in magna justo. </p><p>Nunc sagittis ullamcorper est, vitae imperdiet erat commodo molestie. Nulla ut leo tincidunt, molestie mi non, sollicitudin metus. In imperdiet mollis lacus vitae suscipit. Ut turpis metus, tempor ut neque a, dignissim iaculis odio. Vivamus porta tempor nunc, vel accumsan urna posuere a. Praesent sodales nisl eget viverra finibus.</p>\",\"80238b96-825c-41e1-bf26-1c3226867f6a\":[]}',1,'2025-10-07 10:40:58','2025-10-07 10:42:31','1dbce454-e20f-4f7e-8f3d-565e1b5da3b3'),
(130,66,1,'DJI 0948',NULL,NULL,NULL,1,'2025-10-07 10:41:52','2025-10-07 10:41:52','b90995ab-7e30-4b6f-b76a-bd69424feff0'),
(131,66,2,'DJI 0948',NULL,NULL,NULL,1,'2025-10-07 10:41:52','2025-10-07 10:41:52','ea6a0e2d-3e3b-4327-9726-7b87d18574cf'),
(132,67,1,'Kettes teszt cikk jön ide','kettes-teszt-cikk-jön-ide','nyitolap-one-page/kettes-teszt-cikk-jön-ide','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[66],\"9068048e-5207-4d70-a037-d6f60948fa59\":true,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Vivamus eget est in sem posuere pulvinar a nec nunc. Aliquam dapibus lorem varius fringilla viverra. Donec elementum condimentum tempus. Duis ac lobortis neque. Quisque ac metus eu nulla iaculis maximus et nec sapien. Proin pulvinar felis a ante imperdiet, a posuere erat ultrices. Fusce sit amet magna tristique mi maximus aliquet. Nunc in magna justo. </p><p>Nunc sagittis ullamcorper est, vitae imperdiet erat commodo molestie. Nulla ut leo tincidunt, molestie mi non, sollicitudin metus. In imperdiet mollis lacus vitae suscipit. Ut turpis metus, tempor ut neque a, dignissim iaculis odio. Vivamus porta tempor nunc, vel accumsan urna posuere a. Praesent sodales nisl eget viverra finibus.</p>\"}',1,'2025-10-07 10:42:34','2025-10-07 10:42:34','4a7a6460-3934-40be-b272-2cee2755b193'),
(133,67,2,'Kettes teszt cikk jön ide','kettes-teszt-cikk-jön-ide','nyitolap-one-page/kettes-teszt-cikk-jön-ide','{\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\":[66],\"9068048e-5207-4d70-a037-d6f60948fa59\":true,\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\":\"<p>Vivamus eget est in sem posuere pulvinar a nec nunc. Aliquam dapibus lorem varius fringilla viverra. Donec elementum condimentum tempus. Duis ac lobortis neque. Quisque ac metus eu nulla iaculis maximus et nec sapien. Proin pulvinar felis a ante imperdiet, a posuere erat ultrices. Fusce sit amet magna tristique mi maximus aliquet. Nunc in magna justo. </p><p>Nunc sagittis ullamcorper est, vitae imperdiet erat commodo molestie. Nulla ut leo tincidunt, molestie mi non, sollicitudin metus. In imperdiet mollis lacus vitae suscipit. Ut turpis metus, tempor ut neque a, dignissim iaculis odio. Vivamus porta tempor nunc, vel accumsan urna posuere a. Praesent sodales nisl eget viverra finibus.</p>\"}',1,'2025-10-07 10:42:34','2025-10-07 10:42:34','c204f7c2-3145-481c-bba6-587e8a78e2f1'),
(134,68,1,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:47:35','2025-10-07 12:47:35','ab5bd4e3-eae3-405b-b9c9-cbe6cb881ac9'),
(135,68,2,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:47:35','2025-10-07 12:47:35','35f51dc3-cb61-4054-a0c3-07bc67cffcfc'),
(138,70,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[68]}',1,'2025-10-07 12:47:43','2025-10-07 12:47:43','b32763cc-9b49-45e2-89e0-b315c3a8669c'),
(139,70,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-10-07 12:47:43','2025-10-07 12:47:43','1cb347c3-64a3-4c8b-9eb3-cc011853a849'),
(140,71,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[68]}',1,'2025-10-07 12:50:23','2025-10-07 12:50:23','8e36c1b8-a61d-4fda-b1b8-19dfeceeeb95'),
(141,71,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-10-07 12:50:23','2025-10-07 12:50:23','7ee52b9b-e0fc-407e-9bee-4abd0899953e'),
(142,72,1,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:55:28','2025-10-07 12:55:28','421d9224-9253-4187-a21d-911adc6ff126'),
(143,72,2,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:55:28','2025-10-07 12:55:28','346297f9-1cea-4fef-8e06-1af15d3520ce'),
(146,74,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[72]}',1,'2025-10-07 12:55:30','2025-10-07 12:55:30','29d4b035-6fd7-4122-a372-6bd6c66c608c'),
(147,74,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-10-07 12:55:30','2025-10-07 12:55:30','9928381b-f430-4919-b94f-55fc39266167'),
(148,75,1,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:58:47','2025-10-07 12:58:47','845ddf31-5dd4-4288-b5ee-1e0a3cf61224'),
(149,75,2,'Et2',NULL,NULL,NULL,1,'2025-10-07 12:58:48','2025-10-07 12:58:48','9554c04e-a718-4dd6-abde-f0e78b50e802'),
(150,76,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[72]}',1,'2025-10-07 12:58:52','2025-10-07 12:58:52','06ca66a2-ce9e-4b55-9811-9d58f286eb4b'),
(151,76,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-10-07 12:58:52','2025-10-07 12:58:52','e8953131-9b0f-437f-9a0e-31baf06edc60'),
(152,77,1,'Heti menu 2025 10 06',NULL,NULL,NULL,1,'2025-10-07 13:43:21','2025-10-07 13:43:21','e4328db4-acd3-479a-9ea4-fc690c3511f4'),
(153,77,2,'Heti menu 2025 10 06',NULL,NULL,NULL,1,'2025-10-07 13:43:21','2025-10-07 13:43:21','7bbe3c8a-64c4-447c-b0c6-207a09d851d1'),
(156,79,1,'Nyitólap','nyitólap','__home__','{\"a42c773a-d749-40e5-bae8-628487af6dd5\":[77]}',1,'2025-10-07 13:43:26','2025-10-07 13:43:26','38c8dfce-c41e-410b-8af2-5d670ea8b842'),
(157,79,2,'Nyitólap','nyitólap','__home__',NULL,1,'2025-10-07 13:43:26','2025-10-07 13:43:26','e1d03c9c-26c3-4931-8ab8-ba3a71e3fbf7');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `status` enum('live','pending','expired') NOT NULL DEFAULT 'live',
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dkqvdcxqwjodmojxsgstdtdkjhjvillmxenn` (`postDate`),
  KEY `idx_mxmvthgeiasvkjuwjenauilnuzcvjxmcpzen` (`expiryDate`),
  KEY `idx_umyduquhkhtubvaizcsnlyupyuzjezxrugqf` (`status`),
  KEY `idx_mckfaymmrpimjxfmdnntbvkipoodxvkxawya` (`sectionId`),
  KEY `idx_skyumxzuhmxrhrvpbmliohbtgphujdeqjrat` (`typeId`),
  KEY `idx_jnukutopsbqtptjawvbspcklklhxjivrjeov` (`primaryOwnerId`),
  KEY `idx_voendylmmhltwuhmnildzinhkcrhmsvjrygm` (`fieldId`),
  KEY `fk_tuwhjoiuvrvjyqhrbfjvbfvyguopibvxxoeb` (`parentId`),
  CONSTRAINT `fk_hnllzsabysmbdceuulxnhdnpugrnwesfitkf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ntovmnrsfewaqaswgbtbupgbuvnndeybtzmr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oxwxffvdkeamsufzbsjykevlioirkitvqwvq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tuwhjoiuvrvjyqhrbfjvbfvyguopibvxxoeb` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_utsmwfrydrquulajrcngycijhizkhxjznmll` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcqbpwkbgioexyfoqvbzppeotzubqvlewhgw` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2025-09-23 16:47:00',NULL,'live',NULL,NULL,'2025-09-23 16:47:34','2025-09-23 16:47:45'),
(3,1,NULL,NULL,NULL,1,'2025-09-23 16:47:00',NULL,'live',NULL,NULL,'2025-09-23 16:47:45','2025-09-23 16:47:45'),
(4,1,NULL,NULL,NULL,1,'2025-09-23 16:47:00',NULL,'live',NULL,NULL,'2025-09-23 16:47:47','2025-09-23 16:47:56'),
(5,1,NULL,NULL,NULL,1,'2025-09-23 16:47:00',NULL,'live',NULL,NULL,'2025-09-23 16:47:56','2025-09-23 16:47:56'),
(6,2,NULL,NULL,NULL,2,'2025-09-23 16:48:00',NULL,'live',NULL,NULL,'2025-09-23 16:47:59','2025-09-23 16:48:09'),
(7,2,NULL,NULL,NULL,2,'2025-09-23 16:48:00',NULL,'live',NULL,NULL,'2025-09-23 16:48:09','2025-09-23 16:48:09'),
(8,2,NULL,NULL,NULL,2,'2025-09-23 16:48:00',NULL,'live',NULL,NULL,'2025-09-23 16:48:11','2025-09-23 16:48:24'),
(9,2,NULL,NULL,NULL,2,'2025-09-23 16:48:00',NULL,'live',NULL,NULL,'2025-09-23 16:48:24','2025-09-23 16:48:24'),
(10,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-09-23 17:31:44','2025-09-23 17:31:44'),
(11,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-09-23 17:31:44','2025-09-23 17:31:44'),
(22,NULL,NULL,12,9,4,'2025-09-29 08:33:00',NULL,'live',NULL,NULL,'2025-09-29 08:33:22','2025-09-29 08:33:59'),
(23,NULL,NULL,12,9,4,'2025-09-29 08:33:00',NULL,'live',NULL,NULL,'2025-09-29 08:33:44','2025-09-29 08:33:59'),
(24,NULL,NULL,12,9,4,'2025-09-29 08:38:00',NULL,'live',NULL,NULL,'2025-09-29 08:38:16','2025-09-29 08:38:29'),
(25,NULL,NULL,12,9,4,'2025-09-29 09:20:00',NULL,'live',NULL,NULL,'2025-09-29 09:20:05','2025-09-29 09:20:25'),
(27,4,NULL,NULL,NULL,5,'2025-10-03 07:30:00',NULL,'live',NULL,NULL,'2025-10-03 07:28:21','2025-10-03 07:30:36'),
(33,4,NULL,NULL,NULL,5,'2025-10-03 07:30:00',NULL,'live',NULL,NULL,'2025-10-03 07:30:36','2025-10-03 07:30:36'),
(34,4,NULL,NULL,NULL,5,'2025-10-03 07:30:00',NULL,'live',NULL,NULL,'2025-10-03 07:31:05','2025-10-03 07:31:05'),
(35,4,NULL,NULL,NULL,5,'2025-10-03 07:31:00',NULL,'live',NULL,NULL,'2025-10-03 07:31:07','2025-10-03 07:31:26'),
(36,4,NULL,NULL,NULL,5,'2025-10-03 07:31:00',NULL,'live',NULL,NULL,'2025-10-03 07:31:26','2025-10-03 07:31:26'),
(37,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 07:31:28','2025-10-03 07:32:08'),
(38,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 07:32:08','2025-10-03 07:32:08'),
(39,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 07:32:09','2025-10-03 07:32:32'),
(40,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 07:32:32','2025-10-03 07:32:32'),
(46,4,NULL,NULL,NULL,5,'2025-10-03 07:30:00',NULL,'live',NULL,NULL,'2025-10-03 19:06:02','2025-10-03 19:06:02'),
(48,4,NULL,NULL,NULL,5,'2025-10-03 07:31:00',NULL,'live',NULL,NULL,'2025-10-03 19:06:15','2025-10-03 19:06:15'),
(50,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 19:06:24','2025-10-03 19:06:24'),
(52,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-03 19:06:41','2025-10-03 19:06:41'),
(56,4,NULL,NULL,NULL,5,'2025-10-03 07:30:00',NULL,'live',NULL,NULL,'2025-10-06 10:43:44','2025-10-06 10:43:44'),
(58,4,NULL,NULL,NULL,5,'2025-10-03 07:31:00',NULL,'live',NULL,NULL,'2025-10-06 10:43:51','2025-10-06 10:43:51'),
(60,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-06 10:43:59','2025-10-06 10:43:59'),
(62,4,NULL,NULL,NULL,5,'2025-10-03 07:32:00',NULL,'live',NULL,NULL,'2025-10-06 10:44:07','2025-10-06 10:44:07'),
(63,5,NULL,NULL,NULL,6,'2025-10-07 09:23:00',NULL,'live',NULL,NULL,'2025-10-07 09:21:54','2025-10-07 09:23:02'),
(64,5,NULL,NULL,NULL,6,'2025-10-07 09:23:00',NULL,'live',NULL,NULL,'2025-10-07 09:23:02','2025-10-07 09:23:02'),
(65,5,NULL,NULL,NULL,6,'2025-10-07 10:42:00',NULL,'live',NULL,NULL,'2025-10-07 10:40:58','2025-10-07 10:42:34'),
(67,5,NULL,NULL,NULL,6,'2025-10-07 10:42:00',NULL,'live',NULL,NULL,'2025-10-07 10:42:34','2025-10-07 10:42:34'),
(70,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-10-07 12:47:43','2025-10-07 12:47:43'),
(71,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-10-07 12:50:23','2025-10-07 12:50:23'),
(74,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-10-07 12:55:30','2025-10-07 12:55:30'),
(76,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-10-07 12:58:52','2025-10-07 12:58:52'),
(79,3,NULL,NULL,NULL,3,'2025-09-23 17:31:00',NULL,'live',NULL,NULL,'2025-10-07 13:43:26','2025-10-07 13:43:26');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_rrzxompkenpmcmbdmvrbetsxlqunzsnoulua` (`authorId`),
  KEY `idx_dbqcndhbnbxgbasvcmpwaqxcobdirbtdqnem` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_asyvbybuddybardexrrfegkxfvgnjjpxmbbw` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dbkzywdsznlbcwlzopobsfyyapgzqyceolvp` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
INSERT INTO `entries_authors` VALUES
(2,1,1),
(3,1,1),
(4,1,1),
(5,1,1),
(6,1,1),
(7,1,1),
(8,1,1),
(9,1,1),
(27,1,1),
(33,1,1),
(34,1,1),
(35,1,1),
(36,1,1),
(37,1,1),
(38,1,1),
(39,1,1),
(40,1,1),
(46,1,1),
(48,1,1),
(50,1,1),
(52,1,1),
(56,1,1),
(58,1,1),
(60,1,1),
(62,1,1),
(63,1,1),
(64,1,1),
(65,1,1),
(67,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT 1,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_skamazvcrahidbdmayiahlzvgkmhfzuyxkcq` (`fieldLayoutId`),
  KEY `idx_lcmnmizpsbyqplkbfsffrxshlrpuwbnsshnf` (`dateDeleted`),
  CONSTRAINT `fk_oiuamixbddzwnhubszwaoodfzjamrllpavwa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES
(1,3,'Cikk','article',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-09-23 15:21:06','2025-09-23 15:21:06',NULL,'8bcb174f-c2de-46c2-b796-1394dac78109'),
(2,4,'Menü','menu',NULL,'bars',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-09-23 15:40:59','2025-09-23 15:40:59',NULL,'02980df4-89da-41dc-9c95-0b95a8764e23'),
(3,5,'Nyitó','default',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-09-23 17:31:42','2025-09-23 17:31:42',NULL,'3f01429d-2635-4f6a-a7e2-03296a05e255'),
(4,7,'Adat','adat',NULL,NULL,NULL,0,'site',NULL,NULL,1,'site',NULL,1,'2025-09-29 08:20:42','2025-09-29 08:20:42',NULL,'915fda05-fe2f-4d16-8676-0d5f34b33d08'),
(5,8,'HÍr','new',NULL,NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-10-03 07:12:40','2025-10-03 07:12:40',NULL,'becc6248-77f7-4548-9c0c-9326b0764e28'),
(6,9,'Tartalom','content',NULL,'subtitles',NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-10-07 08:56:32','2025-10-07 08:56:32',NULL,'5fea41c4-9177-4d44-928a-27f69f223cc0');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lglsmisgtmiadnfhypypvmbjkxdhydpcctcj` (`dateDeleted`),
  KEY `idx_uokgdiudfccjtcujdxtbtfhyflzsspquulpj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"7365a492-12cd-47fa-9c44-ba5af70ae5a2\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:08:42+00:00\",\"uid\":\"780bcfb8-0257-42f9-9e23-8924ce4b9216\",\"userCondition\":null,\"elementCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-23 15:10:13','2025-09-23 15:10:13',NULL,'fb7415a7-f6ff-48f9-86c1-de1f44ac4e48'),
(2,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"c98ec293-939e-4a45-a458-63800ba8205b\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:09:28+00:00\",\"uid\":\"a73b8323-482d-4727-8b3c-201eebe50e66\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:11:13+00:00\",\"uid\":\"6141b94c-1518-4d9d-a898-25f981ac290d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-23 15:11:13','2025-09-23 15:11:13',NULL,'feb39794-bd56-455b-b1d0-1795e637ac26'),
(3,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"603cbe38-3f71-4723-9d88-bff71ea7e6ca\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:19:38+00:00\",\"uid\":\"e0e59d9f-6e59-40c2-997a-eb1d61a3e101\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:21:06+00:00\",\"uid\":\"4bcb5fac-022c-4683-8473-1324831488f9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-23 15:21:06','2025-09-23 15:21:06',NULL,'f408692d-aeda-4199-bbc4-b9e6e5323e1c'),
(4,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"032fed4b-8906-4aa7-902e-91a9245bf561\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T15:34:11+00:00\",\"uid\":\"a1192016-bb24-435c-9742-f27ac4019a27\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-23T15:40:58+00:00\",\"uid\":\"e436c514-bcfd-4864-861d-b2a78fea0fb6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-23T15:40:58+00:00\",\"uid\":\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"0e9a9dfe-323e-4651-9e4f-9da62a36bf03\",\"operator\":\"in\",\"values\":[\"post\"],\"fieldUid\":\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\",\"layoutElementUid\":\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"}]},\"fieldUid\":\"785c09ff-d241-42d1-b0a7-c985a24a712c\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-23T15:40:58+00:00\",\"uid\":\"e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"9310e6f5-2150-4cb8-bebf-b3976c957136\",\"operator\":\"in\",\"values\":[\"category\"],\"fieldUid\":\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\",\"layoutElementUid\":\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"}]},\"fieldUid\":\"d46898f6-87ca-4eea-ae8d-1c1f76206e53\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"dirctLink\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-23T15:40:58+00:00\",\"uid\":\"648f1037-f818-4de3-a52c-1ede9fe8db3f\",\"userCondition\":null,\"elementCondition\":{\"elementType\":\"craft\\\\elements\\\\Entry\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\",\"conditionRules\":[{\"class\":\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\",\"uid\":\"37bbb753-0ffd-4fee-8584-e9354365546e\",\"operator\":\"in\",\"values\":[\"directlink\"],\"fieldUid\":\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\",\"layoutElementUid\":\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"}]},\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-23 15:40:59','2025-09-23 15:40:59',NULL,'7869728a-5c08-4218-b250-6cd6479ee0aa'),
(5,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"3246f1cd-4c7c-4f26-8e8b-edae8440b071\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-23T17:30:29+00:00\",\"uid\":\"528b4136-fee6-4f42-bc7d-a3b260218c42\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-07T12:40:37+00:00\",\"uid\":\"a42c773a-d749-40e5-bae8-628487af6dd5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1ddf3471-9514-416a-8cdd-cb453f093e39\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-23 17:31:42','2025-10-07 12:40:37',NULL,'a53c10c1-fc3e-4480-b3ee-24fa81008da8'),
(6,'craft\\elements\\GlobalSet','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"c20de0b0-5fc8-4975-914d-cbff2f64b28f\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"image\",\"label\":\"Logó\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-27T06:52:43+00:00\",\"uid\":\"a1a88a46-026c-4cc6-83d0-3c1066b9280b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8792f1cf-e9e4-4f28-9777-8c5304780529\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-27T16:28:02+00:00\",\"uid\":\"3ae2041d-31e4-40a1-b403-8088b570eefd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6652c4a0-b521-4514-9e6a-ba6383a6325a\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-09-25T17:51:50+00:00\",\"uid\":\"fe328b43-a2ee-46e2-a5fb-6eba425c1fbf\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5b557374-743e-40fc-8528-a0d4e9b40506\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-09-25T18:23:01+00:00\",\"uid\":\"d009cf12-5da2-4730-a496-fe9859c9b720\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a0ed06e8-7d19-46e7-b39f-32af2d4e18c3\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\Heading\",\"heading\":\"Gomb - menünek\",\"dateAdded\":\"2025-10-01T08:58:48+00:00\",\"uid\":\"bdb0d28a-126d-4d95-9940-3cf770ae6287\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"iconName\",\"label\":\"Ikon neve\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-10-02T16:58:14+00:00\",\"uid\":\"d4c35d65-a3f5-4b8d-849e-ea5613c25f0b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"button\",\"label\":\"Menü\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":75,\"dateAdded\":\"2025-10-01T08:58:48+00:00\",\"uid\":\"ed033a95-e3d2-47ec-909b-7f7302254760\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"785c09ff-d241-42d1-b0a7-c985a24a712c\",\"editCondition\":null}]},{\"name\":\"Ikonok\",\"uid\":\"0494f0e0-dbfa-42cf-b197-e82c58e137c1\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-09-29T08:33:16+00:00\",\"uid\":\"28eb1d08-96e7-462e-b659-c98b77924167\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8ea3f70c-70e2-469a-945b-53ac9e122b75\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-25 17:51:50','2025-10-02 16:58:14',NULL,'f866c5d5-1019-40f0-92b1-e25e47cc93eb'),
(7,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"514af082-14ba-4e2d-9b2e-bcdb62136fcf\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"simpleIcon\",\"label\":\"Sima ikon\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-09-29T08:20:42+00:00\",\"uid\":\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Adat szövege\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-09-29T08:20:42+00:00\",\"uid\":\"b743f491-f68a-48eb-9db6-ad3f6d50575d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":\"simpleLink\",\"label\":\"URL\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-09-29T08:20:42+00:00\",\"uid\":\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-09-29 08:20:42','2025-09-29 08:31:46',NULL,'0ee4801b-d11b-4d85-b860-97718c31f27a'),
(8,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"39ce1a3c-5785-4975-943c-feac9d5bd3de\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-03T07:10:46+00:00\",\"uid\":\"b997c09a-2ca8-44d9-bf5a-7911adbc6c9c\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-03T07:12:40+00:00\",\"uid\":\"755d6114-457b-46a8-9106-04c302188c53\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8792f1cf-e9e4-4f28-9777-8c5304780529\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-03T07:12:40+00:00\",\"uid\":\"6755a832-4602-473a-a932-b6633c4cf009\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-10-03 07:12:40','2025-10-03 07:12:40',NULL,'f4565d83-a86a-41ac-8c36-a614d2ff66f1'),
(9,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Tartalom\",\"uid\":\"625283f1-195a-46be-814e-90bc5c296299\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-07T08:47:49+00:00\",\"uid\":\"a6bf5104-4ac5-412d-b0c0-233ffa11c1da\",\"userCondition\":null,\"elementCondition\":null,\"required\":true},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-10-07T08:56:32+00:00\",\"uid\":\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"8792f1cf-e9e4-4f28-9777-8c5304780529\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Kép bal/jobb\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":25,\"dateAdded\":\"2025-10-07T08:56:32+00:00\",\"uid\":\"9068048e-5207-4d70-a037-d6f60948fa59\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4cb3f0fe-5a28-46e4-aeca-af520ddf4746\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":50,\"dateAdded\":\"2025-10-07T08:56:32+00:00\",\"uid\":\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6652c4a0-b521-4514-9e6a-ba6383a6325a\",\"editCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":\"Bővebben\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2025-10-07T08:56:32+00:00\",\"uid\":\"80238b96-825c-41e1-bf26-1c3226867f6a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"785c09ff-d241-42d1-b0a7-c985a24a712c\",\"editCondition\":null}]}],\"generatedFields\":[],\"cardView\":[],\"cardThumbAlignment\":\"end\"}','2025-10-07 08:56:32','2025-10-07 08:56:32',NULL,'32cee94c-54c1-466a-924e-77238954f3f1');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_watqftvrjemqyishhdeukppaqukgvtxlqxee` (`handle`,`context`),
  KEY `idx_mlxogvxqviwzzhinuuvfrewbouuralermexl` (`context`),
  KEY `idx_rncfhbolwoxxozkikuikxdrcawbuhqoajfzh` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES
(1,'Kategória','catField','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Categories','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"source\":null,\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-09-23 14:58:42','2025-09-23 14:58:42',NULL,'d46898f6-87ca-4eea-ae8d-1c1f76206e53'),
(2,'Bejegyzések','post','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"defaultPlacement\":\"end\",\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedEntries\":false,\"showUnpermittedSections\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-09-23 14:59:42','2025-09-23 15:41:12',NULL,'785c09ff-d241-42d1-b0a7-c985a24a712c'),
(3,'Szöveg','simpleText','global',NULL,NULL,0,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":3,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2025-09-23 15:01:24','2025-10-03 07:30:55',NULL,'d11f6ee6-67d9-4ae4-8924-e8dffc44555a'),
(4,'Választó','optional','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"customOptions\":false,\"options\":[{\"label\":\"Bejegyzés\",\"value\":\"post\",\"icon\":\"align-center\",\"color\":\"#4a55ff\",\"default\":\"1\"},{\"label\":\"Kategória\",\"value\":\"category\",\"icon\":\"tree\",\"color\":\"#59bb00\",\"default\":\"\"},{\"label\":\"Közvetlen link\",\"value\":\"directlink\",\"icon\":\"link-horizontal\",\"color\":\"#aa0000\",\"default\":\"\"}]}','2025-09-23 15:04:15','2025-09-23 15:04:15',NULL,'b3a9b4f6-0a54-40c7-80fa-8a53361137e2'),
(5,'Képváltó képek','sliderImage','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:36685e5a-d503-4f86-9d6d-e73a0d97dc93\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2025-09-25 17:50:02','2025-09-25 17:50:02',NULL,'5b557374-743e-40fc-8528-a0d4e9b40506'),
(6,'Sebesség','speed','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"step\":null,\"suffix\":null}','2025-09-25 18:22:21','2025-09-25 18:22:21',NULL,'a0ed06e8-7d19-46e7-b39f-32af2d4e18c3'),
(7,'Egy kép','onePict','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-09-27 06:51:34','2025-09-27 06:51:34',NULL,'8792f1cf-e9e4-4f28-9777-8c5304780529'),
(8,'Szöveg doboz','textBox','global',NULL,NULL,0,'site',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"characterLimit\":null,\"ckeConfig\":\"939c7f22-e6c5-4dbe-8aaa-69b6c587edd0\",\"createButtonLabel\":null,\"defaultTransform\":null,\"expandEntryButtons\":false,\"fullGraphqlData\":true,\"parseEmbeds\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"sourceEditingGroups\":[\"__ADMINS__\"],\"wordLimit\":null}','2025-09-27 16:26:00','2025-09-27 16:26:00',NULL,'6652c4a0-b521-4514-9e6a-ba6383a6325a'),
(9,'Adatok','datas','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"createButtonLabel\":null,\"defaultIndexViewMode\":\"cards\",\"enableVersioning\":false,\"entryTypes\":[{\"uid\":\"915fda05-fe2f-4d16-8676-0d5f34b33d08\",\"group\":\"Általános\"}],\"includeTableView\":false,\"maxEntries\":null,\"minEntries\":null,\"pageSize\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\",\"showCardsInGrid\":false,\"viewMode\":\"blocks\"}','2025-09-29 08:20:58','2025-09-29 08:20:58',NULL,'8ea3f70c-70e2-469a-945b-53ac9e122b75'),
(10,'Kapcsoló','switch','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":null,\"onLabel\":null}','2025-10-07 08:51:20','2025-10-07 08:51:20',NULL,'4cb3f0fe-5a28-46e4-aeca-af520ddf4746'),
(11,'Szöveges dokumnetum -  heti menu','menuDocFile','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"text\",\"word\"],\"branchLimit\":null,\"defaultPlacement\":\"end\",\"defaultUploadLocationSource\":\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\",\"defaultUploadLocationSubpath\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showCardsInGrid\":false,\"showSearchInput\":true,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2025-10-07 12:36:37','2025-10-07 12:58:19',NULL,'1ddf3471-9514-416a-8cdd-cb453f093e39');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ouovzkqubfujcizjoqkscxbrrnpsiutmmbau` (`name`),
  KEY `idx_yxlxcckbaednqudkckibirzdtbrhtaipgnao` (`handle`),
  KEY `idx_vhqvexskbcohqgemrgomhwpuwoukexkuikbe` (`fieldLayoutId`),
  KEY `idx_ucucilgsmydfyigzdtmsqykvnqbguaiwacfq` (`sortOrder`),
  CONSTRAINT `fk_hxxangazfqmyqngqzavdlgwzjhfehqcjpvuc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xedtevfzrpjzxncfzzsuewxyspsswrkkqlew` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
INSERT INTO `globalsets` VALUES
(12,'Fejléc','header',6,1,'2025-09-25 17:51:50','2025-09-25 17:51:50','8d411e5c-39cc-4ade-9676-74c2aae7bcf9');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scope`)),
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lpnlukyusftxdlquuhznqztrledoryjzjckx` (`accessToken`),
  UNIQUE KEY `idx_pjibmgpbrsqtdsdmvbjaryakwhiqriwkukyh` (`name`),
  KEY `fk_yiizgceaqxzibmpeaoejoeohyihggqehcimx` (`schemaId`),
  CONSTRAINT `fk_yiizgceaqxzibmpeaoejoeohyihggqehcimx` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jorxmzphbwzyamfhaileueqsyslebougkpon` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES
(1,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.png',NULL,'_30x15_crop_center-center_none',0,0,1,'2025-09-25 17:52:39','2025-09-25 17:52:39','2025-10-06 10:43:22','937e548d-e89b-4722-b0bc-6d2d460754d6'),
(2,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.png',NULL,'_60x30_crop_center-center_none',0,0,1,'2025-09-25 17:52:39','2025-09-25 17:52:39','2025-10-06 10:43:21','145069a8-5728-4107-a347-3e0222f4f1ea'),
(3,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.jpg',NULL,'_30x22_crop_center-center_none',0,0,1,'2025-09-25 17:53:44','2025-09-25 17:53:44','2025-10-06 10:43:22','5790062b-9db7-45f7-b950-89aa6237edcd'),
(4,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.jpg',NULL,'_60x45_crop_center-center_none',0,0,1,'2025-09-25 17:53:44','2025-09-25 17:53:44','2025-10-06 10:43:21','3834484d-f24c-4f54-af45-2e00a3508add'),
(5,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.jpg',NULL,'_120x90_crop_center-center_none',0,0,1,'2025-09-25 17:53:46','2025-09-25 17:53:46','2025-10-06 10:42:33','f5d7bcf4-34c1-4d98-8b02-136291715c69'),
(6,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.jpg',NULL,'_240x180_crop_center-center_none',0,0,1,'2025-09-25 17:53:46','2025-09-25 17:53:46','2025-10-06 10:42:33','a2a6f948-9094-4d08-9265-519751872063'),
(7,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.png',NULL,'_120x60_crop_center-center_none',0,0,1,'2025-09-25 17:53:50','2025-09-25 17:53:50','2025-09-29 06:10:13','095698ce-7a65-4cde-b9a2-9848b0331288'),
(8,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.png',NULL,'_240x120_crop_center-center_none',0,0,1,'2025-09-25 17:53:50','2025-09-25 17:53:50','2025-09-29 06:10:13','26d739c6-0ab4-4063-b926-21083c0128de'),
(9,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.jpeg',NULL,'_30x16_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:22','af1d4bf8-6197-4096-9474-d68141f3f4e5'),
(10,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.jpeg',NULL,'_60x33_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:21','a59ba640-ad99-4d60-bd3e-e46b76aae487'),
(11,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.jpeg',NULL,'_30x20_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:22','67bff6e7-ddab-491c-ba28-ad16f8f23ceb'),
(12,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.jpeg',NULL,'_60x40_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:21','45de4a84-825e-4544-b4f7-28ece364e8c4'),
(13,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_30x12_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:22','c565b3a7-dfc2-45fb-a533-d79d27a27b9f'),
(14,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_60x24_crop_center-center_none',0,0,1,'2025-09-25 17:54:36','2025-09-25 17:54:36','2025-10-06 10:43:21','937a245a-1892-446d-9348-bc807226efbc'),
(15,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.jpeg',NULL,'_120x67_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-06 10:42:33','20508523-6a34-4efa-91fa-320cdbd0d10d'),
(16,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.jpeg',NULL,'_240x135_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-06 10:42:33','f0c940fa-fe13-4f2c-b286-cb7621fda48d'),
(17,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.jpeg',NULL,'_120x80_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-03 07:10:12','23a1a775-81d7-4b7f-9bba-289d60cf91da'),
(18,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.jpeg',NULL,'_240x160_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-03 07:10:12','04db8f24-28ce-4b74-8fb6-7d95118e4435'),
(19,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_120x48_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-06 10:42:33','6191e891-3b5f-4925-80e7-7f169916d3ea'),
(20,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_240x96_crop_center-center_none',0,0,1,'2025-09-25 17:54:37','2025-09-25 17:54:37','2025-10-06 10:42:33','ad83d18f-55e2-4fd0-8de7-1ee15c24f009'),
(21,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_350x140_crop_center-center_none',1,0,0,'2025-09-25 17:54:48','2025-09-25 17:54:48','2025-09-25 17:54:48','9e5cda52-a44f-4c82-8bae-e5fbb466a983'),
(22,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.jpeg',NULL,'_700x280_crop_center-center_none',1,0,0,'2025-09-25 17:54:48','2025-09-25 17:54:48','2025-09-25 18:13:33','d77afac4-20fe-48dc-a04b-f26048a3b4ce'),
(23,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.webp','webp','_1980x800_crop_center-right_95_none',1,0,0,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-09-25 18:19:24','b45be6d8-e753-4ed0-aa52-ff2e0073d397'),
(24,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-10-06 10:42:20','a0531d77-39b1-4c33-9929-53209ffb4484'),
(25,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.webp','webp','_1980x800_crop_center-right_95_none',1,0,0,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-09-25 18:19:26','a5e2d331-d5de-45a6-ab80-bf0df19e6c3c'),
(26,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-10-03 07:08:53','f8fec1ce-8e55-40bd-ae2a-c38d5b44fdc5'),
(27,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.webp','webp','_1980x800_crop_center-right_95_none',1,0,0,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-09-25 18:19:27','39aa1588-ba96-4fe0-9b81-e480cb7a49de'),
(28,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-09-25 18:19:23','2025-09-25 18:19:23','2025-10-06 10:42:20','ccad139d-e36a-42e0-885c-5b539d795329'),
(29,18,'craft\\imagetransforms\\ImageTransformer','park_hedervar_logo.png',NULL,'_30x17_crop_center-center_none',1,0,1,'2025-09-27 06:54:08','2025-09-27 06:54:08','2025-10-03 07:10:12','e7bf2c00-f70b-4a16-8f39-f8df0ec1099a'),
(30,18,'craft\\imagetransforms\\ImageTransformer','park_hedervar_logo.png',NULL,'_60x34_crop_center-center_none',1,0,1,'2025-09-27 06:54:08','2025-09-27 06:54:08','2025-10-03 07:10:12','7b0929b9-0d34-4c31-94e2-d9ec3846fc25'),
(31,17,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1547200829.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-09-27 11:39:47','2025-09-27 11:39:47','2025-10-06 10:42:20','5788de93-592a-4813-8f4c-0e10f42d1a4b'),
(32,16,'craft\\imagetransforms\\ImageTransformer','AdobeStock_244182656.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-09-27 11:39:47','2025-09-27 11:39:47','2025-10-03 07:08:55','4701264f-1eeb-4dcb-b9cd-0b025cf68626'),
(33,15,'craft\\imagetransforms\\ImageTransformer','AdobeStock_1545881037.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-09-27 11:39:47','2025-09-27 11:39:47','2025-10-06 10:42:20','6f24a695-883a-4c71-a8c2-d27ca3ab535e'),
(34,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-09-29 06:09:42','2025-09-29 06:09:42','2025-10-06 10:42:20','d03b0c94-190e-4464-bf4b-11299170f129'),
(35,14,'craft\\imagetransforms\\ImageTransformer','IMG_20210828_202521.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-09-29 06:09:42','2025-09-29 06:09:42','2025-10-06 10:42:20','f7bd2524-feb7-45e4-b4b6-355209cb76a4'),
(36,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-09-29 06:09:42','2025-09-29 06:09:42','2025-09-29 06:09:42','a394f92b-3b06-4454-9363-4d4ea62ec97f'),
(37,13,'craft\\imagetransforms\\ImageTransformer','Screenshot-2025-09-06-at-14.04.16.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-09-29 06:09:42','2025-09-29 06:09:42','2025-09-29 06:09:42','f0c97c7c-b006-4dea-8636-c378d67b6ea3'),
(38,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_30x20_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','cd7a2555-d001-4103-ad95-ecd060541a5c'),
(39,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_60x40_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','5628e4a2-ce3e-4a38-b942-492119090d59'),
(40,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_30x20_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','366dd247-8821-425b-8ed8-4ea9f606accb'),
(41,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_60x40_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','3b01cb5f-0e11-408b-a38d-bce803a0a506'),
(42,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_30x19_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','7ac7ab17-5747-42b8-aaa9-911ba5682193'),
(43,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_60x39_crop_center-center_none',1,0,1,'2025-09-29 06:10:21','2025-09-29 06:10:21','2025-10-06 10:42:38','5fd85972-11d2-4dbc-9da6-bb3bf6bad7ca'),
(44,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_120x80_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:39','0ab7d99d-9ce3-4d11-92ab-758b45db446c'),
(45,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_240x160_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:39','bc3a2322-e7bd-4300-8a1c-897d4b739b08'),
(46,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_120x80_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:48','2ac172d4-5f6b-47db-926e-a128e9c2da09'),
(47,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_240x160_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:48','5a55079d-2331-4e6c-82c7-96b08cddba9f'),
(48,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_120x79_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:44','8a623a28-f14a-4d4a-9e4c-e8a3c4ca157c'),
(49,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_240x159_crop_center-center_none',1,0,1,'2025-09-29 06:10:26','2025-09-29 06:10:26','2025-10-06 10:42:44','76671845-4a8f-474d-b3f9-95cfd49389a5'),
(50,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.webp','webp','_1920x1280_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','ccc8c60b-bc75-4de3-b66f-67221ca753d8'),
(51,19,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.webp','webp','_640x480_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','a4a5b4bf-3536-4a82-9e43-ea697950b829'),
(52,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.webp','webp','_1920x1280_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','7855f567-2e0b-4f56-9c7b-dad5951cdf39'),
(53,20,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.webp','webp','_640x480_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','fb590c5a-1506-4e92-8c5f-8994e2cba161'),
(54,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.webp','webp','_1920x1280_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','e0f52b40-1f77-4325-83e3-8afce01456b0'),
(55,21,'craft\\imagetransforms\\ImageTransformer','DSC07726.webp','webp','_640x480_crop_center-right_95_none',1,0,1,'2025-09-29 06:10:38','2025-09-29 06:10:38','2025-10-06 10:44:08','d678129f-3955-4b6d-83e0-8a347b2a494b'),
(56,26,'craft\\imagetransforms\\ImageTransformer','park-panzio_logo.jpg',NULL,'_30x22_crop_center-center_none',0,0,1,'2025-09-29 13:32:07','2025-09-29 13:32:07','2025-10-05 06:39:57','20dbe38c-7ce3-4b2a-a988-278eb22be15f'),
(57,26,'craft\\imagetransforms\\ImageTransformer','park-panzio_logo.jpg',NULL,'_60x44_crop_center-center_none',0,0,1,'2025-09-29 13:32:07','2025-09-29 13:32:07','2025-10-05 06:39:57','6a65669b-3778-4f70-bc7d-166df7f4495a'),
(58,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_30x19_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','a6510670-191a-49f1-8e71-832b1bdba8bb'),
(59,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_60x39_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','4250bff1-4e0e-4854-96e6-a0acfc137189'),
(60,29,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_30x20_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','63d3a20c-f0fe-42cc-b235-c955755293ed'),
(61,29,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703153341_0290_D.jpg',NULL,'_60x40_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','6aa972f5-3d62-453c-89db-6146ef3b85ff'),
(62,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_30x20_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','38487267-10ab-41ac-9cf9-8aded0e4ff2b'),
(63,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_60x40_crop_center-center_none',1,0,1,'2025-10-03 07:28:48','2025-10-03 07:28:48','2025-10-06 10:43:40','7875a726-7e9b-45f1-9860-225419fbbae1'),
(64,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_30x19_crop_center-center_none',1,0,1,'2025-10-03 07:29:25','2025-10-03 07:29:25','2025-10-06 10:43:40','a74a874f-93cc-4278-b17c-8bf7d6920436'),
(65,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_60x39_crop_center-center_none',1,0,1,'2025-10-03 07:29:25','2025-10-03 07:29:25','2025-10-06 10:43:40','973d56e1-daa4-45d6-9993-4fff295c93ad'),
(66,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_30x19_crop_center-center_none',1,0,1,'2025-10-03 07:29:37','2025-10-03 07:29:37','2025-10-06 10:43:40','713be924-731b-420f-bd39-3d96099c0c77'),
(67,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_60x39_crop_center-center_none',1,0,1,'2025-10-03 07:29:37','2025-10-03 07:29:37','2025-10-06 10:43:40','c94aa12d-0a77-458c-bd29-9ba51f88cb52'),
(68,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_800x450_crop_center-center_none',1,0,0,'2025-10-03 07:33:17','2025-10-03 07:33:17','2025-10-03 07:33:17','8fd9460a-6853-4bd2-ae9a-f87dad1d90a2'),
(69,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_800x450_crop_center-center_none',1,0,0,'2025-10-03 07:33:44','2025-10-03 07:33:44','2025-10-03 07:33:44','3b0b90ca-3be5-4500-b7d6-b1b693d14792'),
(70,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_800x450_crop_center-center_none',1,0,0,'2025-10-03 07:33:44','2025-10-03 07:33:44','2025-10-03 07:33:44','9cb8b9d3-0770-4b0e-8119-1cda423f1ac9'),
(71,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_800x450_crop_center-center_none',1,0,0,'2025-10-03 07:33:44','2025-10-03 07:33:44','2025-10-03 07:33:44','8f5fea49-7d8e-47f7-91aa-b9d5eb2f9399'),
(72,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_1280x960_crop_center-center_none',1,0,1,'2025-10-03 07:43:25','2025-10-03 07:43:25','2025-10-06 10:44:08','bfbfb6ab-5a49-4d22-95a3-c4b861be4aac'),
(73,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_640x480_crop_center-center_none',1,0,0,'2025-10-03 07:45:47','2025-10-03 07:45:47','2025-10-03 07:45:48','895231f3-44ca-46d2-aeb6-1f20f7d24ce1'),
(74,30,'craft\\imagetransforms\\ImageTransformer','pico_DJI_20250703154444_0332_D.jpg',NULL,'_960x720_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:48','b565f4f0-1301-4fd1-b11c-7ffb9ef3bd8b'),
(75,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_640x480_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:48','3eed3b45-d052-4680-bff0-89632d88defc'),
(76,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_960x720_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:48','af4feed5-2412-4dfb-97f4-97d624139b53'),
(77,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_1280x960_crop_center-center_none',1,0,1,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-06 10:44:08','89830c3d-c32f-4051-887c-d4f307efa023'),
(78,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_640x480_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:49','6ef2d390-33c3-4788-b085-044ff9000aaa'),
(79,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_960x720_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:49','7795afd5-d9b4-4d4a-9f0e-9c1fac2c0223'),
(80,31,'craft\\imagetransforms\\ImageTransformer','DSC07853_thalia.jpg',NULL,'_1280x960_crop_center-center_none',1,0,1,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-06 10:44:08','cef46f18-65b7-4463-b788-9ca2b0182bf7'),
(81,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_640x480_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:49','13249256-b550-44b5-9b90-35710e73d9fd'),
(82,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_960x720_crop_center-center_none',1,0,0,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-03 07:46:49','3599c83c-0812-4684-b10b-3ecf5f2102b0'),
(83,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_1280x960_crop_center-center_none',1,0,1,'2025-10-03 07:46:48','2025-10-03 07:46:48','2025-10-06 10:44:08','70023bb8-bae5-4df1-8e29-6d768d1794ee'),
(84,44,'craft\\imagetransforms\\ImageTransformer','minta.jpg',NULL,'_30x28_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','09e0845b-de36-4065-be2e-8cab9356dc1b'),
(85,44,'craft\\imagetransforms\\ImageTransformer','minta.jpg',NULL,'_60x57_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','0f2aa0f2-aea5-430d-9694-7fe1a6f5d0bd'),
(86,41,'craft\\imagetransforms\\ImageTransformer','hajo_fotoshop_moibil.jpg',NULL,'_30x16_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','571d5b82-5beb-475a-ba67-ca62f6d4ecf0'),
(87,41,'craft\\imagetransforms\\ImageTransformer','hajo_fotoshop_moibil.jpg',NULL,'_60x33_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','c41f475e-a3a0-48d3-835e-2f1b1f39a663'),
(88,42,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_30x16_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','605fcdbd-2cfa-483c-952e-91c4a859a2e8'),
(89,42,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_60x33_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','d885e382-5016-4f85-98c8-801b69bcb059'),
(90,43,'craft\\imagetransforms\\ImageTransformer','a2f65294-6002-4e56-85a9-ae87e8bdefe7.png',NULL,'_30x20_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','81966cef-b9f9-45ad-8cdb-e2224d9d1863'),
(91,43,'craft\\imagetransforms\\ImageTransformer','a2f65294-6002-4e56-85a9-ae87e8bdefe7.png',NULL,'_60x40_crop_center-center_none',0,0,1,'2025-10-03 19:05:52','2025-10-03 19:05:52','2025-10-07 10:41:52','9bedda86-994d-4be0-a316-9de36e7a0d8b'),
(92,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_285x190_crop_center-center_none',0,0,1,'2025-10-03 19:06:28','2025-10-03 19:06:28','2025-10-03 19:06:29','4a35e12d-2ff9-4cf4-a084-a83ba4bf27cd'),
(93,28,'craft\\imagetransforms\\ImageTransformer','DSC07726.jpg',NULL,'_570x380_crop_center-center_none',0,0,1,'2025-10-03 19:06:28','2025-10-03 19:06:28','2025-10-03 19:06:29','f7bef4a1-ef22-4e5e-9bd5-ac76204189c6'),
(94,42,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_1280x960_crop_center-center_none',0,0,1,'2025-10-03 19:06:43','2025-10-03 19:06:43','2025-10-06 10:42:20','602fb47a-ef08-4117-afe9-fe6f5f35b233'),
(95,43,'craft\\imagetransforms\\ImageTransformer','a2f65294-6002-4e56-85a9-ae87e8bdefe7.png',NULL,'_1280x960_crop_center-center_none',0,0,1,'2025-10-03 19:06:43','2025-10-03 19:06:43','2025-10-06 10:42:20','33931ca4-781d-47e8-95ea-6ad924e133a1'),
(96,41,'craft\\imagetransforms\\ImageTransformer','hajo_fotoshop_moibil.jpg',NULL,'_1280x960_crop_center-center_none',0,0,1,'2025-10-03 19:06:43','2025-10-03 19:06:43','2025-10-06 10:42:20','06dad165-3f33-4f64-aeae-60fdc5d0502c'),
(97,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_120x67_crop_center-center_none',0,0,1,'2025-10-04 09:54:05','2025-10-04 09:54:05','2025-10-06 10:42:33','bc7674f9-1e65-4c65-9185-6b2c7fb145ae'),
(98,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_240x135_crop_center-center_none',0,0,1,'2025-10-04 09:54:05','2025-10-04 09:54:05','2025-10-06 10:42:33','98b9d597-b21f-4bff-9e77-f7cccf4ec489'),
(99,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.webp','webp','_1920x1280_crop_center-right_95_none',0,0,1,'2025-10-04 09:54:08','2025-10-04 09:54:08','2025-10-06 10:42:20','8137910e-f312-4944-ba1d-5fd35843934d'),
(100,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.webp','webp','_640x480_crop_center-right_95_none',0,0,1,'2025-10-04 09:54:08','2025-10-04 09:54:08','2025-10-06 10:42:20','d7354e1a-5e25-4355-93c7-afe1907d3450'),
(101,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_30x16_crop_center-center_none',0,0,1,'2025-10-06 10:42:38','2025-10-06 10:42:38','2025-10-06 10:43:22','2422eec8-5a07-4f99-94c6-8c9df5483645'),
(102,53,'craft\\imagetransforms\\ImageTransformer','hajo_ocean_full_hd.jpg',NULL,'_60x33_crop_center-center_none',0,0,1,'2025-10-06 10:42:38','2025-10-06 10:42:38','2025-10-06 10:43:21','b9e0bf69-677d-406e-a630-148b7f93965c'),
(103,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.jpg',NULL,'_30x20_crop_center-center_none',1,0,0,'2025-10-06 10:43:21','2025-10-06 10:43:21','2025-10-06 10:43:21','2ba9c3ea-2535-4fd3-9bf5-aa8add99fcbf'),
(104,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.jpg',NULL,'_60x40_crop_center-center_none',1,0,0,'2025-10-06 10:43:21','2025-10-06 10:43:21','2025-10-06 10:43:21','21ca298c-df4a-47c3-adf3-d96172b3a303'),
(105,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.jpg',NULL,'_120x80_crop_center-center_none',1,0,0,'2025-10-06 10:43:23','2025-10-06 10:43:23','2025-10-06 10:43:23','224a7a4f-19a7-4a7b-b094-32cf47f5e8f8'),
(106,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.jpg',NULL,'_240x160_crop_center-center_none',1,0,0,'2025-10-06 10:43:23','2025-10-06 10:43:23','2025-10-06 10:43:26','7fad2375-ea5a-4a43-b775-5c1a9d486912'),
(107,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.webp','webp','_1920x1280_crop_center-right_95_none',1,0,0,'2025-10-06 10:44:08','2025-10-06 10:44:08','2025-10-06 10:44:09','66700ac0-d0a7-408a-8501-8220a6d072fe'),
(108,54,'craft\\imagetransforms\\ImageTransformer','pico_DSC07230.webp','webp','_640x480_crop_center-right_95_none',1,0,0,'2025-10-06 10:44:08','2025-10-06 10:44:08','2025-10-06 10:44:09','c3031d1f-8032-4347-8dcd-2cdf30e2cdec'),
(109,32,'craft\\imagetransforms\\ImageTransformer','DJI_20250723140426_0500_D.jpg',NULL,'_1280xAUTO_crop_center-center_none',1,0,0,'2025-10-07 09:28:50','2025-10-07 09:28:50','2025-10-07 09:28:50','e1d0204b-4b0a-4fd7-8810-9928755ed53a'),
(110,66,'craft\\imagetransforms\\ImageTransformer','DJI_0948.jpg',NULL,'_19x30_crop_center-center_none',1,0,0,'2025-10-07 10:41:52','2025-10-07 10:41:52','2025-10-07 10:41:52','297b4169-c9f7-40f9-a265-76557152c688'),
(111,66,'craft\\imagetransforms\\ImageTransformer','DJI_0948.jpg',NULL,'_39x60_crop_center-center_none',1,0,0,'2025-10-07 10:41:52','2025-10-07 10:41:52','2025-10-07 10:41:52','effefa55-31d2-491e-910d-d169bb07babc'),
(112,66,'craft\\imagetransforms\\ImageTransformer','DJI_0948.jpg',NULL,'_800xAUTO_crop_center-center_none',1,0,0,'2025-10-07 10:42:37','2025-10-07 10:42:37','2025-10-07 10:42:37','9b28dbaa-7715-427c-a834-2fc82ad78ebb');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypeqblgejhxisguuofdemhyxgqlearutlbaq` (`name`),
  KEY `idx_rhvhdkqhjqtyfajqbkjtxxwkecznkjzzmyom` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES
(1,'5.8.17','5.8.0.3',0,'tehggnepwjgy','3@pkkkgirasq','2025-09-21 10:33:25','2025-10-07 12:58:19','dd54d5f3-5601-49c6-8543-847cad10880e');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wfsiistetvnptpytaqoiaycvpaogjegpiyul` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','9eb4ea4a-dc2d-4686-a073-8a20f422de22'),
(2,'craft','m221101_115859_create_entries_authors_table','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','e00ad55c-1e07-4fe2-9ac8-796c45469ec7'),
(3,'craft','m221107_112121_add_max_authors_to_sections','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','087e712f-63f9-4af8-b1c0-0e7e230c8c56'),
(4,'craft','m221205_082005_translatable_asset_alt_text','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','90310d23-0047-4952-bacb-b42970e375b4'),
(5,'craft','m230314_110309_add_authenticator_table','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','d6b70eca-78ea-4143-bc37-4f9830562d72'),
(6,'craft','m230314_111234_add_webauthn_table','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','c7c7e423-07d6-4dc1-9770-4a4c7747b6d5'),
(7,'craft','m230503_120303_add_recoverycodes_table','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','e02be500-fe24-416e-aa6a-b0b336bef024'),
(8,'craft','m230511_000000_field_layout_configs','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','abd70ae5-1f1c-4ab5-83e6-d3778975792a'),
(9,'craft','m230511_215903_content_refactor','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','7222deca-678b-497f-bbce-05657a19543b'),
(10,'craft','m230524_000000_add_entry_type_show_slug_field','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','73652827-7f07-4512-9cc4-bf24495c2df1'),
(11,'craft','m230524_000001_entry_type_icons','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','7e1e2654-3d98-4bd5-ad3f-38734cbdc0c1'),
(12,'craft','m230524_000002_entry_type_colors','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','d2d3b375-042d-4a63-9a8a-3962c44cc7c0'),
(13,'craft','m230524_220029_global_entry_types','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','6f500b57-4e43-4c91-8c1c-3a1e84ca767d'),
(14,'craft','m230531_123004_add_entry_type_show_status_field','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','266cdd13-38ea-4232-84ba-41f3eb99804b'),
(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','c7b67070-508f-45ce-bec1-dbec4f297a86'),
(16,'craft','m230616_173810_kill_field_groups','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','6679a842-a243-42e7-9a89-474eb401b48f'),
(17,'craft','m230616_183820_remove_field_name_limit','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','a94b3c30-3f94-42d8-b173-48030c8bb052'),
(18,'craft','m230617_070415_entrify_matrix_blocks','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','a957f3ab-ea83-4e6e-b478-e792ae67c372'),
(19,'craft','m230710_162700_element_activity','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','f64355a4-0dbf-473b-a9aa-4924319c8b7f'),
(20,'craft','m230820_162023_fix_cache_id_type','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','21b87bf8-d57a-475c-86b6-1fdd0fddd8b1'),
(21,'craft','m230826_094050_fix_session_id_type','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','9b7a4bfb-f27b-4067-90e2-513d5ab1bbf0'),
(22,'craft','m230904_190356_address_fields','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','da03ac9e-fa9b-4ae5-a2c2-34865d160424'),
(23,'craft','m230928_144045_add_subpath_to_volumes','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','dd27bb53-5039-4ed0-a95a-a08af7d6e497'),
(24,'craft','m231013_185640_changedfields_amend_primary_key','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','689a409b-e602-4999-989a-d3f1c406e4e2'),
(25,'craft','m231213_030600_element_bulk_ops','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','ee31d685-3eac-4b20-9098-bfc41bd544f7'),
(26,'craft','m240129_150719_sites_language_amend_length','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','44ad23e1-eb62-410b-b63b-e60abfafd6de'),
(27,'craft','m240206_035135_convert_json_columns','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','b98ae88c-7807-4008-9823-5b1dd0679d5f'),
(28,'craft','m240207_182452_address_line_3','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','ce886b25-f42d-42c4-ad8a-ad3eb88bc404'),
(29,'craft','m240302_212719_solo_preview_targets','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','cfae1cb7-f775-4cc3-ac37-f1ca35602f31'),
(30,'craft','m240619_091352_add_auth_2fa_timestamp','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','d6908b48-f630-4a59-8ea3-03a7cc7e9d8d'),
(31,'craft','m240723_214330_drop_bulkop_fk','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','e1cd1ab1-2f0d-46b2-b20c-ecfb995055a7'),
(32,'craft','m240731_053543_soft_delete_fields','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','74601f21-c754-4df7-903e-9b57b407096a'),
(33,'craft','m240805_154041_sso_identities','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','eef82dad-abd5-4b53-a901-507a88d7ba1e'),
(34,'craft','m240926_202248_track_entries_deleted_with_section','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','59bfdab3-38ac-4bd7-a261-bfa9aaef6e52'),
(35,'craft','m241120_190905_user_affiliated_sites','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','5da65441-9c77-4cbb-8dc6-f1113606756a'),
(36,'craft','m241125_122914_add_viewUsers_permission','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','e2bfb470-6608-442b-a864-a05aaeb7ef0a'),
(37,'craft','m250119_135304_entry_type_overrides','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','ec11a4d4-c46e-4be0-a3a1-3102fe337e49'),
(38,'craft','m250206_135036_search_index_queue','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','85b8e46f-a742-4e0a-b037-d08e2503f2c5'),
(39,'craft','m250207_172349_bulkop_events','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','cf9ead1a-3477-4ba1-9bbd-a0edb389d367'),
(40,'craft','m250315_131608_unlimited_authors','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','fd011a3e-a843-4736-9274-34d22949c52b'),
(41,'craft','m250403_171253_static_statuses','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','8c987366-d0cd-4f91-98f2-ac15ba20f50e'),
(42,'craft','m250512_164202_asset_mime_types','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','1dcff55d-7caa-4bfb-8699-76931c55b3d4'),
(43,'craft','m250522_090843_add_deleteEntriesForSite_and_deletePeerEntriesForSite_permissions','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','1abca286-23e8-47bf-b615-9dd7e94a1807'),
(44,'craft','m250531_183058_content_blocks','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','659957af-5c7b-4f23-bc25-66057b8ac436'),
(45,'craft','m250623_105031_entry_type_descriptions','2025-09-21 10:33:26','2025-09-21 10:33:26','2025-09-21 10:33:26','dbd5ed95-f2f2-44ae-8cdc-ad5d4c5d25a0'),
(46,'plugin:ckeditor','Install','2025-09-23 14:24:51','2025-09-23 14:24:51','2025-09-23 14:24:51','c5c04949-98dd-496d-9cd4-4f139131d76c'),
(47,'plugin:ckeditor','m230408_163704_v3_upgrade','2025-09-23 14:24:51','2025-09-23 14:24:51','2025-09-23 14:24:51','65173929-a49d-4b8a-a082-b0522e9c16ab');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jgxyjuzyyftozxdeieodknxwpazboefjywhc` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'ckeditor','4.10.1','3.0.0.0','2025-09-23 14:24:51','2025-09-23 14:24:51','2025-09-23 14:24:51','3a54e021-63aa-47e6-9362-63387bcfdda1');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.0','1'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.1','2'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.2','3'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.3','4'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.4','5'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.headingLevels.5','6'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.name','\"Simple\"'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.toolbar.0','\"heading\"'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.toolbar.1','\"|\"'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.toolbar.2','\"bold\"'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.toolbar.3','\"italic\"'),
('ckeditor.configs.846aa6c1-3a4b-4656-a534-646aa812d4f4.toolbar.4','\"link\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.0','1'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.1','2'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.2','3'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.3','4'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.4','5'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.headingLevels.5','6'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.name','\"Basic dw\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.0','\"heading\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.1','\"|\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.2','\"bold\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.3','\"italic\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.4','\"underline\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.5','\"superscript\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.6','\"link\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.7','\"bulletedList\"'),
('ckeditor.configs.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0.toolbar.8','\"sourceEditing\"'),
('dateModified','1759841899'),
('email.fromEmail','\"fulop.viktor.dwiki@gmail.com\"'),
('email.fromName','\"parkhedervar\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.color','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.description','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.cardThumbAlignment','\"end\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elementCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.autocomplete','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.autocorrect','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.class','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.dateAdded','\"2025-09-23T15:34:11+00:00\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.disabled','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.elementCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.id','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.includeInCards','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.inputType','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.instructions','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.label','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.max','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.min','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.name','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.orientation','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.placeholder','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.readonly','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.required','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.size','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.step','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.tip','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.title','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.uid','\"a1192016-bb24-435c-9742-f27ac4019a27\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.warning','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.0.width','100'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.dateAdded','\"2025-09-23T15:40:58+00:00\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.editCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.elementCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.fieldUid','\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.handle','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.includeInCards','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.instructions','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.label','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.required','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.tip','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.uid','\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.warning','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.1.width','50'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.dateAdded','\"2025-09-23T15:40:58+00:00\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.editCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.fieldUid','\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.layoutElementUid','\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.uid','\"0e9a9dfe-323e-4651-9e4f-9da62a36bf03\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.conditionRules.0.values.0','\"post\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.elementCondition.fieldContext','\"global\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.fieldUid','\"785c09ff-d241-42d1-b0a7-c985a24a712c\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.handle','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.includeInCards','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.instructions','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.label','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.required','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.tip','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.uid','\"8c4dad14-33e1-4b9f-9b44-a65e51756aff\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.warning','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.2.width','50'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.dateAdded','\"2025-09-23T15:40:58+00:00\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.editCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.fieldUid','\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.layoutElementUid','\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.uid','\"9310e6f5-2150-4cb8-bebf-b3976c957136\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.conditionRules.0.values.0','\"category\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.elementCondition.fieldContext','\"global\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.fieldUid','\"d46898f6-87ca-4eea-ae8d-1c1f76206e53\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.handle','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.includeInCards','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.instructions','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.label','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.required','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.tip','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.uid','\"e4fbc9fd-1e82-4d35-b3e8-d19c96c58ba8\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.warning','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.3.width','50'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.dateAdded','\"2025-09-23T15:40:58+00:00\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.editCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.class','\"craft\\\\elements\\\\conditions\\\\entries\\\\EntryCondition\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\OptionsFieldConditionRule\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.fieldUid','\"b3a9b4f6-0a54-40c7-80fa-8a53361137e2\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.layoutElementUid','\"e436c514-bcfd-4864-861d-b2a78fea0fb6\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.operator','\"in\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.uid','\"37bbb753-0ffd-4fee-8584-e9354365546e\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.conditionRules.0.values.0','\"directlink\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.elementType','\"craft\\\\elements\\\\Entry\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.elementCondition.fieldContext','\"global\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.handle','\"dirctLink\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.includeInCards','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.instructions','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.label','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.required','false'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.tip','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.uid','\"648f1037-f818-4de3-a52c-1ede9fe8db3f\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.warning','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.elements.4.width','50'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.name','\"Tartalom\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.uid','\"032fed4b-8906-4aa7-902e-91a9245bf561\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.fieldLayouts.7869728a-5c08-4218-b250-6cd6479ee0aa.tabs.0.userCondition','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.handle','\"menu\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.hasTitleField','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.icon','\"bars\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.name','\"Menü\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.showSlugField','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.showStatusField','true'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.slugTranslationKeyFormat','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.slugTranslationMethod','\"site\"'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.titleFormat','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.titleTranslationKeyFormat','null'),
('entryTypes.02980df4-89da-41dc-9c95-0b95a8764e23.titleTranslationMethod','\"site\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.color','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.description','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.cardThumbAlignment','\"end\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elementCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.autocomplete','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.autocorrect','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.class','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.dateAdded','\"2025-09-23T17:30:29+00:00\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.disabled','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.elementCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.id','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.includeInCards','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.inputType','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.instructions','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.label','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.max','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.min','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.name','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.orientation','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.placeholder','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.readonly','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.required','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.size','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.step','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.tip','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.title','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.uid','\"528b4136-fee6-4f42-bc7d-a3b260218c42\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.userCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.warning','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.0.width','100'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.dateAdded','\"2025-10-07T12:40:37+00:00\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.editCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.elementCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.fieldUid','\"1ddf3471-9514-416a-8cdd-cb453f093e39\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.handle','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.includeInCards','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.instructions','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.label','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.required','false'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.tip','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.uid','\"a42c773a-d749-40e5-bae8-628487af6dd5\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.userCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.warning','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.elements.1.width','100'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.name','\"Tartalom\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.uid','\"3246f1cd-4c7c-4f26-8e8b-edae8440b071\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.fieldLayouts.a53c10c1-fc3e-4480-b3ee-24fa81008da8.tabs.0.userCondition','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.handle','\"default\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.hasTitleField','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.icon','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.name','\"Nyitó\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.showSlugField','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.showStatusField','true'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.slugTranslationKeyFormat','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.slugTranslationMethod','\"site\"'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.titleFormat','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.titleTranslationKeyFormat','null'),
('entryTypes.3f01429d-2635-4f6a-a7e2-03296a05e255.titleTranslationMethod','\"site\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.color','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.description','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.cardThumbAlignment','\"end\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.autocomplete','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.autocorrect','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.class','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.dateAdded','\"2025-10-07T08:47:49+00:00\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.disabled','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.id','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.includeInCards','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.inputType','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.instructions','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.label','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.max','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.min','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.name','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.orientation','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.placeholder','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.readonly','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.required','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.size','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.step','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.tip','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.title','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.uid','\"a6bf5104-4ac5-412d-b0c0-233ffa11c1da\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.warning','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.0.width','100'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.dateAdded','\"2025-10-07T08:56:32+00:00\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.editCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.fieldUid','\"8792f1cf-e9e4-4f28-9777-8c5304780529\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.handle','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.includeInCards','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.instructions','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.label','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.required','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.tip','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.uid','\"0ec750be-83ed-48c0-b4aa-56c3ac0085db\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.warning','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.1.width','25'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.dateAdded','\"2025-10-07T08:56:32+00:00\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.editCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.fieldUid','\"4cb3f0fe-5a28-46e4-aeca-af520ddf4746\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.handle','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.includeInCards','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.instructions','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.label','\"Kép bal/jobb\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.required','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.tip','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.uid','\"9068048e-5207-4d70-a037-d6f60948fa59\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.warning','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.2.width','25'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.dateAdded','\"2025-10-07T08:56:32+00:00\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.editCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.fieldUid','\"6652c4a0-b521-4514-9e6a-ba6383a6325a\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.handle','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.includeInCards','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.instructions','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.label','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.required','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.tip','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.uid','\"e4bd36ac-58eb-4d56-bcff-ea00f775ad90\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.warning','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.3.width','50'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.dateAdded','\"2025-10-07T08:56:32+00:00\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.editCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.elementCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.fieldUid','\"785c09ff-d241-42d1-b0a7-c985a24a712c\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.handle','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.includeInCards','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.instructions','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.label','\"Bővebben\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.required','false'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.tip','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.uid','\"80238b96-825c-41e1-bf26-1c3226867f6a\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.warning','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.elements.4.width','100'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.name','\"Tartalom\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.uid','\"625283f1-195a-46be-814e-90bc5c296299\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.fieldLayouts.32cee94c-54c1-466a-924e-77238954f3f1.tabs.0.userCondition','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.handle','\"content\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.hasTitleField','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.icon','\"subtitles\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.name','\"Tartalom\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.showSlugField','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.showStatusField','true'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.slugTranslationKeyFormat','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.slugTranslationMethod','\"site\"'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.titleFormat','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.titleTranslationKeyFormat','null'),
('entryTypes.5fea41c4-9177-4d44-928a-27f69f223cc0.titleTranslationMethod','\"site\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.color','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.description','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.cardThumbAlignment','\"end\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elementCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.autocomplete','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.autocorrect','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.class','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.dateAdded','\"2025-09-23T15:19:38+00:00\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.disabled','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.elementCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.id','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.includeInCards','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.inputType','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.instructions','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.label','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.max','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.min','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.name','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.orientation','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.placeholder','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.readonly','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.required','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.size','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.step','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.tip','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.title','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.uid','\"e0e59d9f-6e59-40c2-997a-eb1d61a3e101\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.userCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.warning','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.0.width','100'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.dateAdded','\"2025-09-23T15:21:06+00:00\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.editCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.elementCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.handle','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.includeInCards','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.instructions','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.label','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.required','false'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.tip','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.uid','\"4bcb5fac-022c-4683-8473-1324831488f9\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.userCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.warning','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.elements.1.width','100'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.name','\"Tartalom\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.uid','\"603cbe38-3f71-4723-9d88-bff71ea7e6ca\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.fieldLayouts.f408692d-aeda-4199-bbc4-b9e6e5323e1c.tabs.0.userCondition','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.handle','\"article\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.hasTitleField','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.icon','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.name','\"Cikk\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.showSlugField','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.showStatusField','true'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.slugTranslationKeyFormat','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.slugTranslationMethod','\"site\"'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.titleFormat','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.titleTranslationKeyFormat','null'),
('entryTypes.8bcb174f-c2de-46c2-b796-1394dac78109.titleTranslationMethod','\"site\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.color','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.description','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.cardThumbAlignment','\"end\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elementCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.dateAdded','\"2025-09-29T08:20:42+00:00\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.editCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.elementCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.handle','\"simpleIcon\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.includeInCards','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.instructions','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.label','\"Sima ikon\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.required','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.tip','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.uid','\"badd7ee8-1f48-4e6f-8fd1-5ebc86d6a65b\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.userCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.warning','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.0.width','25'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.dateAdded','\"2025-09-29T08:20:42+00:00\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.editCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.elementCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.handle','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.includeInCards','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.instructions','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.label','\"Adat szövege\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.required','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.tip','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.uid','\"b743f491-f68a-48eb-9db6-ad3f6d50575d\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.userCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.warning','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.1.width','25'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.dateAdded','\"2025-09-29T08:20:42+00:00\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.editCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.elementCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.handle','\"simpleLink\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.includeInCards','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.instructions','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.label','\"URL\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.required','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.tip','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.uid','\"8096a1a7-c3a2-493d-9527-a89f29bdf4e7\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.userCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.warning','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.elements.2.width','50'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.name','\"Tartalom\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.uid','\"514af082-14ba-4e2d-9b2e-bcdb62136fcf\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.fieldLayouts.0ee4801b-d11b-4d85-b860-97718c31f27a.tabs.0.userCondition','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.handle','\"adat\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.hasTitleField','false'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.icon','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.name','\"Adat\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.showSlugField','true'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.showStatusField','true'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.slugTranslationKeyFormat','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.slugTranslationMethod','\"site\"'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.titleFormat','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.titleTranslationKeyFormat','null'),
('entryTypes.915fda05-fe2f-4d16-8676-0d5f34b33d08.titleTranslationMethod','\"site\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.color','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.description','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.cardThumbAlignment','\"end\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elementCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.autocomplete','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.autocorrect','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.class','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.dateAdded','\"2025-10-03T07:10:46+00:00\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.disabled','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.elementCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.id','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.includeInCards','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.inputType','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.instructions','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.label','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.max','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.min','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.name','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.orientation','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.placeholder','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.readonly','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.required','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.size','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.step','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.tip','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.title','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.uid','\"b997c09a-2ca8-44d9-bf5a-7911adbc6c9c\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.userCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.warning','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.0.width','100'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.dateAdded','\"2025-10-03T07:12:40+00:00\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.editCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.elementCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.fieldUid','\"8792f1cf-e9e4-4f28-9777-8c5304780529\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.handle','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.includeInCards','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.instructions','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.label','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.required','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.tip','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.uid','\"755d6114-457b-46a8-9106-04c302188c53\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.userCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.warning','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.1.width','100'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.dateAdded','\"2025-10-03T07:12:40+00:00\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.editCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.elementCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.handle','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.includeInCards','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.instructions','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.label','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.required','false'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.tip','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.uid','\"6755a832-4602-473a-a932-b6633c4cf009\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.userCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.warning','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.elements.2.width','100'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.name','\"Tartalom\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.uid','\"39ce1a3c-5785-4975-943c-feac9d5bd3de\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.fieldLayouts.f4565d83-a86a-41ac-8c36-a614d2ff66f1.tabs.0.userCondition','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.handle','\"new\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.hasTitleField','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.icon','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.name','\"HÍr\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.showSlugField','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.showStatusField','true'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.slugTranslationKeyFormat','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.slugTranslationMethod','\"site\"'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.titleFormat','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.titleTranslationKeyFormat','null'),
('entryTypes.becc6248-77f7-4548-9c0c-9326b0764e28.titleTranslationMethod','\"site\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.columnSuffix','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.handle','\"menuDocFile\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.instructions','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.name','\"Szöveges dokumnetum -  heti menu\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.searchable','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.allowedKinds.0','\"text\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.allowedKinds.1','\"word\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.allowSelfRelations','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.allowSubfolders','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.allowUploads','true'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.branchLimit','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.defaultPlacement','\"end\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.defaultUploadLocationSource','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.defaultUploadLocationSubpath','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.maintainHierarchy','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.maxRelations','1'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.minRelations','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.previewMode','\"full\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.restrictedDefaultUploadSubpath','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.restrictedLocationSource','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.restrictedLocationSubpath','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.restrictFiles','true'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.restrictLocation','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.selectionLabel','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.showCardsInGrid','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.showSearchInput','true'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.showSiteMenu','true'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.showUnpermittedFiles','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.showUnpermittedVolumes','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.sources','\"*\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.targetSiteId','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.validateRelatedElements','false'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.settings.viewMode','\"list\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.translationKeyFormat','null'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.translationMethod','\"site\"'),
('fields.1ddf3471-9514-416a-8cdd-cb453f093e39.type','\"craft\\\\fields\\\\Assets\"'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.columnSuffix','null'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.handle','\"switch\"'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.instructions','null'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.name','\"Kapcsoló\"'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.searchable','false'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.settings.default','false'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.settings.offLabel','null'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.settings.onLabel','null'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.translationKeyFormat','null'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.translationMethod','\"none\"'),
('fields.4cb3f0fe-5a28-46e4-aeca-af520ddf4746.type','\"craft\\\\fields\\\\Lightswitch\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.columnSuffix','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.handle','\"sliderImage\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.instructions','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.name','\"Képváltó képek\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.searchable','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.allowedKinds.0','\"image\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.allowSelfRelations','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.allowSubfolders','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.allowUploads','true'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.branchLimit','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.defaultPlacement','\"end\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.defaultUploadLocationSource','\"volume:36685e5a-d503-4f86-9d6d-e73a0d97dc93\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.defaultUploadLocationSubpath','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.maintainHierarchy','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.maxRelations','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.minRelations','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.previewMode','\"full\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.restrictedDefaultUploadSubpath','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.restrictedLocationSource','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.restrictedLocationSubpath','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.restrictFiles','true'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.restrictLocation','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.selectionLabel','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.showCardsInGrid','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.showSearchInput','true'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.showSiteMenu','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.showUnpermittedFiles','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.showUnpermittedVolumes','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.sources','\"*\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.targetSiteId','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.validateRelatedElements','false'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.settings.viewMode','\"large\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.translationKeyFormat','null'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.translationMethod','\"none\"'),
('fields.5b557374-743e-40fc-8528-a0d4e9b40506.type','\"craft\\\\fields\\\\Assets\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.columnSuffix','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.handle','\"textBox\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.instructions','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.name','\"Szöveg doboz\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.searchable','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.availableTransforms','\"\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.availableVolumes','\"*\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.characterLimit','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.ckeConfig','\"939c7f22-e6c5-4dbe-8aaa-69b6c587edd0\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.createButtonLabel','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.defaultTransform','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.expandEntryButtons','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.fullGraphqlData','true'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.parseEmbeds','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.purifierConfig','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.purifyHtml','true'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.showUnpermittedFiles','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.showUnpermittedVolumes','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.showWordCount','false'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.sourceEditingGroups.0','\"__ADMINS__\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.settings.wordLimit','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.translationKeyFormat','null'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.translationMethod','\"site\"'),
('fields.6652c4a0-b521-4514-9e6a-ba6383a6325a.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.columnSuffix','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.handle','\"post\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.instructions','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.name','\"Bejegyzések\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.searchable','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.allowSelfRelations','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.branchLimit','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.defaultPlacement','\"end\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.maintainHierarchy','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.maxRelations','1'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.minRelations','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.selectionLabel','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.showCardsInGrid','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.showSearchInput','true'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.showSiteMenu','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.showUnpermittedEntries','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.showUnpermittedSections','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.sources','\"*\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.targetSiteId','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.validateRelatedElements','false'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.settings.viewMode','\"list\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.translationKeyFormat','null'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.translationMethod','\"none\"'),
('fields.785c09ff-d241-42d1-b0a7-c985a24a712c.type','\"craft\\\\fields\\\\Entries\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.columnSuffix','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.handle','\"onePict\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.instructions','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.name','\"Egy kép\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.searchable','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.allowedKinds.0','\"image\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.allowSelfRelations','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.allowSubfolders','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.allowUploads','true'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.branchLimit','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.defaultPlacement','\"end\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.defaultUploadLocationSource','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.defaultUploadLocationSubpath','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.maintainHierarchy','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.maxRelations','1'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.minRelations','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.previewMode','\"full\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.restrictedDefaultUploadSubpath','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.restrictedLocationSource','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.restrictedLocationSubpath','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.restrictFiles','true'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.restrictLocation','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.selectionLabel','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.showCardsInGrid','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.showSearchInput','true'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.showSiteMenu','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.showUnpermittedFiles','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.showUnpermittedVolumes','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.sources.0','\"volume:33fbdc92-4491-48e7-a475-1e1fdf3fc897\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.targetSiteId','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.validateRelatedElements','false'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.settings.viewMode','\"list\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.translationKeyFormat','null'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.translationMethod','\"none\"'),
('fields.8792f1cf-e9e4-4f28-9777-8c5304780529.type','\"craft\\\\fields\\\\Assets\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.columnSuffix','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.handle','\"datas\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.instructions','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.name','\"Adatok\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.searchable','false'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.createButtonLabel','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.defaultIndexViewMode','\"cards\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.enableVersioning','false'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.entryTypes.0.__assoc__.0.0','\"uid\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.entryTypes.0.__assoc__.0.1','\"915fda05-fe2f-4d16-8676-0d5f34b33d08\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.entryTypes.0.__assoc__.1.0','\"group\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.entryTypes.0.__assoc__.1.1','\"Általános\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.includeTableView','false'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.maxEntries','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.minEntries','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.pageSize','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.propagationKeyFormat','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.propagationMethod','\"all\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.showCardsInGrid','false'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.settings.viewMode','\"blocks\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.translationKeyFormat','null'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.translationMethod','\"site\"'),
('fields.8ea3f70c-70e2-469a-945b-53ac9e122b75.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.columnSuffix','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.handle','\"speed\"'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.instructions','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.name','\"Sebesség\"'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.searchable','false'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.decimals','0'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.defaultValue','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.max','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.min','0'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.prefix','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.previewCurrency','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.previewFormat','\"decimal\"'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.size','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.step','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.settings.suffix','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.translationKeyFormat','null'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.translationMethod','\"none\"'),
('fields.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3.type','\"craft\\\\fields\\\\Number\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.columnSuffix','null'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.handle','\"optional\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.instructions','null'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.name','\"Választó\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.searchable','false'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.customOptions','false'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.0.0','\"label\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.0.1','\"Bejegyzés\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.1.0','\"value\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.1.1','\"post\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.2.0','\"icon\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.2.1','\"align-center\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.3.0','\"color\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.3.1','\"#4a55ff\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.4.0','\"default\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.0.__assoc__.4.1','\"1\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.0.0','\"label\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.0.1','\"Kategória\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.1.0','\"value\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.1.1','\"category\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.2.0','\"icon\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.2.1','\"tree\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.3.0','\"color\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.3.1','\"#59bb00\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.4.0','\"default\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.1.__assoc__.4.1','\"\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.0.0','\"label\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.0.1','\"Közvetlen link\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.1.0','\"value\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.1.1','\"directlink\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.2.0','\"icon\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.2.1','\"link-horizontal\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.3.0','\"color\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.3.1','\"#aa0000\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.4.0','\"default\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.settings.options.2.__assoc__.4.1','\"\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.translationKeyFormat','null'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.translationMethod','\"none\"'),
('fields.b3a9b4f6-0a54-40c7-80fa-8a53361137e2.type','\"craft\\\\fields\\\\Dropdown\"'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.columnSuffix','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.handle','\"simpleText\"'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.instructions','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.name','\"Szöveg\"'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.searchable','false'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.byteLimit','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.charLimit','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.code','false'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.initialRows','3'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.multiline','true'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.placeholder','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.settings.uiMode','\"normal\"'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.translationKeyFormat','null'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.translationMethod','\"language\"'),
('fields.d11f6ee6-67d9-4ae4-8924-e8dffc44555a.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.columnSuffix','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.handle','\"catField\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.instructions','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.name','\"Kategória\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.searchable','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.allowSelfRelations','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.branchLimit','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.defaultPlacement','\"end\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.maintainHierarchy','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.maxRelations','1'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.minRelations','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.selectionLabel','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.showCardsInGrid','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.showSearchInput','true'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.showSiteMenu','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.source','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.targetSiteId','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.validateRelatedElements','false'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.settings.viewMode','\"list\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.translationKeyFormat','null'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.translationMethod','\"none\"'),
('fields.d46898f6-87ca-4eea-ae8d-1c1f76206e53.type','\"craft\\\\fields\\\\Categories\"'),
('fs.kepek.hasUrls','true'),
('fs.kepek.name','\"Képek\"'),
('fs.kepek.settings.path','\"@webroot/images\"'),
('fs.kepek.type','\"craft\\\\fs\\\\Local\"'),
('fs.kepek.url','\"/images\"'),
('fs.sliderPictPlace.hasUrls','true'),
('fs.sliderPictPlace.name','\"Képváltó képek helye\"'),
('fs.sliderPictPlace.settings.path','\"@webroot/sliderimages\"'),
('fs.sliderPictPlace.type','\"craft\\\\fs\\\\Local\"'),
('fs.sliderPictPlace.url','\"/sliderimages\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.cardThumbAlignment','\"end\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.dateAdded','\"2025-09-27T06:52:43+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.fieldUid','\"8792f1cf-e9e4-4f28-9777-8c5304780529\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.handle','\"image\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.label','\"Logó\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.uid','\"a1a88a46-026c-4cc6-83d0-3c1066b9280b\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.0.width','100'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.dateAdded','\"2025-09-27T16:28:02+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.fieldUid','\"6652c4a0-b521-4514-9e6a-ba6383a6325a\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.handle','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.label','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.uid','\"3ae2041d-31e4-40a1-b403-8088b570eefd\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.1.width','50'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.dateAdded','\"2025-09-25T17:51:50+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.fieldUid','\"5b557374-743e-40fc-8528-a0d4e9b40506\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.handle','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.label','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.uid','\"fe328b43-a2ee-46e2-a5fb-6eba425c1fbf\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.2.width','25'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.dateAdded','\"2025-09-25T18:23:01+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.fieldUid','\"a0ed06e8-7d19-46e7-b39f-32af2d4e18c3\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.handle','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.label','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.uid','\"d009cf12-5da2-4730-a496-fe9859c9b720\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.3.width','25'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.dateAdded','\"2025-10-01T08:58:48+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.heading','\"Gomb - menünek\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\Heading\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.uid','\"bdb0d28a-126d-4d95-9940-3cf770ae6287\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.4.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.dateAdded','\"2025-10-02T16:58:14+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.handle','\"iconName\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.label','\"Ikon neve\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.uid','\"d4c35d65-a3f5-4b8d-849e-ea5613c25f0b\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.5.width','25'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.dateAdded','\"2025-10-01T08:58:48+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.fieldUid','\"785c09ff-d241-42d1-b0a7-c985a24a712c\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.handle','\"button\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.label','\"Menü\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.uid','\"ed033a95-e3d2-47ec-909b-7f7302254760\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.elements.6.width','75'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.name','\"Tartalom\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.uid','\"c20de0b0-5fc8-4975-914d-cbff2f64b28f\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.0.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.dateAdded','\"2025-09-29T08:33:16+00:00\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.editCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.elementCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.fieldUid','\"8ea3f70c-70e2-469a-945b-53ac9e122b75\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.handle','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.includeInCards','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.instructions','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.label','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.providesThumbs','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.required','false'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.tip','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.uid','\"28eb1d08-96e7-462e-b659-c98b77924167\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.warning','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.elements.0.width','100'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.name','\"Ikonok\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.uid','\"0494f0e0-dbfa-42cf-b197-e82c58e137c1\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.fieldLayouts.f866c5d5-1019-40f0-92b1-e25e47cc93eb.tabs.1.userCondition','null'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.handle','\"header\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.name','\"Fejléc\"'),
('globalSets.8d411e5c-39cc-4ade-9676-74c2aae7bcf9.sortOrder','1'),
('meta.__names__.02980df4-89da-41dc-9c95-0b95a8764e23','\"Menü\"'),
('meta.__names__.0a8824d5-d531-40bc-b0c8-c420edc4449b','\"Német\"'),
('meta.__names__.1ddf3471-9514-416a-8cdd-cb453f093e39','\"Szöveges dokumnetum -  heti menu\"'),
('meta.__names__.29c80c0b-78ca-43dd-b83a-44f42bf35cd6','\"Nyitólap - one page\"'),
('meta.__names__.2bd5267e-a36c-43fa-96fd-e740550c69fc','\"Nyitólap\"'),
('meta.__names__.33fbdc92-4491-48e7-a475-1e1fdf3fc897','\"Képek\"'),
('meta.__names__.36685e5a-d503-4f86-9d6d-e73a0d97dc93','\"Képváltó képek\"'),
('meta.__names__.3f01429d-2635-4f6a-a7e2-03296a05e255','\"Nyitó\"'),
('meta.__names__.4cb3f0fe-5a28-46e4-aeca-af520ddf4746','\"Kapcsoló\"'),
('meta.__names__.5b557374-743e-40fc-8528-a0d4e9b40506','\"Képváltó képek\"'),
('meta.__names__.5fea41c4-9177-4d44-928a-27f69f223cc0','\"Tartalom\"'),
('meta.__names__.6652c4a0-b521-4514-9e6a-ba6383a6325a','\"Szöveg doboz\"'),
('meta.__names__.785c09ff-d241-42d1-b0a7-c985a24a712c','\"Bejegyzések\"'),
('meta.__names__.7abe536e-08e9-4ec4-bf82-1ac522ea4f84','\"Hírek\"'),
('meta.__names__.846aa6c1-3a4b-4656-a534-646aa812d4f4','\"Simple\"'),
('meta.__names__.8792f1cf-e9e4-4f28-9777-8c5304780529','\"Egy kép\"'),
('meta.__names__.88c6398a-f683-42af-9840-82a752943ecc','\"Főmenü\"'),
('meta.__names__.8bcb174f-c2de-46c2-b796-1394dac78109','\"Cikk\"'),
('meta.__names__.8d411e5c-39cc-4ade-9676-74c2aae7bcf9','\"Fejléc\"'),
('meta.__names__.8ea3f70c-70e2-469a-945b-53ac9e122b75','\"Adatok\"'),
('meta.__names__.915fda05-fe2f-4d16-8676-0d5f34b33d08','\"Adat\"'),
('meta.__names__.939c7f22-e6c5-4dbe-8aaa-69b6c587edd0','\"Basic dw\"'),
('meta.__names__.94625fe0-14e2-4fe2-94d5-d0d88b34013a','\"parkhedervar\"'),
('meta.__names__.a0ed06e8-7d19-46e7-b39f-32af2d4e18c3','\"Sebesség\"'),
('meta.__names__.b3a9b4f6-0a54-40c7-80fa-8a53361137e2','\"Választó\"'),
('meta.__names__.bb5ef826-a820-4982-a272-9ad7d3c5be5a','\"parkhedervar\"'),
('meta.__names__.becc6248-77f7-4548-9c0c-9326b0764e28','\"HÍr\"'),
('meta.__names__.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2','\"Cikkek\"'),
('meta.__names__.d11f6ee6-67d9-4ae4-8924-e8dffc44555a','\"Szöveg\"'),
('meta.__names__.d46898f6-87ca-4eea-ae8d-1c1f76206e53','\"Kategória\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.defaultPlacement','\"end\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.enableVersioning','true'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.entryTypes.0.uid','\"5fea41c4-9177-4d44-928a-27f69f223cc0\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.handle','\"OnePage\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.maxAuthors','1'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.name','\"Nyitólap - one page\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.0.1','\"Elsődleges bejegyzés oldal\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.propagationMethod','\"all\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabledByDefault','true'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.template','\"nyitolap-one-page/_entry.twig\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.uriFormat','\"nyitolap-one-page/{slug}\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.enabledByDefault','true'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.template','\"nyitolap-one-page/_entry.twig\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.uriFormat','\"nyitolap-one-page/{slug}\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.structure.maxLevels','null'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.structure.uid','\"2bfbc2e8-2417-4b16-9524-befdf0f50afa\"'),
('sections.29c80c0b-78ca-43dd-b83a-44f42bf35cd6.type','\"structure\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.defaultPlacement','\"end\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.enableVersioning','true'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.entryTypes.0.uid','\"3f01429d-2635-4f6a-a7e2-03296a05e255\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.handle','\"nyitolap\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.maxAuthors','1'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.name','\"Nyitólap\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.0.1','\"Elsődleges bejegyzés oldal\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.propagationMethod','\"all\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabledByDefault','true'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.template','\"home_parkh.twig\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.uriFormat','\"__home__\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.enabledByDefault','true'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.template','\"home_parkh.twig\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.uriFormat','\"__home__\"'),
('sections.2bd5267e-a36c-43fa-96fd-e740550c69fc.type','\"single\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.defaultPlacement','\"end\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.enableVersioning','true'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.entryTypes.0.uid','\"becc6248-77f7-4548-9c0c-9326b0764e28\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.handle','\"news\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.maxAuthors','1'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.name','\"Hírek\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.0.1','\"Elsődleges bejegyzés oldal\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.propagationMethod','\"all\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabledByDefault','true'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.template','\"_news.twig\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.uriFormat','\"news{slug}\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.enabledByDefault','true'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.template','\"_news.twig\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.uriFormat','\"hirek/{slug}\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.structure.maxLevels','null'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.structure.uid','\"09790b78-4040-4f01-97d4-2970f3ff37f7\"'),
('sections.7abe536e-08e9-4ec4-bf82-1ac522ea4f84.type','\"structure\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.defaultPlacement','\"end\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.enableVersioning','true'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.entryTypes.0.uid','\"02980df4-89da-41dc-9c95-0b95a8764e23\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.handle','\"menu\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.maxAuthors','1'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.name','\"Főmenü\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.0.1','\"Elsődleges bejegyzés oldal\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.propagationMethod','\"all\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabledByDefault','true'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.template','\"fomenu/_entry.twig\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.uriFormat','\"fomenu/{slug}\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.enabledByDefault','true'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.template','\"fomenu/_entry.twig\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.uriFormat','\"fomenu/{slug}\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.structure.maxLevels','null'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.structure.uid','\"fbdcb151-75d1-4523-92a1-834ba722698a\"'),
('sections.88c6398a-f683-42af-9840-82a752943ecc.type','\"structure\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.defaultPlacement','\"end\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.enableVersioning','true'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.entryTypes.0.uid','\"8bcb174f-c2de-46c2-b796-1394dac78109\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.handle','\"articles\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.maxAuthors','1'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.name','\"Cikkek\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.0.1','\"Elsődleges bejegyzés oldal\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.propagationMethod','\"all\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabledByDefault','true'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.template','\"articlePost.twig\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.0a8824d5-d531-40bc-b0c8-c420edc4449b.uriFormat','\"artikel/{slug}\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.enabledByDefault','true'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.template','\"articlePost.twig\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.siteSettings.bb5ef826-a820-4982-a272-9ad7d3c5be5a.uriFormat','\"cikkek/{slug}\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.structure.maxLevels','null'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.structure.uid','\"5008f184-22fc-4346-b04e-eb7e8fe13807\"'),
('sections.cd5eaea5-24c1-47f6-96bf-ce456bbed2f2.type','\"structure\"'),
('siteGroups.94625fe0-14e2-4fe2-94d5-d0d88b34013a.name','\"parkhedervar\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.baseUrl','\"/de\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.enabled','\"1\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.handle','\"nemet\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.hasUrls','true'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.language','\"de\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.name','\"Német\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.primary','false'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.siteGroup','\"94625fe0-14e2-4fe2-94d5-d0d88b34013a\"'),
('sites.0a8824d5-d531-40bc-b0c8-c420edc4449b.sortOrder','2'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.handle','\"default\"'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.hasUrls','true'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.language','\"hu\"'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.name','\"parkhedervar\"'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.primary','true'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.siteGroup','\"94625fe0-14e2-4fe2-94d5-d0d88b34013a\"'),
('sites.bb5ef826-a820-4982-a272-9ad7d3c5be5a.sortOrder','1'),
('system.edition','\"solo\"'),
('system.live','true'),
('system.name','\"parkhedervar\"'),
('system.schemaVersion','\"5.8.0.3\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.require2fa','false'),
('users.requireEmailVerification','true'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.altTranslationKeyFormat','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.altTranslationMethod','\"none\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.cardThumbAlignment','\"end\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elementCondition','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.autocapitalize','true'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.autocomplete','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.autocorrect','true'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.class','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.dateAdded','\"2025-09-23T15:08:42+00:00\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.disabled','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.elementCondition','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.id','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.includeInCards','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.inputType','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.instructions','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.label','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.max','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.min','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.name','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.orientation','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.placeholder','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.providesThumbs','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.readonly','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.requirable','false'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.size','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.step','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.tip','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.title','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.uid','\"780bcfb8-0257-42f9-9e23-8924ce4b9216\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.userCondition','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.warning','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.elements.0.width','100'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.name','\"Tartalom\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.uid','\"7365a492-12cd-47fa-9c44-ba5af70ae5a2\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fieldLayouts.fb7415a7-f6ff-48f9-86c1-de1f44ac4e48.tabs.0.userCondition','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.fs','\"kepek\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.handle','\"pictures\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.name','\"Képek\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.sortOrder','1'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.subpath','\"\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.titleTranslationKeyFormat','null'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.titleTranslationMethod','\"site\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.transformFs','\"kepek\"'),
('volumes.33fbdc92-4491-48e7-a475-1e1fdf3fc897.transformSubpath','\"\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.altTranslationKeyFormat','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.altTranslationMethod','\"none\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.cardThumbAlignment','\"end\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elementCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.autocapitalize','true'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.autocomplete','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.autocorrect','true'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.class','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.dateAdded','\"2025-09-23T15:09:28+00:00\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.disabled','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.elementCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.id','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.includeInCards','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.inputType','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.instructions','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.label','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.max','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.min','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.name','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.orientation','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.placeholder','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.providesThumbs','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.readonly','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.requirable','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.size','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.step','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.tip','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.title','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.uid','\"a73b8323-482d-4727-8b3c-201eebe50e66\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.userCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.warning','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.0.width','100'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.dateAdded','\"2025-09-23T15:11:13+00:00\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.editCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.elementCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.fieldUid','\"d11f6ee6-67d9-4ae4-8924-e8dffc44555a\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.handle','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.includeInCards','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.instructions','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.label','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.providesThumbs','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.required','false'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.tip','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.uid','\"6141b94c-1518-4d9d-a898-25f981ac290d\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.userCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.warning','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.elements.1.width','100'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.name','\"Tartalom\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.uid','\"c98ec293-939e-4a45-a458-63800ba8205b\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fieldLayouts.feb39794-bd56-455b-b1d0-1795e637ac26.tabs.0.userCondition','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.fs','\"sliderPictPlace\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.handle','\"sliderPict\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.name','\"Képváltó képek\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.sortOrder','2'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.subpath','\"\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.titleTranslationKeyFormat','null'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.titleTranslationMethod','\"site\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.transformFs','\"sliderPictPlace\"'),
('volumes.36685e5a-d503-4f86-9d6d-e73a0d97dc93.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_knuuqqfnnysosqctzuniprhvwsgnjpvdrlnq` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_nlrnlwqsjxtuaksehuxveqjrwnlpkyfbkado` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=928 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ljrlvkycedpcjakivnvnwufmuvginnribuvh` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_lthvkpmcccwcrksapyrnrjdbvrdgityagudp` (`sourceId`),
  KEY `idx_fyczyrzzmqtjdohcaghpamejualbmkzkvqzs` (`targetId`),
  KEY `idx_wtzwcofoyhegolimkxysmtcvzbulmjfcowsu` (`sourceSiteId`),
  CONSTRAINT `fk_dewlbcyjzgtusntprtawfboenurubmmscstk` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hmnhjpwsruaartaizdcuxrygercuzcebdxdc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjwronauirhhpbfgqvdxwiifaaipbovomzqh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES
(1,2,6,NULL,2,1,'2025-09-23 16:48:05','2025-09-23 16:48:05','3d94fe7d-89ae-42d6-8966-7a097b7256cf'),
(2,2,7,NULL,2,1,'2025-09-23 16:48:09','2025-09-23 16:48:09','ca59891d-5f5a-47a8-ac3f-0d1cfaaa4c17'),
(3,2,8,NULL,4,1,'2025-09-23 16:48:21','2025-09-23 16:48:21','96ab251b-87bc-4801-a400-4331436665e4'),
(4,2,9,NULL,4,1,'2025-09-23 16:48:24','2025-09-23 16:48:24','87379ffd-2eac-4c36-ba1d-eb95070cfdc1'),
(15,2,12,NULL,2,1,'2025-10-01 09:06:28','2025-10-01 09:06:28','9572c2f3-0cf1-4282-b8d0-5524e96106b6'),
(16,7,12,NULL,18,1,'2025-10-01 17:37:41','2025-10-01 17:37:41','028247e1-005e-48e9-98f7-7d5ab3261f5e'),
(24,7,33,NULL,32,1,'2025-10-03 07:30:36','2025-10-03 07:30:36','f4e3c70e-94af-48bf-9d9b-cd2dea56aeaa'),
(25,7,34,NULL,32,1,'2025-10-03 07:31:05','2025-10-03 07:31:05','f2c656cf-ed74-4bf1-a0ab-71effc748158'),
(27,7,36,NULL,31,1,'2025-10-03 07:31:26','2025-10-03 07:31:26','5e079986-e58e-4a44-b71d-b974252834d9'),
(29,7,38,NULL,30,1,'2025-10-03 07:32:08','2025-10-03 07:32:08','dc0efbc5-1261-4db4-a425-1942723dc50f'),
(31,7,40,NULL,28,1,'2025-10-03 07:32:32','2025-10-03 07:32:32','15965efa-edd1-427c-aa8e-be631e555e8f'),
(39,7,46,NULL,41,1,'2025-10-03 19:06:02','2025-10-03 19:06:02','79742963-3bfa-4bb3-a3b6-fa81f63acb85'),
(43,7,48,NULL,42,1,'2025-10-03 19:06:15','2025-10-03 19:06:15','ebd5b3e8-ebf8-4e76-bde3-5be0bff5e603'),
(47,7,50,NULL,43,1,'2025-10-03 19:06:24','2025-10-03 19:06:24','b2415f37-2be4-4cd9-a5ab-9c75555975a3'),
(51,7,52,NULL,42,1,'2025-10-03 19:06:41','2025-10-03 19:06:41','7e1e2107-54da-47cd-9f49-b0a4dd91a43c'),
(53,5,12,NULL,19,1,'2025-10-06 10:43:25','2025-10-06 10:43:25','9d1e11f6-1775-4f4f-84b5-120de9897065'),
(54,5,12,NULL,21,2,'2025-10-06 10:43:25','2025-10-06 10:43:25','8364e114-23b4-499f-a587-b08a8a6675b4'),
(55,5,12,NULL,20,3,'2025-10-06 10:43:25','2025-10-06 10:43:25','d3b44593-cc94-4605-a9e4-d1da3f5d597a'),
(56,5,12,NULL,54,4,'2025-10-06 10:43:25','2025-10-06 10:43:25','41e15ce6-95f6-485f-ad29-10eda7bd7db6'),
(59,7,27,NULL,32,1,'2025-10-06 10:43:44','2025-10-06 10:43:44','4c3f4950-a753-4f7d-9cde-2c3fadc1064f'),
(60,7,56,NULL,32,1,'2025-10-06 10:43:44','2025-10-06 10:43:44','b3531a44-82c0-4dfe-a5ee-088e4a2b6413'),
(63,7,35,NULL,31,1,'2025-10-06 10:43:51','2025-10-06 10:43:51','0e57fbc1-05cb-4cd1-991c-1b83926ebd7c'),
(64,7,58,NULL,31,1,'2025-10-06 10:43:51','2025-10-06 10:43:51','68fdd1f5-5bc3-4dc2-9077-11de85975b89'),
(67,7,37,NULL,28,1,'2025-10-06 10:43:59','2025-10-06 10:43:59','8b52d66f-9bfd-4564-926b-95959e7c190e'),
(68,7,60,NULL,28,1,'2025-10-06 10:43:59','2025-10-06 10:43:59','24484250-3ae8-4ea4-bf62-6a7ced972ec1'),
(71,7,39,NULL,30,1,'2025-10-06 10:44:07','2025-10-06 10:44:07','c6dfb1ad-c7f1-4d57-82a2-1d1c8584e19b'),
(72,7,62,NULL,30,1,'2025-10-06 10:44:07','2025-10-06 10:44:07','76a429a9-7757-4f47-8a94-5a519448e311'),
(73,7,63,NULL,32,1,'2025-10-07 09:21:59','2025-10-07 09:21:59','d288ea5b-03f9-44f2-836a-5abc26792324'),
(74,2,63,NULL,2,1,'2025-10-07 09:22:10','2025-10-07 09:22:10','a989a6bd-952a-481f-8a5f-905f92406f08'),
(75,7,64,NULL,32,1,'2025-10-07 09:23:02','2025-10-07 09:23:02','faa299ff-ad1a-497a-9cbb-de96c7d36798'),
(76,2,64,NULL,2,1,'2025-10-07 09:23:02','2025-10-07 09:23:02','8931f307-c27b-458a-8313-f8a60bdc8c99'),
(77,7,65,NULL,66,1,'2025-10-07 10:41:54','2025-10-07 10:41:54','dbafaa14-017d-4562-a96d-19ea15ad039a'),
(78,7,67,NULL,66,1,'2025-10-07 10:42:34','2025-10-07 10:42:34','a6ecfc77-4c62-46c7-a8d9-e62c5a537442'),
(81,11,70,1,68,1,'2025-10-07 12:47:43','2025-10-07 12:47:43','1d8935b0-ed51-4a36-ac86-066a045771d6'),
(82,11,71,1,68,1,'2025-10-07 12:50:23','2025-10-07 12:50:23','ee7abe07-433e-45ba-8bc4-e445f216b0b1'),
(86,11,74,1,72,1,'2025-10-07 12:55:30','2025-10-07 12:55:30','fc792554-09c0-48bf-8b52-acc2cf7b488f'),
(87,11,76,1,72,1,'2025-10-07 12:58:52','2025-10-07 12:58:52','fd63b859-d6c5-45c9-88eb-f8dac7508687'),
(90,11,10,1,77,1,'2025-10-07 13:43:26','2025-10-07 13:43:26','24884c57-7487-4578-b716-d1ae268adfb1'),
(91,11,79,1,77,1,'2025-10-07 13:43:26','2025-10-07 13:43:26','18884caf-2a48-42b4-9be4-053ec5a1564c');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES
('1036c348','@craft/web/assets/axios/dist'),
('204f6fa6','@craft/web/assets/selectize/dist'),
('217b9638','@craft/web/assets/installer/dist'),
('257cfd93','@craft/web/assets/pluginstore/dist'),
('275ad584','@craft/web/assets/tailwindreset/dist'),
('29df933f','@craft/web/assets/vue/dist'),
('2c07cdee','@craft/web/assets/cp/dist'),
('32fac48d','@craft/web/assets/feed/dist'),
('3632eba7','@craft/web/assets/d3/dist'),
('3663c014','@craft/web/assets/datepickeri18n/dist'),
('3679147f','@craft/web/assets/updateswidget/dist'),
('383b96b1','@craft/web/assets/jquerytouchevents/dist'),
('386849d3','@craft/web/assets/jquerypayment/dist'),
('3b3a3726','@craft/web/assets/fieldsettings/dist'),
('3d53e210','@craft/web/assets/iframeresizer/dist'),
('3dff4b64','@craft/web/assets/velocity/dist'),
('3ef1b7a2','@craft/web/assets/theme/dist'),
('433930d','@craft/web/assets/picturefill/dist'),
('4bb9e246','@craft/web/assets/dashboard/dist'),
('4e6d540d','@craft/web/assets/garnish/dist'),
('51ff291b','@craft/web/assets/animationblocker/dist'),
('5fe317f2','@craft/web/assets/admintable/dist'),
('6421720d','@craft/web/assets/jqueryui/dist'),
('66df631a','@craft/web/assets/fabric/dist'),
('682d6707','@craft/web/assets/sites/dist'),
('6ec6e21b','@bower/jquery/dist'),
('76f5f524','@craft/web/assets/utilities/dist'),
('7a5aa4a6','@craft/web/assets/fileupload/dist'),
('7e2e215d','@craft/web/assets/matrix/dist'),
('8c0cd8f7','@craft/web/assets/axios/dist'),
('8c35611','@craft/web/assets/recententries/dist'),
('91d5e276','@craft/web/assets/craftsupport/dist'),
('93b135b2','@craft/web/assets/xregexp/dist'),
('94f94dae','@craft/web/assets/recententries/dist'),
('977b780e','@craft/web/assets/timepicker/dist'),
('980988b2','@craft/web/assets/picturefill/dist'),
('9d3a0bf1','@craft/web/assets/updater/dist'),
('a169f9af','@craft/web/assets/iframeresizer/dist'),
('a1c550db','@craft/web/assets/velocity/dist'),
('a2cbac1d','@craft/web/assets/theme/dist'),
('a4018d0e','@craft/web/assets/jquerytouchevents/dist'),
('a452526c','@craft/web/assets/jquerypayment/dist'),
('aa08f018','@craft/web/assets/d3/dist'),
('aa430fc0','@craft/web/assets/updateswidget/dist'),
('aa59dbab','@craft/web/assets/datepickeri18n/dist'),
('ae6655cc','@craft/web/assets/assetindexes/dist'),
('aec0df32','@craft/web/assets/feed/dist'),
('af93041b','@nystudio107/codeeditor/web/assets/dist'),
('b03dd651','@craft/web/assets/cp/dist'),
('b443e45','@craft/web/assets/conditionbuilder/dist'),
('b5bd78df','@craft/web/assets/editsection/dist'),
('b5e58880','@craft/web/assets/vue/dist'),
('b946e62c','@craft/web/assets/pluginstore/dist'),
('bb60ce3b','@craft/web/assets/tailwindreset/dist'),
('bc757419','@craft/web/assets/selectize/dist'),
('bd418d87','@craft/web/assets/installer/dist'),
('c3557b76','@craft/web/assets/htmx/dist'),
('cdc532a4','@craft/web/assets/animationblocker/dist'),
('d2574fb2','@craft/web/assets/garnish/dist'),
('d783f9f9','@craft/web/assets/dashboard/dist'),
('dcb2d72c','@craft/ckeditor/web/assets/ckeconfig/dist'),
('deff9c9','@craft/web/assets/craftsupport/dist'),
('e660bf19','@craft/web/assets/fileupload/dist'),
('e97d2f6b','@craft/ckeditor/web/assets/ckeditor/dist'),
('eacfee9b','@craft/web/assets/utilities/dist'),
('ede89c70','@craft/web/assets/prismjs/dist'),
('f2fcf9a4','@bower/jquery/dist'),
('f81b69b2','@craft/web/assets/jqueryui/dist'),
('f8b2e0d','@craft/web/assets/xregexp/dist'),
('fae578a5','@craft/web/assets/fabric/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rmovzigyrcezetqsdjtrdxgmujzidoknymoo` (`canonicalId`,`num`),
  KEY `fk_eihddmdeszszfbowabluvlfyhwrubzilbrzh` (`creatorId`),
  CONSTRAINT `fk_adpfyugsfoqwvchzwxeaarpuzbwhemhokcav` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eihddmdeszszfbowabluvlfyhwrubzilbrzh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES
(1,2,1,1,''),
(2,4,1,1,''),
(3,6,1,1,''),
(4,8,1,1,''),
(5,10,1,1,NULL),
(6,27,1,1,''),
(7,27,1,2,''),
(8,35,1,1,''),
(9,37,1,1,''),
(10,39,1,1,''),
(11,27,1,3,'„Vázlat 1” alkalmazva'),
(12,35,1,2,'„Vázlat 1” alkalmazva'),
(13,37,1,2,'„Vázlat 1” alkalmazva'),
(14,39,1,2,'„Vázlat 1” alkalmazva'),
(15,27,1,4,'„Vázlat 1” alkalmazva'),
(16,35,1,3,'„Vázlat 1” alkalmazva'),
(17,37,1,3,'„Vázlat 1” alkalmazva'),
(18,39,1,3,'„Vázlat 1” alkalmazva'),
(19,63,1,1,''),
(20,65,1,1,''),
(21,10,1,2,'„Vázlat 1” alkalmazva'),
(22,10,1,3,''),
(23,10,1,4,'„Vázlat 1” alkalmazva'),
(24,10,1,5,''),
(25,10,1,6,'„Vázlat 1” alkalmazva');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_vefwfpcevrqhgyvwezslvidcvcleciicjcam` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' fulop viktor dwiki gmail com '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' admin '),
(2,'slug',0,1,' egyes tesz '),
(2,'slug',0,2,' egyes tesz '),
(2,'title',0,1,' egyes tesz '),
(2,'title',0,2,' egyes tesz '),
(4,'slug',0,1,' kettes teszt '),
(4,'slug',0,2,' kettes teszt '),
(4,'title',0,1,' kettes teszt '),
(4,'title',0,2,' kettes teszt '),
(6,'slug',0,1,' egyes '),
(6,'slug',0,2,' egyes '),
(6,'title',0,1,' egyes '),
(6,'title',0,2,' egyes '),
(8,'slug',0,1,' kettes '),
(8,'slug',0,2,' kettes '),
(8,'title',0,1,' kettes '),
(8,'title',0,2,' kettes '),
(10,'slug',0,1,' nyitolap '),
(10,'slug',0,2,' nyitolap '),
(10,'title',0,1,' nyitolap '),
(10,'title',0,2,' nyitolap '),
(12,'slug',0,1,''),
(12,'slug',0,2,''),
(13,'alt',0,1,''),
(13,'alt',0,2,''),
(13,'extension',0,1,' png '),
(13,'extension',0,2,' png '),
(13,'filename',0,1,' screenshot 2025 09 06 at 14 04 16 png '),
(13,'filename',0,2,' screenshot 2025 09 06 at 14 04 16 png '),
(13,'kind',0,1,' image '),
(13,'kind',0,2,' image '),
(13,'slug',0,1,''),
(13,'slug',0,2,''),
(13,'title',0,1,' screenshot 2025 09 06 at 14 04 16 '),
(13,'title',0,2,' screenshot 2025 09 06 at 14 04 16 '),
(14,'alt',0,1,''),
(14,'alt',0,2,''),
(14,'extension',0,1,' jpg '),
(14,'extension',0,2,' jpg '),
(14,'filename',0,1,' img 20210828 202521 jpg '),
(14,'filename',0,2,' img 20210828 202521 jpg '),
(14,'kind',0,1,' image '),
(14,'kind',0,2,' image '),
(14,'slug',0,1,''),
(14,'slug',0,2,''),
(14,'title',0,1,' img 20210828 202521 '),
(14,'title',0,2,' img 20210828 202521 '),
(15,'alt',0,1,''),
(15,'alt',0,2,''),
(15,'extension',0,1,' jpeg '),
(15,'extension',0,2,' jpeg '),
(15,'filename',0,1,' adobestock 1545881037 jpeg '),
(15,'filename',0,2,' adobestock 1545881037 jpeg '),
(15,'kind',0,1,' image '),
(15,'kind',0,2,' image '),
(15,'slug',0,1,''),
(15,'slug',0,2,''),
(15,'title',0,1,' ez a kep '),
(15,'title',0,2,' adobe stock 1545881037 '),
(16,'alt',0,1,''),
(16,'alt',0,2,''),
(16,'extension',0,1,' jpeg '),
(16,'extension',0,2,' jpeg '),
(16,'filename',0,1,' adobestock 244182656 jpeg '),
(16,'filename',0,2,' adobestock 244182656 jpeg '),
(16,'kind',0,1,' image '),
(16,'kind',0,2,' image '),
(16,'slug',0,1,''),
(16,'slug',0,2,''),
(16,'title',0,1,' adobe stock 244182656 '),
(16,'title',0,2,' adobe stock 244182656 '),
(17,'alt',0,1,''),
(17,'alt',0,2,''),
(17,'extension',0,1,' jpeg '),
(17,'extension',0,2,' jpeg '),
(17,'filename',0,1,' adobestock 1547200829 jpeg '),
(17,'filename',0,2,' adobestock 1547200829 jpeg '),
(17,'kind',0,1,' image '),
(17,'kind',0,2,' image '),
(17,'slug',0,1,''),
(17,'slug',0,2,''),
(17,'title',0,1,' adobe stock 1547200829 '),
(17,'title',0,2,' adobe stock 1547200829 '),
(18,'alt',0,1,''),
(18,'alt',0,2,''),
(18,'extension',0,1,' png '),
(18,'extension',0,2,' png '),
(18,'filename',0,1,' park hedervar logo png '),
(18,'filename',0,2,' park hedervar logo png '),
(18,'kind',0,1,' image '),
(18,'kind',0,2,' image '),
(18,'slug',0,1,''),
(18,'slug',0,2,''),
(18,'title',0,1,' park hedervar logo '),
(18,'title',0,2,' park hedervar logo '),
(19,'alt',0,1,''),
(19,'alt',0,2,''),
(19,'extension',0,1,' jpg '),
(19,'extension',0,2,' jpg '),
(19,'filename',0,1,' pico dji 20250703153341 0290 d jpg '),
(19,'filename',0,2,' pico dji 20250703153341 0290 d jpg '),
(19,'kind',0,1,' image '),
(19,'kind',0,2,' image '),
(19,'slug',0,1,''),
(19,'slug',0,2,''),
(19,'title',0,1,' pico dji 20250703153341 0290 d '),
(19,'title',0,2,' pico dji 20250703153341 0290 d '),
(20,'alt',0,1,''),
(20,'alt',0,2,''),
(20,'extension',0,1,' jpg '),
(20,'extension',0,2,' jpg '),
(20,'filename',0,1,' pico dji 20250703154444 0332 d jpg '),
(20,'filename',0,2,' pico dji 20250703154444 0332 d jpg '),
(20,'kind',0,1,' image '),
(20,'kind',0,2,' image '),
(20,'slug',0,1,''),
(20,'slug',0,2,''),
(20,'title',0,1,' pico dji 20250703154444 0332 d '),
(20,'title',0,2,' pico dji 20250703154444 0332 d '),
(21,'alt',0,1,''),
(21,'alt',0,2,''),
(21,'extension',0,1,' jpg '),
(21,'extension',0,2,' jpg '),
(21,'filename',0,1,' dsc07726 jpg '),
(21,'filename',0,2,' dsc07726 jpg '),
(21,'kind',0,1,' image '),
(21,'kind',0,2,' image '),
(21,'slug',0,1,''),
(21,'slug',0,2,''),
(21,'title',0,1,' dsc07726 '),
(21,'title',0,2,' dsc07726 '),
(22,'slug',0,1,' temp ybmrdrzfcwxwdfoqnjjnrhbklhwzmygnrjbm '),
(22,'slug',0,2,' temp ybmrdrzfcwxwdfoqnjjnrhbklhwzmygnrjbm '),
(22,'title',0,1,''),
(22,'title',0,2,''),
(23,'slug',0,1,' temp gzarqybbeydvvujidfvonmjjlopmvjaxbklv '),
(23,'slug',0,2,' temp gzarqybbeydvvujidfvonmjjlopmvjaxbklv '),
(23,'title',0,1,''),
(23,'title',0,2,''),
(24,'slug',0,1,' temp nuqzogyvyvlhqppkgwegkbqdkvyzejnainwh '),
(24,'slug',0,2,' temp nuqzogyvyvlhqppkgwegkbqdkvyzejnainwh '),
(24,'title',0,1,''),
(24,'title',0,2,''),
(25,'slug',0,1,' temp qwelfuidhlampqiuzjdhsvxsczmwevsvdaxu '),
(25,'slug',0,2,' temp qwelfuidhlampqiuzjdhsvxsczmwevsvdaxu '),
(25,'title',0,1,''),
(25,'title',0,2,''),
(26,'alt',0,1,''),
(26,'alt',0,2,''),
(26,'extension',0,1,' jpg '),
(26,'extension',0,2,' jpg '),
(26,'filename',0,1,' park panzio logo jpg '),
(26,'filename',0,2,' park panzio logo jpg '),
(26,'kind',0,1,' image '),
(26,'kind',0,2,' image '),
(26,'slug',0,1,''),
(26,'slug',0,2,''),
(26,'title',0,1,' park panzio logo '),
(26,'title',0,2,' park panzio logo '),
(27,'slug',0,1,' ez egy hir '),
(27,'slug',0,2,' ez egy hir '),
(27,'title',0,1,' ez egy hir '),
(27,'title',0,2,' ez egy hir '),
(28,'alt',0,1,''),
(28,'alt',0,2,''),
(28,'extension',0,1,' jpg '),
(28,'extension',0,2,' jpg '),
(28,'filename',0,1,' dsc07726 jpg '),
(28,'filename',0,2,' dsc07726 jpg '),
(28,'kind',0,1,' image '),
(28,'kind',0,2,' image '),
(28,'slug',0,1,''),
(28,'slug',0,2,''),
(28,'title',0,1,' dsc07726 '),
(28,'title',0,2,' dsc07726 '),
(29,'alt',0,1,''),
(29,'alt',0,2,''),
(29,'extension',0,1,' jpg '),
(29,'extension',0,2,' jpg '),
(29,'filename',0,1,' pico dji 20250703153341 0290 d jpg '),
(29,'filename',0,2,' pico dji 20250703153341 0290 d jpg '),
(29,'kind',0,1,' image '),
(29,'kind',0,2,' image '),
(29,'slug',0,1,''),
(29,'slug',0,2,''),
(29,'title',0,1,' pico dji 20250703153341 0290 d '),
(29,'title',0,2,' pico dji 20250703153341 0290 d '),
(30,'alt',0,1,''),
(30,'alt',0,2,''),
(30,'extension',0,1,' jpg '),
(30,'extension',0,2,' jpg '),
(30,'filename',0,1,' pico dji 20250703154444 0332 d jpg '),
(30,'filename',0,2,' pico dji 20250703154444 0332 d jpg '),
(30,'kind',0,1,' image '),
(30,'kind',0,2,' image '),
(30,'slug',0,1,''),
(30,'slug',0,2,''),
(30,'title',0,1,' pico dji 20250703154444 0332 d '),
(30,'title',0,2,' pico dji 20250703154444 0332 d '),
(31,'alt',0,1,''),
(31,'alt',0,2,''),
(31,'extension',0,1,' jpg '),
(31,'extension',0,2,' jpg '),
(31,'filename',0,1,' dsc07853 thalia jpg '),
(31,'filename',0,2,' dsc07853 thalia jpg '),
(31,'kind',0,1,' image '),
(31,'kind',0,2,' image '),
(31,'slug',0,1,''),
(31,'slug',0,2,''),
(31,'title',0,1,' dsc07853 thalia '),
(31,'title',0,2,' dsc07853 thalia '),
(32,'alt',0,1,''),
(32,'alt',0,2,''),
(32,'extension',0,1,' jpg '),
(32,'extension',0,2,' jpg '),
(32,'filename',0,1,' dji 20250723140426 0500 d jpg '),
(32,'filename',0,2,' dji 20250723140426 0500 d jpg '),
(32,'kind',0,1,' image '),
(32,'kind',0,2,' image '),
(32,'slug',0,1,''),
(32,'slug',0,2,''),
(32,'title',0,1,' dji 20250723140426 0500 d '),
(32,'title',0,2,' dji 20250723140426 0500 d '),
(35,'slug',0,1,' kettes szamu hir ami nem alhir '),
(35,'slug',0,2,' kettes szamu hir ami nem alhir '),
(35,'title',0,1,' kettes szamu hir ami nem alhir '),
(35,'title',0,2,' kettes szamu hir ami nem alhir '),
(37,'slug',0,1,' harmas hir is itt vna '),
(37,'slug',0,2,' harmas hir is itt vna '),
(37,'title',0,1,' harmas hir is itt vna '),
(37,'title',0,2,' harmas hir is itt vna '),
(39,'slug',0,1,' negyes hir '),
(39,'slug',0,2,' negyes hir '),
(39,'title',0,1,' negyes hir '),
(39,'title',0,2,' negyes hir '),
(41,'alt',0,1,''),
(41,'alt',0,2,''),
(41,'extension',0,1,' jpg '),
(41,'extension',0,2,' jpg '),
(41,'filename',0,1,' hajo fotoshop moibil jpg '),
(41,'filename',0,2,' hajo fotoshop moibil jpg '),
(41,'kind',0,1,' image '),
(41,'kind',0,2,' image '),
(41,'slug',0,1,''),
(41,'slug',0,2,''),
(41,'title',0,1,' hajo fotoshop moibil '),
(41,'title',0,2,' hajo fotoshop moibil '),
(42,'alt',0,1,''),
(42,'alt',0,2,''),
(42,'extension',0,1,' jpg '),
(42,'extension',0,2,' jpg '),
(42,'filename',0,1,' hajo ocean full hd jpg '),
(42,'filename',0,2,' hajo ocean full hd jpg '),
(42,'kind',0,1,' image '),
(42,'kind',0,2,' image '),
(42,'slug',0,1,''),
(42,'slug',0,2,''),
(42,'title',0,1,' hajo ocean full hd '),
(42,'title',0,2,' hajo ocean full hd '),
(43,'alt',0,1,''),
(43,'alt',0,2,''),
(43,'extension',0,1,' png '),
(43,'extension',0,2,' png '),
(43,'filename',0,1,' a2f65294 6002 4e56 85a9 ae87e8bdefe7 png '),
(43,'filename',0,2,' a2f65294 6002 4e56 85a9 ae87e8bdefe7 png '),
(43,'kind',0,1,' image '),
(43,'kind',0,2,' image '),
(43,'slug',0,1,''),
(43,'slug',0,2,''),
(43,'title',0,1,' a2f65294 6002 4e56 85a9 ae87e8bdefe7 '),
(43,'title',0,2,' a2f65294 6002 4e56 85a9 ae87e8bdefe7 '),
(44,'alt',0,1,''),
(44,'alt',0,2,''),
(44,'extension',0,1,' jpg '),
(44,'extension',0,2,' jpg '),
(44,'filename',0,1,' minta jpg '),
(44,'filename',0,2,' minta jpg '),
(44,'kind',0,1,' image '),
(44,'kind',0,2,' image '),
(44,'slug',0,1,''),
(44,'slug',0,2,''),
(44,'title',0,1,' minta '),
(44,'title',0,2,' minta '),
(53,'alt',0,1,''),
(53,'alt',0,2,''),
(53,'extension',0,1,' jpg '),
(53,'extension',0,2,' jpg '),
(53,'filename',0,1,' hajo ocean full hd jpg '),
(53,'filename',0,2,' hajo ocean full hd jpg '),
(53,'kind',0,1,' image '),
(53,'kind',0,2,' image '),
(53,'slug',0,1,''),
(53,'slug',0,2,''),
(53,'title',0,1,' hajo ocean full hd '),
(53,'title',0,2,' hajo ocean full hd '),
(54,'alt',0,1,''),
(54,'alt',0,2,''),
(54,'extension',0,1,' jpg '),
(54,'extension',0,2,' jpg '),
(54,'filename',0,1,' pico dsc07230 jpg '),
(54,'filename',0,2,' pico dsc07230 jpg '),
(54,'kind',0,1,' image '),
(54,'kind',0,2,' image '),
(54,'slug',0,1,''),
(54,'slug',0,2,''),
(54,'title',0,1,' pico dsc07230 '),
(54,'title',0,2,' pico dsc07230 '),
(63,'slug',0,1,' ez egy cikk ami teszt '),
(63,'slug',0,2,' ez egy cikk ami teszt '),
(63,'title',0,1,' ez egy cikk ami teszt '),
(63,'title',0,2,' ez egy cikk ami teszt '),
(65,'slug',0,1,' kettes teszt cikk jon ide '),
(65,'slug',0,2,' kettes teszt cikk joen ide '),
(65,'title',0,1,' kettes teszt cikk jon ide '),
(65,'title',0,2,' kettes teszt cikk joen ide '),
(66,'alt',0,1,''),
(66,'alt',0,2,''),
(66,'extension',0,1,' jpg '),
(66,'extension',0,2,' jpg '),
(66,'filename',0,1,' dji 0948 jpg '),
(66,'filename',0,2,' dji 0948 jpg '),
(66,'kind',0,1,' image '),
(66,'kind',0,2,' image '),
(66,'slug',0,1,''),
(66,'slug',0,2,''),
(66,'title',0,1,' dji 0948 '),
(66,'title',0,2,' dji 0948 '),
(68,'alt',0,1,''),
(68,'alt',0,2,''),
(68,'extension',0,1,' doc '),
(68,'extension',0,2,' doc '),
(68,'filename',0,1,' et2 doc '),
(68,'filename',0,2,' et2 doc '),
(68,'kind',0,1,' word '),
(68,'kind',0,2,' word '),
(68,'slug',0,1,''),
(68,'slug',0,2,''),
(68,'title',0,1,' et2 '),
(68,'title',0,2,' et2 '),
(72,'alt',0,1,''),
(72,'alt',0,2,''),
(72,'extension',0,1,' txt '),
(72,'extension',0,2,' txt '),
(72,'filename',0,1,' et2 txt '),
(72,'filename',0,2,' et2 txt '),
(72,'kind',0,1,' text '),
(72,'kind',0,2,' text '),
(72,'slug',0,1,''),
(72,'slug',0,2,''),
(72,'title',0,1,' et2 '),
(72,'title',0,2,' et2 '),
(75,'alt',0,1,''),
(75,'alt',0,2,''),
(75,'extension',0,1,' txt '),
(75,'extension',0,2,' txt '),
(75,'filename',0,1,' et2 2025 10 07 125847 wwrw txt '),
(75,'filename',0,2,' et2 2025 10 07 125847 wwrw txt '),
(75,'kind',0,1,' text '),
(75,'kind',0,2,' text '),
(75,'slug',0,1,''),
(75,'slug',0,2,''),
(75,'title',0,1,' et2 '),
(75,'title',0,2,' et2 '),
(77,'alt',0,1,''),
(77,'alt',0,2,''),
(77,'extension',0,1,' txt '),
(77,'extension',0,2,' txt '),
(77,'filename',0,1,' heti menu 2025 10 06 txt '),
(77,'filename',0,2,' heti menu 2025 10 06 txt '),
(77,'kind',0,1,' text '),
(77,'kind',0,2,' text '),
(77,'slug',0,1,''),
(77,'slug',0,2,''),
(77,'title',0,1,' heti menu 2025 10 06 '),
(77,'title',0,2,' heti menu 2025 10 06 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue`
--

DROP TABLE IF EXISTS `searchindexqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `reserved` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_ukjyoyrbbgzutbnsyiycnvtvorhnpmkttqkb` (`elementId`,`siteId`,`reserved`),
  CONSTRAINT `fk_iwhitovawhvsggcnlwbdpxalummiftrmkdfp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue`
--

LOCK TABLES `searchindexqueue` WRITE;
/*!40000 ALTER TABLE `searchindexqueue` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindexqueue_fields`
--

DROP TABLE IF EXISTS `searchindexqueue_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindexqueue_fields` (
  `jobId` int(11) NOT NULL,
  `fieldHandle` varchar(255) NOT NULL,
  PRIMARY KEY (`jobId`,`fieldHandle`),
  UNIQUE KEY `idx_lzvulmgtstlgoiopswadtouzubhkzfrxwyre` (`jobId`,`fieldHandle`),
  CONSTRAINT `fk_aptfradcoqxhldkckkbrnrygajmyqkpswnem` FOREIGN KEY (`jobId`) REFERENCES `searchindexqueue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindexqueue_fields`
--

LOCK TABLES `searchindexqueue_fields` WRITE;
/*!40000 ALTER TABLE `searchindexqueue_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindexqueue_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `maxAuthors` smallint(6) unsigned DEFAULT NULL,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previewTargets`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idaaasobaokhkwragwnqgwwwkvtcmjiegxie` (`handle`),
  KEY `idx_pjasriopwvmwuoayxctjkrpmlezbwzsiigxw` (`name`),
  KEY `idx_aoimjrpbagudwseqzlcegtzzhxeaxffcylay` (`structureId`),
  KEY `idx_dwuiyvkqmoczakayoamlwcobpiewtiudeirk` (`dateDeleted`),
  CONSTRAINT `fk_tvwdfrkbabdaimpwoalrpvhlwrcvknaswgjs` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,1,'Cikkek','articles','structure',1,1,'all','end','[{\"label\":\"Elsődleges bejegyzés oldal\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2025-09-23 15:21:09','2025-09-23 15:21:09',NULL,'cd5eaea5-24c1-47f6-96bf-ce456bbed2f2'),
(2,2,'Főmenü','menu','structure',1,1,'all','end','[{\"label\":\"Elsődleges bejegyzés oldal\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2025-09-23 15:41:01','2025-09-23 15:41:01',NULL,'88c6398a-f683-42af-9840-82a752943ecc'),
(3,NULL,'Nyitólap','nyitolap','single',1,1,'all','end','[{\"label\":\"Elsődleges bejegyzés oldal\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2025-09-23 17:31:44','2025-09-23 17:31:44',NULL,'2bd5267e-a36c-43fa-96fd-e740550c69fc'),
(4,3,'Hírek','news','structure',1,1,'all','end','[{\"label\":\"Elsődleges bejegyzés oldal\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2025-10-03 07:12:50','2025-10-03 07:12:50',NULL,'7abe536e-08e9-4ec4-bf82-1ac522ea4f84'),
(5,4,'Nyitólap - one page','OnePage','structure',1,1,'all','end','[{\"label\":\"Elsődleges bejegyzés oldal\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2025-10-07 09:03:39','2025-10-07 09:20:33',NULL,'29c80c0b-78ca-43dd-b83a-44f42bf35cd6');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_eaqgstvdavodhmxhylmirgnvkikiyjpjovjz` (`typeId`),
  CONSTRAINT `fk_cfpmmllyjyejntsyxhkdtgptimlrjoercacm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eaqgstvdavodhmxhylmirgnvkikiyjpjovjz` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
INSERT INTO `sections_entrytypes` VALUES
(1,1,1,NULL,NULL,NULL),
(2,2,1,NULL,NULL,NULL),
(3,3,1,NULL,NULL,NULL),
(4,5,1,NULL,NULL,NULL),
(5,6,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vzjkzolizxhiqpzaivllqplbuylhliapzerk` (`sectionId`,`siteId`),
  KEY `idx_rngumyliylbtjennlnwzxcjcsogxvzayabgi` (`siteId`),
  CONSTRAINT `fk_grtbxfxiavqbogqzcqmodrjskktnvpfzamqm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ozixmwbxiizgmmvmnmfgnpnfngezdshdxbwc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'cikkek/{slug}','articlePost.twig',1,'2025-09-23 15:21:09','2025-09-23 15:21:09','f1329dbc-98a6-496f-83be-b588326edcf8'),
(2,1,2,1,'artikel/{slug}','articlePost.twig',1,'2025-09-23 15:24:11','2025-09-23 15:24:11','fd349f10-0422-4e50-8dab-ff2b9edcf410'),
(3,2,2,1,'fomenu/{slug}','fomenu/_entry.twig',1,'2025-09-23 15:41:01','2025-09-23 15:41:01','d70374f0-df82-4427-bee5-8e07e7bca41b'),
(4,2,1,1,'fomenu/{slug}','fomenu/_entry.twig',1,'2025-09-23 15:41:01','2025-09-23 15:41:01','832f6756-f5ce-45c9-91ac-5268b8bea0e2'),
(5,3,2,1,'__home__','home_parkh.twig',1,'2025-09-23 17:31:44','2025-09-23 17:31:44','369ef7c0-9ee5-41f8-bdcf-845d702af25e'),
(6,3,1,1,'__home__','home_parkh.twig',1,'2025-09-23 17:31:44','2025-09-23 17:31:44','16a536d6-9e46-45c0-ab26-13d6d964d0aa'),
(7,4,2,1,'news{slug}','_news.twig',1,'2025-10-03 07:12:50','2025-10-03 07:12:50','bc8a46cc-bddf-4cfb-bf3f-6571ef8b093c'),
(8,4,1,1,'hirek/{slug}','_news.twig',1,'2025-10-03 07:12:50','2025-10-03 07:12:50','7033b535-e9e5-4f80-8010-ba2fd0efc350'),
(9,5,2,1,'nyitolap-one-page/{slug}','nyitolap-one-page/_entry.twig',1,'2025-10-07 09:03:39','2025-10-07 09:03:39','2a761751-e340-4ea2-a199-bda6e6572466'),
(10,5,1,1,'nyitolap-one-page/{slug}','nyitolap-one-page/_entry.twig',1,'2025-10-07 09:03:39','2025-10-07 09:03:39','0866eb2d-bc57-4598-9967-4ef34b99369c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_urlccemrhavwbdnzxmzgzdllwkwikcuzrqrn` (`uid`),
  KEY `idx_wcxeilmthbtrwkahmfclvggqwovzqcekacgg` (`token`),
  KEY `idx_vwdawysfxoifuxvyqanotbfxvlrwgmmsajel` (`dateUpdated`),
  KEY `idx_uxqerdjhobazvkjrdsgzsglcjwxxcvsdlfvb` (`userId`),
  CONSTRAINT `fk_usovppcmrhdjxbxesucnzseraiekrxlwgspg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
(9,1,'ioeamyLbfFji_ggg5d9p7nT2b6I4WN3xEwSpiSE-qI8oKwNGm0zazRjr_aiS0eFnrAU32Sd6BIKx4bZDMVkVGIxgzHT9mNcUm15K','2025-09-29 13:31:44','2025-09-29 14:11:29','8de645b7-2d31-4ca5-ae57-abb6f8c6cd4e'),
(10,1,'7u2-LBAdUsYdHjlGJ1cNCG-ifWc0i7hpb72tL5kqDuetj0DcRIyPSXnBeO0bEEgvyiNS9GNyvbJoXDbQYXQx4x2ZMim0P7KjW6nx','2025-10-01 08:56:51','2025-10-01 09:23:41','1694f66b-e6dc-41b9-8ec4-a4d9889a3f79'),
(11,1,'084pVLjHf6nm3dhw7cvxK9Bvdo7geuxs8jTTQs1Djl59fJr26IQ-iCephq1bt1VhDFrbvBAJCdbYMsL86JCAKRjgSrQpD-jTyaqN','2025-10-01 09:23:41','2025-10-01 13:53:18','8281faa5-31c5-451d-a37e-7a0f20c5b285'),
(20,1,'5lZCNsIcGEO96YD7O2yI5cTMGtRrJVsg-nBl_8RtqzjLaoFP7xasWDZSPkwwbhBwVJFRrx2bYevxUMvqoiDoPq7O0OwCAo9e8sI2','2025-10-06 13:11:39','2025-10-06 14:04:10','20a31d8c-c3f7-4ae4-84d0-1212597be4f9'),
(23,1,'JD86zB5Jow3lUGSEn0dLxt-4EfBqeW7_QBPta4oNVSQn09iieZWZJtU6FLxdY3YetLmpV8CzalcbCSkOfxSIVIg0CGlcABiUUNCF','2025-10-07 12:34:53','2025-10-07 13:50:32','a2ea1355-40c3-463e-817f-ce009953fc14');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wwlxgkjnphtywcemngeavnczjxbkcaofwvfz` (`userId`,`message`),
  CONSTRAINT `fk_hjvjdktqazrruzcwwlxxqlhzqmescizcomce` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xnyakrsjcunctjbzpidxdwdlowwfcmtgjvnw` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES
(1,'parkhedervar','2025-09-21 10:33:25','2025-09-21 10:33:25',NULL,'94625fe0-14e2-4fe2-94d5-d0d88b34013a');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xquuqxyzhfrhkjizbwmtdapijhqwgispvmvv` (`dateDeleted`),
  KEY `idx_kjflxyyxgzaatsxvdqetymfugndzkreqvxeh` (`handle`),
  KEY `idx_zrjdohlewwlwjwcrijppikfijyefwnlcfebe` (`sortOrder`),
  KEY `fk_cdgeroitmumbraccwuvqhoozeidnxbeggdaj` (`groupId`),
  CONSTRAINT `fk_cdgeroitmumbraccwuvqhoozeidnxbeggdaj` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES
(1,1,1,'true','parkhedervar','default','hu',1,'$PRIMARY_SITE_URL',1,'2025-09-21 10:33:25','2025-09-21 10:33:25',NULL,'bb5ef826-a820-4982-a272-9ad7d3c5be5a'),
(2,1,0,'1','Német','nemet','de',1,'/de',2,'2025-09-23 15:22:51','2025-09-23 15:22:51',NULL,'0a8824d5-d531-40bc-b0c8-c420edc4449b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_iericzwohirluzuraplvgdinwwijdwknvjzh` (`userId`),
  CONSTRAINT `fk_iericzwohirluzuraplvgdinwwijdwknvjzh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_anixmdwrfyimfkmciofivocmqzgurodfddot` (`structureId`,`elementId`),
  KEY `idx_yezhoxkglxujclerwnlczqkqdjlhxcdgqznk` (`root`),
  KEY `idx_joscjldktqxfwemtmichrqpgobmbjwdlfnkj` (`lft`),
  KEY `idx_erkirddydedbzlzfnldtpmnbxhwokcnwobae` (`rgt`),
  KEY `idx_dwtpfynzymaezdcxqldgqwewtbjznkglareo` (`level`),
  KEY `idx_nfgqtsxjqtafypgrmzdjckcdcjnbnvragnni` (`elementId`),
  CONSTRAINT `fk_tbvtmbsxfivtapabwzedtneqmylienvuwbmu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
INSERT INTO `structureelements` VALUES
(1,1,NULL,1,1,6,0,'2025-09-23 16:47:34','2025-09-23 16:47:47','21629614-c877-408b-aa90-dfa3a36157ce'),
(2,1,2,1,2,3,1,'2025-09-23 16:47:34','2025-09-23 16:47:34','a4471404-eea6-4427-a81d-70f4aa6f2e85'),
(3,1,4,1,4,5,1,'2025-09-23 16:47:47','2025-09-23 16:47:47','4b07dfd2-6c45-429e-a747-c2f31ef869c1'),
(4,2,NULL,4,1,6,0,'2025-09-23 16:47:59','2025-09-23 16:48:11','38b0d05d-3a5d-42c4-94b9-e008ced1489e'),
(5,2,6,4,2,3,1,'2025-09-23 16:47:59','2025-09-23 16:47:59','979efef6-06ba-4ef3-aaba-d041b17b8435'),
(6,2,8,4,4,5,1,'2025-09-23 16:48:11','2025-09-23 16:48:11','833ae490-99fc-45e2-825f-00565b714e45'),
(7,3,NULL,7,1,10,0,'2025-10-03 07:28:21','2025-10-03 07:32:09','3e086549-1f3a-4bfe-9706-7001e5884ca8'),
(8,3,27,7,2,3,1,'2025-10-03 07:28:21','2025-10-03 07:28:21','02524f63-f51e-41e0-936d-d6b7cf6b172c'),
(9,3,35,7,4,5,1,'2025-10-03 07:31:07','2025-10-03 07:31:07','61c174d9-55ec-4e8a-8c08-7266d19233d6'),
(10,3,37,7,6,7,1,'2025-10-03 07:31:28','2025-10-03 07:31:28','2ef68d4e-d4db-4906-928c-8e74d0a38321'),
(11,3,39,7,8,9,1,'2025-10-03 07:32:09','2025-10-03 07:32:09','3bf4e025-1372-44c2-b6ef-18c6ccc53288'),
(12,4,NULL,12,1,6,0,'2025-10-07 09:21:54','2025-10-07 10:40:58','b2e2fdea-f323-4c06-80e5-690f2daa89cf'),
(13,4,63,12,2,3,1,'2025-10-07 09:21:54','2025-10-07 09:21:54','47022dd8-571d-407f-a8b5-b3ddf72d71b0'),
(14,4,65,12,4,5,1,'2025-10-07 10:40:58','2025-10-07 10:40:58','40182681-7ba9-419d-9199-a3b862c60424');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qmjhierszkvidawykkgmsbzqvyphbqgdtybo` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES
(1,NULL,'2025-09-23 15:21:09','2025-09-23 15:21:09',NULL,'5008f184-22fc-4346-b04e-eb7e8fe13807'),
(2,NULL,'2025-09-23 15:41:01','2025-09-23 15:41:01',NULL,'fbdcb151-75d1-4523-92a1-834ba722698a'),
(3,NULL,'2025-10-03 07:12:50','2025-10-03 07:12:50',NULL,'09790b78-4040-4f01-97d4-2970f3ff37f7'),
(4,NULL,'2025-10-07 09:20:33','2025-10-07 09:20:33',NULL,'2bfbc2e8-2417-4b16-9524-befdf0f50afa');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cdzpsngvztjguqrititnzvkswplkbsdnxfdw` (`key`,`language`),
  KEY `idx_eykluxxfsdqdsdlauplucywpalhsmppmgnzh` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ohylnzahyrdlhdcshlmkdlotxxtpwftkotyv` (`name`),
  KEY `idx_tedmgpdnqlqwittcbafuxfdrrxirruvpoxwv` (`handle`),
  KEY `idx_tsgjnvfxyebgtdnwmsggsujzhnsvorrxzlod` (`dateDeleted`),
  KEY `fk_eygrlyrmllcffwocbbcuqseuepmzmdaaofxj` (`fieldLayoutId`),
  CONSTRAINT `fk_eygrlyrmllcffwocbbcuqseuepmzmdaaofxj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jyxxytssegyvvktutybqboxnsvpmkkwzedcz` (`groupId`),
  CONSTRAINT `fk_ihxmyzjubygynmjmakedlgrkussctcixlhqw` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvvgodoaanihjprygboywykzikycergwvdjo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yabohnepsfgxhuzicdkoazhgrgqashntdoqc` (`token`),
  KEY `idx_yckdyyompeomrathjcahkhxdorxsgedhbwuf` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gfnbnqoerqcdwgcsbazqumezlbqmfscnhknu` (`handle`),
  KEY `idx_txkoxamxktxbhowqlezynaelbddmmgkdanfd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kmiznyquvqapxaqbnqjztkbziekzlazfotet` (`groupId`,`userId`),
  KEY `idx_ffgitprvbbylefqzqutqhjlyonfdnzavapfa` (`userId`),
  CONSTRAINT `fk_tdorkcndnfwpckjptakfnlijstrrizqymjih` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uusxedxcmvgaxmabgeelvcwzgfrjqbnoadmu` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_enfhxruzhuflmbvsvlmkgifgxokaxijnszbu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pjbvmlmqmckbwwsvlepzryvwwarsckbmatff` (`permissionId`,`groupId`),
  KEY `idx_xjiigkkbcoormnedbilgsefkcliptspzxnpl` (`groupId`),
  CONSTRAINT `fk_dnnnorzdqbxzwngbjswvvdegmjosjqwpbznw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fzrfafzizmxulvodcdleeahtbqgnnvjulykp` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kyhevrkpwqrfulasohnkbnhhglnhcaxwlfoj` (`permissionId`,`userId`),
  KEY `idx_utwxyeivliynvykjzzcinwbldsbukavwsetv` (`userId`),
  CONSTRAINT `fk_blndcgbuwpbopreopjqkpfmkryjstvpqfjcp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pkrcrfcqwtbzkelwqajzkjyzuxitnyxcdttw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_bchttkekjqsfqbsarkldemchgmblkdulkcot` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES
(1,'{\"language\":\"hu\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `affiliatedSiteId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_taqbqscikpwhwiycncmbetefywwdqagbmgqn` (`active`),
  KEY `idx_naykzvuvxzgzeeepnspzuzpsourvbkazobwo` (`locked`),
  KEY `idx_cdqeriyhvpqduvdhcchflmrgceyrmjybwxzm` (`pending`),
  KEY `idx_wajeiltxutzpdpsbypwkdljrrcdlrifgiflv` (`suspended`),
  KEY `idx_utpmaroydtfvbhfhzjhujxlonbotcaderrsi` (`verificationCode`),
  KEY `idx_vtjafcrqwcnftjeudjynzhfoygtlsphogiak` (`email`),
  KEY `idx_exdkmxksrbenfhclvpexxgpsulqqullnqkbo` (`username`),
  KEY `fk_knxnlkuopwzcpyudecyjntgfzopnfcmfuufp` (`photoId`),
  KEY `fk_sqaiyxpgisxjrdvdxoodbmvzkjfrdhhuoffs` (`affiliatedSiteId`),
  CONSTRAINT `fk_iqomojzgpetrjfacwyqbpjzvrbyotqsrgllj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_knxnlkuopwzcpyudecyjntgfzopnfcmfuufp` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sqaiyxpgisxjrdvdxoodbmvzkjfrdhhuoffs` FOREIGN KEY (`affiliatedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,NULL,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'fulop.viktor.dwiki@gmail.com','$2y$13$Y6RfNWpdJONVng8mFSt/Ker6rXCuXYn.rWKNikf4glYeBSZfDEJFi','2025-10-07 12:34:53',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2025-09-21 10:33:26','2025-09-21 10:33:26','2025-10-07 12:34:53');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usylcqztoaapvzauohiudyrcnzkkmcxidbww` (`name`,`parentId`,`volumeId`),
  KEY `idx_lksmbgljyhkypxmnjhndmrslwkgraextvbee` (`parentId`),
  KEY `idx_zacejxmjkpevvkqakvyzjggwnrvjvfjyxtog` (`volumeId`),
  CONSTRAINT `fk_isynqfejpbyhpxwtqdqieqipjihakrrsaoog` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uyujvruaahoppdmikdlvljnyzdyvpmtqeunf` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Képek','','2025-09-23 15:10:13','2025-09-23 15:10:13','4869c7fb-8c3a-4d6d-8de7-2c0fbb67392b'),
(2,NULL,2,'Képváltó képek','','2025-09-23 15:11:13','2025-09-23 15:11:13','28c93b87-3d6c-4b7d-bb23-19a1ee5b9991'),
(3,NULL,NULL,'Átmeneti felöltések',NULL,'2025-09-25 17:51:52','2025-09-25 17:51:52','623c0780-4c05-4c78-93d0-c1b675aaac28'),
(4,3,NULL,'user_1','user_1/','2025-09-25 17:51:52','2025-09-25 17:51:52','0bd17789-2fb6-46e2-9771-50f5e97fa527'),
(5,1,1,'news','news/','2025-10-03 07:28:35','2025-10-03 07:28:35','da04e93c-e84d-4e51-9cdd-aea9a0b8665c'),
(6,1,1,'etlap','etlap/','2025-10-07 12:43:01','2025-10-07 12:43:01','26fca262-8a4a-465d-b733-d4ea9387ab0f');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_brlsngznzuxgclhnmxvefnklcddjfhtmuods` (`name`),
  KEY `idx_wxsspncxwcknmwjqnizbocmdkmlzvmwiojdm` (`handle`),
  KEY `idx_cikpodcneeypxazkynmqaiyfvfnwarhmnnto` (`fieldLayoutId`),
  KEY `idx_moozmllnomdmkdwwrzovchrpfwwhtshdxjmy` (`dateDeleted`),
  CONSTRAINT `fk_vswfuajrptxihrmfjpnzvsuabwctnaycuwyr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES
(1,1,'Képek','pictures','kepek','','kepek','','site',NULL,'none',NULL,1,'2025-09-23 15:10:13','2025-09-23 15:10:13',NULL,'33fbdc92-4491-48e7-a475-1e1fdf3fc897'),
(2,2,'Képváltó képek','sliderPict','sliderPictPlace','','sliderPictPlace','','site',NULL,'none',NULL,2,'2025-09-23 15:11:13','2025-09-23 15:11:13',NULL,'36685e5a-d503-4f86-9d6d-e73a0d97dc93');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text DEFAULT NULL,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_tswoiybujssdksmskpjttrzeuhwepvbfvjkx` (`userId`),
  CONSTRAINT `fk_tswoiybujssdksmskpjttrzeuhwepvbfvjkx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lftkopiwyhheuakpnuzialsiahchdnmosqrx` (`userId`),
  CONSTRAINT `fk_katibmfffbnzjrxetgjsdbswxnqxtsvcadzj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2025-09-23 14:23:01','2025-09-23 14:23:01','32124b9d-c17f-401c-9dc9-97fc1d1b933f'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-09-23 14:23:01','2025-09-23 14:23:01','c3e9181e-ac50-4a7f-9576-cfc6669d9ab1'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-09-23 14:23:01','2025-09-23 14:23:01','6a383570-ad78-4ac4-b196-ad1c2209e9a5'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2025-09-23 14:23:01','2025-09-23 14:23:01','17885e12-2763-4633-88e8-29857160f50e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-07 15:50:33
