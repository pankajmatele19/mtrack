-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mtrack
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `activities_data`
--

DROP TABLE IF EXISTS `activities_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `mac` varchar(254) DEFAULT NULL,
  `screenshot` longtext DEFAULT NULL COMMENT 'base64 image',
  `clicks_count` int(11) DEFAULT NULL,
  `keyboard_data` longtext DEFAULT NULL,
  `mouse_movement` longtext DEFAULT NULL,
  `active_windows` longtext DEFAULT NULL COMMENT 'json of window and date_time',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_data`
--

LOCK TABLES `activities_data` WRITE;
/*!40000 ALTER TABLE `activities_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(254) NOT NULL,
  `company_website` text DEFAULT NULL,
  `company_logo` text DEFAULT NULL,
  `about_company` text DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `company_address` text DEFAULT NULL,
  `employees_count` int(11) DEFAULT NULL,
  `contact_email` varchar(254) DEFAULT NULL,
  `contact_name` varchar(254) DEFAULT NULL,
  `contact_phone` varchar(254) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_time_format` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0->inactive, 1->active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Metricoid Technology Solutions','https://metricoidtech.com/','images/uploads/Image1693837495.png','1312545Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure libero a quo, rerum animi minus excepturi nesciunt aspernatur odit molestiae quos.',101,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure libero a quo, rerum animi minus excepturi nesciunt aspernatur odit molestiae quos. Maxime molestiae odio odit ratione fugit, mollitia quasi nemo!',6,'atul@metricoidtech.com','Atul Ilake','847595485','Asia/Kolkata','Y-m-d H:i:s',1,'2023-08-23 10:59:10','2023-12-18 12:10:45'),(2,'test','test','images/uploads/Image1693385649.png','fcasgdsa',NULL,'gasdfghdsfg',NULL,'dsga@vds.com','atul ilake','5665545','Asia/Kolkata','Y-m-d H:i:s',1,'2023-08-25 17:09:02','2023-09-01 10:44:42'),(3,'Test','Test','images/uploads/Image1692972152.png','this is test company',NULL,'anctdhevn ajahtdbhjta',NULL,'test@test.com','test','874856854','Asia/Kolkata','Y-m-d H:i:s',1,'2023-08-25 19:32:08','2023-09-01 10:42:42'),(4,'abcd','abcd.com',NULL,'abcdsdasd',NULL,'dasdgfrwefvc',NULL,'abcd@abcd.com','abcd','1524586584','Asia/Kolkata','Y-m-d H:i:s',1,'2023-12-27 08:34:08','2023-12-27 08:34:08');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_applications_categories`
--

DROP TABLE IF EXISTS `company_applications_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_applications_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL COMMENT 'this is the id from master_applications_categories',
  `company_id` int(11) NOT NULL,
  `category_name` varchar(254) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_applications_categories`
--

LOCK TABLES `company_applications_categories` WRITE;
/*!40000 ALTER TABLE `company_applications_categories` DISABLE KEYS */;
INSERT INTO `company_applications_categories` VALUES (1,1,1,'entertainment','2023-12-21 08:32:14','2023-10-25 09:06:18'),(2,1,4,'entertainment','2023-12-27 08:34:08','2023-12-27 08:34:08'),(7,7,4,'New_category','2023-12-27 15:30:34','2023-12-27 10:00:34');
/*!40000 ALTER TABLE `company_applications_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_applications_nonproductive`
--

DROP TABLE IF EXISTS `company_applications_nonproductive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_applications_nonproductive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `app_name` varchar(254) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1->non productive, 0->productive\r\n',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_applications_nonproductive`
--

LOCK TABLES `company_applications_nonproductive` WRITE;
/*!40000 ALTER TABLE `company_applications_nonproductive` DISABLE KEYS */;
INSERT INTO `company_applications_nonproductive` VALUES (1,1,'Reddit','Reddit is a social news website and forum where content is socially curated and promoted by site members through voting.',1,1,'2023-10-25 07:08:18','2023-12-16 10:05:14'),(2,1,'Youtube','This is youtube app',1,1,'2023-12-16 09:39:30','2023-12-16 10:05:14'),(4,4,'Reddit','Reddit is a social news website and forum where content is socially curated and promoted by site members through voting.',1,1,'2023-12-27 08:34:08','2023-12-27 14:44:34');
/*!40000 ALTER TABLE `company_applications_nonproductive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_integrated_app`
--

DROP TABLE IF EXISTS `company_integrated_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_integrated_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `integration_app_id` int(11) NOT NULL,
  `input_credentials` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'json format of the details submitted by user',
  `auth_api_response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'access token etc',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-just added, 1- connected, 2-disconnected',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `organisation_integrated_app_ibfk_3` (`integration_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_integrated_app`
--

LOCK TABLES `company_integrated_app` WRITE;
/*!40000 ALTER TABLE `company_integrated_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_integrated_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_team_roles`
--

DROP TABLE IF EXISTS `company_team_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_team_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `permissions` longtext NOT NULL COMMENT 'store in json format',
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0->inactive, 1->active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_team_roles`
--

LOCK TABLES `company_team_roles` WRITE;
/*!40000 ALTER TABLE `company_team_roles` DISABLE KEYS */;
INSERT INTO `company_team_roles` VALUES (1,1,'demo','[\"1\",\"2\",\"4\",\"5\"]',1,'2023-08-28 17:25:35','2023-08-29 12:33:23'),(2,1,'Employees','',1,'2023-08-29 11:23:01','2023-08-29 09:08:08'),(3,1,'New role','',1,'2023-08-29 14:40:09',NULL),(4,1,'Testing','[\"1\",\"2\",\"3\"]',1,'2023-08-29 14:40:45',NULL),(5,1,'new testing','',1,'2023-08-29 14:41:01',NULL),(6,3,'Test new','[\"1\",\"2\",\"3\"]',1,'2023-08-29 14:41:31',NULL),(7,3,'fsadfasd','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]',1,'2023-08-30 17:46:46',NULL);
/*!40000 ALTER TABLE `company_team_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AF','Afghanistan',93),(2,'AL','Albania',355),(3,'DZ','Algeria',213),(4,'AS','American Samoa',1684),(5,'AD','Andorra',376),(6,'AO','Angola',244),(7,'AI','Anguilla',1264),(8,'AQ','Antarctica',0),(9,'AG','Antigua And Barbuda',1268),(10,'AR','Argentina',54),(11,'AM','Armenia',374),(12,'AW','Aruba',297),(13,'AU','Australia',61),(14,'AT','Austria',43),(15,'AZ','Azerbaijan',994),(16,'BS','Bahamas The',1242),(17,'BH','Bahrain',973),(18,'BD','Bangladesh',880),(19,'BB','Barbados',1246),(20,'BY','Belarus',375),(21,'BE','Belgium',32),(22,'BZ','Belize',501),(23,'BJ','Benin',229),(24,'BM','Bermuda',1441),(25,'BT','Bhutan',975),(26,'BO','Bolivia',591),(27,'BA','Bosnia and Herzegovina',387),(28,'BW','Botswana',267),(29,'BV','Bouvet Island',0),(30,'BR','Brazil',55),(31,'IO','British Indian Ocean Territory',246),(32,'BN','Brunei',673),(33,'BG','Bulgaria',359),(34,'BF','Burkina Faso',226),(35,'BI','Burundi',257),(36,'KH','Cambodia',855),(37,'CM','Cameroon',237),(38,'CA','Canada',1),(39,'CV','Cape Verde',238),(40,'KY','Cayman Islands',1345),(41,'CF','Central African Republic',236),(42,'TD','Chad',235),(43,'CL','Chile',56),(44,'CN','China',86),(45,'CX','Christmas Island',61),(46,'CC','Cocos (Keeling) Islands',672),(47,'CO','Colombia',57),(48,'KM','Comoros',269),(49,'CG','Republic Of The Congo',242),(50,'CD','Democratic Republic Of The Congo',242),(51,'CK','Cook Islands',682),(52,'CR','Costa Rica',506),(53,'CI','Cote D\'Ivoire (Ivory Coast)',225),(54,'HR','Croatia (Hrvatska)',385),(55,'CU','Cuba',53),(56,'CY','Cyprus',357),(57,'CZ','Czech Republic',420),(58,'DK','Denmark',45),(59,'DJ','Djibouti',253),(60,'DM','Dominica',1767),(61,'DO','Dominican Republic',1809),(62,'TP','East Timor',670),(63,'EC','Ecuador',593),(64,'EG','Egypt',20),(65,'SV','El Salvador',503),(66,'GQ','Equatorial Guinea',240),(67,'ER','Eritrea',291),(68,'EE','Estonia',372),(69,'ET','Ethiopia',251),(70,'XA','External Territories of Australia',61),(71,'FK','Falkland Islands',500),(72,'FO','Faroe Islands',298),(73,'FJ','Fiji Islands',679),(74,'FI','Finland',358),(75,'FR','France',33),(76,'GF','French Guiana',594),(77,'PF','French Polynesia',689),(78,'TF','French Southern Territories',0),(79,'GA','Gabon',241),(80,'GM','Gambia The',220),(81,'GE','Georgia',995),(82,'DE','Germany',49),(83,'GH','Ghana',233),(84,'GI','Gibraltar',350),(85,'GR','Greece',30),(86,'GL','Greenland',299),(87,'GD','Grenada',1473),(88,'GP','Guadeloupe',590),(89,'GU','Guam',1671),(90,'GT','Guatemala',502),(91,'XU','Guernsey and Alderney',44),(92,'GN','Guinea',224),(93,'GW','Guinea-Bissau',245),(94,'GY','Guyana',592),(95,'HT','Haiti',509),(96,'HM','Heard and McDonald Islands',0),(97,'HN','Honduras',504),(98,'HK','Hong Kong S.A.R.',852),(99,'HU','Hungary',36),(100,'IS','Iceland',354),(101,'IN','India',91),(102,'ID','Indonesia',62),(103,'IR','Iran',98),(104,'IQ','Iraq',964),(105,'IE','Ireland',353),(106,'IL','Israel',972),(107,'IT','Italy',39),(108,'JM','Jamaica',1876),(109,'JP','Japan',81),(110,'XJ','Jersey',44),(111,'JO','Jordan',962),(112,'KZ','Kazakhstan',7),(113,'KE','Kenya',254),(114,'KI','Kiribati',686),(115,'KP','Korea North',850),(116,'KR','Korea South',82),(117,'KW','Kuwait',965),(118,'KG','Kyrgyzstan',996),(119,'LA','Laos',856),(120,'LV','Latvia',371),(121,'LB','Lebanon',961),(122,'LS','Lesotho',266),(123,'LR','Liberia',231),(124,'LY','Libya',218),(125,'LI','Liechtenstein',423),(126,'LT','Lithuania',370),(127,'LU','Luxembourg',352),(128,'MO','Macau S.A.R.',853),(129,'MK','Macedonia',389),(130,'MG','Madagascar',261),(131,'MW','Malawi',265),(132,'MY','Malaysia',60),(133,'MV','Maldives',960),(134,'ML','Mali',223),(135,'MT','Malta',356),(136,'XM','Man (Isle of)',44),(137,'MH','Marshall Islands',692),(138,'MQ','Martinique',596),(139,'MR','Mauritania',222),(140,'MU','Mauritius',230),(141,'YT','Mayotte',269),(142,'MX','Mexico',52),(143,'FM','Micronesia',691),(144,'MD','Moldova',373),(145,'MC','Monaco',377),(146,'MN','Mongolia',976),(147,'MS','Montserrat',1664),(148,'MA','Morocco',212),(149,'MZ','Mozambique',258),(150,'MM','Myanmar',95),(151,'NA','Namibia',264),(152,'NR','Nauru',674),(153,'NP','Nepal',977),(154,'AN','Netherlands Antilles',599),(155,'NL','Netherlands The',31),(156,'NC','New Caledonia',687),(157,'NZ','New Zealand',64),(158,'NI','Nicaragua',505),(159,'NE','Niger',227),(160,'NG','Nigeria',234),(161,'NU','Niue',683),(162,'NF','Norfolk Island',672),(163,'MP','Northern Mariana Islands',1670),(164,'NO','Norway',47),(165,'OM','Oman',968),(166,'PK','Pakistan',92),(167,'PW','Palau',680),(168,'PS','Palestinian Territory Occupied',970),(169,'PA','Panama',507),(170,'PG','Papua new Guinea',675),(171,'PY','Paraguay',595),(172,'PE','Peru',51),(173,'PH','Philippines',63),(174,'PN','Pitcairn Island',0),(175,'PL','Poland',48),(176,'PT','Portugal',351),(177,'PR','Puerto Rico',1787),(178,'QA','Qatar',974),(179,'RE','Reunion',262),(180,'RO','Romania',40),(181,'RU','Russia',70),(182,'RW','Rwanda',250),(183,'SH','Saint Helena',290),(184,'KN','Saint Kitts And Nevis',1869),(185,'LC','Saint Lucia',1758),(186,'PM','Saint Pierre and Miquelon',508),(187,'VC','Saint Vincent And The Grenadines',1784),(188,'WS','Samoa',684),(189,'SM','San Marino',378),(190,'ST','Sao Tome and Principe',239),(191,'SA','Saudi Arabia',966),(192,'SN','Senegal',221),(193,'RS','Serbia',381),(194,'SC','Seychelles',248),(195,'SL','Sierra Leone',232),(196,'SG','Singapore',65),(197,'SK','Slovakia',421),(198,'SI','Slovenia',386),(199,'XG','Smaller Territories of the UK',44),(200,'SB','Solomon Islands',677),(201,'SO','Somalia',252),(202,'ZA','South Africa',27),(203,'GS','South Georgia',0),(204,'SS','South Sudan',211),(205,'ES','Spain',34),(206,'LK','Sri Lanka',94),(207,'SD','Sudan',249),(208,'SR','Suriname',597),(209,'SJ','Svalbard And Jan Mayen Islands',47),(210,'SZ','Swaziland',268),(211,'SE','Sweden',46),(212,'CH','Switzerland',41),(213,'SY','Syria',963),(214,'TW','Taiwan',886),(215,'TJ','Tajikistan',992),(216,'TZ','Tanzania',255),(217,'TH','Thailand',66),(218,'TG','Togo',228),(219,'TK','Tokelau',690),(220,'TO','Tonga',676),(221,'TT','Trinidad And Tobago',1868),(222,'TN','Tunisia',216),(223,'TR','Turkey',90),(224,'TM','Turkmenistan',7370),(225,'TC','Turks And Caicos Islands',1649),(226,'TV','Tuvalu',688),(227,'UG','Uganda',256),(228,'UA','Ukraine',380),(229,'AE','United Arab Emirates',971),(230,'GB','United Kingdom',44),(231,'US','United States',1),(232,'UM','United States Minor Outlying Islands',1),(233,'UY','Uruguay',598),(234,'UZ','Uzbekistan',998),(235,'VU','Vanuatu',678),(236,'VA','Vatican City State (Holy See)',39),(237,'VE','Venezuela',58),(238,'VN','Vietnam',84),(239,'VG','Virgin Islands (British)',1284),(240,'VI','Virgin Islands (US)',1340),(241,'WF','Wallis And Futuna Islands',681),(242,'EH','Western Sahara',212),(243,'YE','Yemen',967),(244,'YU','Yugoslavia',38),(245,'ZM','Zambia',260),(246,'ZW','Zimbabwe',263);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_employee_reports`
--

DROP TABLE IF EXISTS `daily_employee_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_employee_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `idle_time` int(11) NOT NULL,
  `non_productive_time` bigint(20) NOT NULL,
  `active_time` bigint(20) NOT NULL,
  `from_datetime` varchar(255) NOT NULL,
  `to_datetime` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_employee_reports`
--

LOCK TABLES `daily_employee_reports` WRITE;
/*!40000 ALTER TABLE `daily_employee_reports` DISABLE KEYS */;
INSERT INTO `daily_employee_reports` VALUES (144,4,4900,1290,5494,'2023-12-20 00:00:00','2023-12-20 23:59:00');
/*!40000 ALTER TABLE `daily_employee_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_wise_productive_apps`
--

DROP TABLE IF EXISTS `department_wise_productive_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_wise_productive_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'app_id or category_id can be used\r\n',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_wise_productive_apps`
--

LOCK TABLES `department_wise_productive_apps` WRITE;
/*!40000 ALTER TABLE `department_wise_productive_apps` DISABLE KEYS */;
INSERT INTO `department_wise_productive_apps` VALUES (1,1,1,NULL,1,'2023-12-21 13:46:41',NULL),(2,1,1,1,1,'2023-12-21 13:46:41',NULL);
/*!40000 ALTER TABLE `department_wise_productive_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'Test Department','This is mtrack test department',1,1),(3,'Test 2 Department','This mtrack test2 department',2,1),(4,'dLcompare.com',NULL,15,1),(5,'',NULL,15,1),(6,'',NULL,15,1),(7,'Test Organization Metricoid',NULL,16,1),(8,'Test Organization Metricoid',NULL,16,1),(9,'New',NULL,17,1),(10,'abcdfirst','this is first department',4,1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_otp_verification`
--

DROP TABLE IF EXISTS `email_otp_verification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_otp_verification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `otp` varchar(50) DEFAULT NULL,
  `expiry_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_otp_verification`
--

LOCK TABLES `email_otp_verification` WRITE;
/*!40000 ALTER TABLE `email_otp_verification` DISABLE KEYS */;
INSERT INTO `email_otp_verification` VALUES (1,'test@test.com',NULL,'2023-08-22 14:10:12'),(2,'atul@metricoidtech.com',NULL,'2023-08-23 08:52:49'),(3,'shubham.yadav@metricoidtech.com',NULL,'2023-09-12 13:37:04');
/*!40000 ALTER TABLE `email_otp_verification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_wise_productive_apps`
--

DROP TABLE IF EXISTS `employee_wise_productive_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_wise_productive_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT 'app_id or category_id can be used\r\n',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_wise_productive_apps`
--

LOCK TABLES `employee_wise_productive_apps` WRITE;
/*!40000 ALTER TABLE `employee_wise_productive_apps` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_wise_productive_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `creator_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-superadmin user, 0-company user',
  `name` varchar(254) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `password` varchar(254) NOT NULL,
  `profile_pic` text DEFAULT NULL,
  `track_applications` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0->NO, 1->YES (To track the applications usage by employee)',
  `live_camera` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0->NO, 1->YES (if enabled then it will start uploading the camera image in firebase on every live_interval)',
  `live_screen` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0->NO, 1->YES (if enabled then it will start uploading the screenshot in firebase on every live_interval)',
  `live_interval` int(11) NOT NULL DEFAULT 2 COMMENT 'enter the value in seconds',
  `track_activities` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0->NO, 1->YES (track mouse movement, keyboard strokes etc, this will upload the details in database on every track_activities_interval)',
  `track_activities_interval` int(11) NOT NULL DEFAULT 10 COMMENT 'enter the value in seconds',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,1,2,1,'Test','employee@test.com','8475915625',2,'$2a$12$DQKfBkXneqxS/bAHeZCMiuHON0aUu8fIYyOtfgQj/TPz5p72Hsc6m','images/uploads/Image1692969442.png',1,1,0,2,1,10,1,'2023-08-25 18:47:22','2023-12-07 05:56:08'),(2,1,2,1,'Test2','employee2@test.com','8475915625',2,'$2a$12$DQKfBkXneqxS/bAHeZCMiuHON0aUu8fIYyOtfgQj/TPz5p72Hsc6m','images/uploads/Image1692969442.png',1,0,0,2,1,10,1,'2023-08-25 18:47:22','2023-12-07 05:56:47'),(3,2,2,1,'Test3','employee3@test.com','8475915625',3,'$2a$12$DQKfBkXneqxS/bAHeZCMiuHON0aUu8fIYyOtfgQj/TPz5p72Hsc6m','images/uploads/Image1692969442.png',1,0,0,2,1,10,1,'2023-08-25 18:47:22','2023-12-07 05:57:58'),(4,1,2,1,'Shubham Bhadale','shubham@metricoidtech.com','8745869554',2,'$2y$10$E55HaCslljghdds3d8OkBOOTZXfSQP8DxaoaF0KA/PMav1WH29vMO',NULL,1,0,1,60,1,10,1,'2023-12-16 09:05:52','2023-12-16 09:32:47'),(5,1,2,1,'Atul Ilake','atul@metricoidtech.com','7845958654',2,'$2y$10$N3544rtxnEhwb/hZLjiSFO9qEUDW3glUbt5K0NN34h97xouJYMhV.',NULL,1,0,1,60,1,10,1,'2023-12-16 09:24:37','2023-12-16 09:33:13'),(6,1,2,1,'Shubham Yadav','shubham.yadav@metricoidtech.com','8547595685',2,'$2y$10$OIwaUA8RTXPwGbNB17/b7O/uTLTbtFbIxqjS6CIKs9n9ugSHwxZle',NULL,1,0,1,60,1,10,1,'2023-12-16 09:25:37','2023-12-16 09:33:21'),(7,1,2,1,'Shubham More','shubham.more@metricoidtech.com','9874568126',2,'$2y$10$UKUA.vhxpInAwmjG6bl3rOJpHThDLmp2BoZyr2Aat3Es.Fjyr2ioq',NULL,1,0,1,60,1,10,1,'2023-12-16 09:27:01','2023-12-16 09:33:29'),(8,1,2,1,'Sejal Saroj','hr@metricoidtech.com','8475965845',2,'$2y$10$UKUA.vhxpInAwmjG6bl3rOJpHThDLmp2BoZyr2Aat3Es.Fjyr2ioq',NULL,1,0,1,60,1,10,1,'2023-12-18 12:10:45','2023-12-18 12:13:32');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `face_detections`
--

DROP TABLE IF EXISTS `face_detections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `face_detections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `mac` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `face_count` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `face_detections`
--

LOCK TABLES `face_detections` WRITE;
/*!40000 ALTER TABLE `face_detections` DISABLE KEYS */;
/*!40000 ALTER TABLE `face_detections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integration_apps`
--

DROP TABLE IF EXISTS `integration_apps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `integration_apps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `long_description` text DEFAULT NULL,
  `instructions_steps` longtext DEFAULT NULL,
  `video_guide_url` text DEFAULT NULL,
  `input_credentials` longtext DEFAULT NULL,
  `client_credentials` text DEFAULT NULL COMMENT 'this will be used for oAuth2 platforms',
  `isAuth2` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0->No, 1->Yes',
  `scope` text DEFAULT NULL,
  `provider` varchar(254) DEFAULT NULL,
  `image_url` text NOT NULL COMMENT 'image from public path',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integration_apps`
--

LOCK TABLES `integration_apps` WRITE;
/*!40000 ALTER TABLE `integration_apps` DISABLE KEYS */;
INSERT INTO `integration_apps` VALUES (1,'Firebase','If you want to track the screen and camera of employees then you need to connect your own firebase account so that our platform can upload the video in your connected firebase account.','hello Lorem, ipsum dolor sit amet consectetur adipisicing elit. Assumenda quam est exercitationem pariatur iusto dolore. Esse accusantium magni aspernatur ratione ex vel et, amet laudantium dolore vero necessitatibus in eius! Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quae perferendis delectus facilis magni, accusamus labore omnis sunt rerum ab blanditiis?','  <p>\r\n                                                            <ul>\r\n                                                                <li>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi ratione consectetur fugiat alias esse voluptas tempora non explicabo quis. Assumenda dolorum deleniti modi inventore eligendi vero repudiandae a corrupti nobis!</li>\r\n                                                                <li>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi ratione consectetur fugiat alias esse voluptas tempora non explicabo quis. Assumenda dolorum deleniti modi inventore eligendi vero repudiandae a corrupti nobis!</li>\r\n                                                                <li>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi ratione consectetur fugiat alias esse voluptas tempora non explicabo quis. Assumenda dolorum deleniti modi inventore eligendi vero repudiandae a corrupti nobis!</li>\r\n                                                                <li>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Excepturi ratione consectetur fugiat alias esse voluptas tempora non explicabo quis. Assumenda dolorum deleniti modi inventore eligendi vero repudiandae a corrupti nobis!</li>\r\n                                                            </ul>\r\n                                                        </p>','https://www.youtube.com/embed/RRTSLAL6qt0','{\"bucket_storage_path\":{\"name\":\"bucket_storage_path\",\"label\":\"Storage Bucket Path\",\"placeholder\":\"Enter Your Storage Bucket Path\",\"type\":\"text\",\"hint\":\"\",\"required\":\"required\"},\"credentials_file\":{\"name\": \"credentials_file\",\"label\": \"Upload Credentials File\",\"placeholder\":\"Get the credentials file and upload it here\",\"hint\": \"Please follow the above instructions to get the credentials\",\"type\": \"file\",\"allowed_extensions\":[\"json\"], \"update_required\" : true}}',NULL,0,NULL,NULL,'/public/images/firebase.png');
/*!40000 ALTER TABLE `integration_apps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list`
--

DROP TABLE IF EXISTS `list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list` (
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list`
--

LOCK TABLES `list` WRITE;
/*!40000 ALTER TABLE `list` DISABLE KEYS */;
INSERT INTO `list` VALUES ('aa','Afar'),('ab','Abkhazian'),('ace','Achinese'),('ach','Acoli'),('ada','Adangme'),('ady','Adyghe'),('ae','Avestan'),('aeb','Tunisian Arabic'),('af','Afrikaans'),('afh','Afrihili'),('agq','Aghem'),('ain','Ainu'),('ak','Akan'),('akk','Akkadian'),('akz','Alabama'),('ale','Aleut'),('aln','Gheg Albanian'),('alt','Southern Altai'),('am','Amarik'),('an','Aragonese'),('ang','Old English'),('anp','Angika'),('ar','Arabik'),('ar_001','Modern Standard Arabic'),('arc','Aramaic'),('arn','Mapuche'),('aro','Araona'),('arp','Arapaho'),('arq','Algerian Arabic'),('arw','Arawak'),('ary','Moroccan Arabic'),('arz','Egyptian Arabic'),('as','Assamese'),('asa','Asu'),('ase','American Sign Language'),('ast','Asturian'),('av','Avaric'),('avk','Kotava'),('awa','Awadhi'),('ay','Aymara'),('az','Azerbaijani'),('azb','South Azerbaijani'),('ba','Bashkir'),('bal','Baluchi'),('ban','Balinese'),('bar','Bavarian'),('bas','Basaa'),('bax','Bamun'),('bbc','Batak Toba'),('bbj','Ghomala'),('be','Belarus kasa'),('bej','Beja'),('bem','Bemba'),('bew','Betawi'),('bez','Bena'),('bfd','Bafut'),('bfq','Badaga'),('bg','Bɔlgeria kasa'),('bho','Bhojpuri'),('bi','Bislama'),('bik','Bikol'),('bin','Bini'),('bjn','Banjar'),('bkm','Kom'),('bla','Siksika'),('bm','Bambara'),('bn','Bengali kasa'),('bo','Tibetan'),('bpy','Bishnupriya'),('bqi','Bakhtiari'),('br','Breton'),('bra','Braj'),('brh','Brahui'),('brx','Bodo'),('bs','Bosnian'),('bss','Akoose'),('bua','Buriat'),('bug','Buginese'),('bum','Bulu'),('byn','Blin'),('byv','Medumba'),('ca','Catalan'),('cad','Caddo'),('car','Carib'),('cay','Cayuga'),('cch','Atsam'),('ce','Chechen'),('ceb','Cebuano'),('cgg','Chiga'),('ch','Chamorro'),('chb','Chibcha'),('chg','Chagatai'),('chk','Chuukese'),('chm','Mari'),('chn','Chinook Jargon'),('cho','Choctaw'),('chp','Chipewyan'),('chr','Cherokee'),('chy','Cheyenne'),('ckb','Central Kurdish'),('co','Corsican'),('cop','Coptic'),('cps','Capiznon'),('cr','Cree'),('crh','Crimean Turkish'),('cs','Kyɛk kasa'),('csb','Kashubian'),('cu','Church Slavic'),('cv','Chuvash'),('cy','Welsh'),('da','Danish'),('dak','Dakota'),('dar','Dargwa'),('dav','Taita'),('de','Gyaaman'),('de_AT','Austrian German'),('de_CH','Swiss High German'),('del','Delaware'),('den','Slave'),('dgr','Dogrib'),('din','Dinka'),('dje','Zarma'),('doi','Dogri'),('dsb','Lower Sorbian'),('dtp','Central Dusun'),('dua','Duala'),('dum','Middle Dutch'),('dv','Divehi'),('dyo','Jola-Fonyi'),('dyu','Dyula'),('dz','Dzongkha'),('dzg','Dazaga'),('ebu','Embu'),('ee','Ewe'),('efi','Efik'),('egl','Emilian'),('egy','Ancient Egyptian'),('eka','Ekajuk'),('el','Greek kasa'),('elx','Elamite'),('en','Borɔfo'),('en_AU','Australian English'),('en_CA','Canadian English'),('en_GB','British English'),('en_US','American English'),('enm','Middle English'),('eo','Esperanto'),('es','Spain kasa'),('es_419','Latin American Spanish'),('es_ES','European Spanish'),('es_MX','Mexican Spanish'),('esu','Central Yupik'),('et','Estonian'),('eu','Basque'),('ewo','Ewondo'),('ext','Extremaduran'),('fa','Pɛɛhyia kasa'),('fan','Fang'),('fat','Fanti'),('ff','Fulah'),('fi','Finnish'),('fil','Filipino'),('fit','Tornedalen Finnish'),('fj','Fijian'),('fo','Faroese'),('fon','Fon'),('fr','Frɛnkye'),('fr_CA','Canadian French'),('fr_CH','Swiss French'),('frc','Cajun French'),('frm','Middle French'),('fro','Old French'),('frp','Arpitan'),('frr','Northern Frisian'),('frs','Eastern Frisian'),('fur','Friulian'),('fy','Western Frisian'),('ga','Irish'),('gaa','Ga'),('gag','Gagauz'),('gan','Gan Chinese'),('gay','Gayo'),('gba','Gbaya'),('gbz','Zoroastrian Dari'),('gd','Scottish Gaelic'),('gez','Geez'),('gil','Gilbertese'),('gl','Galician'),('glk','Gilaki'),('gmh','Middle High German'),('gn','Guarani'),('goh','Old High German'),('gom','Goan Konkani'),('gon','Gondi'),('gor','Gorontalo'),('got','Gothic'),('grb','Grebo'),('grc','Ancient Greek'),('gsw','Swiss German'),('gu','Gujarati'),('guc','Wayuu'),('gur','Frafra'),('guz','Gusii'),('gv','Manx'),('gwi','Gwichʼin'),('ha','Hausa'),('hai','Haida'),('hak','Hakka Chinese'),('haw','Hawaiian'),('he','Hebrew'),('hi','Hindi'),('hif','Fiji Hindi'),('hil','Hiligaynon'),('hit','Hittite'),('hmn','Hmong'),('ho','Hiri Motu'),('hr','Croatian'),('hsb','Upper Sorbian'),('hsn','Xiang Chinese'),('ht','Haitian'),('hu','Hangri kasa'),('hup','Hupa'),('hy','Armenian'),('hz','Herero'),('ia','Interlingua'),('iba','Iban'),('ibb','Ibibio'),('id','Indonihyia kasa'),('ie','Interlingue'),('ig','Igbo'),('ii','Sichuan Yi'),('ik','Inupiaq'),('ilo','Iloko'),('inh','Ingush'),('io','Ido'),('is','Icelandic'),('it','Italy kasa'),('iu','Inuktitut'),('izh','Ingrian'),('ja','Gyapan kasa'),('jam','Jamaican Creole English'),('jbo','Lojban'),('jgo','Ngomba'),('jmc','Machame'),('jpr','Judeo-Persian'),('jrb','Judeo-Arabic'),('jut','Jutish'),('jv','Gyabanis kasa'),('ka','Georgian'),('kaa','Kara-Kalpak'),('kab','Kabyle'),('kac','Kachin'),('kaj','Jju'),('kam','Kamba'),('kaw','Kawi'),('kbd','Kabardian'),('kbl','Kanembu'),('kcg','Tyap'),('kde','Makonde'),('kea','Kabuverdianu'),('ken','Kenyang'),('kfo','Koro'),('kg','Kongo'),('kgp','Kaingang'),('kha','Khasi'),('kho','Khotanese'),('khq','Koyra Chiini'),('khw','Khowar'),('ki','Kikuyu'),('kiu','Kirmanjki'),('kj','Kuanyama'),('kk','Kazakh'),('kkj','Kako'),('kl','Kalaallisut'),('kln','Kalenjin'),('km','Kambodia kasa'),('kmb','Kimbundu'),('kn','Kannada'),('ko','Korea kasa'),('koi','Komi-Permyak'),('kok','Konkani'),('kos','Kosraean'),('kpe','Kpelle'),('kr','Kanuri'),('krc','Karachay-Balkar'),('kri','Krio'),('krj','Kinaray-a'),('krl','Karelian'),('kru','Kurukh'),('ks','Kashmiri'),('ksb','Shambala'),('ksf','Bafia'),('ksh','Colognian'),('ku','Kurdish'),('kum','Kumyk'),('kut','Kutenai'),('kv','Komi'),('kw','Cornish'),('ky','Kyrgyz'),('la','Latin'),('lad','Ladino'),('lag','Langi'),('lah','Lahnda'),('lam','Lamba'),('lb','Luxembourgish'),('lez','Lezghian'),('lfn','Lingua Franca Nova'),('lg','Ganda'),('li','Limburgish'),('lij','Ligurian'),('liv','Livonian'),('lkt','Lakota'),('lmo','Lombard'),('ln','Lingala'),('lo','Lao'),('lol','Mongo'),('loz','Lozi'),('lt','Lithuanian'),('ltg','Latgalian'),('lu','Luba-Katanga'),('lua','Luba-Lulua'),('lui','Luiseno'),('lun','Lunda'),('luo','Luo'),('lus','Mizo'),('luy','Luyia'),('lv','Latvian'),('lzh','Literary Chinese'),('lzz','Laz'),('mad','Madurese'),('maf','Mafa'),('mag','Magahi'),('mai','Maithili'),('mak','Makasar'),('man','Mandingo'),('mas','Masai'),('mde','Maba'),('mdf','Moksha'),('mdr','Mandar'),('men','Mende'),('mer','Meru'),('mfe','Morisyen'),('mg','Malagasy'),('mga','Middle Irish'),('mgh','Makhuwa-Meetto'),('mgo','Metaʼ'),('mh','Marshallese'),('mi','Maori'),('mic','Micmac'),('min','Minangkabau'),('mk','Macedonian'),('ml','Malayalam'),('mn','Mongolian'),('mnc','Manchu'),('mni','Manipuri'),('moh','Mohawk'),('mos','Mossi'),('mr','Marathi'),('mrj','Western Mari'),('ms','Malay kasa'),('mt','Maltese'),('mua','Mundang'),('mul','Multiple Languages'),('mus','Creek'),('mwl','Mirandese'),('mwr','Marwari'),('mwv','Mentawai'),('my','Bɛɛmis kasa'),('mye','Myene'),('myv','Erzya'),('mzn','Mazanderani'),('na','Nauru'),('nan','Min Nan Chinese'),('nap','Neapolitan'),('naq','Nama'),('nb','Norwegian Bokmål'),('nd','North Ndebele'),('nds','Low German'),('ne','Nɛpal kasa'),('new','Newari'),('ng','Ndonga'),('nia','Nias'),('niu','Niuean'),('njo','Ao Naga'),('nl','Dɛɛkye'),('nl_BE','Flemish'),('nmg','Kwasio'),('nn','Norwegian Nynorsk'),('nnh','Ngiemboon'),('no','Norwegian'),('nog','Nogai'),('non','Old Norse'),('nov','Novial'),('nqo','NʼKo'),('nr','South Ndebele'),('nso','Northern Sotho'),('nus','Nuer'),('nv','Navajo'),('nwc','Classical Newari'),('ny','Nyanja'),('nym','Nyamwezi'),('nyn','Nyankole'),('nyo','Nyoro'),('nzi','Nzima'),('oc','Occitan'),('oj','Ojibwa'),('om','Oromo'),('or','Oriya'),('os','Ossetic'),('osa','Osage'),('ota','Ottoman Turkish'),('pa','Pungyabi kasa'),('pag','Pangasinan'),('pal','Pahlavi'),('pam','Pampanga'),('pap','Papiamento'),('pau','Palauan'),('pcd','Picard'),('pdc','Pennsylvania German'),('pdt','Plautdietsch'),('peo','Old Persian'),('pfl','Palatine German'),('phn','Phoenician'),('pi','Pali'),('pl','Pɔland kasa'),('pms','Piedmontese'),('pnt','Pontic'),('pon','Pohnpeian'),('prg','Prussian'),('pro','Old Provençal'),('ps','Pashto'),('pt','Pɔɔtugal kasa'),('pt_BR','Brazilian Portuguese'),('pt_PT','European Portuguese'),('qu','Quechua'),('quc','Kʼicheʼ'),('qug','Chimborazo Highland Quichua'),('raj','Rajasthani'),('rap','Rapanui'),('rar','Rarotongan'),('rgn','Romagnol'),('rif','Riffian'),('rm','Romansh'),('rn','Rundi'),('ro','Romenia kasa'),('ro_MD','Moldavian'),('rof','Rombo'),('rom','Romany'),('root','Root'),('rtm','Rotuman'),('ru','Rahyia kasa'),('rue','Rusyn'),('rug','Roviana'),('rup','Aromanian'),('rw','Rewanda kasa'),('rwk','Rwa'),('sa','Sanskrit'),('sad','Sandawe'),('sah','Sakha'),('sam','Samaritan Aramaic'),('saq','Samburu'),('sas','Sasak'),('sat','Santali'),('saz','Saurashtra'),('sba','Ngambay'),('sbp','Sangu'),('sc','Sardinian'),('scn','Sicilian'),('sco','Scots'),('sd','Sindhi'),('sdc','Sassarese Sardinian'),('se','Northern Sami'),('see','Seneca'),('seh','Sena'),('sei','Seri'),('sel','Selkup'),('ses','Koyraboro Senni'),('sg','Sango'),('sga','Old Irish'),('sgs','Samogitian'),('sh','Serbo-Croatian'),('shi','Tachelhit'),('shn','Shan'),('shu','Chadian Arabic'),('si','Sinhala'),('sid','Sidamo'),('sk','Slovak'),('sl','Slovenian'),('sli','Lower Silesian'),('sly','Selayar'),('sm','Samoan'),('sma','Southern Sami'),('smj','Lule Sami'),('smn','Inari Sami'),('sms','Skolt Sami'),('sn','Shona'),('snk','Soninke'),('so','Somalia kasa'),('sog','Sogdien'),('sq','Albanian'),('sr','Serbian'),('srn','Sranan Tongo'),('srr','Serer'),('ss','Swati'),('ssy','Saho'),('st','Southern Sotho'),('stq','Saterland Frisian'),('su','Sundanese'),('suk','Sukuma'),('sus','Susu'),('sux','Sumerian'),('sv','Sweden kasa'),('sw','Swahili'),('swb','Comorian'),('swc','Congo Swahili'),('syc','Classical Syriac'),('syr','Syriac'),('szl','Silesian'),('ta','Tamil kasa'),('tcy','Tulu'),('te','Telugu'),('tem','Timne'),('teo','Teso'),('ter','Tereno'),('tet','Tetum'),('tg','Tajik'),('th','Taeland kasa'),('ti','Tigrinya'),('tig','Tigre'),('tiv','Tiv'),('tk','Turkmen'),('tkl','Tokelau'),('tkr','Tsakhur'),('tl','Tagalog'),('tlh','Klingon'),('tli','Tlingit'),('tly','Talysh'),('tmh','Tamashek'),('tn','Tswana'),('to','Tongan'),('tog','Nyasa Tonga'),('tpi','Tok Pisin'),('tr','Tɛɛki kasa'),('tru','Turoyo'),('trv','Taroko'),('ts','Tsonga'),('tsd','Tsakonian'),('tsi','Tsimshian'),('tt','Tatar'),('ttt','Muslim Tat'),('tum','Tumbuka'),('tvl','Tuvalu'),('tw','Twi'),('twq','Tasawaq'),('ty','Tahitian'),('tyv','Tuvinian'),('tzm','Central Atlas Tamazight'),('udm','Udmurt'),('ug','Uyghur'),('uga','Ugaritic'),('uk','Ukren kasa'),('umb','Umbundu'),('und','Unknown Language'),('ur','Urdu kasa'),('uz','Uzbek'),('vai','Vai'),('ve','Venda'),('vec','Venetian'),('vep','Veps'),('vi','Viɛtnam kasa'),('vls','West Flemish'),('vmf','Main-Franconian'),('vo','Volapük'),('vot','Votic'),('vro','Võro'),('vun','Vunjo'),('wa','Walloon'),('wae','Walser'),('wal','Wolaytta'),('war','Waray'),('was','Washo'),('wbp','Warlpiri'),('wo','Wolof'),('wuu','Wu Chinese'),('xal','Kalmyk'),('xh','Xhosa'),('xmf','Mingrelian'),('xog','Soga'),('yao','Yao'),('yap','Yapese'),('yav','Yangben'),('ybb','Yemba'),('yi','Yiddish'),('yo','Yoruba'),('yrl','Nheengatu'),('yue','Cantonese'),('za','Zhuang'),('zap','Zapotec'),('zbl','Blissymbols'),('zea','Zeelandic'),('zen','Zenaga'),('zgh','Standard Moroccan Tamazight'),('zh','Kyaena kasa'),('zh_Hans','Simplified Chinese'),('zh_Hant','Traditional Chinese'),('zu','Zulu'),('zun','Zuni'),('zxx','No linguistic content'),('zza','Zaza');
/*!40000 ALTER TABLE `list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `live_data`
--

DROP TABLE IF EXISTS `live_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `live_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `mac` varchar(254) DEFAULT NULL,
  `camera` longtext DEFAULT NULL,
  `screen` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `live_data`
--

LOCK TABLES `live_data` WRITE;
/*!40000 ALTER TABLE `live_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `live_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_applications_categories`
--

DROP TABLE IF EXISTS `master_applications_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_applications_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(254) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1->Active, 0->Inactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_applications_categories`
--

LOCK TABLES `master_applications_categories` WRITE;
/*!40000 ALTER TABLE `master_applications_categories` DISABLE KEYS */;
INSERT INTO `master_applications_categories` VALUES (1,'entertainment',1,'2023-10-25 07:07:14','2023-10-25 09:06:18');
/*!40000 ALTER TABLE `master_applications_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_applications_nonproductive`
--

DROP TABLE IF EXISTS `master_applications_nonproductive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_applications_nonproductive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(254) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `active` tinyint(4) DEFAULT 1 COMMENT '1->Active, 0-> Inactive',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_applications_nonproductive`
--

LOCK TABLES `master_applications_nonproductive` WRITE;
/*!40000 ALTER TABLE `master_applications_nonproductive` DISABLE KEYS */;
INSERT INTO `master_applications_nonproductive` VALUES (1,'Reddit','Reddit is a social news website and forum where content is socially curated and promoted by site members through voting.',1,1,'2023-10-25 07:08:18','2023-10-25 09:07:23');
/*!40000 ALTER TABLE `master_applications_nonproductive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `for_superadmin` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Users','update',1,1,'2023-08-28 17:41:27','2023-08-30 12:47:28'),(2,'Users','create',0,1,'2023-08-28 17:41:27','2023-08-29 12:29:13'),(3,'Users','delete',0,1,'2023-08-28 17:41:27','2023-08-28 17:58:18'),(4,'Employees','Create',0,1,'2023-08-29 18:01:32',NULL),(5,'Employees','Update',1,1,'2023-08-29 18:02:33',NULL),(6,'Employees','Delete',1,1,'2023-08-29 18:02:53',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_team_roles`
--

DROP TABLE IF EXISTS `superadmin_team_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `superadmin_team_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `permissions` longtext NOT NULL COMMENT 'store in json format',
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0->inactive, 1->active',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_team_roles`
--

LOCK TABLES `superadmin_team_roles` WRITE;
/*!40000 ALTER TABLE `superadmin_team_roles` DISABLE KEYS */;
INSERT INTO `superadmin_team_roles` VALUES (1,'wesadavsdvhbrth','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]',1,'2023-08-30 17:50:48','2023-08-30 12:27:17');
/*!40000 ALTER TABLE `superadmin_team_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker_sessions`
--

DROP TABLE IF EXISTS `tracker_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `started_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ended_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker_sessions`
--

LOCK TABLES `tracker_sessions` WRITE;
/*!40000 ALTER TABLE `tracker_sessions` DISABLE KEYS */;
INSERT INTO `tracker_sessions` VALUES (1,1,1,'2023-12-27 14:02:28',NULL),(2,2,1,'2023-12-27 14:02:45',NULL),(3,3,1,'2023-12-27 14:02:45',NULL);
/*!40000 ALTER TABLE `tracker_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_sessions`
--

DROP TABLE IF EXISTS `user_login_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_loggedin` tinyint(4) NOT NULL DEFAULT 1,
  `type` tinytext NOT NULL COMMENT '1->employee, 2->company_users, 3-> superadmin(mtrack)',
  `sign_in` datetime NOT NULL DEFAULT current_timestamp(),
  `sign_out` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_sessions`
--

LOCK TABLES `user_login_sessions` WRITE;
/*!40000 ALTER TABLE `user_login_sessions` DISABLE KEYS */;
INSERT INTO `user_login_sessions` VALUES (1,1,1,'2','2023-08-28 14:09:08',NULL,NULL),(2,2,1,'3','2023-08-29 10:37:20','2023-08-29 13:06:44','2023-08-29 13:06:44'),(3,2,1,'3','2023-08-29 18:39:48',NULL,NULL),(4,2,1,'3','2023-08-30 12:13:37',NULL,NULL),(5,1,1,'2','2023-08-30 15:25:28',NULL,NULL),(6,2,1,'3','2023-08-31 16:00:48',NULL,NULL),(7,1,1,'2','2023-08-31 16:42:33',NULL,NULL),(8,2,1,'3','2023-09-01 13:00:23',NULL,NULL),(9,2,1,'3','2023-09-01 15:52:08',NULL,NULL),(10,1,1,'2','2023-09-01 15:59:44',NULL,NULL),(11,2,1,'3','2023-09-01 17:07:10',NULL,NULL),(12,1,1,'2','2023-09-01 19:40:32',NULL,NULL),(13,2,1,'3','2023-09-02 16:35:52',NULL,NULL),(14,1,1,'2','2023-09-02 18:23:14',NULL,NULL),(15,2,1,'3','2023-09-04 18:30:27',NULL,NULL),(16,1,1,'2','2023-09-04 18:32:27',NULL,NULL),(17,2,1,'3','2023-09-05 14:48:19',NULL,NULL),(18,1,0,'1','2023-08-28 13:26:38','2023-08-28 13:28:44',NULL),(19,1,0,'1','2023-08-28 13:29:38','2023-08-28 13:29:48',NULL),(20,1,0,'1','2023-08-28 13:33:14','2023-08-28 13:37:04',NULL),(21,1,0,'1','2023-08-28 14:13:08','2023-08-28 14:13:28',NULL),(22,1,0,'1','2023-08-30 05:38:18','2023-08-30 05:38:37',NULL),(23,1,0,'1','2023-08-30 05:51:00','2023-08-30 05:51:04',NULL),(24,1,0,'1','2023-08-30 06:00:57','2023-08-30 07:19:13',NULL),(25,1,0,'1','2023-08-30 07:23:00','2023-09-04 06:35:20',NULL),(26,1,0,'1','2023-09-04 06:38:11','2023-09-04 07:17:07',NULL),(27,1,0,'1','2023-09-05 13:44:21',NULL,'2023-09-06 10:32:32'),(28,1,0,'1','2023-09-05 13:44:35',NULL,'2023-09-06 10:32:32'),(29,1,0,'1','2023-09-05 14:20:54',NULL,'2023-09-06 10:32:32'),(30,1,0,'1','2023-09-05 14:21:32',NULL,'2023-09-06 10:32:32'),(31,1,0,'1','2023-09-06 10:32:43',NULL,'2023-09-07 11:08:05'),(32,1,0,'1','2023-09-06 10:34:27',NULL,'2023-09-07 11:08:05'),(33,2,0,'1','2023-09-06 10:34:32',NULL,'2023-09-26 13:20:18'),(34,2,0,'1','2023-09-06 11:00:17',NULL,'2023-09-26 13:20:18'),(35,1,0,'1','2023-09-08 10:45:30',NULL,'2023-09-11 07:52:50'),(36,1,0,'1','2023-09-11 07:53:01',NULL,'2023-09-12 13:30:42'),(37,1,0,'1','2023-09-11 10:03:49',NULL,'2023-09-12 13:30:42'),(38,1,0,'1','2023-09-11 12:04:32',NULL,'2023-09-12 13:30:42'),(39,2,1,'3','2023-09-12 11:46:38','2023-09-12 13:38:53','2023-09-12 13:38:53'),(40,1,0,'1','2023-09-12 13:17:32',NULL,'2023-09-12 13:30:42'),(41,8,1,'2','2023-09-12 13:29:29','2023-09-12 13:44:18','2023-09-12 13:44:18'),(42,2,0,'1','2023-09-12 13:30:53',NULL,'2023-09-26 13:20:18'),(43,3,1,'1','2023-09-12 13:31:20',NULL,NULL),(44,8,1,'2','2023-09-12 13:59:30',NULL,NULL),(45,8,1,'2','2023-09-13 06:03:13',NULL,NULL),(46,2,1,'3','2023-09-13 12:35:16',NULL,NULL),(47,8,1,'2','2023-09-26 09:25:40',NULL,NULL),(48,1,0,'1','2023-09-26 10:24:08',NULL,'2023-12-04 10:54:04'),(49,2,0,'1','2023-09-26 12:25:34',NULL,'2023-09-26 13:20:18'),(50,8,1,'2','2023-09-26 12:25:52',NULL,NULL),(51,2,0,'1','2023-09-26 12:27:43',NULL,'2023-09-26 13:20:18'),(52,2,0,'1','2023-09-26 12:30:33',NULL,'2023-09-26 13:20:18'),(53,2,0,'1','2023-09-26 12:34:18',NULL,'2023-09-26 13:20:18'),(54,2,0,'1','2023-09-26 12:38:22',NULL,'2023-09-26 13:20:18'),(55,2,0,'1','2023-09-26 12:50:25',NULL,'2023-09-26 13:20:18'),(56,8,1,'2','2023-09-26 14:20:09',NULL,NULL),(57,8,1,'2','2023-09-27 10:54:54',NULL,NULL),(58,8,1,'2','2023-09-27 11:56:31',NULL,NULL),(59,8,1,'2','2023-09-27 11:57:33',NULL,NULL),(60,8,1,'2','2023-09-27 14:04:24',NULL,NULL),(61,8,1,'2','2023-09-28 07:17:28',NULL,NULL),(62,8,1,'2','2023-09-28 07:18:29',NULL,NULL),(63,8,1,'2','2023-09-28 07:20:45',NULL,NULL),(64,8,1,'2','2023-09-28 07:44:49',NULL,NULL),(65,8,1,'2','2023-09-28 12:03:48',NULL,NULL),(66,8,1,'2','2023-09-28 12:05:48',NULL,NULL),(67,8,1,'2','2023-09-28 12:06:46',NULL,NULL),(68,8,1,'2','2023-10-18 14:24:41',NULL,NULL),(69,2,1,'1','2023-10-21 12:43:49',NULL,NULL),(70,2,1,'1','2023-10-21 12:43:49',NULL,NULL),(71,2,1,'1','2023-10-21 12:43:49',NULL,NULL),(72,3,1,'1','2023-10-21 12:44:17',NULL,NULL),(73,2,1,'1','2023-10-25 06:11:28',NULL,NULL),(74,3,1,'1','2023-10-25 06:11:42',NULL,NULL),(75,2,1,'1','2023-11-02 06:27:11',NULL,NULL),(76,3,1,'1','2023-11-02 06:27:34',NULL,NULL),(77,2,1,'3','2023-11-02 14:00:04',NULL,NULL),(78,2,1,'3','2023-11-03 05:31:34',NULL,NULL),(79,3,1,'1','2023-11-03 13:22:34',NULL,NULL),(80,2,1,'1','2023-11-03 13:22:39',NULL,NULL),(81,2,1,'3','2023-11-03 13:22:56',NULL,NULL),(82,3,1,'1','2023-11-03 13:30:51',NULL,NULL),(83,2,1,'1','2023-11-03 13:31:01',NULL,NULL),(84,2,1,'1','2023-11-13 10:28:25',NULL,NULL),(85,8,1,'2','2023-11-14 11:41:32',NULL,NULL),(86,1,0,'1','2023-12-02 07:20:28',NULL,'2023-12-04 10:54:04'),(87,1,0,'1','2023-12-02 10:50:02',NULL,'2023-12-04 10:54:04'),(88,1,0,'1','2023-12-02 10:50:25',NULL,'2023-12-04 10:54:04'),(89,1,0,'1','2023-12-02 11:25:06',NULL,'2023-12-04 10:54:04'),(90,1,0,'1','2023-12-02 11:26:06',NULL,'2023-12-04 10:54:04'),(91,1,0,'1','2023-12-02 11:26:59',NULL,'2023-12-04 10:54:04'),(92,1,0,'1','2023-12-04 10:55:26',NULL,'2023-12-04 14:31:11'),(93,1,0,'1','2023-12-05 06:22:47',NULL,'2023-12-05 09:46:46'),(94,1,0,'1','2023-12-05 09:47:53',NULL,'2023-12-05 09:48:38'),(95,1,0,'1','2023-12-05 09:49:16',NULL,'2023-12-05 14:34:34'),(96,1,0,'1','2023-12-05 14:35:01',NULL,'2023-12-16 09:29:29'),(97,2,1,'3','2023-12-11 11:50:16',NULL,NULL),(98,8,1,'2','2023-12-11 12:50:17',NULL,NULL),(99,8,1,'2','2023-12-12 07:43:03',NULL,NULL),(100,2,1,'3','2023-12-16 08:53:41',NULL,NULL),(101,4,0,'1','2023-12-16 09:33:47',NULL,'2023-12-18 12:06:52'),(102,5,1,'1','2023-12-16 09:34:33',NULL,NULL),(103,6,0,'1','2023-12-16 09:37:11',NULL,'2023-12-18 07:08:00'),(104,7,0,'1','2023-12-16 09:37:45',NULL,'2023-12-18 14:48:12'),(105,8,1,'2','2023-12-16 09:38:17',NULL,NULL),(106,1,1,'2','2023-12-16 09:38:35',NULL,NULL),(107,8,1,'2','2023-12-16 12:42:38',NULL,NULL),(108,6,0,'1','2023-12-18 07:08:29',NULL,'2023-12-18 12:14:32'),(109,2,1,'3','2023-12-18 10:42:23',NULL,NULL),(110,8,1,'2','2023-12-18 11:44:24',NULL,NULL),(111,7,0,'1','2023-12-18 12:12:26',NULL,'2023-12-18 14:48:12'),(112,6,1,'1','2023-12-18 12:14:55',NULL,NULL),(113,4,1,'1','2023-12-18 12:15:10',NULL,NULL),(114,8,1,'1','2023-12-18 12:15:11',NULL,NULL),(115,2,1,'3','2023-12-19 05:20:48',NULL,NULL),(116,8,1,'2','2023-12-20 08:50:20',NULL,NULL),(117,7,1,'1','2023-12-20 11:10:25',NULL,NULL),(118,8,1,'2','2023-12-20 11:22:03',NULL,NULL),(119,4,1,'1','2023-12-20 12:44:18',NULL,NULL),(120,4,1,'1','2023-12-21 05:19:19',NULL,NULL),(121,2,1,'3','2023-12-21 07:39:27',NULL,NULL),(122,2,1,'3','2023-12-21 07:49:28',NULL,NULL),(123,8,1,'2','2023-12-21 10:18:24',NULL,NULL),(124,8,1,'2','2023-12-22 10:48:04',NULL,NULL),(125,8,1,'2','2023-12-25 06:27:39',NULL,NULL),(126,8,1,'2','2023-12-26 13:41:00',NULL,NULL),(127,1,1,'2','2023-12-27 14:06:58','2023-12-27 08:38:37','2023-12-27 08:38:37'),(128,1,1,'2','2023-12-27 14:10:18','2023-12-27 09:18:59','2023-12-27 09:18:59'),(129,9,1,'2','2023-12-27 14:49:07',NULL,NULL),(130,2,1,'3','2023-12-28 12:39:33',NULL,NULL);
/*!40000 ALTER TABLE `user_login_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super_admin` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-> superadmin & its staff of the plaform, 0-> company''s users',
  `is_company_super_admin` tinyint(4) NOT NULL DEFAULT 0 COMMENT '	1-> company''s superadmin, 0-> normal user of the company	',
  `role_id` int(11) NOT NULL DEFAULT 0,
  `profile_pic` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `last_login_at` datetime DEFAULT NULL,
  `last_login_ip` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Testing','test@test.com','$2y$10$NTEu6gqgr9sPprmws05Xh.bj5AyreaQNhjM6mTrnqbsDYu27iE7Qy','8475868954',1,'101','hi',0,1,1,'images/uploads/Image1693661969.png',NULL,NULL,NULL,'2023-08-22 19:30:12','2023-12-27 14:06:50',1,'2023-08-22 14:00:12','127.0.0.1'),(2,'Atul Ilake','atul@metricoidtech.com','$2y$10$ohV5iVNHRY9/UsJWHadg7eF7P1VtoMd0mGvon4GQ6KRSoA7mYYGtO','',0,NULL,'0',1,1,0,'images/uploads/Image1693477929.png',NULL,NULL,NULL,'2023-08-23 14:12:49','2023-12-11 11:50:05',1,'2023-08-23 08:42:49','127.0.0.1'),(3,'dcsaf','fsafas@gmauil.com','$2a$12$x6mvvtDgJ5QFIfpNwPJie.BOv4KBlSvtnwE/PYhKiDVm59uSeK5xK','',1,NULL,'0',0,0,3,NULL,NULL,NULL,NULL,'2023-08-28 15:31:46','2023-08-29 18:39:23',1,NULL,NULL),(4,'vasdga','gasdg@gmail.com','$2y$10$bj5zLR81RtBfkPRuH7Uzh.APZ6JB1lZ1LoQlVjvXPXMAwaEPJrvqa','',0,NULL,'0',0,0,0,NULL,NULL,NULL,NULL,'2023-08-30 17:14:18','2023-08-30 11:49:06',1,NULL,NULL),(5,'sdafgaga','dsgasdg@gmail.com','$2y$10$HrwWvCpZjAueBH4NqxBDIOMna2fnNHvKAxo6EbnfGU/WkWlcoYr3S','',0,NULL,'0',1,0,0,NULL,NULL,NULL,NULL,'2023-08-30 17:22:56','2023-08-30 12:00:54',1,NULL,NULL),(6,'New user','sadcvsadv@gmail.com','$2y$10$A7vJk52D0asKmeD7CejZ9.Aa4GZqxZCGtcKtZji.zy5NL9caDsffy','',0,NULL,'0',1,0,0,'images/uploads/Image1693481155.png',NULL,NULL,NULL,'2023-08-31 16:54:54','2023-08-31 11:25:55',1,NULL,NULL),(7,'efgag','asdgasd@gsdf.com','$2y$10$Qysk8uejfBB4zad6cLR5nehVx9mtPw5DwIbFfGIeYjjrPBz47UMWa','',1,NULL,'0',0,0,0,NULL,NULL,NULL,NULL,'2023-08-31 17:13:53',NULL,1,NULL,NULL),(8,'shubham yadav','shubham.yadav@metricoidtech.com','$2y$10$Lz9W9dU0nRwZwYxNXLvTNO7Kt0LBRmpfq3wsahRjkWlhk9itvkEI.',NULL,1,NULL,NULL,0,1,0,NULL,NULL,NULL,NULL,'2023-09-12 13:27:04','2023-09-12 13:28:47',1,'2023-09-12 13:27:04','171.51.244.155'),(9,'abcd','abcd@abcd.com','$2y$10$NTEu6gqgr9sPprmws05Xh.bj5AyreaQNhjM6mTrnqbsDYu27iE7Qy',NULL,4,NULL,NULL,0,0,0,NULL,NULL,NULL,NULL,'2023-12-27 14:46:02','2023-12-27 14:46:47',1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 13:37:49
