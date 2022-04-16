-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: localhost    Database: sms2w_api_db
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `org_shortcode_id` int DEFAULT NULL,
  `url_default` varchar(255) DEFAULT NULL,
  `message_default` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_settings`
--

DROP TABLE IF EXISTS `org_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL COMMENT 'the organisation id of the org settings.',
  `sms_token` varchar(255) NOT NULL COMMENT 'sms token of the organisation settings.',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The creation date, this date is automatically update by the system.',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The update date, this date is\nautomatically update by the system.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_settings`
--

LOCK TABLES `org_settings` WRITE;
/*!40000 ALTER TABLE `org_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_shortcodes`
--

DROP TABLE IF EXISTS `org_shortcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_shortcodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `org_id` int NOT NULL COMMENT 'the organisations id',
  `shortcode_id` int NOT NULL COMMENT 'The id of the shortcode',
  `is_actif` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The creation date, this date is automatically update by the system.',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The update date, this date is\nautomatically update by the system.',
  PRIMARY KEY (`id`),
  KEY `fk_org_shortcodes_id` (`shortcode_id`),
  CONSTRAINT `fk_org_shortcodes_id` FOREIGN KEY (`shortcode_id`) REFERENCES `shortcodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_shortcodes`
--

LOCK TABLES `org_shortcodes` WRITE;
/*!40000 ALTER TABLE `org_shortcodes` DISABLE KEYS */;
INSERT INTO `org_shortcodes` VALUES (1,2,4,1,'2021-10-11 10:39:17','2021-11-24 06:26:53'),(3,2,4,0,'2021-10-12 11:03:56','2021-10-29 07:29:21'),(4,999,8,0,'2021-10-13 09:43:45','2021-10-13 09:43:45'),(6,547,9,1,'2021-10-13 09:47:55','2021-10-15 10:19:34'),(7,333,6,0,'2021-10-13 10:08:52','2021-10-13 10:08:52'),(8,457,6,0,'2021-10-13 11:14:32','2021-10-13 11:14:32'),(10,8888,8,1,'2021-10-15 10:23:46','2021-10-15 10:23:46'),(11,575,8,1,'2021-10-28 15:13:53','2021-10-28 15:13:53'),(13,8888,9,0,'2021-10-29 08:44:50','2021-10-29 08:44:50');
/*!40000 ALTER TABLE `org_shortcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_codes`
--

DROP TABLE IF EXISTS `service_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_dedicated` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_codes`
--

LOCK TABLES `service_codes` WRITE;
/*!40000 ALTER TABLE `service_codes` DISABLE KEYS */;
INSERT INTO `service_codes` VALUES (1,'058','Bienvenu au portail #058#',NULL,'2021-07-25 23:00:00','2021-07-25 23:00:00'),(2,'060','Bienvenu au portail #060#','https://ussd-lay-api-preprod.nexah.net/sent','2021-07-25 23:00:00','2021-07-25 23:00:00'),(3,'059','Bienvenue a MyBank. Faites votre choix :',NULL,'2021-07-25 23:00:00','2021-07-25 23:00:00');
/*!40000 ALTER TABLE `service_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `grant_type` varchar(255) NOT NULL,
  `scope` varchar(255) NOT NULL,
  `service_key` varchar(255) NOT NULL DEFAULT 'nexah-hbmvl15767736672',
  `nxh_service_key` varchar(255) NOT NULL,
  `api_sms_url` varchar(255) NOT NULL,
  `api_sso_url` varchar(255) NOT NULL,
  `api_org_url` varchar(255) NOT NULL,
  `app_web_url` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gen_key` varchar(255) NOT NULL,
  `url_shortener_api_url` varchar(255) NOT NULL,
  `url_shortener_api_key` varchar(255) NOT NULL,
  `key_back` int NOT NULL,
  `key_home` int NOT NULL,
  `key_home_title` varchar(255) NOT NULL,
  `key_back_title` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,14,'L2S7RLFXk8NxasGmqa23XQhgwimd355bK9I1Wa9V','password','openid email profile roles key','nexah-hlmqb15874685216','nexah-8emgr15877193028','http://sms-api-dev.nexah.net/api/v1/','https://sso-preprod.nexah.net/','https://organization-preprod.nexah.net/api/v1/','https://ussd-preprod.nexah.net','todo@nexah.net','todo1234','ZeBkwLlaWC3N2G7fMCWGrQ==','https://nxh-preprod-api.nexah.net/api/v1/','9fcb7cb6397a1488551b664ad330cb3ede60155e6508febac63dabe1016608bb3f6df505711bc765',2222,1111,'1111)Accueil','2222)Precedent','2020-04-30 13:33:46','2020-04-30 13:33:46');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortcodes`
--

DROP TABLE IF EXISTS `shortcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcodes` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'The ID of the shortcodes',
  `code` varchar(255) NOT NULL COMMENT 'the code of the shortcodes',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The creation date, this date is automatically update by the system.',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The update date, this date is\nautomatically update by the system.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortcodes`
--

LOCK TABLES `shortcodes` WRITE;
/*!40000 ALTER TABLE `shortcodes` DISABLE KEYS */;
INSERT INTO `shortcodes` VALUES (4,'5','2021-10-11 07:49:05','2021-10-13 14:36:58'),(5,'5','2021-10-11 11:15:04','2021-10-13 14:36:58'),(6,'5','2021-10-11 14:20:45','2021-10-13 14:36:58'),(7,'5','2021-10-11 16:12:01','2021-10-13 14:36:58'),(8,'5','2021-10-13 07:16:15','2021-10-13 14:36:58'),(9,'5','2021-10-13 07:17:15','2021-10-13 14:36:58'),(11,'5','2021-10-13 10:27:45','2021-10-13 14:36:58'),(12,'5','2021-10-13 10:28:02','2021-10-13 14:36:58'),(13,'4587qdczee','2021-10-15 08:36:08','2021-10-15 08:36:08'),(14,'4587qdczee','2021-10-15 08:36:35','2021-10-15 08:36:35'),(15,'7zdcer5ef8','2021-10-15 08:36:44','2021-10-15 08:36:44'),(16,'7zdcer5ef8','2021-10-15 08:38:05','2021-10-15 08:38:05'),(17,'7zdcer5ef8','2021-10-15 08:43:42','2021-10-15 08:43:42'),(18,'7zdcer5ef8','2021-10-15 08:49:42','2021-10-15 08:49:42'),(19,'khzbz7zdz','2021-10-15 08:50:00','2021-10-15 08:50:00'),(20,'khzbz7zdz','2021-10-15 08:50:44','2021-10-15 08:50:44'),(21,'khzbz7zdz','2021-10-15 08:53:31','2021-10-15 08:53:31'),(22,'khzbz7zdz','2021-10-15 08:53:47','2021-10-15 08:53:47'),(23,'khzbz7zdz','2021-10-15 09:36:28','2021-10-15 09:36:28'),(24,'5f999feez','2021-10-15 09:45:52','2021-10-15 09:45:52'),(25,'AAAAA888','2021-10-19 07:34:59','2021-10-19 07:34:59'),(26,'zehfvhgcz','2021-10-19 15:09:45','2021-10-19 15:09:45'),(27,'zehfvhgcz','2021-10-19 15:51:50','2021-10-19 15:51:50'),(28,'ksdc45zd','2021-10-28 11:00:57','2021-10-28 11:00:57'),(29,'kzfzefizef','2021-10-28 11:04:59','2021-10-28 11:04:59'),(30,'erezrzr','2021-10-28 11:21:48','2021-10-28 11:21:48');
/*!40000 ALTER TABLE `shortcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'The transactions id.',
  `org_id` int NOT NULL COMMENT 'organization id.',
  `shortcode_id` int NOT NULL COMMENT 'short code id',
  `keyword` varchar(255) NOT NULL COMMENT 'keyword.',
  `sender_address` varchar(255) NOT NULL COMMENT 'The sender adresse of the transaction.',
  `operator` varchar(255) NOT NULL COMMENT 'The operator of transaction.',
  `unique_id` varchar(255) DEFAULT NULL,
  `date_time` datetime NOT NULL COMMENT 'the current date.',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'The creation date, this date is automatically update by the system.',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'The update date, this date is\nautomatically update by the system.',
  PRIMARY KEY (`id`),
  KEY `fk_transactions_id` (`shortcode_id`),
  CONSTRAINT `fk_transactions_id` FOREIGN KEY (`shortcode_id`) REFERENCES `shortcodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,8,6,'ttt','ppp','orange','ooo','2020-02-12 00:00:00','2021-11-18 09:39:48','2021-11-18 09:39:48');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sso_user_id` bigint unsigned NOT NULL,
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `expires_in` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,9,'57b1a12e806266f9635d8cc61251cefb6039f1d5d9fb79a5e770dde43d28427e3ef1ac4c35dc45bb','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6IjU3YjFhMTJlODA2MjY2Zjk2MzVkOGNjNjEyNTFjZWZiNjAzOWYxZDVkOWZiNzlhNWU3NzBkZGU0M2QyODQyN2UzZWYxYWM0YzM1ZGM0NWJiIiwiaWF0IjoxNjM2MzU4OTUxLCJuYmYiOjE2MzYzNTg5NTEsImV4cCI6MTY2Nzg5NDk1MSwic3ViIjoiOSIsInNjb3BlcyI6WyJvcGVuaWQiLCJlbWFpbCIsInByb2ZpbGUiLCJyb2xlcyIsImtleSJdfQ.sxkgvcbOcEdklDWjFnw6fH2_r8Lmk-YLe8VrMttezMBIGFoARh2NjynhsZ7XtKZqAugVIpOMecD4-0_PyovF3qnqxFhObLor_lfbRAEpsZBYm_uX65RPI8SiIh8MST7hzVxeZlbvqJnNkw_qrezmqqVD4pihIEEZJ7cPmhZak-wO00J3pubzgMh8235NCcM9lN1-2pjJ5S_ZPtI3E6hG9Ih5lQieK_RQRevsDRbwlVTcM_ivZdAKMDZkFnesu4LoZwF9F97eiit8LcYTy6FRx1NBrJSyfIzfSYkphllM0qwEi3Yxbmis8KmJT0V3zj3sWz9zc6WVf-74COED5tx2b0Bgdirs6xIFB7HgK04hRIBA5RgJAaGEQVrtkQMdhtpnQft7zZP7xNu-jfHV5UU7vGXaXwcjf5HkrF3JAIv2yQ_KiSpZenKEaVlJVlk1l_w0R93nuRvzyloAMpfdO2bqOyz8YamtR77gLHkHQdUXoPiQI7wO8fI4TdBxqSOB6NBeQh0HlYvvnRX3dfxHtKU8GLCSDp3jnHePIe38h42toVJIUY3M0e_8lct_crvF_TYtC2MwIajcc1zSobprIihexiXwGx0B4G_Towh9ac8dj9Z8-qJJtzyiZYzJPinH8GNu3LDz_amHO_zpyTo1Bn8ZnTBoOx1-aQrqPrXhlNrqKpE',NULL,'2020-12-11 13:44:32','2021-11-08 08:09:11'),(2,27,'0705c17b5121510fecb5e527db7fa47d0fff8137f85b2f07eec6ca4a73600e3e68cd3ca6d73a2ed6','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6IjA3MDVjMTdiNTEyMTUxMGZlY2I1ZTUyN2RiN2ZhNDdkMGZmZjgxMzdmODViMmYwN2VlYzZjYTRhNzM2MDBlM2U2OGNkM2NhNmQ3M2EyZWQ2IiwiaWF0IjoxNjM2MDM0MDM3LCJuYmYiOjE2MzYwMzQwMzcsImV4cCI6MTY2NzU3MDAzNywic3ViIjoiMjciLCJzY29wZXMiOlsib3BlbmlkIiwiZW1haWwiLCJwcm9maWxlIiwicm9sZXMiLCJrZXkiXX0.XF2jr61ES2kD20jiGsiWSBHKIYhdYvmiI2xrcgpNJQL95DC1aSlj_ppQHLj3ZJBjkvkhCBsWkec0ymwQ4SVQEL73Mje8OXq-A8itGjwrsu-A7MOfvrPTBZRHgc9x6AIl0_3MyhJq2sKqMtsJVrA4P9Twftc61IZ2FHuvOYqNywQi1mHjXavUahN2HT1za4UToRxYfpddEhnjXUdCvZ13P96hCRnyK3gqR6tllSYFl027Qr_tXxFNYgrkBMIRELodq7eQtIXIOTq917APuMLynWlAdHN-PISAelwGtdnys3tEVBoH1P6RrWM3Yjo7TAPtzbI9i9bAUGduB-jcdvdAQf-6e6pgHewdb8sfpNpyQbodHLY1622h5eA9RbCPuS3_nsFj8cvqhajGPyHpKQmD94-PSrCyKx3gjSv-gpQTB-MDK-5L8cb_2Ul9Z2THp_2zTk-Xj4YfrvXiH_ZuLiXCfvpkh0bWDlhhY1YWEbM3oU2bVJroZQTzYMTntB4_pkNnAjbX3-SOJ6Cem-G4z74rpzNUq2aoOjKGp8fj2ADXfJNM7DAjL6WKoNLyVvjionOzKzuPO6NZMVpTvoOEVZlzFQiaLvd1mtXhHevmB1DWWMgptrvEf_6YluUw8bRTKfONalGp8vvDWleToHatRK_zk-1y7aEZ17ySNBoFbd0TTYI',NULL,'2021-07-25 19:39:00','2021-11-04 13:53:58'),(3,4,'f191a549cfbdbcbf1b839ee60d84e098a1897fd7586d1e9fba0b1e19f75fa7d84b9d0148b519617b','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6ImYxOTFhNTQ5Y2ZiZGJjYmYxYjgzOWVlNjBkODRlMDk4YTE4OTdmZDc1ODZkMWU5ZmJhMGIxZTE5Zjc1ZmE3ZDg0YjlkMDE0OGI1MTk2MTdiIiwiaWF0IjoxNjMxNTQ4MzY2LCJuYmYiOjE2MzE1NDgzNjYsImV4cCI6MTY2MzA4NDM2Niwic3ViIjoiNCIsInNjb3BlcyI6WyJvcGVuaWQiLCJlbWFpbCIsInByb2ZpbGUiLCJyb2xlcyIsImtleSJdfQ.yhjjTbDb27AsQYiyt4g2lZ-DUsawjrqZtDlzxvNan2Jgtw3u0NkunrbvyCjPiixHM7uZEffM7JLR-yC1SGrCzI1ka6jhbyknfg9VEOh6GUjq9ipV4yER6QKgmnqCMxIW-ibX2I71VoCJnfBRoIcrfMIFRqOMuPgEDEkv9ZTl-XTqBhXxqAgPVXeqE9N1P-jbDNxBB5x286i5vlqwWW0i7sSZ4Z5edghxiOGnQ92GCmNcK7ljOmWybE-f4sGv2SGxSizMBLsjPVyi4_qPPWEyZ5ffLAdXEgaXoFSzgWY97ZT0NUe9HO70g9DNvPbRKU1cVSmYtzAygkKarFANWIznfU6uhi81-TxQQe4VWeRsszkz0LuU3DNiD67crEw-oga_90Ros1_uYOf3xL8EcNzT4cTAoYngggXBwJFBNZlbl9jXkLa0ARMIRTem-cj30oRuLjxX5TVz8J68aMc7wbBUaDPpmFfUtkcao0chtNt8h4ayQmAPlz660-oX3O2o_2dq3-EB_R3U_mRySH7nF892l-EA88aPnEy-tF1gHx0xyc4F7r53NFKoQ5vULBX4HOQbMgtJ_HIjMOUU7dwy9YdsOcv34_PE_zI6Bt2BQSiWNifqLkg03yupuRIbMPHFSx1OrgK3NkbqoVfowAbZhIMliW1-kBye_wHhgvupVzbRK8M',NULL,'2021-09-13 15:52:47','2021-09-13 15:52:47'),(4,118,'c4c158d4e6b7c70f893acb42d97d0a095f9e4624cb16a88e20cf8f8f30e64dd4dd8775fa91793143','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6ImM0YzE1OGQ0ZTZiN2M3MGY4OTNhY2I0MmQ5N2QwYTA5NWY5ZTQ2MjRjYjE2YTg4ZTIwY2Y4ZjhmMzBlNjRkZDRkZDg3NzVmYTkxNzkzMTQzIiwiaWF0IjoxNjM2MzU3MjAzLCJuYmYiOjE2MzYzNTcyMDMsImV4cCI6MTY2Nzg5MzIwMywic3ViIjoiMTE4Iiwic2NvcGVzIjpbIm9wZW5pZCIsImVtYWlsIiwicHJvZmlsZSIsInJvbGVzIiwia2V5Il19.viv1DLAUoUaL4vbTdO7S_3hBoSMOoTOSTt_vUrVh57d8BA143qS1ZXiP4anANwhBY7IyOSLDkKyADKBNyrHv2PXAOnWNy9OsEWbmDW88K2mUCqKn1JTitzvt2lmzGLPnJAH6F20xl3APu134LMJ0vAdKguPAwanNnYhc3H6qMB_56QAJYdOOZgl7y78ZvEX-qPESr66fwWLKAzlt4mzOBlEepJcYUy2hSxZ6WTLR0yCLT8NpJbjSOy6F2tuJNujZjEBlcyp9NbVKs9bIfUibfUPTIbt4RFMMAFcpSuih7WmlPyB1pAugHmn5FrRsD99yib6km3dj6RzaDp4O-z6MJmSRg1T-KGE6DxB5IcaQ24W-jKZUg9809lUevMNXySpd4ZmG0GFu_fX6tIH9UWXJkbtCLCGIP-2Fa_oqnMw1wRIkvM1X_PqahoCA8WecNOEo09fM2XuGy4IlChKMCwECRmbl_Z3ORQJzCYx0T4mC8iJorcB6kxRTPZQcWc09nxEkq2Fj7WjuJgdSp_IhCnDlDbxD_2BCtKdHzuijzD7eV2iFtzlpejeY3T6yCWaUh8mvYwXU9iiG7XKJgYd11j94pfrtLfyb2tskBTCLIycm4J9xEGWVzkoat3pGQjjDGVCWdIBQj3Ax7DVuvkc3ittzIzuk32dmqYsea4tOpCUt4KE',NULL,'2021-10-21 07:43:45','2021-11-08 07:40:03'),(5,19,'24ac5a92bbb84e8cd88d96f4a6b9ead7172813b76d9809a1e628ae3ad11d3b1d3e97f929ca2f1aa1','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6IjI0YWM1YTkyYmJiODRlOGNkODhkOTZmNGE2YjllYWQ3MTcyODEzYjc2ZDk4MDlhMWU2MjhhZTNhZDExZDNiMWQzZTk3ZjkyOWNhMmYxYWExIiwiaWF0IjoxNjM1MjM1MTc0LCJuYmYiOjE2MzUyMzUxNzQsImV4cCI6MTY2Njc3MTE3NCwic3ViIjoiMTkiLCJzY29wZXMiOlsib3BlbmlkIiwiZW1haWwiLCJwcm9maWxlIiwicm9sZXMiLCJrZXkiXX0.JczKc3QINkVXKplMwGU9jsgKC1v64mqzQtVgeVhc-cVH91PZNbNXjrYMQ4GduTsInSIeS95l1saT7EmdDeU7SbYjpt5WG_flQNQOaSzGd-u_Mz0mGca1Uc30tOnhgZDLR2ZPYgFpHBDMwEtLuFuoFbC4MfTen5OrLRQStm-teFl44Hlip5MTRUE6mc5Y3mEeGiEEwXMqpydKqMlBjppD5teMVIiDeHKUigBXgZ8gUWFJWlma1FphbzFwm5OV-P7caF9gRLk_JH9lzVclMX_w77_IBYvcjLx9GYY6TVPkcVoUvkI39mF6j4WWpyrgfEuMMOtGkb4ENJ85X7tTCPrMvSXhQyi-f-JqdVxWm2TShd3zFoZmSZbl8bSC2tn5aANMKtu9WbcxrdScH5BfVahEKbLJu8G5UF9tEggV7R_6v-eJ-3wBs4-8Fcx6UGqIbyuqQCDHcM1qFy47Dwvcrz-Zeu9ltCnYN8-JsymN741FYNBP6cUWNvHHkYWqQeEW13-K4XJwGVrSAkw0pAuIXVpUj1Wok4oNSjsAWTvSrqYocURXioNk7OYykQZzZ6r0XufemglWTrFldADvL9S6KfyLJjxthmRZUEfpVRYqljfxWA75dFoypUUUdsqYlrL35s5Ay2laoQ7OguEF0xSm7KhIYzVyEZXLrkhTrZsiFCtHRhM',NULL,'2021-10-25 13:40:25','2021-10-26 07:59:34'),(6,117,'c13c8c953a2da02a8a0b7be7f149adc1a46c2fb7d84e85a186a42dbeae5d94768d0e8fa2a3acfb17','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6ImMxM2M4Yzk1M2EyZGEwMmE4YTBiN2JlN2YxNDlhZGMxYTQ2YzJmYjdkODRlODVhMTg2YTQyZGJlYWU1ZDk0NzY4ZDBlOGZhMmEzYWNmYjE3IiwiaWF0IjoxNjM1MTc0MDgxLCJuYmYiOjE2MzUxNzQwODEsImV4cCI6MTY2NjcxMDA4MSwic3ViIjoiMTE3Iiwic2NvcGVzIjpbIm9wZW5pZCIsImVtYWlsIiwicHJvZmlsZSIsInJvbGVzIiwia2V5Il19.bcUswdh9S5cdU4nN30TkUC5VETEIEDEkIu4NMqKZU8ln-aXZXMeoS_5gFQ3yyDZmC78x_FOaDKtRXSio0s7S7dvxepjiVk1b4onp6-1ySHk_A4nh2QjtRlCAhCtwz8fE1yOeqKS9AExD32qA01ARmRzAeB5cH1BZov4LB7NflH5qmJ1LKikB17Y6nwI12b_IsrgnWnAy-qJawUeQbhHappiAw6TKQNciR6UXX30p6tR0v0eiw9v4cR0k2JziQ7YeXTDaQm-BS0wAqZzoFYfhG7KIcPA4d3mG9UgAbE5l4jzZEBHzuIFJwZfQBvtbqjo927MfQjpwa6iX_-3sfxZRBE5hwnfht5wk0nZcj7p1GekFMHP1FkrneKEl8_AzUuqvDVLnF3fvvWbNN4QjmY_QF1hwkZQDT82fsjIR7_iKQj7heh7slCBnj03QWXjo8Vpqst6_QV0qNfrdsKCmQHKCPB8JjRgRfMODuDYaotcTUNbHrWOVN_VB1QkS5ClOla3L04I-YVilngGYA1d-lhEOPaki5KISScIX9mo9Rlelfu8VD6pi1VZwFd4qdsF-31dbWDSLZm9SQKnxZbvdFlQmA5LGMGRZucVTqrIJSS2D-ufeT5B8zZ739ZemImgBXrqQbmo3dmnNzRJyI5NSigiMv7FseMl1WhCxfxQ3SVCGPiY',NULL,'2021-10-25 15:01:21','2021-10-25 15:01:21'),(7,121,'191d5c19296d125be25db9ddb62c43be0d9809d927c14d096932aee6ea96c098c16ea246bc563e98','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6IjE5MWQ1YzE5Mjk2ZDEyNWJlMjVkYjlkZGI2MmM0M2JlMGQ5ODA5ZDkyN2MxNGQwOTY5MzJhZWU2ZWE5NmMwOThjMTZlYTI0NmJjNTYzZTk4IiwiaWF0IjoxNjM2MzcwNjQxLCJuYmYiOjE2MzYzNzA2NDEsImV4cCI6MTY2NzkwNjY0MSwic3ViIjoiMTIxIiwic2NvcGVzIjpbIm9wZW5pZCIsImVtYWlsIiwicHJvZmlsZSIsInJvbGVzIiwia2V5Il19.q6apkGThQBYkRsJe89lZF6-R5o7ZSoMLnUg040oNOARQFqrRbOzalPDPtWkLDFaF7NDcQmgQjaxRPE_13zSvfCMZ8iWaSKWMrrJXluFXJyQ4OTeB-kk9c5aqbAl1LivXUQdlxy6Y5Pc4fFh--7Yk7Y9eIl8L99jyZRsMjCBIWbfgTp_dGvwhryFD4F3L7ILN_3KyeV-_Rbad7wATwTMSny1zMBiQJvTjBPmuSeE_m6jOAc0wBI11oT3m0mAvytpUTrR7DeduHz7rLKbnyFU9iLR6T61o6Q-DJhxOtMLLo91eb_WB25xjIAqJHKXXoeg1D_Xth4qtjDcSIIyDKnkoQEpRUHK9Q68OjqUGYygFS2rOgPgCHz1K9wEMhRtkVEoclxctqHIeMmVxOs_iY-hY0NuY44TJhahO0EXUkZBJ6OxVbBk342B2bao8-emDW1_EVRU1I_IqdH3URIb28FJMLNukjIET5ewAWA2vnL7tHU6KDnVDxeFYR2tnrZCm_AVrJmcN3c2X7YoDVRAYMkxIJSIGRkHv9Bp-tqPRFjhcEYaymW6vpMKRfSQiZXw9MgMIDu2JFUQhob86ZxJvlKnz4G9H1mSg6yboAs_SOnzrQDFUquO8ykg6rl5QcjbFKUnHHWesSgvlDvMpgltFdODJPkskxfXs5S0tQiBRTQ8zHEQ',NULL,'2021-11-04 11:00:55','2021-11-08 11:24:02'),(8,120,'d5e7285b2c9201ce21b4c7b98ad6f9f6ceefcdd54c1db0afa3fe9f6624d68bd79f3fe9cdc288fa6b','eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxNCIsImp0aSI6ImQ1ZTcyODViMmM5MjAxY2UyMWI0YzdiOThhZDZmOWY2Y2VlZmNkZDU0YzFkYjBhZmEzZmU5ZjY2MjRkNjhiZDc5ZjNmZTljZGMyODhmYTZiIiwiaWF0IjoxNjM3Njg1NjY4LCJuYmYiOjE2Mzc2ODU2NjgsImV4cCI6MTY2OTIyMTY2OCwic3ViIjoiMTIwIiwic2NvcGVzIjpbIm9wZW5pZCIsImVtYWlsIiwicHJvZmlsZSIsInJvbGVzIiwia2V5Il19.eK_oIM2g63fEam1c5n_2EoNFCsW4PLMeUZvdCv95ayFhW99uiVzV4uAoMIwGwnz-tg33PX8uOivMpmcDvRklM2UqBZDORQS4clzI3YSoTfc7TVC9Wns6Y7tkVKmLrYt3zSyjDaTclHhIhoFm0jnba4lamTjPENjDPMa_ie2PhW23BksKLqt83vQTAbKBRzfXXOlF1JqJfQpciQt3OnDBPDSCn_FOL7587XQBJIuoQonyGWz8kib1NDQRSS3CQmVS9Rbj6M3nzFbN4aDQnuRhL3sYk1lvnjf_YgP3eL4U-9O9RkrFyqya3hOhhbeINvdV7DNEpZc22h7BCq3TbOc3ury6ejtNxLG5kKlPXaz76wrWK93P1E3bdh8KRfHZwf9eEIQHRScu8z4CPyS8-uX9n80zcgB_RyMXR6ViMRk_X11tdZb6M1alPSLehYIMZp0gYXxR09iity328R2JfoS3JO-I29Rjm4EPk_oeAAXzyDWEG3nf28CD60T_oamDbO3Ggc4JaYsoBG8K7yfZbRcVnUH0HItZNz7SNJrGtvn_xsy1eiVHjvMyrOuK0Mm2igqBg1jTBlybX5REsfYycIjSqufTwNYlhBytAEnc4axgEHeh3HCk4b2T1j_gzwew2hZwpUrvtwg-jkknoVC4x7zUzU0d9Gl4ZP21Q0eu4VXElXA',NULL,'2021-11-08 08:09:19','2021-11-23 15:41:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- GTID state at the end of the backup 
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 22:56:27
