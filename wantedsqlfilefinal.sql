-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: MIPO
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `dbs`
--

DROP TABLE IF EXISTS `dbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbs` (
  `dbs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `threshold_supplement` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `threshold_remove` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `max_user_sequences` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `validation_expression` varchar(255) DEFAULT NULL,
  `bg_supp_searches` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prune_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dbs_id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbs`
--

LOCK TABLES `dbs` WRITE;
/*!40000 ALTER TABLE `dbs` DISABLE KEYS */;
INSERT INTO `dbs` VALUES (4,'MycobacteriumDB','Mycobacterim prod database',80,10,0,'its',0,0);
/*!40000 ALTER TABLE `dbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs`
--

DROP TABLE IF EXISTS `labs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs` (
  `labs_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`labs_id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs`
--

LOCK TABLES `labs` WRITE;
/*!40000 ALTER TABLE `labs` DISABLE KEYS */;
INSERT INTO `labs` VALUES (2,'UNMC'),(1,'UNO');
/*!40000 ALTER TABLE `labs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs_has_dbs`
--

DROP TABLE IF EXISTS `labs_has_dbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs_has_dbs` (
  `labs_id` int(10) NOT NULL,
  `dbs_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`labs_id`,`dbs_id`),
  KEY `fk_labs_has_dbs_dbs1_idx` (`dbs_id`),
  KEY `fk_labs_has_dbs_labs1_idx` (`labs_id`),
  CONSTRAINT `fk_labs_has_dbs_dbs1` FOREIGN KEY (`dbs_id`) REFERENCES `dbs` (`dbs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_labs_has_dbs_labs1` FOREIGN KEY (`labs_id`) REFERENCES `labs` (`labs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs_has_dbs`
--

LOCK TABLES `labs_has_dbs` WRITE;
/*!40000 ALTER TABLE `labs_has_dbs` DISABLE KEYS */;
INSERT INTO `labs_has_dbs` VALUES (1,4),(2,4);
/*!40000 ALTER TABLE `labs_has_dbs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labs_has_users`
--

DROP TABLE IF EXISTS `labs_has_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `labs_has_users` (
  `users_id` int(10) unsigned NOT NULL,
  `labs_id` int(10) NOT NULL,
  PRIMARY KEY (`users_id`,`labs_id`),
  KEY `fk_users_has_labs_labs1_idx` (`labs_id`),
  KEY `fk_users_has_labs_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_has_labs_labs1` FOREIGN KEY (`labs_id`) REFERENCES `labs` (`labs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_labs_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labs_has_users`
--

LOCK TABLES `labs_has_users` WRITE;
/*!40000 ALTER TABLE `labs_has_users` DISABLE KEYS */;
INSERT INTO `labs_has_users` VALUES (25,1),(28,1),(48,1),(49,1),(50,1),(51,1),(52,1),(25,2),(27,2),(28,2),(34,2),(39,2),(41,2),(45,2),(48,2),(49,2),(50,2),(51,2),(52,2);
/*!40000 ALTER TABLE `labs_has_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organism_gene`
--

DROP TABLE IF EXISTS `organism_gene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organism_gene` (
  `regions_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `organism` varchar(100) NOT NULL,
  `genename` varchar(100) NOT NULL,
  `startsequence` varchar(100) NOT NULL,
  `endsequence` varchar(100) NOT NULL,
  `wildcard` char(1) NOT NULL,
  `wildcard_search_limit` int(10) DEFAULT NULL,
  `wildcard_insert_limit` int(10) DEFAULT NULL,
  `run_limit` int(10) NOT NULL,
  PRIMARY KEY (`organism`,`genename`),
  KEY `regions_id` (`regions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organism_gene`
--

LOCK TABLES `organism_gene` WRITE;
/*!40000 ALTER TABLE `organism_gene` DISABLE KEYS */;
INSERT INTO `organism_gene` VALUES (1,'abc','def','CACCTCCTTTCT','GGGGTGTGG','N',0,2,7);
/*!40000 ALTER TABLE `organism_gene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `queries_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `exec_time` float NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `max_score` tinyint(3) unsigned DEFAULT NULL,
  `regions` varchar(255) NOT NULL DEFAULT '',
  `allow_miss` int(11) NOT NULL DEFAULT '0',
  `allow_supplement` int(11) NOT NULL DEFAULT '0',
  `allow_blastall` int(11) NOT NULL DEFAULT '0',
  `autoadd` int(11) NOT NULL DEFAULT '0',
  `stage` varchar(16) DEFAULT 'standard',
  PRIMARY KEY (`queries_id`),
  KEY `id_index` (`queries_id`),
  KEY `user_index` (`user`),
  KEY `name_index` (`name`),
  CONSTRAINT `fk_queries_users1` FOREIGN KEY (`user`) REFERENCES `users` (`users_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_results`
--

DROP TABLE IF EXISTS `query_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_results` (
  `queries_id` int(10) unsigned NOT NULL,
  `sequences_id` int(10) unsigned NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`queries_id`,`sequences_id`),
  KEY `fk_queries_has_sequences_sequences1_idx` (`sequences_id`),
  KEY `fk_queries_has_sequences_queries1_idx` (`queries_id`),
  CONSTRAINT `fk_queries_has_sequences_queries1` FOREIGN KEY (`queries_id`) REFERENCES `queries` (`queries_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_queries_has_sequences_sequences1` FOREIGN KEY (`sequences_id`) REFERENCES `sequences` (`sequences_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_results`
--

LOCK TABLES `query_results` WRITE;
/*!40000 ALTER TABLE `query_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_results_blastall`
--

DROP TABLE IF EXISTS `query_results_blastall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_results_blastall` (
  `qrb_id` int(10) NOT NULL AUTO_INCREMENT,
  `queries_id` int(10) NOT NULL DEFAULT '0',
  `score` double NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hspline` varchar(255) DEFAULT '',
  `evalue` double NOT NULL DEFAULT '0',
  `raw_score` int(11) NOT NULL DEFAULT '0',
  `mlength` int(11) NOT NULL DEFAULT '0',
  `description` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qrb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_results_blastall`
--

LOCK TABLES `query_results_blastall` WRITE;
/*!40000 ALTER TABLE `query_results_blastall` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_results_blastall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_results_supplement`
--

DROP TABLE IF EXISTS `query_results_supplement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_results_supplement` (
  `queries_id` int(10) unsigned NOT NULL,
  `sequences_supplement_id` int(10) unsigned NOT NULL,
  `score` float NOT NULL,
  PRIMARY KEY (`queries_id`,`sequences_supplement_id`),
  KEY `fk_queries_has_sequences_supplement_sequences_supplement1_idx` (`sequences_supplement_id`),
  KEY `fk_queries_has_sequences_supplement_queries1_idx` (`queries_id`),
  CONSTRAINT `fk_queries_has_sequences_supplement_queries1` FOREIGN KEY (`queries_id`) REFERENCES `queries` (`queries_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_queries_has_sequences_supplement_sequences_supplement1` FOREIGN KEY (`sequences_supplement_id`) REFERENCES `sequences_supplement` (`sequences_supplement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_results_supplement`
--

LOCK TABLES `query_results_supplement` WRITE;
/*!40000 ALTER TABLE `query_results_supplement` DISABLE KEYS */;
/*!40000 ALTER TABLE `query_results_supplement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_filters`
--

DROP TABLE IF EXISTS `region_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_filters` (
  `region_filters_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `region` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `priority` int(11) NOT NULL DEFAULT '100',
  `bound` enum('left','right') NOT NULL DEFAULT 'left',
  `pattern` varchar(100) NOT NULL DEFAULT '',
  `substitute` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_filters_id`),
  KEY `fk_region_filters_regions1_idx` (`region`),
  CONSTRAINT `fk_region_filters_regions1` FOREIGN KEY (`region`) REFERENCES `regions` (`regions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_filters`
--

LOCK TABLES `region_filters` WRITE;
/*!40000 ALTER TABLE `region_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `region_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `regions_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `startsequence` varchar(100) NOT NULL DEFAULT '',
  `endsequence` varchar(100) NOT NULL DEFAULT '',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `wildcard` char(1) NOT NULL DEFAULT '',
  `wildcard_search_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `wildcard_insert_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `run_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `symbol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`regions_id`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'ITS','CACCTCCTTTCT','GGGGTGTGG','Y','N',0,2,7,'its');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sec_sequences_has_regions`
--

DROP TABLE IF EXISTS `sec_sequences_has_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sec_sequences_has_regions` (
  `sequences_id` int(10) unsigned NOT NULL,
  `regions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sequences_id`,`regions_id`),
  KEY `fk_sec_sequences_has_regions_regions1_idx` (`regions_id`),
  KEY `fk_sec_sequences_has_regions_sequences1_idx` (`sequences_id`),
  CONSTRAINT `fk_sec_sequences_has_regions_regions1` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`regions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sec_sequences_has_regions_sequences1` FOREIGN KEY (`sequences_id`) REFERENCES `sequences_supplement` (`sequences_supplement_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sec_sequences_has_regions`
--

LOCK TABLES `sec_sequences_has_regions` WRITE;
/*!40000 ALTER TABLE `sec_sequences_has_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sec_sequences_has_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `sequences_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbs_id` int(10) unsigned NOT NULL DEFAULT '0',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `data` longtext NOT NULL,
  `i3bio` tinyint(1) NOT NULL,
  PRIMARY KEY (`sequences_id`),
  KEY `db_index` (`dbs_id`),
  KEY `active_idx` (`active`),
  CONSTRAINT `fk_sequences_dbs1` FOREIGN KEY (`dbs_id`) REFERENCES `dbs` (`dbs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences_has_regions`
--

DROP TABLE IF EXISTS `sequences_has_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences_has_regions` (
  `sequences_id` int(10) unsigned NOT NULL,
  `regions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sequences_id`,`regions_id`),
  KEY `fk_sequences_has_regions_regions1_idx` (`regions_id`),
  KEY `fk_sequences_has_regions_sequences1_idx` (`sequences_id`),
  CONSTRAINT `fk_sequences_has_regions_regions1` FOREIGN KEY (`regions_id`) REFERENCES `regions` (`regions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sequences_has_regions_sequences1` FOREIGN KEY (`sequences_id`) REFERENCES `sequences` (`sequences_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences_has_regions`
--

LOCK TABLES `sequences_has_regions` WRITE;
/*!40000 ALTER TABLE `sequences_has_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences_has_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences_names`
--

DROP TABLE IF EXISTS `sequences_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences_names` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`,`name`),
  KEY `fk_sequences_names_sequences1_idx` (`id`),
  CONSTRAINT `fk_sequences_names_sequences1` FOREIGN KEY (`id`) REFERENCES `sequences` (`sequences_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences_names`
--

LOCK TABLES `sequences_names` WRITE;
/*!40000 ALTER TABLE `sequences_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences_supplement`
--

DROP TABLE IF EXISTS `sequences_supplement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences_supplement` (
  `sequences_supplement_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dbs_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `user` int(10) unsigned DEFAULT NULL,
  `data` longtext NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` int(11) unsigned NOT NULL DEFAULT '0',
  `accession` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sequences_supplement_id`),
  KEY `db_idx` (`dbs_id`),
  KEY `accession_idx` (`accession`),
  CONSTRAINT `fk_sequences_supplement_dbs1` FOREIGN KEY (`dbs_id`) REFERENCES `dbs` (`dbs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences_supplement`
--

LOCK TABLES `sequences_supplement` WRITE;
/*!40000 ALTER TABLE `sequences_supplement` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences_supplement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessions_id` varchar(32) NOT NULL DEFAULT '',
  `a_session` text NOT NULL,
  UNIQUE KEY `id` (`sessions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `users_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `type` enum('user','staff','admin','debugger') NOT NULL DEFAULT 'user',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `defaultdatabase` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  UNIQUE KEY `username_unique` (`username`),
  KEY `fk_users_dbs1_idx` (`defaultdatabase`),
  CONSTRAINT `fk_users_dbs1` FOREIGN KEY (`defaultdatabase`) REFERENCES `dbs` (`dbs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (24,'James','Harr','jharr@mail.unomaha.edu','jharr','912ec803b2ce49e4a541068d495ab570','debugger','N',4),(25,'Dhundy','Bastola','dkbastola@unomaha.edu','dbastola','912ec803b2ce49e4a541068d495ab570','admin','Y',4),(26,'Bob','Wickert','bwickert@unmc.edu','bob','912ec803b2ce49e4a541068d495ab570','user','N',4),(27,'Pete','Iwen','piwen@unmc.edu','piwen','912ec803b2ce49e4a541068d495ab570','user','Y',4),(28,'Mohammad','Shafiullah','mshafiullah.ne@gmail.com','mshafiullah','912ec803b2ce49e4a541068d495ab570','admin','Y',4),(29,'Michael','Loeffelholz','mloeffelholz@healthyarkansas.com','michael','912ec803b2ce49e4a541068d495ab570','user','N',NULL),(30,'Randy','Olsen','rolsen@bcm.tmc.edu','rolsen','912ec803b2ce49e4a541068d495ab570','user','N',4),(31,'June','Pounder','june.pounder@aruplab.com','jpounder','912ec803b2ce49e4a541068d495ab570','user','N',4),(32,'Kiran','Bastola','dbastola@unmc.edu','kiran','912ec803b2ce49e4a541068d495ab570','user','N',4),(33,'Mike','Grove','mrgrove@mail.unomaha.edu','mrgrove','912ec803b2ce49e4a541068d495ab570','admin','N',4),(34,'Steven','Hinrichs','shinrich@unmc.edu','shinrich','912ec803b2ce49e4a541068d495ab570','user','Y',4),(35,'Amrit','Pant','arp@alum.mit.edu','guest','912ec803b2ce49e4a541068d495ab570','user','N',4),(36,'James','Harr','jharr@mail.unomaha.edu','temp','912ec803b2ce49e4a541068d495ab570','user','N',4),(37,'admin','istrator','test@test.com','admin','912ec803b2ce49e4a541068d495ab570','user','N',4),(38,'Michell','Gasko','mgasko@unmc.edu','mgasko','912ec803b2ce49e4a541068d495ab570','user','N',4),(39,'Tricia','Aden','taden@unmc.edu','taden','912ec803b2ce49e4a541068d495ab570','user','N',4),(40,'Jay','Hannah','jay@jays.net','jhannah','912ec803b2ce49e4a541068d495ab570','debugger','N',4),(41,'Nathan','Bills','nbills@unmc.edu','nbills','912ec803b2ce49e4a541068d495ab570','staff','Y',4),(42,'Sanjiit','Pandey','spandey@mail.unomaha.edu','spandey','912ec803b2ce49e4a541068d495ab570','user','N',4),(43,'Amr','Mohamed','amohamed@unmc.edu','amohamed','912ec803b2ce49e4a541068d495ab570','user','N',4),(44,'Pragati','Bapat','pbapat@mail.unomaha.edu','pbapat','912ec803b2ce49e4a541068d495ab570','user','N',4),(45,'Andrea','Brockman','abrockman@unmc.edu','abrockman','912ec803b2ce49e4a541068d495ab570','user','Y',4),(46,'sriram','surapaneni','ssurapaneni@unomaha.edu','ssurapaneni','912ec803b2ce49e4a541068d495ab570','user','N',NULL),(47,'Sanik','Bajracharya','sbajracharya@unomaha.edu','sbajracharya','912ec803b2ce49e4a541068d495ab570','admin','N',4),(48,'Ishwor','Thapa','ithapa@mail.unomaha.edu','ithapa','cc03e747a6afbbcbf8be7668acfebee5','admin','Y',4),(49,'Generic','Prod User','support@biodoc.ist.unomaha.edu','generic-prod-user','912ec803b2ce49e4a541068d495ab570','user','Y',4),(50,'Generic','Prod Staff','support@biodoc.ist.unomaha.edu','generic-prod-staff','912ec803b2ce49e4a541068d495ab570','staff','Y',NULL),(51,'Generic','Prod Admin','support@biodoc.ist.unomaha.edu','generic-prod-admin','912ec803b2ce49e4a541068d495ab570','admin','Y',4),(52,'Sumanth','Ghanta','sghanta@unomaha.edu','sghanta','912ec803b2ce49e4a541068d495ab570','admin','Y',4);
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

-- Dump completed on 2016-12-15 20:52:17
