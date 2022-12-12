-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: g5
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `g5_auth`
--

DROP TABLE IF EXISTS `g5_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_auth` (
                           `mb_id` varchar(20) NOT NULL DEFAULT '',
                           `au_menu` varchar(20) NOT NULL DEFAULT '',
                           `au_auth` set('r','w','d') NOT NULL DEFAULT '',
                           PRIMARY KEY (`mb_id`,`au_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_auth`
--

LOCK TABLES `g5_auth` WRITE;
/*!40000 ALTER TABLE `g5_auth` DISABLE KEYS */;
INSERT INTO `g5_auth` VALUES ('nimuro','400300','r,w'),('nimuro','400610','r,w'),('nimuro','400620','r,w'),('nimuro','400750','r,w'),('nimuro2','400300','r,w');
/*!40000 ALTER TABLE `g5_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_autosave`
--

DROP TABLE IF EXISTS `g5_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_autosave` (
                               `as_id` int(11) NOT NULL AUTO_INCREMENT,
                               `mb_id` varchar(20) NOT NULL,
                               `as_uid` bigint(20) unsigned NOT NULL,
                               `as_subject` varchar(255) NOT NULL,
                               `as_content` text NOT NULL,
                               `as_datetime` datetime NOT NULL,
                               PRIMARY KEY (`as_id`),
                               UNIQUE KEY `as_uid` (`as_uid`),
                               KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_autosave`
--

LOCK TABLES `g5_autosave` WRITE;
/*!40000 ALTER TABLE `g5_autosave` DISABLE KEYS */;
INSERT INTO `g5_autosave` VALUES (5,'zm2life',2022110721084437,'결제 테스트 123','<p>123</p>','2022-11-07 21:09:45'),(9,'zm2life',2022110814573312,'class 글쓰기 공제 테스트','<p>&nbsp;class 글쓰기 공제 테스트</p>\n<p><img src=\"http://localhost:8080/data/editor/2211/20221107223121_28e2ca35f8dff89fd0d9fdf914d88d9d_gkpv.jpg\" alt=\"사이버펑크 2077.jpg\" style=\"width: 800px; height: 348px;\" /></p>','2022-11-08 14:59:34'),(11,'zm2life',2022110815174485,'class 글쓰기 공제 테스트','<p>&nbsp;class 글쓰기 공제 테스트</p>\n<p>\n   <img src=\"http://localhost:8080/data/editor/2211/20221107223121_28e2ca35f8dff89fd0d9fdf914d88d9d_gkpv.jpg\" alt=\"사이버펑크 2077.jpg\" style=\"width: 800px; height: 348px;\" />\n</p>','2022-11-08 15:18:45'),(17,'zm2life',2022111018193137,'[클래스 강의] 줌마라이프 테스트 강의','안녕하세요.<br /><br />\n줌마라이프 테스트 강의 입니다.\n<p>&nbsp;&nbsp;</p>\n<p>아자 !!!</p>','2022-11-10 18:20:31'),(18,'zm2life',2022111109084234,'[라이브강의] 무료 강의','<p>무료강의 테스트 입니다.</p>\n<p>&nbsp;</p>\n<p>https://www.youtube.com/watch?v=vFaHxGm2ID4</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>','2022-11-11 09:09:42'),(21,'nimuro',2022111308315123,'무료강의 테스트','<p>..</p>','2022-11-13 08:32:51'),(22,'nimuro',2022111308424712,'무료강의','<p>/</p>','2022-11-13 08:43:47');
/*!40000 ALTER TABLE `g5_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board`
--

DROP TABLE IF EXISTS `g5_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board` (
                            `bo_table` varchar(20) NOT NULL DEFAULT '',
                            `gr_id` varchar(255) NOT NULL DEFAULT '',
                            `bo_subject` varchar(255) NOT NULL DEFAULT '',
                            `bo_mobile_subject` varchar(255) NOT NULL DEFAULT '',
                            `bo_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
                            `bo_admin` varchar(255) NOT NULL DEFAULT '',
                            `bo_list_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_read_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_write_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_reply_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_comment_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_upload_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_download_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_html_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_link_level` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_count_delete` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_count_modify` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_read_point` int(11) NOT NULL DEFAULT 0,
                            `bo_write_point` int(11) NOT NULL DEFAULT 0,
                            `bo_comment_point` int(11) NOT NULL DEFAULT 0,
                            `bo_download_point` int(11) NOT NULL DEFAULT 0,
                            `bo_use_category` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_category_list` text NOT NULL,
                            `bo_use_sideview` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_file_content` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_secret` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_dhtml_editor` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_select_editor` varchar(50) NOT NULL DEFAULT '',
                            `bo_use_rss_view` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_good` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_nogood` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_name` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_signature` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_ip_view` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_list_view` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_list_file` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_list_content` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_table_width` int(11) NOT NULL DEFAULT 0,
                            `bo_subject_len` int(11) NOT NULL DEFAULT 0,
                            `bo_mobile_subject_len` int(11) NOT NULL DEFAULT 0,
                            `bo_page_rows` int(11) NOT NULL DEFAULT 0,
                            `bo_mobile_page_rows` int(11) NOT NULL DEFAULT 0,
                            `bo_new` int(11) NOT NULL DEFAULT 0,
                            `bo_hot` int(11) NOT NULL DEFAULT 0,
                            `bo_image_width` int(11) NOT NULL DEFAULT 0,
                            `bo_skin` varchar(255) NOT NULL DEFAULT '',
                            `bo_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                            `bo_include_head` varchar(255) NOT NULL DEFAULT '',
                            `bo_include_tail` varchar(255) NOT NULL DEFAULT '',
                            `bo_content_head` text NOT NULL,
                            `bo_mobile_content_head` text NOT NULL,
                            `bo_content_tail` text NOT NULL,
                            `bo_mobile_content_tail` text NOT NULL,
                            `bo_insert_content` text NOT NULL,
                            `bo_gallery_cols` int(11) NOT NULL DEFAULT 0,
                            `bo_gallery_width` int(11) NOT NULL DEFAULT 0,
                            `bo_gallery_height` int(11) NOT NULL DEFAULT 0,
                            `bo_mobile_gallery_width` int(11) NOT NULL DEFAULT 0,
                            `bo_mobile_gallery_height` int(11) NOT NULL DEFAULT 0,
                            `bo_upload_size` int(11) NOT NULL DEFAULT 0,
                            `bo_reply_order` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_search` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_order` int(11) NOT NULL DEFAULT 0,
                            `bo_count_write` int(11) NOT NULL DEFAULT 0,
                            `bo_count_comment` int(11) NOT NULL DEFAULT 0,
                            `bo_write_min` int(11) NOT NULL DEFAULT 0,
                            `bo_write_max` int(11) NOT NULL DEFAULT 0,
                            `bo_comment_min` int(11) NOT NULL DEFAULT 0,
                            `bo_comment_max` int(11) NOT NULL DEFAULT 0,
                            `bo_notice` text NOT NULL,
                            `bo_upload_count` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_email` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_cert` enum('','cert','adult','hp-cert','hp-adult') NOT NULL DEFAULT '',
                            `bo_use_sns` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_use_captcha` tinyint(4) NOT NULL DEFAULT 0,
                            `bo_sort_field` varchar(255) NOT NULL DEFAULT '',
                            `bo_1_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_2_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_3_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_4_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_5_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_6_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_7_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_8_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_9_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_10_subj` varchar(255) NOT NULL DEFAULT '',
                            `bo_1` varchar(255) NOT NULL DEFAULT '',
                            `bo_2` varchar(255) NOT NULL DEFAULT '',
                            `bo_3` varchar(255) NOT NULL DEFAULT '',
                            `bo_4` varchar(255) NOT NULL DEFAULT '',
                            `bo_5` varchar(255) NOT NULL DEFAULT '',
                            `bo_6` varchar(255) NOT NULL DEFAULT '',
                            `bo_7` varchar(255) NOT NULL DEFAULT '',
                            `bo_8` varchar(255) NOT NULL DEFAULT '',
                            `bo_9` varchar(255) NOT NULL DEFAULT '',
                            `bo_10` varchar(255) NOT NULL DEFAULT '',
                            PRIMARY KEY (`bo_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board`
--

LOCK TABLES `g5_board` WRITE;
/*!40000 ALTER TABLE `g5_board` DISABLE KEYS */;
INSERT INTO `g5_board` VALUES ('class','market','동영상강의','동영상강의','both','',1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,'사고|팔고',1,0,0,1,'',0,1,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,1,0,0,0,0,0,'',2,0,'',0,0,'','컨텐츠 결제','결제금액','','','','','','','','','1','1000','','','','','','','',''),('class_live','market','라이브강의','라이브강의','both','',1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','컨텐츠 결제','결제금액','','','','','','','','','1','1000','','','','','','','',''),('ebook','ebook','전자책','','both','',1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,5242880,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','결제','결제금액','','','','','','','','','1','1000','','','','','','','',''),('edu','community','자녀교육 이야기','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('free','community','자유게시판','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('gallery','community','오늘 뭐 먹지','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'cheditor5',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'gallery','gallery','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('howtouse','notice','이용방법','이용방법','both','',1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,'',0,0,0,0,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('jaetech','community','재테크 이야기','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('notice','community','공지사항','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('qa','community','질문답변','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','',''),('somoim_off','somoim','오프라인 소모임','','both','',1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','결제','결제금액','','','','','','','','','1','1000','','','','','','','',''),('somoim_on','somoim','온라인 소모임','','both','',1,2,2,2,2,2,2,2,2,1,0,0,0,0,0,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,600,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','결제','결제금액','','','','','','','','','1','1000','','','','','','','',''),('tip','community','생활 알뜰 팁','','both','',1,1,1,1,1,1,1,1,1,1,1,-1,5,1,-20,0,'',0,0,0,1,'',0,0,0,0,0,0,0,0,0,100,60,30,15,15,24,100,835,'basic','basic','_head.php','_tail.php','','','','','',4,202,150,125,100,1048576,1,1,0,0,0,0,0,0,0,'',2,0,'',0,0,'','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_file`
--

DROP TABLE IF EXISTS `g5_board_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_file` (
                                 `bo_table` varchar(20) NOT NULL DEFAULT '',
                                 `wr_id` int(11) NOT NULL DEFAULT 0,
                                 `bf_no` int(11) NOT NULL DEFAULT 0,
                                 `bf_source` varchar(255) NOT NULL DEFAULT '',
                                 `bf_file` varchar(255) NOT NULL DEFAULT '',
                                 `bf_download` int(11) NOT NULL,
                                 `bf_content` text NOT NULL,
                                 `bf_fileurl` varchar(255) NOT NULL DEFAULT '',
                                 `bf_thumburl` varchar(255) NOT NULL DEFAULT '',
                                 `bf_storage` varchar(50) NOT NULL DEFAULT '',
                                 `bf_filesize` int(11) NOT NULL DEFAULT 0,
                                 `bf_width` int(11) NOT NULL DEFAULT 0,
                                 `bf_height` smallint(6) NOT NULL DEFAULT 0,
                                 `bf_type` tinyint(4) NOT NULL DEFAULT 0,
                                 `bf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 PRIMARY KEY (`bo_table`,`wr_id`,`bf_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_file`
--

LOCK TABLES `g5_board_file` WRITE;
/*!40000 ALTER TABLE `g5_board_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_good`
--

DROP TABLE IF EXISTS `g5_board_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_good` (
                                 `bg_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `bo_table` varchar(20) NOT NULL DEFAULT '',
                                 `wr_id` int(11) NOT NULL DEFAULT 0,
                                 `mb_id` varchar(20) NOT NULL DEFAULT '',
                                 `bg_flag` varchar(255) NOT NULL DEFAULT '',
                                 `bg_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 PRIMARY KEY (`bg_id`),
                                 UNIQUE KEY `fkey1` (`bo_table`,`wr_id`,`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_good`
--

LOCK TABLES `g5_board_good` WRITE;
/*!40000 ALTER TABLE `g5_board_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_board_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_new`
--

DROP TABLE IF EXISTS `g5_board_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_new` (
                                `bn_id` int(11) NOT NULL AUTO_INCREMENT,
                                `bo_table` varchar(20) NOT NULL DEFAULT '',
                                `wr_id` int(11) NOT NULL DEFAULT 0,
                                `wr_parent` int(11) NOT NULL DEFAULT 0,
                                `bn_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `mb_id` varchar(20) NOT NULL DEFAULT '',
                                PRIMARY KEY (`bn_id`),
                                KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_new`
--

LOCK TABLES `g5_board_new` WRITE;
/*!40000 ALTER TABLE `g5_board_new` DISABLE KEYS */;
INSERT INTO `g5_board_new` VALUES (42,'class',10,10,'2022-11-16 04:42:50','zm2life');
/*!40000 ALTER TABLE `g5_board_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_cert_history`
--

DROP TABLE IF EXISTS `g5_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_cert_history` (
                                   `cr_id` int(11) NOT NULL AUTO_INCREMENT,
                                   `mb_id` varchar(20) NOT NULL DEFAULT '',
                                   `cr_company` varchar(255) NOT NULL DEFAULT '',
                                   `cr_method` varchar(255) NOT NULL DEFAULT '',
                                   `cr_ip` varchar(255) NOT NULL DEFAULT '',
                                   `cr_date` date NOT NULL DEFAULT '0000-00-00',
                                   `cr_time` time NOT NULL DEFAULT '00:00:00',
                                   PRIMARY KEY (`cr_id`),
                                   KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_cert_history`
--

LOCK TABLES `g5_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_config`
--

DROP TABLE IF EXISTS `g5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_config` (
                             `cf_title` varchar(255) NOT NULL DEFAULT '',
                             `cf_theme` varchar(100) NOT NULL DEFAULT '',
                             `cf_admin` varchar(100) NOT NULL DEFAULT '',
                             `cf_admin_email` varchar(100) NOT NULL DEFAULT '',
                             `cf_admin_email_name` varchar(100) NOT NULL DEFAULT '',
                             `cf_add_script` text NOT NULL,
                             `cf_use_point` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_point_term` int(11) NOT NULL DEFAULT 0,
                             `cf_use_copy_log` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_email_certify` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_login_point` int(11) NOT NULL DEFAULT 0,
                             `cf_cut_name` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_nick_modify` int(11) NOT NULL DEFAULT 0,
                             `cf_new_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_new_rows` int(11) NOT NULL DEFAULT 0,
                             `cf_search_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_connect_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_faq_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_read_point` int(11) NOT NULL DEFAULT 0,
                             `cf_write_point` int(11) NOT NULL DEFAULT 0,
                             `cf_comment_point` int(11) NOT NULL DEFAULT 0,
                             `cf_download_point` int(11) NOT NULL DEFAULT 0,
                             `cf_write_pages` int(11) NOT NULL DEFAULT 0,
                             `cf_mobile_pages` int(11) NOT NULL DEFAULT 0,
                             `cf_link_target` varchar(50) NOT NULL DEFAULT '',
                             `cf_bbs_rewrite` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_delay_sec` int(11) NOT NULL DEFAULT 0,
                             `cf_filter` text NOT NULL,
                             `cf_possible_ip` text NOT NULL,
                             `cf_intercept_ip` text NOT NULL,
                             `cf_analytics` text NOT NULL,
                             `cf_add_meta` text NOT NULL,
                             `cf_syndi_token` varchar(255) NOT NULL,
                             `cf_syndi_except` text NOT NULL,
                             `cf_member_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_use_homepage` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_homepage` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_tel` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_tel` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_hp` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_hp` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_addr` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_addr` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_signature` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_signature` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_profile` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_req_profile` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_register_level` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_register_point` int(11) NOT NULL DEFAULT 0,
                             `cf_icon_level` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_use_recommend` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_recommend_point` int(11) NOT NULL DEFAULT 0,
                             `cf_leave_day` int(11) NOT NULL DEFAULT 0,
                             `cf_search_part` int(11) NOT NULL DEFAULT 0,
                             `cf_email_use` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_wr_super_admin` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_wr_group_admin` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_wr_board_admin` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_wr_write` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_wr_comment_all` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_mb_super_admin` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_mb_member` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_email_po_super_admin` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_prohibit_id` text NOT NULL,
                             `cf_prohibit_email` text NOT NULL,
                             `cf_new_del` int(11) NOT NULL DEFAULT 0,
                             `cf_memo_del` int(11) NOT NULL DEFAULT 0,
                             `cf_visit_del` int(11) NOT NULL DEFAULT 0,
                             `cf_popular_del` int(11) NOT NULL DEFAULT 0,
                             `cf_optimize_date` date NOT NULL DEFAULT '0000-00-00',
                             `cf_use_member_icon` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_member_icon_size` int(11) NOT NULL DEFAULT 0,
                             `cf_member_icon_width` int(11) NOT NULL DEFAULT 0,
                             `cf_member_icon_height` int(11) NOT NULL DEFAULT 0,
                             `cf_member_img_size` int(11) NOT NULL DEFAULT 0,
                             `cf_member_img_width` int(11) NOT NULL DEFAULT 0,
                             `cf_member_img_height` int(11) NOT NULL DEFAULT 0,
                             `cf_login_minutes` int(11) NOT NULL DEFAULT 0,
                             `cf_image_extension` varchar(255) NOT NULL DEFAULT '',
                             `cf_flash_extension` varchar(255) NOT NULL DEFAULT '',
                             `cf_movie_extension` varchar(255) NOT NULL DEFAULT '',
                             `cf_formmail_is_member` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_page_rows` int(11) NOT NULL DEFAULT 0,
                             `cf_mobile_page_rows` int(11) NOT NULL DEFAULT 0,
                             `cf_visit` varchar(255) NOT NULL DEFAULT '',
                             `cf_max_po_id` int(11) NOT NULL DEFAULT 0,
                             `cf_stipulation` text NOT NULL,
                             `cf_privacy` text NOT NULL,
                             `cf_open_modify` int(11) NOT NULL DEFAULT 0,
                             `cf_memo_send_point` int(11) NOT NULL DEFAULT 0,
                             `cf_mobile_new_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_mobile_search_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_mobile_connect_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_mobile_faq_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_mobile_member_skin` varchar(50) NOT NULL DEFAULT '',
                             `cf_captcha_mp3` varchar(255) NOT NULL DEFAULT '',
                             `cf_editor` varchar(50) NOT NULL DEFAULT '',
                             `cf_cert_use` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_cert_find` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_cert_ipin` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_hp` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_simple` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_kg_cd` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_kg_mid` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_kcb_cd` varchar(255) NOT NULL DEFAULT '',
                             `cf_cert_kcp_cd` varchar(255) NOT NULL DEFAULT '',
                             `cf_lg_mid` varchar(100) NOT NULL DEFAULT '',
                             `cf_lg_mert_key` varchar(100) NOT NULL DEFAULT '',
                             `cf_cert_limit` int(11) NOT NULL DEFAULT 0,
                             `cf_cert_req` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_sms_use` varchar(255) NOT NULL DEFAULT '',
                             `cf_sms_type` varchar(10) NOT NULL DEFAULT '',
                             `cf_icode_id` varchar(255) NOT NULL DEFAULT '',
                             `cf_icode_pw` varchar(255) NOT NULL DEFAULT '',
                             `cf_icode_server_ip` varchar(50) NOT NULL DEFAULT '',
                             `cf_icode_server_port` varchar(50) NOT NULL DEFAULT '',
                             `cf_icode_token_key` varchar(100) NOT NULL DEFAULT '',
                             `cf_googl_shorturl_apikey` varchar(50) NOT NULL DEFAULT '',
                             `cf_social_login_use` tinyint(4) NOT NULL DEFAULT 0,
                             `cf_social_servicelist` varchar(255) NOT NULL DEFAULT '',
                             `cf_payco_clientid` varchar(100) NOT NULL DEFAULT '',
                             `cf_payco_secret` varchar(100) NOT NULL DEFAULT '',
                             `cf_facebook_appid` varchar(100) NOT NULL,
                             `cf_facebook_secret` varchar(100) NOT NULL,
                             `cf_twitter_key` varchar(100) NOT NULL,
                             `cf_twitter_secret` varchar(100) NOT NULL,
                             `cf_google_clientid` varchar(100) NOT NULL DEFAULT '',
                             `cf_google_secret` varchar(100) NOT NULL DEFAULT '',
                             `cf_naver_clientid` varchar(100) NOT NULL DEFAULT '',
                             `cf_naver_secret` varchar(100) NOT NULL DEFAULT '',
                             `cf_kakao_rest_key` varchar(100) NOT NULL DEFAULT '',
                             `cf_kakao_client_secret` varchar(100) NOT NULL DEFAULT '',
                             `cf_kakao_js_apikey` varchar(100) NOT NULL,
                             `cf_captcha` varchar(100) NOT NULL DEFAULT '',
                             `cf_recaptcha_site_key` varchar(100) NOT NULL DEFAULT '',
                             `cf_recaptcha_secret_key` varchar(100) NOT NULL DEFAULT '',
                             `cf_1_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_2_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_3_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_4_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_5_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_6_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_7_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_8_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_9_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_10_subj` varchar(255) NOT NULL DEFAULT '',
                             `cf_1` varchar(255) NOT NULL DEFAULT '',
                             `cf_2` varchar(255) NOT NULL DEFAULT '',
                             `cf_3` varchar(255) NOT NULL DEFAULT '',
                             `cf_4` varchar(255) NOT NULL DEFAULT '',
                             `cf_5` varchar(255) NOT NULL DEFAULT '',
                             `cf_6` varchar(255) NOT NULL DEFAULT '',
                             `cf_7` varchar(255) NOT NULL DEFAULT '',
                             `cf_8` varchar(255) NOT NULL DEFAULT '',
                             `cf_9` varchar(255) NOT NULL DEFAULT '',
                             `cf_10` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_config`
--

LOCK TABLES `g5_config` WRITE;
/*!40000 ALTER TABLE `g5_config` DISABLE KEYS */;
INSERT INTO `g5_config` VALUES ('줌마이라이프','basic','zm2life','nimuro@naver.com','줌마이라이프','',1,0,1,0,10,15,60,'theme/basic',15,'theme/basic','theme/basic','theme/basic',0,0,0,0,10,5,'_blank',0,30,'18아,18놈,18새끼,18뇬,18노,18것,18넘,개년,개놈,개뇬,개새,개색끼,개세끼,개세이,개쉐이,개쉑,개쉽,개시키,개자식,개좆,게색기,게색끼,광뇬,뇬,눈깔,뉘미럴,니귀미,니기미,니미,도촬,되질래,뒈져라,뒈진다,디져라,디진다,디질래,병쉰,병신,뻐큐,뻑큐,뽁큐,삐리넷,새꺄,쉬발,쉬밸,쉬팔,쉽알,스패킹,스팽,시벌,시부랄,시부럴,시부리,시불,시브랄,시팍,시팔,시펄,실밸,십8,십쌔,십창,싶알,쌉년,썅놈,쌔끼,쌩쑈,썅,써벌,썩을년,쎄꺄,쎄엑,쓰바,쓰발,쓰벌,쓰팔,씨8,씨댕,씨바,씨발,씨뱅,씨봉알,씨부랄,씨부럴,씨부렁,씨부리,씨불,씨브랄,씨빠,씨빨,씨뽀랄,씨팍,씨팔,씨펄,씹,아가리,아갈이,엄창,접년,잡놈,재랄,저주글,조까,조빠,조쟁이,조지냐,조진다,조질래,존나,존니,좀물,좁년,좃,좆,좇,쥐랄,쥐롤,쥬디,지랄,지럴,지롤,지미랄,쫍빱,凸,퍽큐,뻑큐,빠큐,ㅅㅂㄹㅁ','','','','','','','theme/basic',0,0,0,0,0,0,0,0,1,0,1,0,2,1000,2,0,0,30,10000,1,0,0,0,0,0,0,1,0,'admin,administrator,관리자,운영자,어드민,주인장,webmaster,웹마스터,sysop,시삽,시샵,manager,매니저,메니저,root,루트,su,guest,방문객','',30,180,180,180,'2022-11-19',2,5000,22,22,50000,60,60,10,'gif|jpg|jpeg|png|webp','swf','asx|asf|wmv|wma|mpg|mpeg|mov|avi|mp3',1,15,15,'오늘:102,어제:96,최대:177,전체:727',1,'해당 홈페이지에 맞는 회원가입약관을 입력합니다.','해당 홈페이지에 맞는 개인정보처리방침을 입력합니다.',0,50,'theme/basic','theme/basic','theme/basic','theme/basic','theme/basic','basic','cheditor5',0,0,'','','','','','','','','',2,0,'','','jujh1234','jujh1234!@#','211.172.232.124','7295','','',0,'','','','','','','','','','','','','','','kcaptcha','','','결제여부','','','','','','','','','','1','','','','','','','','','');
/*!40000 ALTER TABLE `g5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_content`
--

DROP TABLE IF EXISTS `g5_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_content` (
                              `co_id` varchar(20) NOT NULL DEFAULT '',
                              `co_html` tinyint(4) NOT NULL DEFAULT 0,
                              `co_subject` varchar(255) NOT NULL DEFAULT '',
                              `co_content` longtext NOT NULL,
                              `co_seo_title` varchar(255) NOT NULL DEFAULT '',
                              `co_mobile_content` longtext NOT NULL,
                              `co_skin` varchar(255) NOT NULL DEFAULT '',
                              `co_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                              `co_tag_filter_use` tinyint(4) NOT NULL DEFAULT 0,
                              `co_hit` int(11) NOT NULL DEFAULT 0,
                              `co_include_head` varchar(255) NOT NULL,
                              `co_include_tail` varchar(255) NOT NULL,
                              PRIMARY KEY (`co_id`),
                              KEY `co_seo_title` (`co_seo_title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_content`
--

LOCK TABLES `g5_content` WRITE;
/*!40000 ALTER TABLE `g5_content` DISABLE KEYS */;
INSERT INTO `g5_content` VALUES ('company',1,'zooma2llife 는?','<p align=\"center\"><b>경단녀를 위한 커뮤니티 입니다.</b></p>\r\n<p align=\"center\"><b>자기개발을 해보세요</b></p>\r\n<p align=\"center\"><b>&nbsp;</b></p>\r\n<p align=\"center\">&nbsp;</p>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n   </blockquote>\r\n<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">여러분의 life 와 함께 발전하는 zoomalife 입니다.</b></blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">&nbsp;</b></blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">즐거운 커뮤니티 문화를 함께 만들어 나가요</b></blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">&nbsp;</b></blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n<blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                        <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                           <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">^&nbsp; &nbsp; &nbsp;^</b></blockquote>\r\n                           </blockquote>\r\n                        </blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                        <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\">\r\n                           <blockquote style=\"margin: 0 0 0 40px; border: none; padding: 0px;\"><b style=\"box-sizing: border-box;\">&nbsp; ----</b></blockquote>\r\n                           </blockquote>\r\n                        </blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n   </blockquote>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n   </blockquote>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n   </blockquote>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n   </blockquote>\r\n','zooma2llife-는','<p align=\"center\">\r\n   <b>경단녀를 위한 커뮤니티 입니다.</b>\r\n</p>\r\n<p align=\"center\">\r\n   <b>자기개발을 해보세요</b>\r\n</p>\r\n<p align=\"center\">\r\n   <b>&nbsp;</b>\r\n</p>\r\n<p align=\"center\">&nbsp;</p>\r\n<blockquote style=\"box-sizing: border-box; font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; background-color: #ffffff; margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"box-sizing: border-box; margin: 0px 0px 0px 40px; border: none; padding: 0px;\"></blockquote>\r\n</blockquote>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">여러분의 life 와 함께 발전하는 zoomalife 입니다.</b>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">&nbsp;</b>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">즐거운 커뮤니티 문화를 함께 만들어 나가요</b>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">&nbsp;</b>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n</blockquote>\r\n<blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                           <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                              <b style=\"font-family: &quot;Malgun Gothic&quot;, dotum, sans-serif; box-sizing: border-box;\">^&nbsp; &nbsp; &nbsp;^</b>\r\n                           </blockquote>\r\n                        </blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n   <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n      <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n         <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n            <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n               <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                  <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                     <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                        <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                           <blockquote style=\"margin: 0px 0px 0px 40px; border: none; padding: 0px;\">\r\n                              <b style=\"box-sizing: border-box;\">&nbsp; ----</b>\r\n                           </blockquote>\r\n                        </blockquote>\r\n                     </blockquote>\r\n                  </blockquote>\r\n               </blockquote>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n</blockquote>\r\n<p align=\"center\"><b></b></p>\r\n<p align=\"center\">\r\n   <b></b>\r\n</p>\r\n','basic','basic',1,0,'',''),('privacy',1,'개인정보 처리방침','<p align=center><b>개인정보 처리방침에 대한 내용을 입력하십시오.</b></p>','개인정보-처리방침','','basic','basic',0,0,'',''),('provision',1,'서비스 이용약관','<p align=center><b>서비스 이용약관에 대한 내용을 입력하십시오.</b></p>','서비스-이용약관','','basic','basic',0,0,'','');
/*!40000 ALTER TABLE `g5_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq`
--

DROP TABLE IF EXISTS `g5_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq` (
                          `fa_id` int(11) NOT NULL AUTO_INCREMENT,
                          `fm_id` int(11) NOT NULL DEFAULT 0,
                          `fa_subject` text NOT NULL,
                          `fa_content` text NOT NULL,
                          `fa_order` int(11) NOT NULL DEFAULT 0,
                          PRIMARY KEY (`fa_id`),
                          KEY `fm_id` (`fm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq`
--

LOCK TABLES `g5_faq` WRITE;
/*!40000 ALTER TABLE `g5_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_faq_master`
--

DROP TABLE IF EXISTS `g5_faq_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_faq_master` (
                                 `fm_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `fm_subject` varchar(255) NOT NULL DEFAULT '',
                                 `fm_head_html` text NOT NULL,
                                 `fm_tail_html` text NOT NULL,
                                 `fm_mobile_head_html` text NOT NULL,
                                 `fm_mobile_tail_html` text NOT NULL,
                                 `fm_order` int(11) NOT NULL DEFAULT 0,
                                 PRIMARY KEY (`fm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_faq_master`
--

LOCK TABLES `g5_faq_master` WRITE;
/*!40000 ALTER TABLE `g5_faq_master` DISABLE KEYS */;
INSERT INTO `g5_faq_master` VALUES (1,'자주하시는 질문','','','','',0);
/*!40000 ALTER TABLE `g5_faq_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group`
--

DROP TABLE IF EXISTS `g5_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group` (
                            `gr_id` varchar(10) NOT NULL DEFAULT '',
                            `gr_subject` varchar(255) NOT NULL DEFAULT '',
                            `gr_device` enum('both','pc','mobile') NOT NULL DEFAULT 'both',
                            `gr_admin` varchar(255) NOT NULL DEFAULT '',
                            `gr_use_access` tinyint(4) NOT NULL DEFAULT 0,
                            `gr_order` int(11) NOT NULL DEFAULT 0,
                            `gr_1_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_2_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_3_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_4_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_5_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_6_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_7_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_8_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_9_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_10_subj` varchar(255) NOT NULL DEFAULT '',
                            `gr_1` varchar(255) NOT NULL DEFAULT '',
                            `gr_2` varchar(255) NOT NULL DEFAULT '',
                            `gr_3` varchar(255) NOT NULL DEFAULT '',
                            `gr_4` varchar(255) NOT NULL DEFAULT '',
                            `gr_5` varchar(255) NOT NULL DEFAULT '',
                            `gr_6` varchar(255) NOT NULL DEFAULT '',
                            `gr_7` varchar(255) NOT NULL DEFAULT '',
                            `gr_8` varchar(255) NOT NULL DEFAULT '',
                            `gr_9` varchar(255) NOT NULL DEFAULT '',
                            `gr_10` varchar(255) NOT NULL DEFAULT '',
                            PRIMARY KEY (`gr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group`
--

LOCK TABLES `g5_group` WRITE;
/*!40000 ALTER TABLE `g5_group` DISABLE KEYS */;
INSERT INTO `g5_group` VALUES ('community','게시판','both','',0,0,'','','','','','','','','','','','','','','','','','','',''),('ebook','전자책','both','',0,0,'','','','','','','','','','','','','','','','','','','',''),('market','강의','both','',0,0,'영상링크','','','','','','','','','','https://www.youtube.com/watch?v=0iEJ3YQHsH8','','','','','','','','',''),('notice','공지사항','both','',0,0,'','','','','','','','','','','','','','','','','','','',''),('somoim','소모임','both','',0,0,'','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_group_member`
--

DROP TABLE IF EXISTS `g5_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_group_member` (
                                   `gm_id` int(11) NOT NULL AUTO_INCREMENT,
                                   `gr_id` varchar(255) NOT NULL DEFAULT '',
                                   `mb_id` varchar(20) NOT NULL DEFAULT '',
                                   `gm_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   PRIMARY KEY (`gm_id`),
                                   KEY `gr_id` (`gr_id`),
                                   KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_group_member`
--

LOCK TABLES `g5_group_member` WRITE;
/*!40000 ALTER TABLE `g5_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_login`
--

DROP TABLE IF EXISTS `g5_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_login` (
                            `lo_ip` varchar(100) NOT NULL DEFAULT '',
                            `mb_id` varchar(20) NOT NULL DEFAULT '',
                            `lo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                            `lo_location` text NOT NULL,
                            `lo_url` text NOT NULL,
                            PRIMARY KEY (`lo_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_login`
--

LOCK TABLES `g5_login` WRITE;
/*!40000 ALTER TABLE `g5_login` DISABLE KEYS */;
INSERT INTO `g5_login` VALUES ('207.46.13.174','','2022-11-19 18:53:19','자유게시판  페이지','/bbs/board.php?bo_table=free'),('40.77.167.61','','2022-11-19 18:56:54','소모임','/bbs/group.php?gr_id=somoim'),('::1','zm2life','2022-11-19 18:53:44','/','');
/*!40000 ALTER TABLE `g5_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_mail`
--

DROP TABLE IF EXISTS `g5_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_mail` (
                           `ma_id` int(11) NOT NULL AUTO_INCREMENT,
                           `ma_subject` varchar(255) NOT NULL DEFAULT '',
                           `ma_content` mediumtext NOT NULL,
                           `ma_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                           `ma_ip` varchar(255) NOT NULL DEFAULT '',
                           `ma_last_option` text NOT NULL,
                           PRIMARY KEY (`ma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_mail`
--

LOCK TABLES `g5_mail` WRITE;
/*!40000 ALTER TABLE `g5_mail` DISABLE KEYS */;
INSERT INTO `g5_mail` VALUES (1,'테스트 발송','<p>헤헤</p>','2022-10-18 21:50:40','::1','');
/*!40000 ALTER TABLE `g5_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member`
--

DROP TABLE IF EXISTS `g5_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member` (
                             `mb_no` int(11) NOT NULL AUTO_INCREMENT,
                             `mb_id` varchar(20) NOT NULL DEFAULT '',
                             `mb_password` varchar(255) NOT NULL DEFAULT '',
                             `mb_name` varchar(255) NOT NULL DEFAULT '',
                             `mb_nick` varchar(255) NOT NULL DEFAULT '',
                             `mb_nick_date` date NOT NULL DEFAULT '0000-00-00',
                             `mb_email` varchar(255) NOT NULL DEFAULT '',
                             `mb_homepage` varchar(255) NOT NULL DEFAULT '',
                             `mb_level` tinyint(4) NOT NULL DEFAULT 0,
                             `mb_sex` char(1) NOT NULL DEFAULT '',
                             `mb_birth` varchar(255) NOT NULL DEFAULT '',
                             `mb_tel` varchar(255) NOT NULL DEFAULT '',
                             `mb_hp` varchar(255) NOT NULL DEFAULT '',
                             `mb_certify` varchar(20) NOT NULL DEFAULT '',
                             `mb_adult` tinyint(4) NOT NULL DEFAULT 0,
                             `mb_dupinfo` varchar(255) NOT NULL DEFAULT '',
                             `mb_zip1` char(3) NOT NULL DEFAULT '',
                             `mb_zip2` char(3) NOT NULL DEFAULT '',
                             `mb_addr1` varchar(255) NOT NULL DEFAULT '',
                             `mb_addr2` varchar(255) NOT NULL DEFAULT '',
                             `mb_addr3` varchar(255) NOT NULL DEFAULT '',
                             `mb_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
                             `mb_signature` text NOT NULL,
                             `mb_recommend` varchar(255) NOT NULL DEFAULT '',
                             `mb_point` int(11) NOT NULL DEFAULT 0,
                             `mb_today_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                             `mb_login_ip` varchar(255) NOT NULL DEFAULT '',
                             `mb_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                             `mb_ip` varchar(255) NOT NULL DEFAULT '',
                             `mb_leave_date` varchar(8) NOT NULL DEFAULT '',
                             `mb_intercept_date` varchar(8) NOT NULL DEFAULT '',
                             `mb_email_certify` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                             `mb_email_certify2` varchar(255) NOT NULL DEFAULT '',
                             `mb_memo` text NOT NULL,
                             `mb_lost_certify` varchar(255) NOT NULL,
                             `mb_mailling` tinyint(4) NOT NULL DEFAULT 0,
                             `mb_sms` tinyint(4) NOT NULL DEFAULT 0,
                             `mb_open` tinyint(4) NOT NULL DEFAULT 0,
                             `mb_open_date` date NOT NULL DEFAULT '0000-00-00',
                             `mb_profile` text NOT NULL,
                             `mb_memo_call` varchar(255) NOT NULL DEFAULT '',
                             `mb_memo_cnt` int(11) NOT NULL DEFAULT 0,
                             `mb_scrap_cnt` int(11) NOT NULL DEFAULT 0,
                             `mb_1` varchar(255) NOT NULL DEFAULT '',
                             `mb_2` varchar(255) NOT NULL DEFAULT '',
                             `mb_3` varchar(255) NOT NULL DEFAULT '',
                             `mb_4` varchar(255) NOT NULL DEFAULT '',
                             `mb_5` varchar(255) NOT NULL DEFAULT '',
                             `mb_6` varchar(255) NOT NULL DEFAULT '',
                             `mb_7` varchar(255) NOT NULL DEFAULT '',
                             `mb_8` varchar(255) NOT NULL DEFAULT '',
                             `mb_9` varchar(255) NOT NULL DEFAULT '',
                             `mb_10` varchar(255) NOT NULL DEFAULT '',
                             PRIMARY KEY (`mb_no`),
                             UNIQUE KEY `mb_id` (`mb_id`),
                             KEY `mb_today_login` (`mb_today_login`),
                             KEY `mb_datetime` (`mb_datetime`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member`
--

LOCK TABLES `g5_member` WRITE;
/*!40000 ALTER TABLE `g5_member` DISABLE KEYS */;
INSERT INTO `g5_member` VALUES (1,'zm2life','sha256:12000:SrAEaWa2n6SH+UXT6ZzHLE4kwKluj/X5:OgXny8zqi4xNY/oUuwW14D100xfrBFjl','최고관리자','최고관리자','2022-10-18','nimuro@naver.com','',10,'','','','','',0,'','','','','','','','','',267,'2022-11-19 18:53:44','::1','2022-10-18 14:36:22','::1','','','2022-10-18 14:36:22','','','',1,0,1,'0000-00-00','','',0,1,'','','','','','','','','',''),(2,'nimuro','sha256:12000:cgNcnUp7oQFviXq4ehbcHACPAz33F3PF:ZAafwrsjIrz2pcTqlKGZC+sC+S1XL+0k','고고싱','고고싱','2022-10-18','nimuro0@gmail.com','',2,'','','','','',0,'','','','','','','','','',1080,'2022-11-14 14:57:58','121.133.32.145','2022-10-18 14:39:36','::1','','','2022-10-18 14:39:36','','','',1,0,1,'2022-10-18','','',0,0,'','','','','','','','','',''),(3,'nimuro2','sha256:12000:jDyEm4ZDzrXILZ5nnsyufK5xxrvTLsjd:lMY8pFNLGYE1PsfJ2MiQWyYCO3vOuSKc','고고싱2','고고싱2','2022-10-18','gogotting7@gmail.com','',2,'','','','','',0,'','','','','','','','','',1030,'2022-11-08 15:08:55','::1','2022-10-18 20:26:12','::1','','','2022-10-18 20:26:12','','','',1,0,1,'2022-10-18','','',0,0,'','','','','','','','','',''),(4,'nimuro3','sha256:12000:DiieCX9NXWu/8R/VTeT7iHq+NQs9+YJc:9kqu84kNzzJow0/ylLRcFlhhR9iaTG/R','니무로3','니무로3','2022-11-08','nimuro3@naver.com','',2,'','','','','',0,'','','','','','','','','',1008,'2022-11-09 12:33:25','::1','2022-11-08 15:09:52','::1','','','2022-11-08 15:09:52','','','',1,0,1,'2022-11-08','','',0,0,'','','','','','','','','','');
/*!40000 ALTER TABLE `g5_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_cert_history`
--

DROP TABLE IF EXISTS `g5_member_cert_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member_cert_history` (
                                          `ch_id` int(11) NOT NULL AUTO_INCREMENT,
                                          `mb_id` varchar(20) NOT NULL DEFAULT '',
                                          `ch_name` varchar(255) NOT NULL DEFAULT '',
                                          `ch_hp` varchar(255) NOT NULL DEFAULT '',
                                          `ch_birth` varchar(255) NOT NULL DEFAULT '',
                                          `ch_type` varchar(20) NOT NULL DEFAULT '',
                                          `ch_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                          PRIMARY KEY (`ch_id`),
                                          KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_cert_history`
--

LOCK TABLES `g5_member_cert_history` WRITE;
/*!40000 ALTER TABLE `g5_member_cert_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_cert_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_member_social_profiles`
--

DROP TABLE IF EXISTS `g5_member_social_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_member_social_profiles` (
                                             `mp_no` int(11) NOT NULL AUTO_INCREMENT,
                                             `mb_id` varchar(255) NOT NULL DEFAULT '',
                                             `provider` varchar(50) NOT NULL DEFAULT '',
                                             `object_sha` varchar(45) NOT NULL DEFAULT '',
                                             `identifier` varchar(255) NOT NULL DEFAULT '',
                                             `profileurl` varchar(255) NOT NULL DEFAULT '',
                                             `photourl` varchar(255) NOT NULL DEFAULT '',
                                             `displayname` varchar(150) NOT NULL DEFAULT '',
                                             `description` varchar(255) NOT NULL DEFAULT '',
                                             `mp_register_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                             `mp_latest_day` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                             UNIQUE KEY `mp_no` (`mp_no`),
                                             KEY `mb_id` (`mb_id`),
                                             KEY `provider` (`provider`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_member_social_profiles`
--

LOCK TABLES `g5_member_social_profiles` WRITE;
/*!40000 ALTER TABLE `g5_member_social_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_member_social_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_memo`
--

DROP TABLE IF EXISTS `g5_memo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_memo` (
                           `me_id` int(11) NOT NULL AUTO_INCREMENT,
                           `me_recv_mb_id` varchar(20) NOT NULL DEFAULT '',
                           `me_send_mb_id` varchar(20) NOT NULL DEFAULT '',
                           `me_send_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                           `me_read_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                           `me_memo` text NOT NULL,
                           `me_send_id` int(11) NOT NULL DEFAULT 0,
                           `me_type` enum('send','recv') NOT NULL DEFAULT 'recv',
                           `me_send_ip` varchar(100) NOT NULL DEFAULT '',
                           PRIMARY KEY (`me_id`),
                           KEY `me_recv_mb_id` (`me_recv_mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_memo`
--

LOCK TABLES `g5_memo` WRITE;
/*!40000 ALTER TABLE `g5_memo` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_memo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_menu`
--

DROP TABLE IF EXISTS `g5_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_menu` (
                           `me_id` int(11) NOT NULL AUTO_INCREMENT,
                           `me_code` varchar(255) NOT NULL DEFAULT '',
                           `me_name` varchar(255) NOT NULL DEFAULT '',
                           `me_link` varchar(255) NOT NULL DEFAULT '',
                           `me_target` varchar(255) NOT NULL DEFAULT '',
                           `me_order` int(11) NOT NULL DEFAULT 0,
                           `me_use` tinyint(4) NOT NULL DEFAULT 0,
                           `me_mobile_use` tinyint(4) NOT NULL DEFAULT 0,
                           PRIMARY KEY (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_menu`
--

LOCK TABLES `g5_menu` WRITE;
/*!40000 ALTER TABLE `g5_menu` DISABLE KEYS */;
INSERT INTO `g5_menu` VALUES (307,'10','줌마이라이프','http://zm2life.com/bbs/content.php?co_id=company','self',0,1,1),(308,'1010','개인정보 처리방침','http://zm2life.com/bbs/content.php?co_id=privacy','self',0,1,1),(309,'1020','서비스 이용약관','http://zm2life.com/bbs/content.php?co_id=provision','self',0,1,1),(310,'20','게시판','http://zm2life.com/bbs/group.php?gr_id=community','self',2,1,1),(311,'2010','자유게시판','http://zm2life.com/bbs/board.php?bo_table=free','self',0,1,1),(312,'2020','오늘 뭐 먹지','http://zm2life.com/bbs/board.php?bo_table=gallery','self',0,1,1),(313,'2030','생활 알뜰 팁','http://zm2life.com/bbs/board.php?bo_table=tip','self',0,1,1),(314,'2040','재테크 이야기','http://zm2life.com/bbs/board.php?bo_table=jaetech','self',0,1,1),(315,'2050','자녀교육 이야기','http://zm2life.com/bbs/board.php?bo_table=edu','self',0,1,1),(316,'30','강의','http://zm2life.com/bbs/group.php?gr_id=market','self',3,1,1),(317,'3010','동영상강의','http://zm2life.com/bbs/board.php?bo_table=class','self',0,1,1),(318,'3020','라이브강의','http://zm2life.com/bbs/board.php?bo_table=class_live','self',0,1,1),(319,'40','전자책','http://zm2life.com/bbs/group.php?gr_id=ebook','self',4,1,1),(320,'4010','전자책','http://zm2life.com/bbs/board.php?bo_table=ebook','self',0,1,1),(321,'50','소모임','http://zm2life.com/bbs/group.php?gr_id=somoim','self',3,1,1),(322,'5010','온라인 소모임','http://zm2life.com/bbs/board.php?bo_table=somoim_on','self',0,1,1),(323,'5020','오프라인 소모임','http://zm2life.com/bbs/board.php?bo_table=somoim_off','self',0,1,1),(324,'60','공지사항','http://zm2life.com/bbs/group.php?gr_id=notice','self',0,1,1),(325,'6010','공지사항','http://zm2life.com/bbs/board.php?bo_table=notice','self',0,1,1),(326,'6020','이용방법','http://zm2life.com/bbs/board.php?bo_table=howtouse','self',0,1,1);
/*!40000 ALTER TABLE `g5_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_new_win`
--

DROP TABLE IF EXISTS `g5_new_win`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_new_win` (
                              `nw_id` int(11) NOT NULL AUTO_INCREMENT,
                              `nw_division` varchar(10) NOT NULL DEFAULT 'both',
                              `nw_device` varchar(10) NOT NULL DEFAULT 'both',
                              `nw_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `nw_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `nw_disable_hours` int(11) NOT NULL DEFAULT 0,
                              `nw_left` int(11) NOT NULL DEFAULT 0,
                              `nw_top` int(11) NOT NULL DEFAULT 0,
                              `nw_height` int(11) NOT NULL DEFAULT 0,
                              `nw_width` int(11) NOT NULL DEFAULT 0,
                              `nw_subject` text NOT NULL,
                              `nw_content` text NOT NULL,
                              `nw_content_html` tinyint(4) NOT NULL DEFAULT 0,
                              PRIMARY KEY (`nw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_new_win`
--

LOCK TABLES `g5_new_win` WRITE;
/*!40000 ALTER TABLE `g5_new_win` DISABLE KEYS */;
INSERT INTO `g5_new_win` VALUES (3,'comm','both','2022-11-08 00:00:00','2023-11-15 23:59:59',24,300,400,200,450,'여러분의 life 와 함께 발전하는 zoomalife','<p>&nbsp;</p>\r\n<blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n   <p><b><span style=\"background-color:#ffffff;\">&nbsp;</span></b></p>\r\n   </blockquote>\r\n<blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n   <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n      <b><span style=\"background-color:#ffffff;\">여러분의 life 와 함께 발전하는 zoomalife 입니다.</span></b>\r\n   </blockquote>\r\n   <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n      <b><span style=\"background-color:#ffffff;\">&nbsp;</span></b>\r\n   </blockquote>\r\n   <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n      <p>\r\n         <span><b><span style=\"background-color:#ffffff;\">즐거운 커뮤니티 문화를 함께 만들어 나가요</span></b></span>\r\n      </p>\r\n      <p><span><b><span style=\"background-color:#ffffff;\">&nbsp;</span></b></span></p>\r\n      </blockquote>\r\n   </blockquote>\r\n<blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n   <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n      <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n         <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\"><b><span style=\"background-color:#ffffff;\">^&nbsp; &nbsp; &nbsp;^</span></b></blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n      <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n         <blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\">\r\n            <p><span><b><span style=\"background-color:#ffffff;\">&nbsp; ----</span></b></span></p>\r\n            </blockquote>\r\n         </blockquote>\r\n      </blockquote>\r\n   </blockquote>\r\n<blockquote style=\"margin:0 0 0 40px;border:none;padding:0px;\"></blockquote>',0);
/*!40000 ALTER TABLE `g5_new_win` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_board_order_data`
--

DROP TABLE IF EXISTS `g5_board_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_board_order_data` (
                                 `od_id` bigint(20) unsigned DEFAULT NULL COMMENT 'order id',
                                 `ms_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `mb_id` varchar(20) NOT NULL DEFAULT '',
                                 `bo_table` varchar(20) NOT NULL DEFAULT '',
                                 `wr_id` varchar(15) NOT NULL DEFAULT '',
                                 `ms_datetime` datetime NOT NULL DEFAULT current_timestamp(),
                                 `dt_pg` varchar(255) DEFAULT '',
                                 PRIMARY KEY (`ms_id`),
                                 KEY `mb_id` (`mb_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_board_order_data`
--

LOCK TABLES `g5_board_order_data` WRITE;
/*!40000 ALTER TABLE `g5_board_order_data` DISABLE KEYS */;
INSERT INTO `g5_board_order_data` VALUES (NULL,1,'zm2life','class','1','2022-11-10 16:14:34',NULL);
/*!40000 ALTER TABLE `g5_board_order_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_point`
--

DROP TABLE IF EXISTS `g5_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_point` (
                            `po_id` int(11) NOT NULL AUTO_INCREMENT,
                            `mb_id` varchar(20) NOT NULL DEFAULT '',
                            `po_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                            `po_content` varchar(255) NOT NULL DEFAULT '',
                            `po_point` int(11) NOT NULL DEFAULT 0,
                            `po_use_point` int(11) NOT NULL DEFAULT 0,
                            `po_expired` tinyint(4) NOT NULL DEFAULT 0,
                            `po_expire_date` date NOT NULL DEFAULT '0000-00-00',
                            `po_mb_point` int(11) NOT NULL DEFAULT 0,
                            `po_rel_table` varchar(20) NOT NULL DEFAULT '',
                            `po_rel_id` varchar(20) NOT NULL DEFAULT '',
                            `po_rel_action` varchar(100) NOT NULL DEFAULT '',
                            PRIMARY KEY (`po_id`),
                            KEY `index1` (`mb_id`,`po_rel_table`,`po_rel_id`,`po_rel_action`),
                            KEY `index2` (`po_expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_point`
--

LOCK TABLES `g5_point` WRITE;
/*!40000 ALTER TABLE `g5_point` DISABLE KEYS */;
INSERT INTO `g5_point` VALUES (1,'zm2life','2022-10-18 14:36:46','2022-10-18 첫로그인',100,3,0,'9999-12-31',100,'@login','zm2life','2022-10-18'),(2,'nimuro','2022-10-18 14:39:36','회원가입 축하',1000,0,0,'9999-12-31',1000,'@member','nimuro','회원가입'),(5,'zm2life','2022-10-18 14:43:08','공지사항 1 글읽기',-1,0,1,'2022-10-18',99,'notice','1','읽기'),(8,'nimuro2','2022-10-18 20:26:12','회원가입 축하',1000,0,0,'9999-12-31',1000,'@member','nimuro2','회원가입'),(12,'nimuro2','2022-10-21 15:20:58','2022-10-21 첫로그인',10,0,0,'9999-12-31',1010,'@login','nimuro2','2022-10-21'),(13,'nimuro','2022-10-21 15:21:16','2022-10-21 첫로그인',10,0,0,'9999-12-31',1010,'@login','nimuro','2022-10-21'),(14,'nimuro','2022-10-24 23:47:37','2022-10-24 첫로그인',10,0,0,'9999-12-31',1020,'@login','nimuro','2022-10-24'),(15,'nimuro','2022-10-25 00:39:19','2022-10-25 첫로그인',10,0,0,'9999-12-31',1030,'@login','nimuro','2022-10-25'),(16,'zm2life','2022-10-25 00:41:40','2022-10-25 첫로그인',10,0,0,'9999-12-31',109,'@login','zm2life','2022-10-25'),(17,'nimuro2','2022-10-25 01:08:50','2022-10-25 첫로그인',10,0,0,'9999-12-31',1020,'@login','nimuro2','2022-10-25'),(18,'zm2life','2022-10-28 15:37:22','2022-10-28 첫로그인',10,0,0,'9999-12-31',119,'@login','zm2life','2022-10-28'),(20,'zm2life','2022-10-30 16:19:47','2022-10-30 첫로그인',10,0,0,'9999-12-31',129,'@login','zm2life','2022-10-30'),(21,'zm2life','2022-10-31 11:11:31','2022-10-31 첫로그인',10,0,0,'9999-12-31',139,'@login','zm2life','2022-10-31'),(22,'zm2life','2022-11-02 20:17:18','2022-11-02 첫로그인',10,0,0,'9999-12-31',149,'@login','zm2life','2022-11-02'),(23,'nimuro','2022-11-02 22:12:30','2022-11-02 첫로그인',10,0,0,'9999-12-31',1040,'@login','nimuro','2022-11-02'),(24,'nimuro','2022-11-03 00:01:35','2022-11-03 첫로그인',10,0,0,'9999-12-31',1050,'@login','nimuro','2022-11-03'),(25,'zm2life','2022-11-03 02:53:28','2022-11-03 첫로그인',10,0,0,'9999-12-31',159,'@login','zm2life','2022-11-03'),(26,'zm2life','2022-11-04 11:29:21','2022-11-04 첫로그인',10,0,0,'9999-12-31',169,'@login','zm2life','2022-11-04'),(28,'zm2life','2022-11-04 17:10:57','자유게시판 1 글읽기',-1,0,1,'2022-11-04',168,'free','1','읽기'),(29,'zm2life','2022-11-07 20:40:40','2022-11-07 첫로그인',10,0,0,'9999-12-31',178,'@login','zm2life','2022-11-07'),(31,'zm2life','2022-11-08 13:25:21','2022-11-08 첫로그인',10,0,0,'9999-12-31',188,'@login','zm2life','2022-11-08'),(37,'nimuro','2022-11-08 15:05:28','2022-11-08 첫로그인',10,0,0,'9999-12-31',1060,'@login','nimuro','2022-11-08'),(38,'nimuro2','2022-11-08 15:08:55','2022-11-08 첫로그인',10,0,0,'9999-12-31',1030,'@login','nimuro2','2022-11-08'),(39,'nimuro3','2022-11-08 15:09:52','회원가입 축하',1000,2,0,'9999-12-31',1000,'@member','nimuro3','회원가입'),(40,'zm2life','2022-11-09 09:40:31','2022-11-09 첫로그인',10,0,0,'9999-12-31',198,'@login','zm2life','2022-11-09'),(43,'nimuro3','2022-11-09 12:33:25','2022-11-09 첫로그인',10,0,0,'9999-12-31',1010,'@login','nimuro3','2022-11-09'),(45,'nimuro3','2022-11-09 12:36:37','자유게시판 3 글읽기',-1,0,1,'2022-11-09',1009,'free','3','읽기'),(46,'nimuro3','2022-11-09 13:14:18','공지사항 1 글읽기',-1,0,1,'2022-11-09',1008,'notice','1','읽기'),(47,'zm2life','2022-11-09 13:35:35','자유게시판 9 글읽기',-1,0,1,'2022-11-09',197,'free','9','읽기'),(49,'zm2life','2022-11-10 15:51:06','2022-11-10 첫로그인',10,0,0,'9999-12-31',207,'@login','zm2life','2022-11-10'),(50,'zm2life','2022-11-11 00:03:04','2022-11-11 첫로그인',10,0,0,'9999-12-31',217,'@login','zm2life','2022-11-11'),(51,'zm2life','2022-11-12 11:08:29','2022-11-12 첫로그인',10,0,0,'9999-12-31',227,'@login','zm2life','2022-11-12'),(54,'zm2life','2022-11-13 04:43:08','2022-11-13 첫로그인',10,0,0,'9999-12-31',237,'@login','zm2life','2022-11-13'),(55,'nimuro','2022-11-13 08:31:26','2022-11-13 첫로그인',10,0,0,'9999-12-31',1070,'@login','nimuro','2022-11-13'),(57,'nimuro','2022-11-14 14:57:58','2022-11-14 첫로그인',10,0,0,'9999-12-31',1080,'@login','nimuro','2022-11-14'),(58,'zm2life','2022-11-16 04:41:57','2022-11-16 첫로그인',10,0,0,'9999-12-31',247,'@login','zm2life','2022-11-16'),(59,'zm2life','2022-11-18 14:43:46','2022-11-18 첫로그인',10,0,0,'9999-12-31',257,'@login','zm2life','2022-11-18'),(60,'zm2life','2022-11-19 18:53:44','2022-11-19 첫로그인',10,0,0,'9999-12-31',267,'@login','zm2life','2022-11-19');
/*!40000 ALTER TABLE `g5_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll`
--

DROP TABLE IF EXISTS `g5_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll` (
                           `po_id` int(11) NOT NULL AUTO_INCREMENT,
                           `po_subject` varchar(255) NOT NULL DEFAULT '',
                           `po_poll1` varchar(255) NOT NULL DEFAULT '',
                           `po_poll2` varchar(255) NOT NULL DEFAULT '',
                           `po_poll3` varchar(255) NOT NULL DEFAULT '',
                           `po_poll4` varchar(255) NOT NULL DEFAULT '',
                           `po_poll5` varchar(255) NOT NULL DEFAULT '',
                           `po_poll6` varchar(255) NOT NULL DEFAULT '',
                           `po_poll7` varchar(255) NOT NULL DEFAULT '',
                           `po_poll8` varchar(255) NOT NULL DEFAULT '',
                           `po_poll9` varchar(255) NOT NULL DEFAULT '',
                           `po_cnt1` int(11) NOT NULL DEFAULT 0,
                           `po_cnt2` int(11) NOT NULL DEFAULT 0,
                           `po_cnt3` int(11) NOT NULL DEFAULT 0,
                           `po_cnt4` int(11) NOT NULL DEFAULT 0,
                           `po_cnt5` int(11) NOT NULL DEFAULT 0,
                           `po_cnt6` int(11) NOT NULL DEFAULT 0,
                           `po_cnt7` int(11) NOT NULL DEFAULT 0,
                           `po_cnt8` int(11) NOT NULL DEFAULT 0,
                           `po_cnt9` int(11) NOT NULL DEFAULT 0,
                           `po_etc` varchar(255) NOT NULL DEFAULT '',
                           `po_level` tinyint(4) NOT NULL DEFAULT 0,
                           `po_point` int(11) NOT NULL DEFAULT 0,
                           `po_date` date NOT NULL DEFAULT '0000-00-00',
                           `po_ips` mediumtext NOT NULL,
                           `mb_ids` text NOT NULL,
                           `po_use` tinyint(4) NOT NULL DEFAULT 0,
                           PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll`
--

LOCK TABLES `g5_poll` WRITE;
/*!40000 ALTER TABLE `g5_poll` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_poll_etc`
--

DROP TABLE IF EXISTS `g5_poll_etc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_poll_etc` (
                               `pc_id` int(11) NOT NULL DEFAULT 0,
                               `po_id` int(11) NOT NULL DEFAULT 0,
                               `mb_id` varchar(20) NOT NULL DEFAULT '',
                               `pc_name` varchar(255) NOT NULL DEFAULT '',
                               `pc_idea` varchar(255) NOT NULL DEFAULT '',
                               `pc_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                               PRIMARY KEY (`pc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_poll_etc`
--

LOCK TABLES `g5_poll_etc` WRITE;
/*!40000 ALTER TABLE `g5_poll_etc` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_poll_etc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_popular`
--

DROP TABLE IF EXISTS `g5_popular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_popular` (
                              `pp_id` int(11) NOT NULL AUTO_INCREMENT,
                              `pp_word` varchar(50) NOT NULL DEFAULT '',
                              `pp_date` date NOT NULL DEFAULT '0000-00-00',
                              `pp_ip` varchar(50) NOT NULL DEFAULT '',
                              PRIMARY KEY (`pp_id`),
                              UNIQUE KEY `index1` (`pp_date`,`pp_word`,`pp_ip`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_popular`
--

LOCK TABLES `g5_popular` WRITE;
/*!40000 ALTER TABLE `g5_popular` DISABLE KEYS */;
INSERT INTO `g5_popular` VALUES (1,'클래스','2022-10-28','::1'),(2,'페이스','2022-10-28','::1'),(5,'클래스','2022-10-30','::1'),(6,'페이스','2022-10-30','::1'),(17,'zm2life','2022-11-09','::1'),(13,'일런머스크','2022-11-09','::1'),(20,'최고관리자','2022-11-09','::1'),(19,'최고관리자님','2022-11-09','::1'),(25,'라이브강의','2022-11-11','::1'),(26,'소모임','2022-11-11','::1'),(39,'라이브강의','2022-11-13','139.99.61.171'),(75,'라이브강의','2022-11-13','146.59.157.229'),(27,'라이브강의','2022-11-13','54.36.162.160'),(41,'소모임','2022-11-13','139.99.61.171'),(77,'소모임','2022-11-13','146.59.157.229'),(29,'소모임','2022-11-13','54.36.162.160'),(225,'라이브강의','2022-11-14','111.7.100.20'),(226,'라이브강의','2022-11-14','111.7.100.22'),(91,'라이브강의','2022-11-14','146.59.157.229'),(198,'라이브강의','2022-11-14','51.195.216.255'),(170,'라이브강의','2022-11-14','51.195.90.229'),(95,'라이브강의','2022-11-14','51.210.182.66'),(134,'라이브강의','2022-11-14','54.37.233.116'),(223,'소모임','2022-11-14','111.7.100.20'),(224,'소모임','2022-11-14','111.7.100.22'),(222,'소모임','2022-11-14','111.7.100.23'),(93,'소모임','2022-11-14','146.59.157.229'),(200,'소모임','2022-11-14','51.195.216.255'),(172,'소모임','2022-11-14','51.195.90.229'),(97,'소모임','2022-11-14','51.210.182.66'),(136,'소모임','2022-11-14','54.37.233.116'),(243,'라이브강의','2022-11-15','111.7.100.20'),(241,'라이브강의','2022-11-15','111.7.100.21'),(228,'라이브강의','2022-11-15','111.7.100.24'),(236,'라이브강의','2022-11-15','148.251.168.205'),(234,'라이브강의','2022-11-15','157.55.39.96'),(235,'소모임','2022-11-15','148.251.168.205'),(245,'소모임','2022-11-15','36.99.136.130'),(246,'소모임','2022-11-15','36.99.136.133'),(229,'소모임','2022-11-15','36.99.136.134'),(232,'소모임','2022-11-15','36.99.136.135'),(247,'ë¼ì´ë¸Œê°•ì˜','2022-11-18','207.46.13.174'),(248,'ë¼ì´ë¸Œê°•ì˜','2022-11-19','111.7.100.25'),(249,'ë¼ì´ë¸Œê°•ì˜','2022-11-19','111.7.100.27'),(250,'ë¼ì´ë¸Œê°•ì˜','2022-11-19','207.46.13.174');
/*!40000 ALTER TABLE `g5_popular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_config`
--

DROP TABLE IF EXISTS `g5_qa_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_config` (
                                `qa_title` varchar(255) NOT NULL DEFAULT '',
                                `qa_category` varchar(255) NOT NULL DEFAULT '',
                                `qa_skin` varchar(255) NOT NULL DEFAULT '',
                                `qa_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                                `qa_use_email` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_req_email` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_use_hp` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_req_hp` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_use_sms` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_send_number` varchar(255) NOT NULL DEFAULT '0',
                                `qa_admin_hp` varchar(255) NOT NULL DEFAULT '',
                                `qa_admin_email` varchar(255) NOT NULL DEFAULT '',
                                `qa_use_editor` tinyint(4) NOT NULL DEFAULT 0,
                                `qa_subject_len` int(11) NOT NULL DEFAULT 0,
                                `qa_mobile_subject_len` int(11) NOT NULL DEFAULT 0,
                                `qa_page_rows` int(11) NOT NULL DEFAULT 0,
                                `qa_mobile_page_rows` int(11) NOT NULL DEFAULT 0,
                                `qa_image_width` int(11) NOT NULL DEFAULT 0,
                                `qa_upload_size` int(11) NOT NULL DEFAULT 0,
                                `qa_insert_content` text NOT NULL,
                                `qa_include_head` varchar(255) NOT NULL DEFAULT '',
                                `qa_include_tail` varchar(255) NOT NULL DEFAULT '',
                                `qa_content_head` text NOT NULL,
                                `qa_content_tail` text NOT NULL,
                                `qa_mobile_content_head` text NOT NULL,
                                `qa_mobile_content_tail` text NOT NULL,
                                `qa_1_subj` varchar(255) NOT NULL DEFAULT '',
                                `qa_2_subj` varchar(255) NOT NULL DEFAULT '',
                                `qa_3_subj` varchar(255) NOT NULL DEFAULT '',
                                `qa_4_subj` varchar(255) NOT NULL DEFAULT '',
                                `qa_5_subj` varchar(255) NOT NULL DEFAULT '',
                                `qa_1` varchar(255) NOT NULL DEFAULT '',
                                `qa_2` varchar(255) NOT NULL DEFAULT '',
                                `qa_3` varchar(255) NOT NULL DEFAULT '',
                                `qa_4` varchar(255) NOT NULL DEFAULT '',
                                `qa_5` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_config`
--

LOCK TABLES `g5_qa_config` WRITE;
/*!40000 ALTER TABLE `g5_qa_config` DISABLE KEYS */;
INSERT INTO `g5_qa_config` VALUES ('1:1문의','회원|포인트','theme/basic','theme/basic',1,0,1,0,0,'0','','',1,60,30,15,15,600,1048576,'','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_qa_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_qa_content`
--

DROP TABLE IF EXISTS `g5_qa_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_qa_content` (
                                 `qa_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `qa_num` int(11) NOT NULL DEFAULT 0,
                                 `qa_parent` int(11) NOT NULL DEFAULT 0,
                                 `qa_related` int(11) NOT NULL DEFAULT 0,
                                 `mb_id` varchar(20) NOT NULL DEFAULT '',
                                 `qa_name` varchar(255) NOT NULL DEFAULT '',
                                 `qa_email` varchar(255) NOT NULL DEFAULT '',
                                 `qa_hp` varchar(255) NOT NULL DEFAULT '',
                                 `qa_type` tinyint(4) NOT NULL DEFAULT 0,
                                 `qa_category` varchar(255) NOT NULL DEFAULT '',
                                 `qa_email_recv` tinyint(4) NOT NULL DEFAULT 0,
                                 `qa_sms_recv` tinyint(4) NOT NULL DEFAULT 0,
                                 `qa_html` tinyint(4) NOT NULL DEFAULT 0,
                                 `qa_subject` varchar(255) NOT NULL DEFAULT '',
                                 `qa_content` text NOT NULL,
                                 `qa_status` tinyint(4) NOT NULL DEFAULT 0,
                                 `qa_file1` varchar(255) NOT NULL DEFAULT '',
                                 `qa_source1` varchar(255) NOT NULL DEFAULT '',
                                 `qa_file2` varchar(255) NOT NULL DEFAULT '',
                                 `qa_source2` varchar(255) NOT NULL DEFAULT '',
                                 `qa_ip` varchar(255) NOT NULL DEFAULT '',
                                 `qa_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 `qa_1` varchar(255) NOT NULL DEFAULT '',
                                 `qa_2` varchar(255) NOT NULL DEFAULT '',
                                 `qa_3` varchar(255) NOT NULL DEFAULT '',
                                 `qa_4` varchar(255) NOT NULL DEFAULT '',
                                 `qa_5` varchar(255) NOT NULL DEFAULT '',
                                 PRIMARY KEY (`qa_id`),
                                 KEY `qa_num_parent` (`qa_num`,`qa_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_qa_content`
--

LOCK TABLES `g5_qa_content` WRITE;
/*!40000 ALTER TABLE `g5_qa_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_qa_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_scrap`
--

DROP TABLE IF EXISTS `g5_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_scrap` (
                            `ms_id` int(11) NOT NULL AUTO_INCREMENT,
                            `mb_id` varchar(20) NOT NULL DEFAULT '',
                            `bo_table` varchar(20) NOT NULL DEFAULT '',
                            `wr_id` varchar(15) NOT NULL DEFAULT '',
                            `ms_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                            PRIMARY KEY (`ms_id`),
                            KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_scrap`
--

LOCK TABLES `g5_scrap` WRITE;
/*!40000 ALTER TABLE `g5_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_banner`
--

DROP TABLE IF EXISTS `g5_shop_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_banner` (
                                  `bn_id` int(11) NOT NULL AUTO_INCREMENT,
                                  `bn_alt` varchar(255) NOT NULL DEFAULT '',
                                  `bn_url` varchar(255) NOT NULL DEFAULT '',
                                  `bn_device` varchar(10) NOT NULL DEFAULT '',
                                  `bn_position` varchar(255) NOT NULL DEFAULT '',
                                  `bn_border` tinyint(4) NOT NULL DEFAULT 0,
                                  `bn_new_win` tinyint(4) NOT NULL DEFAULT 0,
                                  `bn_begin_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  `bn_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  `bn_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  `bn_hit` int(11) NOT NULL DEFAULT 0,
                                  `bn_order` int(11) NOT NULL DEFAULT 0,
                                  PRIMARY KEY (`bn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_banner`
--

LOCK TABLES `g5_shop_banner` WRITE;
/*!40000 ALTER TABLE `g5_shop_banner` DISABLE KEYS */;
INSERT INTO `g5_shop_banner` VALUES (2,'테스트2','http://localhost:8080/','both','왼쪽',1,0,'2022-11-08 00:00:00','2022-12-09 00:00:00','2022-11-13 07:01:22',37,50),(4,'풍백 블로그','https://blog.naver.com/poongbaek24','both','메인',0,1,'2022-11-08 00:00:00','2022-12-09 00:00:00','2022-11-12 13:08:21',27,50);
/*!40000 ALTER TABLE `g5_shop_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_cart`
--

DROP TABLE IF EXISTS `g5_shop_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_cart` (
                                `ct_id` int(11) NOT NULL AUTO_INCREMENT,
                                `od_id` bigint(20) unsigned NOT NULL,
                                `mb_id` varchar(255) NOT NULL DEFAULT '',
                                `it_id` varchar(20) NOT NULL DEFAULT '',
                                `it_name` varchar(255) NOT NULL DEFAULT '',
                                `it_sc_type` tinyint(4) NOT NULL DEFAULT 0,
                                `it_sc_method` tinyint(4) NOT NULL DEFAULT 0,
                                `it_sc_price` int(11) NOT NULL DEFAULT 0,
                                `it_sc_minimum` int(11) NOT NULL DEFAULT 0,
                                `it_sc_qty` int(11) NOT NULL DEFAULT 0,
                                `ct_status` varchar(255) NOT NULL DEFAULT '',
                                `ct_history` text NOT NULL,
                                `ct_price` int(11) NOT NULL DEFAULT 0,
                                `ct_point` int(11) NOT NULL DEFAULT 0,
                                `cp_price` int(11) NOT NULL DEFAULT 0,
                                `ct_point_use` tinyint(4) NOT NULL DEFAULT 0,
                                `ct_stock_use` tinyint(4) NOT NULL DEFAULT 0,
                                `ct_option` varchar(255) NOT NULL DEFAULT '',
                                `ct_qty` int(11) NOT NULL DEFAULT 0,
                                `ct_notax` tinyint(4) NOT NULL DEFAULT 0,
                                `io_id` varchar(255) NOT NULL DEFAULT '',
                                `io_type` tinyint(4) NOT NULL DEFAULT 0,
                                `io_price` int(11) NOT NULL DEFAULT 0,
                                `ct_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `ct_ip` varchar(25) NOT NULL DEFAULT '',
                                `ct_send_cost` tinyint(4) NOT NULL DEFAULT 0,
                                `ct_direct` tinyint(4) NOT NULL DEFAULT 0,
                                `ct_select` tinyint(4) NOT NULL DEFAULT 0,
                                `ct_select_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                PRIMARY KEY (`ct_id`),
                                KEY `od_id` (`od_id`),
                                KEY `it_id` (`it_id`),
                                KEY `ct_status` (`ct_status`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_cart`
--

LOCK TABLES `g5_shop_cart` WRITE;
/*!40000 ALTER TABLE `g5_shop_cart` DISABLE KEYS */;
INSERT INTO `g5_shop_cart` VALUES (23,2022110722350823,'zm2life','1667115059','강의 상품 테스트',1,0,0,0,0,'쇼핑','',0,0,0,0,0,'강의 상품 테스트',1,0,'',0,0,'2022-11-08 15:00:53','1',2,1,0,'2022-11-08 15:00:53'),(24,2022111316331989,'nimuro','1668222822','전자책 테스트',0,0,0,0,0,'쇼핑','',0,0,0,0,0,'전자책 테스트',1,0,'',0,0,'2022-11-13 16:33:19','192.168.0.8',0,1,0,'2022-11-13 16:33:19'),(25,2022111318053104,'zm2life','1667115059','강의 상품 테스트',1,0,0,0,0,'쇼핑','',0,0,0,0,0,'강의 상품 테스트',1,0,'',0,0,'2022-11-13 18:05:31','192.168.0.1',2,1,0,'2022-11-13 18:05:31');
/*!40000 ALTER TABLE `g5_shop_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_category`
--

DROP TABLE IF EXISTS `g5_shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_category` (
                                    `ca_id` varchar(10) NOT NULL DEFAULT '0',
                                    `ca_name` varchar(255) NOT NULL DEFAULT '',
                                    `ca_order` int(11) NOT NULL DEFAULT 0,
                                    `ca_skin_dir` varchar(255) NOT NULL DEFAULT '',
                                    `ca_mobile_skin_dir` varchar(255) NOT NULL DEFAULT '',
                                    `ca_skin` varchar(255) NOT NULL DEFAULT '',
                                    `ca_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                                    `ca_img_width` int(11) NOT NULL DEFAULT 0,
                                    `ca_img_height` int(11) NOT NULL DEFAULT 0,
                                    `ca_mobile_img_width` int(11) NOT NULL DEFAULT 0,
                                    `ca_mobile_img_height` int(11) NOT NULL DEFAULT 0,
                                    `ca_sell_email` varchar(255) NOT NULL DEFAULT '',
                                    `ca_use` tinyint(4) NOT NULL DEFAULT 0,
                                    `ca_stock_qty` int(11) NOT NULL DEFAULT 0,
                                    `ca_explan_html` tinyint(4) NOT NULL DEFAULT 0,
                                    `ca_head_html` text NOT NULL,
                                    `ca_tail_html` text NOT NULL,
                                    `ca_mobile_head_html` text NOT NULL,
                                    `ca_mobile_tail_html` text NOT NULL,
                                    `ca_list_mod` int(11) NOT NULL DEFAULT 0,
                                    `ca_list_row` int(11) NOT NULL DEFAULT 0,
                                    `ca_mobile_list_mod` int(11) NOT NULL DEFAULT 0,
                                    `ca_mobile_list_row` int(11) NOT NULL DEFAULT 0,
                                    `ca_include_head` varchar(255) NOT NULL DEFAULT '',
                                    `ca_include_tail` varchar(255) NOT NULL DEFAULT '',
                                    `ca_mb_id` varchar(255) NOT NULL DEFAULT '',
                                    `ca_cert_use` tinyint(4) NOT NULL DEFAULT 0,
                                    `ca_adult_use` tinyint(4) NOT NULL DEFAULT 0,
                                    `ca_nocoupon` tinyint(4) NOT NULL DEFAULT 0,
                                    `ca_1_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_2_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_3_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_4_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_5_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_6_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_7_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_8_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_9_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_10_subj` varchar(255) NOT NULL DEFAULT '',
                                    `ca_1` varchar(255) NOT NULL DEFAULT '',
                                    `ca_2` varchar(255) NOT NULL DEFAULT '',
                                    `ca_3` varchar(255) NOT NULL DEFAULT '',
                                    `ca_4` varchar(255) NOT NULL DEFAULT '',
                                    `ca_5` varchar(255) NOT NULL DEFAULT '',
                                    `ca_6` varchar(255) NOT NULL DEFAULT '',
                                    `ca_7` varchar(255) NOT NULL DEFAULT '',
                                    `ca_8` varchar(255) NOT NULL DEFAULT '',
                                    `ca_9` varchar(255) NOT NULL DEFAULT '',
                                    `ca_10` varchar(255) NOT NULL DEFAULT '',
                                    PRIMARY KEY (`ca_id`),
                                    KEY `ca_order` (`ca_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_category`
--

LOCK TABLES `g5_shop_category` WRITE;
/*!40000 ALTER TABLE `g5_shop_category` DISABLE KEYS */;
INSERT INTO `g5_shop_category` VALUES ('10','강의/멘토링',0,'','','list.10.skin.php','list.10.skin.php',230,230,230,230,'',1,99999,1,'','','','',3,5,3,5,'','','',0,0,0,'','','','','','','','','','','','','','','','','','','',''),('20','출판(오프/전자/해외)',0,'','','list.10.skin.php','list.10.skin.php',230,230,230,230,'',1,99999,1,'','','','',3,5,3,5,'','','',0,0,0,'','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_shop_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon`
--

DROP TABLE IF EXISTS `g5_shop_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_coupon` (
                                  `cp_no` int(11) NOT NULL AUTO_INCREMENT,
                                  `cp_id` varchar(100) NOT NULL DEFAULT '',
                                  `cp_subject` varchar(255) NOT NULL DEFAULT '',
                                  `cp_method` tinyint(4) NOT NULL DEFAULT 0,
                                  `cp_target` varchar(255) NOT NULL DEFAULT '',
                                  `mb_id` varchar(255) NOT NULL DEFAULT '',
                                  `cz_id` int(11) NOT NULL DEFAULT 0,
                                  `cp_start` date NOT NULL DEFAULT '0000-00-00',
                                  `cp_end` date NOT NULL DEFAULT '0000-00-00',
                                  `cp_price` int(11) NOT NULL DEFAULT 0,
                                  `cp_type` tinyint(4) NOT NULL DEFAULT 0,
                                  `cp_trunc` int(11) NOT NULL DEFAULT 0,
                                  `cp_minimum` int(11) NOT NULL DEFAULT 0,
                                  `cp_maximum` int(11) NOT NULL DEFAULT 0,
                                  `od_id` bigint(20) unsigned NOT NULL,
                                  `cp_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  PRIMARY KEY (`cp_no`),
                                  UNIQUE KEY `cp_id` (`cp_id`),
                                  KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon`
--

LOCK TABLES `g5_shop_coupon` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon_log`
--

DROP TABLE IF EXISTS `g5_shop_coupon_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_coupon_log` (
                                      `cl_id` int(11) NOT NULL AUTO_INCREMENT,
                                      `cp_id` varchar(100) NOT NULL DEFAULT '',
                                      `mb_id` varchar(100) NOT NULL DEFAULT '',
                                      `od_id` bigint(20) NOT NULL,
                                      `cp_price` int(11) NOT NULL DEFAULT 0,
                                      `cl_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      PRIMARY KEY (`cl_id`),
                                      KEY `mb_id` (`mb_id`),
                                      KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon_log`
--

LOCK TABLES `g5_shop_coupon_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_coupon_zone`
--

DROP TABLE IF EXISTS `g5_shop_coupon_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_coupon_zone` (
                                       `cz_id` int(11) NOT NULL AUTO_INCREMENT,
                                       `cz_type` tinyint(4) NOT NULL DEFAULT 0,
                                       `cz_subject` varchar(255) NOT NULL DEFAULT '',
                                       `cz_start` date NOT NULL DEFAULT '0000-00-00',
                                       `cz_end` date NOT NULL DEFAULT '0000-00-00',
                                       `cz_file` varchar(255) NOT NULL DEFAULT '',
                                       `cz_period` int(11) NOT NULL DEFAULT 0,
                                       `cz_point` int(11) NOT NULL DEFAULT 0,
                                       `cp_method` tinyint(4) NOT NULL DEFAULT 0,
                                       `cp_target` varchar(255) NOT NULL DEFAULT '',
                                       `cp_price` int(11) NOT NULL DEFAULT 0,
                                       `cp_type` tinyint(4) NOT NULL DEFAULT 0,
                                       `cp_trunc` int(11) NOT NULL DEFAULT 0,
                                       `cp_minimum` int(11) NOT NULL DEFAULT 0,
                                       `cp_maximum` int(11) NOT NULL DEFAULT 0,
                                       `cz_download` int(11) NOT NULL DEFAULT 0,
                                       `cz_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                       PRIMARY KEY (`cz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_coupon_zone`
--

LOCK TABLES `g5_shop_coupon_zone` WRITE;
/*!40000 ALTER TABLE `g5_shop_coupon_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_coupon_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_default`
--

DROP TABLE IF EXISTS `g5_shop_default`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_default` (
                                   `de_admin_company_owner` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_name` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_saupja_no` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_tel` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_fax` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_tongsin_no` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_zip` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_company_addr` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_info_name` varchar(255) NOT NULL DEFAULT '',
                                   `de_admin_info_email` varchar(255) NOT NULL DEFAULT '',
                                   `de_shop_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_shop_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type1_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_type1_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type1_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_type1_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_type1_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_type1_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_type2_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_type2_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type2_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_type2_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_type2_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_type2_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_type3_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_type3_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type3_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_type3_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_type3_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_type3_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_type4_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_type4_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type4_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_type4_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_type4_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_type4_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_type5_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_type5_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_type5_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_type5_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_type5_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_type5_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type1_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_type1_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_type1_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type1_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type1_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type1_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type2_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_type2_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_type2_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type2_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type2_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type2_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type3_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_type3_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_type3_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type3_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type3_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type3_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type4_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_type4_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_type4_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type4_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type4_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type4_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type5_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_type5_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_type5_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type5_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type5_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_type5_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_rel_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_rel_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_rel_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_rel_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_rel_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_rel_list_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_mobile_rel_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_rel_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_rel_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_rel_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_search_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_search_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_search_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_search_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_search_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_search_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_search_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_search_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_search_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_search_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_listtype_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_listtype_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_listtype_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_listtype_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_listtype_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_listtype_list_skin` varchar(255) NOT NULL DEFAULT '',
                                   `de_mobile_listtype_list_mod` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_listtype_list_row` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_listtype_img_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mobile_listtype_img_height` int(11) NOT NULL DEFAULT 0,
                                   `de_bank_use` int(11) NOT NULL DEFAULT 0,
                                   `de_bank_account` text NOT NULL,
                                   `de_card_test` int(11) NOT NULL DEFAULT 0,
                                   `de_card_use` int(11) NOT NULL DEFAULT 0,
                                   `de_card_noint_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_card_point` int(11) NOT NULL DEFAULT 0,
                                   `de_settle_min_point` int(11) NOT NULL DEFAULT 0,
                                   `de_settle_max_point` int(11) NOT NULL DEFAULT 0,
                                   `de_settle_point_unit` int(11) NOT NULL DEFAULT 0,
                                   `de_level_sell` int(11) NOT NULL DEFAULT 0,
                                   `de_delivery_company` varchar(255) NOT NULL DEFAULT '',
                                   `de_send_cost_case` varchar(255) NOT NULL DEFAULT '',
                                   `de_send_cost_limit` varchar(255) NOT NULL DEFAULT '',
                                   `de_send_cost_list` varchar(255) NOT NULL DEFAULT '',
                                   `de_hope_date_use` int(11) NOT NULL DEFAULT 0,
                                   `de_hope_date_after` int(11) NOT NULL DEFAULT 0,
                                   `de_baesong_content` text NOT NULL,
                                   `de_change_content` text NOT NULL,
                                   `de_point_days` int(11) NOT NULL DEFAULT 0,
                                   `de_simg_width` int(11) NOT NULL DEFAULT 0,
                                   `de_simg_height` int(11) NOT NULL DEFAULT 0,
                                   `de_mimg_width` int(11) NOT NULL DEFAULT 0,
                                   `de_mimg_height` int(11) NOT NULL DEFAULT 0,
                                   `de_sms_cont1` text NOT NULL,
                                   `de_sms_cont2` text NOT NULL,
                                   `de_sms_cont3` text NOT NULL,
                                   `de_sms_cont4` text NOT NULL,
                                   `de_sms_cont5` text NOT NULL,
                                   `de_sms_use1` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_sms_use2` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_sms_use3` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_sms_use4` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_sms_use5` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_sms_hp` varchar(255) NOT NULL DEFAULT '',
                                   `de_pg_service` varchar(255) NOT NULL DEFAULT '',
                                   `de_kcp_mid` varchar(255) NOT NULL DEFAULT '',
                                   `de_kcp_site_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_inicis_mid` varchar(255) NOT NULL DEFAULT '',
                                   `de_inicis_admin_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_inicis_sign_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_iche_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_easy_pay_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_easy_pay_services` varchar(255) NOT NULL DEFAULT '',
                                   `de_samsung_pay_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_inicis_lpay_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_inicis_kakaopay_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_inicis_cartpoint_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_item_use_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_item_use_write` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_code_dup_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_cart_keep_term` int(11) NOT NULL DEFAULT 0,
                                   `de_guest_cart_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_admin_buga_no` varchar(255) NOT NULL DEFAULT '',
                                   `de_vbank_use` varchar(255) NOT NULL DEFAULT '',
                                   `de_taxsave_use` tinyint(4) NOT NULL,
                                   `de_taxsave_types` set('account','vbank','transfer') NOT NULL DEFAULT 'account',
                                   `de_guest_privacy` text NOT NULL,
                                   `de_hp_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_escrow_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_tax_flag_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_kakaopay_mid` varchar(255) NOT NULL DEFAULT '',
                                   `de_kakaopay_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_kakaopay_enckey` varchar(255) NOT NULL DEFAULT '',
                                   `de_kakaopay_hashkey` varchar(255) NOT NULL DEFAULT '',
                                   `de_kakaopay_cancelpwd` varchar(255) NOT NULL DEFAULT '',
                                   `de_naverpay_mid` varchar(255) NOT NULL DEFAULT '',
                                   `de_naverpay_cert_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_naverpay_button_key` varchar(255) NOT NULL DEFAULT '',
                                   `de_naverpay_test` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_naverpay_mb_id` varchar(255) NOT NULL DEFAULT '',
                                   `de_naverpay_sendcost` varchar(255) NOT NULL DEFAULT '',
                                   `de_member_reg_coupon_use` tinyint(4) NOT NULL DEFAULT 0,
                                   `de_member_reg_coupon_term` int(11) NOT NULL DEFAULT 0,
                                   `de_member_reg_coupon_price` int(11) NOT NULL DEFAULT 0,
                                   `de_member_reg_coupon_minimum` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_default`
--

LOCK TABLES `g5_shop_default` WRITE;
/*!40000 ALTER TABLE `g5_shop_default` DISABLE KEYS */;
INSERT INTO `g5_shop_default` VALUES ('임다혜','zoomMa2life','123-45-67890','02-123-4567','02-123-4568','제 OO구 - 123호','123-456','OO도 OO시 OO구 OO동 123-45','정보책임자명','정보책임자 E-mail','basic','basic',1,'main.10.skin.php',5,1,160,160,1,'main.20.skin.php',4,1,215,215,1,'main.40.skin.php',4,1,215,215,1,'main.50.skin.php',5,1,215,215,1,'main.30.skin.php',4,1,215,215,1,'main.30.skin.php',2,4,230,230,1,'main.10.skin.php',2,2,230,230,1,'main.10.skin.php',2,4,300,300,1,'main.20.skin.php',2,2,80,80,1,'main.10.skin.php',2,2,230,230,1,'relation.10.skin.php',5,215,215,1,'relation.10.skin.php',3,230,230,'list.10.skin.php',5,5,225,225,'list.10.skin.php',2,5,230,230,'list.10.skin.php',5,5,225,225,'list.10.skin.php',2,5,230,230,1,'수협은행 12345-67-89012 임다혜',1,1,1,0,5000,50000,100,1,'','차등','20000;30000;40000','4000;3000;2000',0,3,'배송 안내 입력전입니다.','교환/반품 안내 입력전입니다.',7,230,230,300,300,'{이름}님의 회원가입을 축하드립니다.\r\nID:{회원아이디}\r\n{회사명}','{이름}님 주문해주셔서 고맙습니다.\r\n{주문번호}\r\n{주문금액}원\r\n{회사명}','{이름}님께서 주문하셨습니다.\r\n{주문번호}\r\n{주문금액}원\r\n{회사명}','{이름}님 입금 감사합니다.\r\n{입금액}원\r\n주문번호:\r\n{주문번호}\r\n{회사명}','{이름}님 배송합니다.\r\n택배:{택배회사}\r\n운송장번호:\r\n{운송장번호}\r\n{회사명}',0,0,0,0,0,'','kcp','','','','','',0,0,'',0,0,0,0,1,0,0,15,0,'12345호','0',0,'account','',0,0,0,'','','','','1111','','','',0,'','',0,0,0,0);
/*!40000 ALTER TABLE `g5_shop_default` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_event`
--

DROP TABLE IF EXISTS `g5_shop_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_event` (
                                 `ev_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `ev_skin` varchar(255) NOT NULL DEFAULT '',
                                 `ev_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                                 `ev_img_width` int(11) NOT NULL DEFAULT 0,
                                 `ev_img_height` int(11) NOT NULL DEFAULT 0,
                                 `ev_list_mod` int(11) NOT NULL DEFAULT 0,
                                 `ev_list_row` int(11) NOT NULL DEFAULT 0,
                                 `ev_mobile_img_width` int(11) NOT NULL DEFAULT 0,
                                 `ev_mobile_img_height` int(11) NOT NULL DEFAULT 0,
                                 `ev_mobile_list_mod` int(11) NOT NULL DEFAULT 0,
                                 `ev_mobile_list_row` int(11) NOT NULL DEFAULT 0,
                                 `ev_subject` varchar(255) NOT NULL DEFAULT '',
                                 `ev_subject_strong` tinyint(4) NOT NULL DEFAULT 0,
                                 `ev_head_html` text NOT NULL,
                                 `ev_tail_html` text NOT NULL,
                                 `ev_use` tinyint(4) NOT NULL DEFAULT 0,
                                 PRIMARY KEY (`ev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_event`
--

LOCK TABLES `g5_shop_event` WRITE;
/*!40000 ALTER TABLE `g5_shop_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_event_item`
--

DROP TABLE IF EXISTS `g5_shop_event_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_event_item` (
                                      `ev_id` int(11) NOT NULL DEFAULT 0,
                                      `it_id` varchar(20) NOT NULL DEFAULT '',
                                      PRIMARY KEY (`ev_id`,`it_id`),
                                      KEY `it_id` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_event_item`
--

LOCK TABLES `g5_shop_event_item` WRITE;
/*!40000 ALTER TABLE `g5_shop_event_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_event_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_inicis_log`
--

DROP TABLE IF EXISTS `g5_shop_inicis_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_inicis_log` (
                                      `oid` bigint(20) unsigned NOT NULL,
                                      `P_TID` varchar(255) NOT NULL DEFAULT '',
                                      `P_MID` varchar(255) NOT NULL DEFAULT '',
                                      `P_AUTH_DT` varchar(255) NOT NULL DEFAULT '',
                                      `P_STATUS` varchar(255) NOT NULL DEFAULT '',
                                      `P_TYPE` varchar(255) NOT NULL DEFAULT '',
                                      `P_OID` varchar(255) NOT NULL DEFAULT '',
                                      `P_FN_NM` varchar(255) NOT NULL DEFAULT '',
                                      `P_AUTH_NO` varchar(255) NOT NULL DEFAULT '',
                                      `P_AMT` int(11) NOT NULL DEFAULT 0,
                                      `P_RMESG1` varchar(255) NOT NULL DEFAULT '',
                                      `post_data` text NOT NULL,
                                      `is_mail_send` tinyint(4) NOT NULL DEFAULT 1,
                                      PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_inicis_log`
--

LOCK TABLES `g5_shop_inicis_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_inicis_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_inicis_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item`
--

DROP TABLE IF EXISTS `g5_shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item` (
                                `it_id` varchar(20) NOT NULL DEFAULT '',
                                `ca_id` varchar(10) NOT NULL DEFAULT '0',
                                `ca_id2` varchar(255) NOT NULL DEFAULT '',
                                `ca_id3` varchar(255) NOT NULL DEFAULT '',
                                `it_skin` varchar(255) NOT NULL DEFAULT '',
                                `it_mobile_skin` varchar(255) NOT NULL DEFAULT '',
                                `it_name` varchar(255) NOT NULL DEFAULT '',
                                `it_seo_title` varchar(200) NOT NULL DEFAULT '',
                                `it_maker` varchar(255) NOT NULL DEFAULT '',
                                `it_origin` varchar(255) NOT NULL DEFAULT '',
                                `it_brand` varchar(255) NOT NULL DEFAULT '',
                                `it_model` varchar(255) NOT NULL DEFAULT '',
                                `it_option_subject` varchar(255) NOT NULL DEFAULT '',
                                `it_supply_subject` varchar(255) NOT NULL DEFAULT '',
                                `it_type1` tinyint(4) NOT NULL DEFAULT 0,
                                `it_type2` tinyint(4) NOT NULL DEFAULT 0,
                                `it_type3` tinyint(4) NOT NULL DEFAULT 0,
                                `it_type4` tinyint(4) NOT NULL DEFAULT 0,
                                `it_type5` tinyint(4) NOT NULL DEFAULT 0,
                                `it_basic` text NOT NULL,
                                `it_explan` mediumtext NOT NULL,
                                `it_explan2` mediumtext NOT NULL,
                                `it_mobile_explan` mediumtext NOT NULL,
                                `it_cust_price` int(11) NOT NULL DEFAULT 0,
                                `it_price` int(11) NOT NULL DEFAULT 0,
                                `it_point` int(11) NOT NULL DEFAULT 0,
                                `it_point_type` tinyint(4) NOT NULL DEFAULT 0,
                                `it_supply_point` int(11) NOT NULL DEFAULT 0,
                                `it_notax` tinyint(4) NOT NULL DEFAULT 0,
                                `it_sell_email` varchar(255) NOT NULL DEFAULT '',
                                `it_use` tinyint(4) NOT NULL DEFAULT 0,
                                `it_nocoupon` tinyint(4) NOT NULL DEFAULT 0,
                                `it_soldout` tinyint(4) NOT NULL DEFAULT 0,
                                `it_stock_qty` int(11) NOT NULL DEFAULT 0,
                                `it_stock_sms` tinyint(4) NOT NULL DEFAULT 0,
                                `it_noti_qty` int(11) NOT NULL DEFAULT 0,
                                `it_sc_type` tinyint(4) NOT NULL DEFAULT 0,
                                `it_sc_method` tinyint(4) NOT NULL DEFAULT 0,
                                `it_sc_price` int(11) NOT NULL DEFAULT 0,
                                `it_sc_minimum` int(11) NOT NULL DEFAULT 0,
                                `it_sc_qty` int(11) NOT NULL DEFAULT 0,
                                `it_buy_min_qty` int(11) NOT NULL DEFAULT 0,
                                `it_buy_max_qty` int(11) NOT NULL DEFAULT 0,
                                `it_head_html` text NOT NULL,
                                `it_tail_html` text NOT NULL,
                                `it_mobile_head_html` text NOT NULL,
                                `it_mobile_tail_html` text NOT NULL,
                                `it_hit` int(11) NOT NULL DEFAULT 0,
                                `it_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `it_update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `it_ip` varchar(25) NOT NULL DEFAULT '',
                                `it_order` int(11) NOT NULL DEFAULT 0,
                                `it_tel_inq` tinyint(4) NOT NULL DEFAULT 0,
                                `it_info_gubun` varchar(50) NOT NULL DEFAULT '',
                                `it_info_value` text NOT NULL,
                                `it_sum_qty` int(11) NOT NULL DEFAULT 0,
                                `it_use_cnt` int(11) NOT NULL DEFAULT 0,
                                `it_use_avg` decimal(2,1) NOT NULL,
                                `it_shop_memo` text NOT NULL,
                                `ec_mall_pid` varchar(255) NOT NULL DEFAULT '',
                                `it_img1` varchar(255) NOT NULL DEFAULT '',
                                `it_img2` varchar(255) NOT NULL DEFAULT '',
                                `it_img3` varchar(255) NOT NULL DEFAULT '',
                                `it_img4` varchar(255) NOT NULL DEFAULT '',
                                `it_img5` varchar(255) NOT NULL DEFAULT '',
                                `it_img6` varchar(255) NOT NULL DEFAULT '',
                                `it_img7` varchar(255) NOT NULL DEFAULT '',
                                `it_img8` varchar(255) NOT NULL DEFAULT '',
                                `it_img9` varchar(255) NOT NULL DEFAULT '',
                                `it_img10` varchar(255) NOT NULL DEFAULT '',
                                `it_1_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_2_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_3_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_4_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_5_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_6_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_7_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_8_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_9_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_10_subj` varchar(255) NOT NULL DEFAULT '',
                                `it_1` varchar(255) NOT NULL DEFAULT '',
                                `it_2` varchar(255) NOT NULL DEFAULT '',
                                `it_3` varchar(255) NOT NULL DEFAULT '',
                                `it_4` varchar(255) NOT NULL DEFAULT '',
                                `it_5` varchar(255) NOT NULL DEFAULT '',
                                `it_6` varchar(255) NOT NULL DEFAULT '',
                                `it_7` varchar(255) NOT NULL DEFAULT '',
                                `it_8` varchar(255) NOT NULL DEFAULT '',
                                `it_9` varchar(255) NOT NULL DEFAULT '',
                                `it_10` varchar(255) NOT NULL DEFAULT '',
                                PRIMARY KEY (`it_id`),
                                KEY `ca_id` (`ca_id`),
                                KEY `it_name` (`it_name`),
                                KEY `it_seo_title` (`it_seo_title`),
                                KEY `it_order` (`it_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item`
--

LOCK TABLES `g5_shop_item` WRITE;
/*!40000 ALTER TABLE `g5_shop_item` DISABLE KEYS */;
INSERT INTO `g5_shop_item` VALUES ('1667115059','10','10','10','','','강의 상품 테스트','강의-상품-테스트','','','','','','',1,1,1,1,1,'강의 상품 테스트 입니다.','<p>강의 상품 설명 입니다.</p>\r\n<p>&nbsp;</p>\r\n<p>설명을 입력해 주세요</p>\r\n','강의 상품 설명 입니다.\r\n&nbsp;\r\n설명을 입력해 주세요','<p>강의 상품 설명 입니다.</p>\r\n<p>&nbsp;</p>\r\n<p>설명을 입력해 주세요</p>\r\n',0,0,0,0,0,0,'',1,0,0,99999,0,0,1,0,0,0,0,0,0,'','','','',66,'2022-10-30 16:33:15','2022-11-08 15:00:08','::1',0,0,'wear','a:8:{s:8:\"material\";s:22:\"상품페이지 참고\";s:5:\"color\";s:22:\"상품페이지 참고\";s:4:\"size\";s:22:\"상품페이지 참고\";s:5:\"maker\";s:22:\"상품페이지 참고\";s:7:\"caution\";s:22:\"상품페이지 참고\";s:16:\"manufacturing_ym\";s:22:\"상품페이지 참고\";s:8:\"warranty\";s:22:\"상품페이지 참고\";s:2:\"as\";s:22:\"상품페이지 참고\";}',0,0,0.0,'','','1667115059/7ZKN67Cx7YOA7J207YuA.jpeg','','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),('1668222822','20','20','20','','','전자책 테스트','전자책-테스트','','','','','','',1,1,1,1,1,'','','','',0,0,0,0,0,0,'',1,0,0,99999,0,0,0,0,0,0,0,0,0,'','','','',55,'2022-11-12 12:14:37','2022-11-12 12:15:26','::1',0,0,'wear','a:8:{s:8:\"material\";s:22:\"상품페이지 참고\";s:5:\"color\";s:22:\"상품페이지 참고\";s:4:\"size\";s:22:\"상품페이지 참고\";s:5:\"maker\";s:22:\"상품페이지 참고\";s:7:\"caution\";s:22:\"상품페이지 참고\";s:16:\"manufacturing_ym\";s:22:\"상품페이지 참고\";s:8:\"warranty\";s:22:\"상품페이지 참고\";s:2:\"as\";s:22:\"상품페이지 참고\";}',0,0,0.0,'','','1668222822/7KCE7J6Q7LGF7J206647KeA.jpeg','','','','','','','','','','','','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `g5_shop_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_option`
--

DROP TABLE IF EXISTS `g5_shop_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item_option` (
                                       `io_no` int(11) NOT NULL AUTO_INCREMENT,
                                       `io_id` varchar(255) NOT NULL DEFAULT '0',
                                       `io_type` tinyint(4) NOT NULL DEFAULT 0,
                                       `it_id` varchar(20) NOT NULL DEFAULT '',
                                       `io_price` int(11) NOT NULL DEFAULT 0,
                                       `io_stock_qty` int(11) NOT NULL DEFAULT 0,
                                       `io_noti_qty` int(11) NOT NULL DEFAULT 0,
                                       `io_use` tinyint(4) NOT NULL DEFAULT 0,
                                       PRIMARY KEY (`io_no`),
                                       KEY `io_id` (`io_id`),
                                       KEY `it_id` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_option`
--

LOCK TABLES `g5_shop_item_option` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_qa`
--

DROP TABLE IF EXISTS `g5_shop_item_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item_qa` (
                                   `iq_id` int(11) NOT NULL AUTO_INCREMENT,
                                   `it_id` varchar(20) NOT NULL DEFAULT '',
                                   `mb_id` varchar(255) NOT NULL DEFAULT '',
                                   `iq_secret` tinyint(4) NOT NULL DEFAULT 0,
                                   `iq_name` varchar(255) NOT NULL DEFAULT '',
                                   `iq_email` varchar(255) NOT NULL DEFAULT '',
                                   `iq_hp` varchar(255) NOT NULL DEFAULT '',
                                   `iq_password` varchar(255) NOT NULL DEFAULT '',
                                   `iq_subject` varchar(255) NOT NULL DEFAULT '',
                                   `iq_question` text NOT NULL,
                                   `iq_answer` text NOT NULL,
                                   `iq_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `iq_ip` varchar(25) NOT NULL DEFAULT '',
                                   PRIMARY KEY (`iq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_qa`
--

LOCK TABLES `g5_shop_item_qa` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_qa` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_relation`
--

DROP TABLE IF EXISTS `g5_shop_item_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item_relation` (
                                         `it_id` varchar(20) NOT NULL DEFAULT '',
                                         `it_id2` varchar(20) NOT NULL DEFAULT '',
                                         `ir_no` int(11) NOT NULL DEFAULT 0,
                                         PRIMARY KEY (`it_id`,`it_id2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_relation`
--

LOCK TABLES `g5_shop_item_relation` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_stocksms`
--

DROP TABLE IF EXISTS `g5_shop_item_stocksms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item_stocksms` (
                                         `ss_id` int(11) NOT NULL AUTO_INCREMENT,
                                         `it_id` varchar(20) NOT NULL DEFAULT '',
                                         `ss_hp` varchar(255) NOT NULL DEFAULT '',
                                         `ss_send` tinyint(4) NOT NULL DEFAULT 0,
                                         `ss_send_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                         `ss_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                         `ss_ip` varchar(25) NOT NULL DEFAULT '',
                                         PRIMARY KEY (`ss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_stocksms`
--

LOCK TABLES `g5_shop_item_stocksms` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_stocksms` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_stocksms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_item_use`
--

DROP TABLE IF EXISTS `g5_shop_item_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_item_use` (
                                    `is_id` int(11) NOT NULL AUTO_INCREMENT,
                                    `it_id` varchar(20) NOT NULL DEFAULT '0',
                                    `mb_id` varchar(255) NOT NULL DEFAULT '',
                                    `is_name` varchar(255) NOT NULL DEFAULT '',
                                    `is_password` varchar(255) NOT NULL DEFAULT '',
                                    `is_score` tinyint(4) NOT NULL DEFAULT 0,
                                    `is_subject` varchar(255) NOT NULL DEFAULT '',
                                    `is_content` text NOT NULL,
                                    `is_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                    `is_ip` varchar(25) NOT NULL DEFAULT '',
                                    `is_confirm` tinyint(4) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`is_id`),
                                    KEY `index1` (`it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_item_use`
--

LOCK TABLES `g5_shop_item_use` WRITE;
/*!40000 ALTER TABLE `g5_shop_item_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_item_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order`
--

DROP TABLE IF EXISTS `g5_shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_order` (
                                 `od_id` bigint(20) unsigned NOT NULL,
                                 `mb_id` varchar(255) NOT NULL DEFAULT '',
                                 `od_name` varchar(20) NOT NULL DEFAULT '',
                                 `od_email` varchar(100) NOT NULL DEFAULT '',
                                 `od_tel` varchar(20) NOT NULL DEFAULT '',
                                 `od_hp` varchar(20) NOT NULL DEFAULT '',
                                 `od_zip1` char(3) NOT NULL DEFAULT '',
                                 `od_zip2` char(3) NOT NULL DEFAULT '',
                                 `od_addr1` varchar(100) NOT NULL DEFAULT '',
                                 `od_addr2` varchar(100) NOT NULL DEFAULT '',
                                 `od_addr3` varchar(255) NOT NULL DEFAULT '',
                                 `od_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
                                 `od_deposit_name` varchar(20) NOT NULL DEFAULT '',
                                 `od_b_name` varchar(20) NOT NULL DEFAULT '',
                                 `od_b_tel` varchar(20) NOT NULL DEFAULT '',
                                 `od_b_hp` varchar(20) NOT NULL DEFAULT '',
                                 `od_b_zip1` char(3) NOT NULL DEFAULT '',
                                 `od_b_zip2` char(3) NOT NULL DEFAULT '',
                                 `od_b_addr1` varchar(100) NOT NULL DEFAULT '',
                                 `od_b_addr2` varchar(100) NOT NULL DEFAULT '',
                                 `od_b_addr3` varchar(255) NOT NULL DEFAULT '',
                                 `od_b_addr_jibeon` varchar(255) NOT NULL DEFAULT '',
                                 `od_memo` text NOT NULL,
                                 `od_cart_count` int(11) NOT NULL DEFAULT 0,
                                 `od_cart_price` int(11) NOT NULL DEFAULT 0,
                                 `od_cart_coupon` int(11) NOT NULL DEFAULT 0,
                                 `od_send_cost` int(11) NOT NULL DEFAULT 0,
                                 `od_send_cost2` int(11) NOT NULL DEFAULT 0,
                                 `od_send_coupon` int(11) NOT NULL DEFAULT 0,
                                 `od_receipt_price` int(11) NOT NULL DEFAULT 0,
                                 `od_cancel_price` int(11) NOT NULL DEFAULT 0,
                                 `od_receipt_point` int(11) NOT NULL DEFAULT 0,
                                 `od_refund_price` int(11) NOT NULL DEFAULT 0,
                                 `od_bank_account` varchar(255) NOT NULL DEFAULT '',
                                 `od_receipt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 `od_coupon` int(11) NOT NULL DEFAULT 0,
                                 `od_misu` int(11) NOT NULL DEFAULT 0,
                                 `od_shop_memo` text NOT NULL,
                                 `od_mod_history` text NOT NULL,
                                 `od_status` varchar(255) NOT NULL DEFAULT '',
                                 `od_hope_date` date NOT NULL DEFAULT '0000-00-00',
                                 `od_settle_case` varchar(255) NOT NULL DEFAULT '',
                                 `od_other_pay_type` varchar(100) NOT NULL DEFAULT '',
                                 `od_test` tinyint(4) NOT NULL DEFAULT 0,
                                 `od_mobile` tinyint(4) NOT NULL DEFAULT 0,
                                 `od_pg` varchar(255) NOT NULL DEFAULT '',
                                 `od_tno` varchar(255) NOT NULL DEFAULT '',
                                 `od_app_no` varchar(20) NOT NULL DEFAULT '',
                                 `od_escrow` tinyint(4) NOT NULL DEFAULT 0,
                                 `od_casseqno` varchar(255) NOT NULL DEFAULT '',
                                 `od_tax_flag` tinyint(4) NOT NULL DEFAULT 0,
                                 `od_tax_mny` int(11) NOT NULL DEFAULT 0,
                                 `od_vat_mny` int(11) NOT NULL DEFAULT 0,
                                 `od_free_mny` int(11) NOT NULL DEFAULT 0,
                                 `od_delivery_company` varchar(255) NOT NULL DEFAULT '0',
                                 `od_invoice` varchar(255) NOT NULL DEFAULT '',
                                 `od_invoice_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 `od_cash` tinyint(4) NOT NULL,
                                 `od_cash_no` varchar(255) NOT NULL,
                                 `od_cash_info` text NOT NULL,
                                 `od_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 `od_pwd` varchar(255) NOT NULL DEFAULT '',
                                 `od_ip` varchar(25) NOT NULL DEFAULT '',
                                 PRIMARY KEY (`od_id`),
                                 KEY `index2` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order`
--

LOCK TABLES `g5_shop_order` WRITE;
/*!40000 ALTER TABLE `g5_shop_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_address`
--

DROP TABLE IF EXISTS `g5_shop_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_order_address` (
                                         `ad_id` int(11) NOT NULL AUTO_INCREMENT,
                                         `mb_id` varchar(255) NOT NULL DEFAULT '',
                                         `ad_subject` varchar(255) NOT NULL DEFAULT '',
                                         `ad_default` tinyint(4) NOT NULL DEFAULT 0,
                                         `ad_name` varchar(255) NOT NULL DEFAULT '',
                                         `ad_tel` varchar(255) NOT NULL DEFAULT '',
                                         `ad_hp` varchar(255) NOT NULL DEFAULT '',
                                         `ad_zip1` char(3) NOT NULL DEFAULT '',
                                         `ad_zip2` char(3) NOT NULL DEFAULT '',
                                         `ad_addr1` varchar(255) NOT NULL DEFAULT '',
                                         `ad_addr2` varchar(255) NOT NULL DEFAULT '',
                                         `ad_addr3` varchar(255) NOT NULL DEFAULT '',
                                         `ad_jibeon` varchar(255) NOT NULL DEFAULT '',
                                         PRIMARY KEY (`ad_id`),
                                         KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_address`
--

LOCK TABLES `g5_shop_order_address` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_data`
--

DROP TABLE IF EXISTS `g5_shop_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_order_data` (
                                      `od_id` bigint(20) unsigned NOT NULL,
                                      `cart_id` bigint(20) unsigned NOT NULL,
                                      `mb_id` varchar(20) NOT NULL DEFAULT '',
                                      `dt_pg` varchar(255) NOT NULL DEFAULT '',
                                      `dt_data` text NOT NULL,
                                      `dt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_data`
--

LOCK TABLES `g5_shop_order_data` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_data` DISABLE KEYS */;
INSERT INTO `g5_shop_order_data` VALUES (2022110223013084,2022110223013078,'zm2life','inicis','YTo2Njp7czo1OiJpdF9pZCI7YToxOntpOjA7czoxMDoiMTY2NzExNTA1OSI7fXM6NzoiaXRfbmFtZSI7YToxOntpOjA7czoyMzoi6rCV7J2YIOyDge2SiCDthYzsiqTtirgiO31zOjg6Iml0X3ByaWNlIjthOjE6e2k6MDtzOjE6IjAiO31zOjU6ImNwX2lkIjthOjE6e2k6MDtzOjA6IiI7fXM6ODoiY3BfcHJpY2UiO2E6MTp7aTowO3M6MToiMCI7fXM6ODoib2RfcHJpY2UiO3M6MToiMCI7czoxMjoib3JnX29kX3ByaWNlIjtzOjE6IjAiO3M6MTI6Im9kX3NlbmRfY29zdCI7czo0OiI0MDAwIjtzOjEzOiJvZF9zZW5kX2Nvc3QyIjtzOjE6IjAiO3M6MTE6Iml0ZW1fY291cG9uIjtzOjE6IjAiO3M6OToib2RfY291cG9uIjtzOjE6IjAiO3M6MTQ6Im9kX3NlbmRfY291cG9uIjtzOjE6IjAiO3M6MTM6Im9kX2dvb2RzX25hbWUiO3M6MjM6IuqwleydmCDsg4Htkogg7YWM7Iqk7Yq4IjtzOjg6Imdvb2RfbW55IjtzOjQ6IjQwMDAiO3M6NzoidmVyc2lvbiI7czozOiIxLjAiO3M6MzoibWlkIjtzOjEwOiJJTklwYXlUZXN0IjtzOjM6Im9pZCI7czoxNjoiMjAyMjExMDIyMzAxMzA4NCI7czo4OiJnb29kbmFtZSI7czoyMzoi6rCV7J2YIOyDge2SiCDthYzsiqTtirgiO3M6NToicHJpY2UiO3M6NDoiNDAwMCI7czo5OiJidXllcm5hbWUiO3M6MTU6Iuy1nOqzoOq0gOumrOyekCI7czoxMDoiYnV5ZXJlbWFpbCI7czoxNjoibmltdXJvQG5hdmVyLmNvbSI7czoxMToicGFyZW50ZW1haWwiO3M6MDoiIjtzOjg6ImJ1eWVydGVsIjtzOjE6IjEiO3M6ODoicmVjdm5hbWUiO3M6MTU6Iuy1nOqzoOq0gOumrOyekCI7czo3OiJyZWN2dGVsIjtzOjE6IjEiO3M6ODoicmVjdmFkZHIiO3M6NDM6IuyEnOyauCDrj5nsnpHqtawg7ISc64us66GcIDkxIDEwMeuPmSA1MDHtmLgiO3M6MTE6InJlY3Zwb3N0bnVtIjtzOjU6IjA2OTc1IjtzOjg6ImN1cnJlbmN5IjtzOjM6IldPTiI7czoxMToiZ29wYXltZXRob2QiO3M6NDoiS3BheSI7czoxMjoiYWNjZXB0bWV0aG9kIjtzOjQzOiJIUFAoMik6bm9fcmVjZWlwdDp2YmFuaygyMDIyMTEwNSk6YmVsb3cxMDAwIjtzOjk6InRpbWVzdGFtcCI7czowOiIiO3M6OToic2lnbmF0dXJlIjtzOjA6IiI7czo5OiJyZXR1cm5VcmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9pbmlzdGRwYXlfcmV0dXJuLnBocCI7czo0OiJtS2V5IjtzOjA6IiI7czo3OiJjaGFyc2V0IjtzOjU6IlVURi04IjtzOjExOiJwYXlWaWV3VHlwZSI7czo3OiJvdmVybGF5IjtzOjg6ImNsb3NlVXJsIjtzOjQzOiJodHRwOi8vbG9jYWxob3N0OjgwODAvc2hvcC9pbmljaXMvY2xvc2UucGhwIjtzOjg6InBvcHVwVXJsIjtzOjQzOiJodHRwOi8vbG9jYWxob3N0OjgwODAvc2hvcC9pbmljaXMvcG9wdXAucGhwIjtzOjEwOiJub2ludGVyZXN0IjtzOjA6IiI7czo5OiJxdW90YWJhc2UiO3M6MjQ6IjI6Mzo0OjU6Njo3Ojg6OToxMDoxMToxMiI7czo3OiJvZF9uYW1lIjtzOjE1OiLstZzqs6DqtIDrpqzsnpAiO3M6Njoib2RfdGVsIjtzOjE6IjEiO3M6NToib2RfaHAiO3M6MDoiIjtzOjY6Im9kX3ppcCI7czo1OiIwNjk3NSI7czo4OiJvZF9hZGRyMSI7czoyOToi7ISc7Jq4IOuPmeyekeq1rCDshJzri6zroZwgOTEiO3M6ODoib2RfYWRkcjIiO3M6MTM6IjEwMeuPmSA1MDHtmLgiO3M6ODoib2RfYWRkcjMiO3M6NDI6IiAo7Z2R7ISd64+ZLCDtnZHshJ3tlZzqsJXshLztirjroIjruYwy7LCoKSI7czoxNDoib2RfYWRkcl9qaWJlb24iO3M6MToiUiI7czo4OiJvZF9lbWFpbCI7czoxNjoibmltdXJvQG5hdmVyLmNvbSI7czoxMToiYWRfc2VsX2FkZHIiO3M6NDoic2FtZSI7czoxMDoiYWRfc3ViamVjdCI7czowOiIiO3M6OToib2RfYl9uYW1lIjtzOjE1OiLstZzqs6DqtIDrpqzsnpAiO3M6ODoib2RfYl90ZWwiO3M6MToiMSI7czo3OiJvZF9iX2hwIjtzOjA6IiI7czo4OiJvZF9iX3ppcCI7czo1OiIwNjk3NSI7czoxMDoib2RfYl9hZGRyMSI7czoyOToi7ISc7Jq4IOuPmeyekeq1rCDshJzri6zroZwgOTEiO3M6MTA6Im9kX2JfYWRkcjIiO3M6MTM6IjEwMeuPmSA1MDHtmLgiO3M6MTA6Im9kX2JfYWRkcjMiO3M6NDI6IiAo7Z2R7ISd64+ZLCDtnZHshJ3tlZzqsJXshLztirjroIjruYwy7LCoKSI7czoxNjoib2RfYl9hZGRyX2ppYmVvbiI7czoxOiJSIjtzOjc6Im9kX21lbW8iO3M6MDoiIjtzOjE0OiJvZF9zZXR0bGVfY2FzZSI7czoxMjoi6rCE7Y646rKw7KCcIjtzOjE1OiJvZF9iYW5rX2FjY291bnQiO3M6MzY6Ik9P7J2A7ZaJIDEyMzQ1LTY3LTg5MDEyIOyYiOq4iOyjvOuqhSI7czoxNToib2RfZGVwb3NpdF9uYW1lIjtzOjA6IiI7czo5OiJzd19kaXJlY3QiO3M6MToiMSI7czo3OiJvZF90ZXN0IjtzOjE6IjEiO3M6NToib2RfaXAiO3M6MzoiOjoxIjt9','2022-11-02 23:02:03'),(2022110301350326,2022110300184606,'nimuro','inicis','YTo0NTp7czo4OiJvZF9wcmljZSI7czoxOiIwIjtzOjEyOiJvcmdfb2RfcHJpY2UiO3M6MToiMCI7czoxMjoib2Rfc2VuZF9jb3N0IjtzOjM6Ik5hTiI7czoxMzoib2Rfc2VuZF9jb3N0MiI7czoxOiIwIjtzOjExOiJpdGVtX2NvdXBvbiI7czoxOiIwIjtzOjk6Im9kX2NvdXBvbiI7czoxOiIwIjtzOjE0OiJvZF9zZW5kX2NvdXBvbiI7czoxOiIwIjtzOjEzOiJvZF9nb29kc19uYW1lIjtzOjEwOiIg7Jm4IC0x6rG0IjtzOjg6Imdvb2RfbW55IjtzOjA6IiI7czo3OiJ2ZXJzaW9uIjtzOjM6IjEuMCI7czozOiJtaWQiO3M6MTA6IklOSXBheVRlc3QiO3M6Mzoib2lkIjtzOjA6IiI7czo4OiJnb29kbmFtZSI7czoxMDoiIOyZuCAtMeqxtCI7czo1OiJwcmljZSI7czo0OiIxMDAwIjtzOjk6ImJ1eWVybmFtZSI7czo5OiLqs6Dqs6Dsi7EiO3M6MTA6ImJ1eWVyZW1haWwiO3M6MTc6Im5pbXVybzBAZ21haWwuY29tIjtzOjExOiJwYXJlbnRlbWFpbCI7czowOiIiO3M6ODoiYnV5ZXJ0ZWwiO3M6MTE6IjAxMDI1MDY2MzAwIjtzOjg6InJlY3ZuYW1lIjtzOjk6IuqzoOqzoOyLsSI7czo3OiJyZWN2dGVsIjtzOjExOiIwMTAyNTA2NjMwMCI7czo4OiJyZWN2YWRkciI7czowOiIiO3M6MTE6InJlY3Zwb3N0bnVtIjtzOjA6IiI7czo4OiJjdXJyZW5jeSI7czozOiJXT04iO3M6MTE6ImdvcGF5bWV0aG9kIjtzOjQ6IktwYXkiO3M6MTI6ImFjY2VwdG1ldGhvZCI7czo0MzoiSFBQKDIpOm5vX3JlY2VpcHQ6dmJhbmsoMjAyMjExMDYpOmJlbG93MTAwMCI7czo5OiJ0aW1lc3RhbXAiO3M6MTM6IjE2Njc0MTE0MzYzNzkiO3M6OToic2lnbmF0dXJlIjtzOjY0OiI5MWVkN2I4MGMxZWM3NjBlZGExMmVjOTI0NTczMmM1MjUwNDkzNzQ1M2E4ODI4ZDUyNzQwYjIyMDE4NDY4MDAzIjtzOjk6InJldHVyblVybCI7czo1NDoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL3Nob3AvaW5pY2lzL2luaXN0ZHBheV9yZXR1cm4ucGhwIjtzOjQ6Im1LZXkiO3M6NjQ6IjNhOTUwMzA2OTE5MmYyMDc0OTFkNGIxOWJkNzQzZmMyNDlhNzYxZWQ5NDI0NmM4YzQyZmVkMDZjM2NkMTVhMzMiO3M6NzoiY2hhcnNldCI7czo1OiJVVEYtOCI7czoxMToicGF5Vmlld1R5cGUiO3M6Nzoib3ZlcmxheSI7czo4OiJjbG9zZVVybCI7czo0MzoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL3Nob3AvaW5pY2lzL2Nsb3NlLnBocCI7czo4OiJwb3B1cFVybCI7czo0MzoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL3Nob3AvaW5pY2lzL3BvcHVwLnBocCI7czoxMDoibm9pbnRlcmVzdCI7czowOiIiO3M6OToicXVvdGFiYXNlIjtzOjI0OiIyOjM6NDo1OjY6Nzo4Ojk6MTA6MTE6MTIiO3M6Nzoib2RfbmFtZSI7czo5OiLqs6Dqs6Dsi7EiO3M6Njoib2RfdGVsIjtzOjExOiIwMTAyNTA2NjMwMCI7czo1OiJvZF9ocCI7czowOiIiO3M6ODoib2RfZW1haWwiO3M6MTc6Im5pbXVybzBAZ21haWwuY29tIjtzOjE0OiJvZF9zZXR0bGVfY2FzZSI7czoxMjoi6rCE7Y646rKw7KCcIjtzOjE1OiJvZF9iYW5rX2FjY291bnQiO3M6MzY6Ik9P7J2A7ZaJIDEyMzQ1LTY3LTg5MDEyIOyYiOq4iOyjvOuqhSI7czoxNToib2RfZGVwb3NpdF9uYW1lIjtzOjA6IiI7czo5OiJzd19kaXJlY3QiO3M6MToiMSI7czo3OiJvZF90ZXN0IjtzOjE6IjEiO3M6NToib2RfaXAiO3M6MzoiOjoxIjt9','2022-11-03 02:50:39'),(0,2022110411292124,'zm2life','inicis','YTo0NTp7czo4OiJvZF9wcmljZSI7czoxOiIwIjtzOjEyOiJvcmdfb2RfcHJpY2UiO3M6MToiMCI7czoxMjoib2Rfc2VuZF9jb3N0IjtzOjM6Ik5hTiI7czoxMzoib2Rfc2VuZF9jb3N0MiI7czoxOiIwIjtzOjExOiJpdGVtX2NvdXBvbiI7czoxOiIwIjtzOjk6Im9kX2NvdXBvbiI7czoxOiIwIjtzOjE0OiJvZF9zZW5kX2NvdXBvbiI7czoxOiIwIjtzOjEzOiJvZF9nb29kc19uYW1lIjtzOjEwOiIg7Jm4IC0x6rG0IjtzOjg6Imdvb2RfbW55IjtzOjA6IiI7czo3OiJ2ZXJzaW9uIjtzOjM6IjEuMCI7czozOiJtaWQiO3M6MTA6IklOSXBheVRlc3QiO3M6Mzoib2lkIjtzOjA6IiI7czo4OiJnb29kbmFtZSI7czoxMDoiIOyZuCAtMeqxtCI7czo1OiJwcmljZSI7czo0OiIxMDAwIjtzOjk6ImJ1eWVybmFtZSI7czoxNToi7LWc6rOg6rSA66as7J6QIjtzOjEwOiJidXllcmVtYWlsIjtzOjE2OiJuaW11cm9AbmF2ZXIuY29tIjtzOjExOiJwYXJlbnRlbWFpbCI7czowOiIiO3M6ODoiYnV5ZXJ0ZWwiO3M6MTE6IjAxMDI1MDY2MzAwIjtzOjg6InJlY3ZuYW1lIjtzOjE1OiLstZzqs6DqtIDrpqzsnpAiO3M6NzoicmVjdnRlbCI7czoxMToiMDEwMjUwNjYzMDAiO3M6ODoicmVjdmFkZHIiO3M6MDoiIjtzOjExOiJyZWN2cG9zdG51bSI7czowOiIiO3M6ODoiY3VycmVuY3kiO3M6MzoiV09OIjtzOjExOiJnb3BheW1ldGhvZCI7czo0OiJLcGF5IjtzOjEyOiJhY2NlcHRtZXRob2QiO3M6NDM6IkhQUCgyKTpub19yZWNlaXB0OnZiYW5rKDIwMjIxMTA3KTpiZWxvdzEwMDAiO3M6OToidGltZXN0YW1wIjtzOjA6IiI7czo5OiJzaWduYXR1cmUiO3M6MDoiIjtzOjk6InJldHVyblVybCI7czo1NDoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL3Nob3AvaW5pY2lzL2luaXN0ZHBheV9yZXR1cm4ucGhwIjtzOjQ6Im1LZXkiO3M6MDoiIjtzOjc6ImNoYXJzZXQiO3M6NToiVVRGLTgiO3M6MTE6InBheVZpZXdUeXBlIjtzOjc6Im92ZXJsYXkiO3M6ODoiY2xvc2VVcmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9jbG9zZS5waHAiO3M6ODoicG9wdXBVcmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9wb3B1cC5waHAiO3M6MTA6Im5vaW50ZXJlc3QiO3M6MDoiIjtzOjk6InF1b3RhYmFzZSI7czoyNDoiMjozOjQ6NTo2Ojc6ODo5OjEwOjExOjEyIjtzOjc6Im9kX25hbWUiO3M6MTU6Iuy1nOqzoOq0gOumrOyekCI7czo2OiJvZF90ZWwiO3M6MTE6IjAxMDI1MDY2MzAwIjtzOjU6Im9kX2hwIjtzOjA6IiI7czo4OiJvZF9lbWFpbCI7czoxNjoibmltdXJvQG5hdmVyLmNvbSI7czoxNDoib2Rfc2V0dGxlX2Nhc2UiO3M6MTI6IuqwhO2OuOqysOygnCI7czoxNToib2RfYmFua19hY2NvdW50IjtzOjM2OiJPT+ydgO2WiSAxMjM0NS02Ny04OTAxMiDsmIjquIjso7zrqoUiO3M6MTU6Im9kX2RlcG9zaXRfbmFtZSI7czoxNToi7LWc6rOg6rSA66as7J6QIjtzOjk6InN3X2RpcmVjdCI7czowOiIiO3M6Nzoib2RfdGVzdCI7czoxOiIxIjtzOjU6Im9kX2lwIjtzOjM6Ijo6MSI7fQ==','2022-11-04 11:30:26');
/*!40000 ALTER TABLE `g5_shop_order_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_delete`
--

DROP TABLE IF EXISTS `g5_shop_order_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_order_delete` (
                                        `de_id` int(11) NOT NULL AUTO_INCREMENT,
                                        `de_key` varchar(255) NOT NULL DEFAULT '',
                                        `de_data` longtext NOT NULL,
                                        `mb_id` varchar(20) NOT NULL DEFAULT '',
                                        `de_ip` varchar(255) NOT NULL DEFAULT '',
                                        `de_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                        PRIMARY KEY (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_delete`
--

LOCK TABLES `g5_shop_order_delete` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_delete` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_order_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_order_post_log`
--

DROP TABLE IF EXISTS `g5_shop_order_post_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_order_post_log` (
                                          `log_id` int(11) NOT NULL AUTO_INCREMENT,
                                          `oid` bigint(20) unsigned NOT NULL,
                                          `mb_id` varchar(255) NOT NULL DEFAULT '',
                                          `post_data` text NOT NULL,
                                          `ol_code` varchar(255) NOT NULL DEFAULT '',
                                          `ol_msg` text NOT NULL,
                                          `ol_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                          `ol_ip` varchar(25) NOT NULL DEFAULT '',
                                          PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_order_post_log`
--

LOCK TABLES `g5_shop_order_post_log` WRITE;
/*!40000 ALTER TABLE `g5_shop_order_post_log` DISABLE KEYS */;
INSERT INTO `g5_shop_order_post_log` VALUES (1,2022110223013084,'zm2life','YTo3NTp7czoxMDoicmVzdWx0Q29kZSI7czo0OiJWMTAxIjtzOjk6InJlc3VsdE1zZyI7czo2MToi7ISg7YOd7ZWcIOqysOygnOyImOuLqOycvOuhnOuKlCDqsrDsoJzqsIAg67aI6rCA64ql7ZWp64uI64ukLiI7czo5OiJyZXR1cm5VcmwiO3M6NTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9pbmlzdGRwYXlfcmV0dXJuLnBocCI7czo3OiJhdXRoVXJsIjtzOjA6IiI7czo3OiJjaGFyc2V0IjtzOjU6IlVURi04IjtzOjc6ImNhcmRudW0iO3M6MDoiIjtzOjExOiJvcmRlck51bWJlciI7czoxNjoiMjAyMjExMDIyMzAxMzA4NCI7czo5OiJhdXRoVG9rZW4iO3M6MDoiIjtzOjExOiJjaGVja0Fja1VybCI7czowOiIiO3M6MTI6Im5ldENhbmNlbFVybCI7czowOiIiO3M6MzoibWlkIjtzOjEwOiJJTklwYXlUZXN0IjtzOjEyOiJtZXJjaGFudERhdGEiO3M6MDoiIjtzOjU6Iml0X2lkIjthOjE6e2k6MDtzOjEwOiIxNjY3MTE1MDU5Ijt9czo3OiJpdF9uYW1lIjthOjE6e2k6MDtzOjIzOiLqsJXsnZgg7IOB7ZKIIO2FjOyKpO2KuCI7fXM6ODoiaXRfcHJpY2UiO2E6MTp7aTowO3M6MToiMCI7fXM6NToiY3BfaWQiO2E6MTp7aTowO3M6MDoiIjt9czo4OiJjcF9wcmljZSI7YToxOntpOjA7czoxOiIwIjt9czo4OiJvZF9wcmljZSI7czoxOiIwIjtzOjEyOiJvcmdfb2RfcHJpY2UiO3M6MToiMCI7czoxMjoib2Rfc2VuZF9jb3N0IjtzOjQ6IjQwMDAiO3M6MTM6Im9kX3NlbmRfY29zdDIiO3M6MToiMCI7czoxMToiaXRlbV9jb3Vwb24iO3M6MToiMCI7czo5OiJvZF9jb3Vwb24iO3M6MToiMCI7czoxNDoib2Rfc2VuZF9jb3Vwb24iO3M6MToiMCI7czoxMzoib2RfZ29vZHNfbmFtZSI7czoyMzoi6rCV7J2YIOyDge2SiCDthYzsiqTtirgiO3M6ODoiZ29vZF9tbnkiO3M6NDoiNDAwMCI7czo3OiJ2ZXJzaW9uIjtzOjM6IjEuMCI7czozOiJvaWQiO3M6MTY6IjIwMjIxMTAyMjMwMTMwODQiO3M6ODoiZ29vZG5hbWUiO3M6MjM6IuqwleydmCDsg4Htkogg7YWM7Iqk7Yq4IjtzOjU6InByaWNlIjtzOjQ6IjQwMDAiO3M6OToiYnV5ZXJuYW1lIjtzOjE1OiLstZzqs6DqtIDrpqzsnpAiO3M6MTA6ImJ1eWVyZW1haWwiO3M6MTY6Im5pbXVyb0BuYXZlci5jb20iO3M6MTE6InBhcmVudGVtYWlsIjtzOjA6IiI7czo4OiJidXllcnRlbCI7czoxOiIxIjtzOjg6InJlY3ZuYW1lIjtzOjE1OiLstZzqs6DqtIDrpqzsnpAiO3M6NzoicmVjdnRlbCI7czoxOiIxIjtzOjg6InJlY3ZhZGRyIjtzOjQzOiLshJzsmrgg64+Z7J6R6rWsIOyEnOuLrOuhnCA5MSAxMDHrj5kgNTAx7Zi4IjtzOjExOiJyZWN2cG9zdG51bSI7czo1OiIwNjk3NSI7czo4OiJjdXJyZW5jeSI7czozOiJXT04iO3M6MTE6ImdvcGF5bWV0aG9kIjtzOjQ6IktwYXkiO3M6MTI6ImFjY2VwdG1ldGhvZCI7czo0MzoiSFBQKDIpOm5vX3JlY2VpcHQ6dmJhbmsoMjAyMjExMDUpOmJlbG93MTAwMCI7czo5OiJ0aW1lc3RhbXAiO3M6MDoiIjtzOjk6InNpZ25hdHVyZSI7czowOiIiO3M6NDoibUtleSI7czowOiIiO3M6MTE6InBheVZpZXdUeXBlIjtzOjc6Im92ZXJsYXkiO3M6ODoiY2xvc2VVcmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9jbG9zZS5waHAiO3M6ODoicG9wdXBVcmwiO3M6NDM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODA4MC9zaG9wL2luaWNpcy9wb3B1cC5waHAiO3M6MTA6Im5vaW50ZXJlc3QiO3M6MDoiIjtzOjk6InF1b3RhYmFzZSI7czoyNDoiMjozOjQ6NTo2Ojc6ODo5OjEwOjExOjEyIjtzOjc6Im9kX25hbWUiO3M6MTU6Iuy1nOqzoOq0gOumrOyekCI7czo2OiJvZF90ZWwiO3M6MToiMSI7czo1OiJvZF9ocCI7czowOiIiO3M6Njoib2RfemlwIjtzOjU6IjA2OTc1IjtzOjg6Im9kX2FkZHIxIjtzOjI5OiLshJzsmrgg64+Z7J6R6rWsIOyEnOuLrOuhnCA5MSI7czo4OiJvZF9hZGRyMiI7czoxMzoiMTAx64+ZIDUwMe2YuCI7czo4OiJvZF9hZGRyMyI7czo0MjoiICjtnZHshJ3rj5ksIO2dkeyEne2VnOqwleyEvO2KuOugiOu5jDLssKgpIjtzOjE0OiJvZF9hZGRyX2ppYmVvbiI7czoxOiJSIjtzOjg6Im9kX2VtYWlsIjtzOjE2OiJuaW11cm9AbmF2ZXIuY29tIjtzOjExOiJhZF9zZWxfYWRkciI7czo0OiJzYW1lIjtzOjEwOiJhZF9zdWJqZWN0IjtzOjA6IiI7czo5OiJvZF9iX25hbWUiO3M6MTU6Iuy1nOqzoOq0gOumrOyekCI7czo4OiJvZF9iX3RlbCI7czoxOiIxIjtzOjc6Im9kX2JfaHAiO3M6MDoiIjtzOjg6Im9kX2JfemlwIjtzOjU6IjA2OTc1IjtzOjEwOiJvZF9iX2FkZHIxIjtzOjI5OiLshJzsmrgg64+Z7J6R6rWsIOyEnOuLrOuhnCA5MSI7czoxMDoib2RfYl9hZGRyMiI7czoxMzoiMTAx64+ZIDUwMe2YuCI7czoxMDoib2RfYl9hZGRyMyI7czo0MjoiICjtnZHshJ3rj5ksIO2dkeyEne2VnOqwleyEvO2KuOugiOu5jDLssKgpIjtzOjE2OiJvZF9iX2FkZHJfamliZW9uIjtzOjE6IlIiO3M6Nzoib2RfbWVtbyI7czowOiIiO3M6MTQ6Im9kX3NldHRsZV9jYXNlIjtzOjEyOiLqsITtjrjqsrDsoJwiO3M6MTU6Im9kX2JhbmtfYWNjb3VudCI7czozNjoiT0/snYDtlokgMTIzNDUtNjctODkwMTIg7JiI6riI7KO866qFIjtzOjE1OiJvZF9kZXBvc2l0X25hbWUiO3M6MDoiIjtzOjk6InN3X2RpcmVjdCI7czoxOiIxIjtzOjc6Im9kX3Rlc3QiO3M6MToiMSI7czo1OiJvZF9pcCI7czozOiI6OjEiO30=','init','init','2022-11-02 23:02:04','::1');
/*!40000 ALTER TABLE `g5_shop_order_post_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_personalpay`
--

DROP TABLE IF EXISTS `g5_shop_personalpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_personalpay` (
                                       `pp_id` bigint(20) unsigned NOT NULL,
                                       `od_id` bigint(20) unsigned NOT NULL,
                                       `pp_name` varchar(255) NOT NULL DEFAULT '',
                                       `pp_email` varchar(255) NOT NULL DEFAULT '',
                                       `pp_hp` varchar(255) NOT NULL DEFAULT '',
                                       `pp_content` text NOT NULL,
                                       `pp_use` tinyint(4) NOT NULL DEFAULT 0,
                                       `pp_price` int(11) NOT NULL DEFAULT 0,
                                       `pp_pg` varchar(255) NOT NULL DEFAULT '',
                                       `pp_tno` varchar(255) NOT NULL DEFAULT '',
                                       `pp_app_no` varchar(20) NOT NULL DEFAULT '',
                                       `pp_casseqno` varchar(255) NOT NULL DEFAULT '',
                                       `pp_receipt_price` int(11) NOT NULL DEFAULT 0,
                                       `pp_settle_case` varchar(255) NOT NULL DEFAULT '',
                                       `pp_bank_account` varchar(255) NOT NULL DEFAULT '',
                                       `pp_deposit_name` varchar(255) NOT NULL DEFAULT '',
                                       `pp_receipt_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                       `pp_receipt_ip` varchar(255) NOT NULL DEFAULT '',
                                       `pp_shop_memo` text NOT NULL,
                                       `pp_cash` tinyint(4) NOT NULL DEFAULT 0,
                                       `pp_cash_no` varchar(255) NOT NULL DEFAULT '',
                                       `pp_cash_info` text NOT NULL,
                                       `pp_ip` varchar(255) NOT NULL DEFAULT '',
                                       `pp_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                       PRIMARY KEY (`pp_id`),
                                       KEY `od_id` (`od_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_personalpay`
--

LOCK TABLES `g5_shop_personalpay` WRITE;
/*!40000 ALTER TABLE `g5_shop_personalpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_personalpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_sendcost`
--

DROP TABLE IF EXISTS `g5_shop_sendcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_sendcost` (
                                    `sc_id` int(11) NOT NULL AUTO_INCREMENT,
                                    `sc_name` varchar(255) NOT NULL DEFAULT '',
                                    `sc_zip1` varchar(10) NOT NULL DEFAULT '',
                                    `sc_zip2` varchar(10) NOT NULL DEFAULT '',
                                    `sc_price` int(11) NOT NULL DEFAULT 0,
                                    PRIMARY KEY (`sc_id`),
                                    KEY `sc_zip1` (`sc_zip1`),
                                    KEY `sc_zip2` (`sc_zip2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_sendcost`
--

LOCK TABLES `g5_shop_sendcost` WRITE;
/*!40000 ALTER TABLE `g5_shop_sendcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_sendcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_shop_wish`
--

DROP TABLE IF EXISTS `g5_shop_wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_shop_wish` (
                                `wi_id` int(11) NOT NULL AUTO_INCREMENT,
                                `mb_id` varchar(255) NOT NULL DEFAULT '',
                                `it_id` varchar(20) NOT NULL DEFAULT '0',
                                `wi_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `wi_ip` varchar(25) NOT NULL DEFAULT '',
                                PRIMARY KEY (`wi_id`),
                                KEY `index1` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_shop_wish`
--

LOCK TABLES `g5_shop_wish` WRITE;
/*!40000 ALTER TABLE `g5_shop_wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_shop_wish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_uniqid`
--

DROP TABLE IF EXISTS `g5_uniqid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_uniqid` (
                             `uq_id` bigint(20) unsigned NOT NULL,
                             `uq_ip` varchar(255) NOT NULL,
                             PRIMARY KEY (`uq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_uniqid`
--

LOCK TABLES `g5_uniqid` WRITE;
/*!40000 ALTER TABLE `g5_uniqid` DISABLE KEYS */;
INSERT INTO `g5_uniqid` VALUES (2022101814364648,'::1'),(2022101814394760,'::1'),(2022101814405165,'::1'),(2022101814410570,'::1'),(2022101814413478,'::1'),(2022101814423188,'::1'),(2022101818385344,'::1'),(2022101818401547,'::1'),(2022101819033585,'::1'),(2022101819152328,'::1'),(2022101819191772,'::1'),(2022101819442242,'::1'),(2022101819482917,'::1'),(2022101819510081,'::1'),(2022101819510084,'::1'),(2022101820292425,'::1'),(2022101820301464,'::1'),(2022101820334241,'::1'),(2022101820451555,'::1'),(2022101820451558,'::1'),(2022101821313565,'::1'),(2022101821313568,'::1'),(2022101821321576,'::1'),(2022101821555885,'::1'),(2022101822134521,'::1'),(2022101822142397,'::1'),(2022101822145528,'::1'),(2022102115205844,'::1'),(2022102115211628,'::1'),(2022102423473728,'::1'),(2022102423513506,'::1'),(2022102500414045,'::1'),(2022102501014180,'::1'),(2022102501085051,'::1'),(2022102511314351,'::1'),(2022102511354602,'::1'),(2022102511383088,'::1'),(2022102511420933,'::1'),(2022102511485792,'::1'),(2022102514353719,'::1'),(2022102514362886,'::1'),(2022102514402447,'::1'),(2022102514480582,'::1'),(2022102514480584,'::1'),(2022102515231874,'::1'),(2022102515233059,'::1'),(2022102515264122,'::1'),(2022102515265793,'::1'),(2022102515271327,'::1'),(2022102515275595,'::1'),(2022102515293352,'::1'),(2022102515300879,'::1'),(2022102815372246,'::1'),(2022102816500931,'::1'),(2022102816561822,'::1'),(2022102816565492,'::1'),(2022102816565839,'::1'),(2022102817400370,'::1'),(2022102817410365,'::1'),(2022102817414109,'::1'),(2022102817420738,'::1'),(2022102817432743,'::1'),(2022102817440859,'::1'),(2022102817442719,'::1'),(2022103016333983,'::1'),(2022103016333987,'::1'),(2022103016340606,'::1'),(2022103111113171,'::1'),(2022103111114485,'::1'),(2022103114241355,'::1'),(2022103114241861,'::1'),(2022110220171837,'::1'),(2022110220200693,'::1'),(2022110220201308,'::1'),(2022110220404242,'::1'),(2022110220404250,'::1'),(2022110221301933,'::1'),(2022110221303399,'::1'),(2022110221304567,'::1'),(2022110221310089,'::1'),(2022110221445946,'::1'),(2022110221453165,'::1'),(2022110221523052,'::1'),(2022110222062181,'::1'),(2022110222123026,'::1'),(2022110222174742,'::1'),(2022110222174750,'::1'),(2022110222175250,'::1'),(2022110222205299,'::1'),(2022110222215066,'::1'),(2022110223013078,'::1'),(2022110223013084,'::1'),(2022110223111166,'::1'),(2022110223112556,'::1'),(2022110223463166,'::1'),(2022110300184606,'::1'),(2022110300184613,'::1'),(2022110300205868,'::1'),(2022110301350326,'::1'),(2022110302532869,'::1'),(2022110411292124,'::1'),(2022110414452839,'::1'),(2022110415031050,'::1'),(2022110415031058,'::1'),(2022110415120064,'::1'),(2022110415121833,'::1'),(2022110415304203,'::1'),(2022110415304211,'::1'),(2022110415383290,'::1'),(2022110415504784,'::1'),(2022110417105405,'::1'),(2022110720404037,'::1'),(2022110720525010,'::1'),(2022110720584931,'::1'),(2022110720593517,'::1'),(2022110720593590,'::1'),(2022110720593650,'::1'),(2022110720593868,'::1'),(2022110720594614,'::1'),(2022110721000715,'::1'),(2022110721004044,'::1'),(2022110721004169,'::1'),(2022110721004237,'::1'),(2022110721004368,'::1'),(2022110721084437,'::1'),(2022110721252254,'::1'),(2022110721252938,'::1'),(2022110721263520,'::1'),(2022110721335888,'::1'),(2022110721340013,'::1'),(2022110721340110,'::1'),(2022110721340330,'::1'),(2022110721351949,'::1'),(2022110721352347,'::1'),(2022110721371018,'::1'),(2022110721373424,'::1'),(2022110721413860,'::1'),(2022110721425739,'::1'),(2022110721434947,'::1'),(2022110721435991,'::1'),(2022110721441012,'::1'),(2022110721444912,'::1'),(2022110721452123,'::1'),(2022110721524412,'::1'),(2022110721530326,'::1'),(2022110721530463,'::1'),(2022110721532145,'::1'),(2022110721540064,'::1'),(2022110721541114,'::1'),(2022110721541785,'::1'),(2022110721550115,'::1'),(2022110721551337,'::1'),(2022110721551772,'::1'),(2022110721570675,'::1'),(2022110721571488,'::1'),(2022110722014489,'::1'),(2022110722015471,'::1'),(2022110722022839,'::1'),(2022110722025151,'::1'),(2022110722043041,'::1'),(2022110722061847,'::1'),(2022110722071383,'::1'),(2022110722300298,'::1'),(2022110722302492,'::1'),(2022110722303913,'::1'),(2022110722305204,'::1'),(2022110722310128,'::1'),(2022110722325320,'::1'),(2022110722350823,'::1'),(2022110722350857,'::1'),(2022110813352572,'::1'),(2022110813361664,'::1'),(2022110813364697,'::1'),(2022110813364940,'::1'),(2022110813364989,'::1'),(2022110813365343,'::1'),(2022110813370555,'::1'),(2022110813370989,'::1'),(2022110813373861,'::1'),(2022110813391677,'::1'),(2022110813422043,'::1'),(2022110813455213,'::1'),(2022110813471014,'::1'),(2022110813473444,'::1'),(2022110813475374,'::1'),(2022110813484970,'::1'),(2022110813500269,'::1'),(2022110813544423,'::1'),(2022110813570087,'::1'),(2022110813573239,'::1'),(2022110813573604,'::1'),(2022110814554642,'::1'),(2022110814560354,'::1'),(2022110814562510,'::1'),(2022110814563879,'::1'),(2022110814573312,'::1'),(2022110815005439,'::1'),(2022110815052826,'::1'),(2022110815085485,'::1'),(2022110815111737,'::1'),(2022110815121182,'::1'),(2022110815174485,'::1'),(2022110815244587,'::1'),(2022110815250190,'::1'),(2022110815252400,'::1'),(2022110815254831,'::1'),(2022110815272289,'::1'),(2022110815275647,'::1'),(2022110815275808,'::1'),(2022110815284937,'::1'),(2022110815293070,'::1'),(2022110815304538,'::1'),(2022110815305871,'::1'),(2022110815312811,'::1'),(2022110815313129,'::1'),(2022110815342247,'::1'),(2022110815352517,'::1'),(2022110815354849,'::1'),(2022110815360135,'::1'),(2022110815373905,'::1'),(2022110815375461,'::1'),(2022110815375712,'::1'),(2022110815375782,'::1'),(2022110815395129,'::1'),(2022110815401973,'::1'),(2022110815403517,'::1'),(2022110815410786,'::1'),(2022110815424590,'::1'),(2022110909403146,'::1'),(2022110910333553,'::1'),(2022110911305827,'::1'),(2022110911310323,'::1'),(2022110911320543,'::1'),(2022110911331112,'::1'),(2022110911331521,'::1'),(2022110911332027,'::1'),(2022110911332056,'::1'),(2022110911332089,'::1'),(2022110911332130,'::1'),(2022110911332169,'::1'),(2022110911332199,'::1'),(2022110911332229,'::1'),(2022110911332261,'::1'),(2022110911332362,'::1'),(2022110911332391,'::1'),(2022110911332422,'::1'),(2022110911332463,'::1'),(2022110911332493,'::1'),(2022110911332534,'::1'),(2022110911332573,'::1'),(2022110911332605,'::1'),(2022110911454828,'::1'),(2022110911455692,'::1'),(2022110911494243,'::1'),(2022110911495605,'::1'),(2022110911510414,'::1'),(2022110911512308,'::1'),(2022110911514575,'::1'),(2022110911520700,'::1'),(2022110911523917,'::1'),(2022110911524991,'::1'),(2022110911535465,'::1'),(2022110911573980,'::1'),(2022110911583310,'::1'),(2022110911592170,'::1'),(2022110911592647,'::1'),(2022110911594535,'::1'),(2022110912063569,'::1'),(2022110912064137,'::1'),(2022110912070663,'::1'),(2022110912071098,'::1'),(2022110912072626,'::1'),(2022110912090070,'::1'),(2022110912091639,'::1'),(2022110912124515,'::1'),(2022110912161189,'::1'),(2022110912171698,'::1'),(2022110912173128,'::1'),(2022110912180886,'::1'),(2022110912195364,'::1'),(2022110912332502,'::1'),(2022110912333192,'::1'),(2022110912364839,'::1'),(2022110912432658,'::1'),(2022110913121840,'::1'),(2022110913130638,'::1'),(2022110913131879,'::1'),(2022110913140681,'::1'),(2022110913212129,'::1'),(2022110913330437,'::1'),(2022110913454825,'::1'),(2022111015510610,'::1'),(2022111018180340,'::1'),(2022111018184887,'::1'),(2022111018190575,'::1'),(2022111018191707,'::1'),(2022111018191867,'::1'),(2022111018192000,'::1'),(2022111018192666,'::1'),(2022111018193137,'::1'),(2022111018204051,'::1'),(2022111018204603,'::1'),(2022111018211487,'::1'),(2022111018212041,'::1'),(2022111018230354,'::1'),(2022111018230508,'::1'),(2022111018232568,'::1'),(2022111018235090,'::1'),(2022111018240883,'::1'),(2022111018252111,'::1'),(2022111018272497,'::1'),(2022111018272638,'::1'),(2022111018283308,'::1'),(2022111018283971,'::1'),(2022111018291258,'::1'),(2022111018292522,'::1'),(2022111018293489,'::1'),(2022111018304464,'::1'),(2022111018312361,'::1'),(2022111018315917,'::1'),(2022111018320097,'::1'),(2022111018321373,'::1'),(2022111018324988,'::1'),(2022111018325229,'::1'),(2022111018325287,'::1'),(2022111018325390,'::1'),(2022111018330016,'::1'),(2022111018330846,'::1'),(2022111018331847,'::1'),(2022111018333662,'::1'),(2022111018354405,'::1'),(2022111018373519,'::1'),(2022111018390129,'::1'),(2022111018392107,'::1'),(2022111018395615,'::1'),(2022111018401715,'::1'),(2022111018404471,'::1'),(2022111018405095,'::1'),(2022111018413324,'::1'),(2022111018415992,'::1'),(2022111018420790,'::1'),(2022111018424705,'::1'),(2022111018425165,'::1'),(2022111018430998,'::1'),(2022111018444178,'::1'),(2022111018444318,'::1'),(2022111018444399,'::1'),(2022111018444478,'::1'),(2022111018444510,'::1'),(2022111018444541,'::1'),(2022111018444568,'::1'),(2022111018444599,'::1'),(2022111018450969,'::1'),(2022111018473911,'::1'),(2022111018521098,'::1'),(2022111018530906,'::1'),(2022111018531347,'::1'),(2022111018540870,'::1'),(2022111018541774,'::1'),(2022111018543757,'::1'),(2022111021413143,'::1'),(2022111021420113,'::1'),(2022111021421785,'::1'),(2022111021481402,'::1'),(2022111021481623,'::1'),(2022111021482909,'::1'),(2022111021502661,'::1'),(2022111021505368,'::1'),(2022111021511347,'::1'),(2022111021520515,'::1'),(2022111021525521,'::1'),(2022111021531223,'::1'),(2022111021532772,'::1'),(2022111021541196,'::1'),(2022111021543316,'::1'),(2022111021550764,'::1'),(2022111021575578,'::1'),(2022111021581738,'::1'),(2022111021592937,'::1'),(2022111021595573,'::1'),(2022111022002861,'::1'),(2022111022074648,'::1'),(2022111022110719,'::1'),(2022111022111732,'::1'),(2022111022113525,'::1'),(2022111022115964,'::1'),(2022111022123766,'::1'),(2022111022144032,'::1'),(2022111022150881,'::1'),(2022111022251999,'::1'),(2022111022252502,'::1'),(2022111022280425,'::1'),(2022111022363510,'::1'),(2022111022363953,'::1'),(2022111022364691,'::1'),(2022111022375260,'::1'),(2022111022380742,'::1'),(2022111022380874,'::1'),(2022111022382710,'::1'),(2022111022390646,'::1'),(2022111022393507,'::1'),(2022111022395043,'::1'),(2022111022401406,'::1'),(2022111022424679,'::1'),(2022111022434143,'::1'),(2022111022455124,'::1'),(2022111022523990,'::1'),(2022111022573343,'::1'),(2022111023001278,'::1'),(2022111023040753,'::1'),(2022111023043625,'::1'),(2022111023053551,'::1'),(2022111023072156,'::1'),(2022111023075903,'::1'),(2022111023081166,'::1'),(2022111023084696,'::1'),(2022111023094394,'::1'),(2022111023105117,'::1'),(2022111023105195,'::1'),(2022111023111887,'::1'),(2022111023112022,'::1'),(2022111023112101,'::1'),(2022111023120764,'::1'),(2022111023120864,'::1'),(2022111023134529,'::1'),(2022111023135387,'::1'),(2022111023135985,'::1'),(2022111023144591,'::1'),(2022111023145125,'::1'),(2022111023201399,'::1'),(2022111023224995,'::1'),(2022111023275779,'::1'),(2022111023412304,'::1'),(2022111023445661,'::1'),(2022111023450961,'::1'),(2022111023454112,'::1'),(2022111023454530,'::1'),(2022111023464962,'::1'),(2022111023465762,'::1'),(2022111023480500,'::1'),(2022111023542697,'::1'),(2022111023543542,'::1'),(2022111100030489,'::1'),(2022111100040761,'::1'),(2022111100041426,'::1'),(2022111100064518,'::1'),(2022111100070412,'::1'),(2022111100070706,'::1'),(2022111100070817,'::1'),(2022111100073314,'::1'),(2022111100081153,'::1'),(2022111100102020,'::1'),(2022111100175318,'::1'),(2022111100184720,'::1'),(2022111100200612,'::1'),(2022111100202275,'::1'),(2022111100203284,'::1'),(2022111100205163,'::1'),(2022111100211756,'::1'),(2022111100221499,'::1'),(2022111100262168,'::1'),(2022111100303975,'::1'),(2022111100331924,'::1'),(2022111100333257,'::1'),(2022111100353171,'::1'),(2022111100354675,'::1'),(2022111100362445,'::1'),(2022111100363228,'::1'),(2022111100425843,'::1'),(2022111100431088,'::1'),(2022111100455843,'::1'),(2022111100471671,'::1'),(2022111100471922,'::1'),(2022111100472930,'::1'),(2022111100474686,'::1'),(2022111100475544,'::1'),(2022111100485534,'::1'),(2022111100505502,'::1'),(2022111100510046,'::1'),(2022111100511602,'::1'),(2022111100514339,'::1'),(2022111100522680,'::1'),(2022111100530501,'::1'),(2022111100540135,'::1'),(2022111100540244,'::1'),(2022111100542657,'::1'),(2022111100552311,'::1'),(2022111100554234,'::1'),(2022111100563046,'::1'),(2022111100564894,'::1'),(2022111100565528,'::1'),(2022111100593333,'::1'),(2022111100594081,'::1'),(2022111100594998,'::1'),(2022111101002917,'::1'),(2022111101005103,'::1'),(2022111101012271,'::1'),(2022111101020688,'::1'),(2022111101022611,'::1'),(2022111101034650,'::1'),(2022111101042659,'::1'),(2022111108592202,'::1'),(2022111109042312,'::1'),(2022111109083550,'::1'),(2022111109084234,'::1'),(2022111109101962,'::1'),(2022111109175639,'::1'),(2022111109183319,'::1'),(2022111109203773,'::1'),(2022111109360126,'::1'),(2022111109375139,'::1'),(2022111109593485,'::1'),(2022111110003146,'::1'),(2022111110140123,'::1'),(2022111211094404,'::1'),(2022111211104435,'::1'),(2022111212443079,'192.168.0.1'),(2022111212513868,'192.168.0.1'),(2022111212514372,'192.168.0.1'),(2022111212522071,'192.168.0.1'),(2022111212523004,'192.168.0.1'),(2022111212534200,'192.168.0.1'),(2022111212544098,'192.168.0.1'),(2022111212595099,'192.168.0.1'),(2022111213054234,'192.168.0.1'),(2022111213165003,'211.234.181.24'),(2022111213230698,'211.234.181.24'),(2022111213334226,'211.234.181.24'),(2022111213360060,'192.168.0.1'),(2022111213371602,'192.168.0.1'),(2022111213375600,'192.168.0.1'),(2022111222414540,'192.168.0.1'),(2022111304430890,'192.168.0.1'),(2022111304470026,'192.168.0.1'),(2022111306532150,'192.168.0.1'),(2022111306591998,'192.168.0.1'),(2022111306592685,'192.168.0.1'),(2022111308124648,'118.235.7.96'),(2022111308312604,'192.168.0.1'),(2022111308315123,'192.168.0.1'),(2022111308422993,'192.168.0.1'),(2022111308424712,'192.168.0.1'),(2022111308440300,'192.168.0.1'),(2022111308440488,'192.168.0.1'),(2022111308442238,'192.168.0.1'),(2022111308475640,'192.168.0.1'),(2022111308475995,'192.168.0.1'),(2022111308480057,'192.168.0.1'),(2022111308492763,'192.168.0.1'),(2022111308492888,'192.168.0.1'),(2022111308493413,'192.168.0.1'),(2022111308505126,'192.168.0.8'),(2022111308505132,'192.168.0.8'),(2022111308512781,'192.168.0.8'),(2022111308523762,'192.168.0.8'),(2022111308524497,'192.168.0.8'),(2022111308524936,'192.168.0.8'),(2022111308532258,'192.168.0.8'),(2022111308542039,'192.168.0.1'),(2022111308545420,'192.168.0.8'),(2022111308552330,'192.168.0.8'),(2022111308553749,'192.168.0.8'),(2022111308564997,'192.168.0.1'),(2022111308570073,'192.168.0.8'),(2022111308572012,'192.168.0.8'),(2022111309012061,'192.168.0.8'),(2022111309030112,'192.168.0.1'),(2022111314102870,'192.168.0.1'),(2022111314110169,'192.168.0.8'),(2022111314114439,'192.168.0.8'),(2022111314133056,'192.168.0.8'),(2022111314133500,'192.168.0.1'),(2022111314141105,'192.168.0.1'),(2022111314141423,'192.168.0.1'),(2022111314143100,'192.168.0.1'),(2022111314144270,'192.168.0.1'),(2022111314145503,'192.168.0.1'),(2022111314150633,'192.168.0.1'),(2022111316152167,'192.168.0.8'),(2022111316185633,'192.168.0.1'),(2022111316191838,'192.168.0.1'),(2022111316194096,'192.168.0.1'),(2022111316235011,'192.168.0.1'),(2022111316253872,'192.168.0.1'),(2022111316270722,'192.168.0.1'),(2022111316280118,'192.168.0.8'),(2022111316280150,'192.168.0.8'),(2022111316293627,'192.168.0.8'),(2022111316295071,'192.168.0.8'),(2022111316301492,'192.168.0.8'),(2022111316331989,'192.168.0.8'),(2022111316332022,'192.168.0.8'),(2022111316344737,'192.168.0.8'),(2022111316370455,'192.168.0.8'),(2022111316370687,'192.168.0.8'),(2022111316371073,'192.168.0.8'),(2022111316373381,'192.168.0.8'),(2022111316375091,'192.168.0.8'),(2022111316382953,'192.168.0.8'),(2022111316383836,'192.168.0.8'),(2022111316384643,'192.168.0.8'),(2022111316385487,'192.168.0.8'),(2022111316385976,'192.168.0.8'),(2022111316405585,'192.168.0.8'),(2022111316414017,'192.168.0.8'),(2022111316414737,'192.168.0.8'),(2022111316415239,'192.168.0.8'),(2022111316415976,'192.168.0.8'),(2022111316430709,'192.168.0.8'),(2022111316431075,'192.168.0.8'),(2022111316434515,'192.168.0.8'),(2022111316450477,'192.168.0.8'),(2022111316474510,'192.168.0.8'),(2022111316475518,'192.168.0.1'),(2022111316475864,'192.168.0.1'),(2022111316480642,'192.168.0.1'),(2022111316501020,'192.168.0.8'),(2022111316503241,'192.168.0.8'),(2022111316524481,'192.168.0.8'),(2022111316525610,'192.168.0.8'),(2022111316530599,'192.168.0.8'),(2022111316533424,'192.168.0.8'),(2022111316542486,'192.168.0.8'),(2022111316545769,'192.168.0.8'),(2022111316564195,'192.168.0.8'),(2022111316582809,'192.168.0.1'),(2022111317100799,'192.168.0.1'),(2022111317101683,'192.168.0.1'),(2022111317102166,'192.168.0.1'),(2022111317103801,'192.168.0.1'),(2022111317123480,'192.168.0.1'),(2022111317263953,'192.168.0.1'),(2022111317265047,'192.168.0.1'),(2022111317324542,'192.168.0.1'),(2022111317350876,'192.168.0.1'),(2022111317414049,'192.168.0.1'),(2022111317420800,'192.168.0.1'),(2022111317462360,'192.168.0.1'),(2022111317470449,'192.168.0.1'),(2022111317482951,'192.168.0.1'),(2022111317502186,'192.168.0.1'),(2022111317514596,'54.36.162.160'),(2022111317540317,'54.36.162.160'),(2022111317540352,'54.36.162.160'),(2022111317540590,'54.36.162.160'),(2022111317540624,'54.36.162.160'),(2022111317540932,'54.36.162.160'),(2022111317540966,'54.36.162.160'),(2022111317541336,'54.36.162.160'),(2022111317541372,'54.36.162.160'),(2022111317541475,'54.36.162.160'),(2022111317541509,'54.36.162.160'),(2022111317541798,'54.36.162.160'),(2022111317541833,'54.36.162.160'),(2022111317542068,'54.36.162.160'),(2022111317542100,'54.36.162.160'),(2022111317543722,'54.36.162.160'),(2022111317543756,'54.36.162.160'),(2022111317572985,'192.168.0.1'),(2022111317573425,'192.168.0.1'),(2022111318002305,'192.168.0.1'),(2022111318005865,'192.168.0.1'),(2022111318022607,'192.168.0.1'),(2022111318033914,'192.168.0.1'),(2022111318053104,'192.168.0.1'),(2022111318053110,'192.168.0.1'),(2022111318061786,'192.168.0.1'),(2022111318073018,'192.168.0.1'),(2022111318083089,'192.168.0.1'),(2022111319294251,'139.99.61.171'),(2022111319305796,'139.99.61.171'),(2022111319305817,'139.99.61.171'),(2022111319305961,'139.99.61.171'),(2022111319305981,'139.99.61.171'),(2022111319310158,'139.99.61.171'),(2022111319310178,'139.99.61.171'),(2022111319310398,'139.99.61.171'),(2022111319310418,'139.99.61.171'),(2022111319310479,'139.99.61.171'),(2022111319310501,'139.99.61.171'),(2022111319310643,'139.99.61.171'),(2022111319310664,'139.99.61.171'),(2022111319310835,'139.99.61.171'),(2022111319310857,'139.99.61.171'),(2022111319311794,'139.99.61.171'),(2022111319311815,'139.99.61.171'),(2022111321383164,'139.99.61.171'),(2022111321394960,'139.99.61.171'),(2022111321394981,'139.99.61.171'),(2022111321395120,'139.99.61.171'),(2022111321395141,'139.99.61.171'),(2022111321395319,'139.99.61.171'),(2022111321395341,'139.99.61.171'),(2022111321395598,'139.99.61.171'),(2022111321395619,'139.99.61.171'),(2022111321395677,'139.99.61.171'),(2022111321395699,'139.99.61.171'),(2022111321395833,'139.99.61.171'),(2022111321395893,'139.99.61.171'),(2022111321400058,'139.99.61.171'),(2022111321400080,'139.99.61.171'),(2022111321401016,'139.99.61.171'),(2022111321401035,'139.99.61.171'),(2022111322092500,'139.99.61.171'),(2022111322092577,'139.99.61.171'),(2022111322225718,'139.99.61.171'),(2022111322240120,'139.99.61.171'),(2022111322245385,'139.99.61.171'),(2022111322245437,'139.99.61.171'),(2022111322290721,'139.99.61.171'),(2022111322293239,'139.99.61.171'),(2022111323332964,'146.59.157.229'),(2022111323353849,'146.59.157.229'),(2022111323353883,'146.59.157.229'),(2022111323354123,'146.59.157.229'),(2022111323354158,'146.59.157.229'),(2022111323354458,'146.59.157.229'),(2022111323354492,'146.59.157.229'),(2022111323354871,'146.59.157.229'),(2022111323354904,'146.59.157.229'),(2022111323355008,'146.59.157.229'),(2022111323355043,'146.59.157.229'),(2022111323355276,'146.59.157.229'),(2022111323355311,'146.59.157.229'),(2022111323355602,'146.59.157.229'),(2022111323355637,'146.59.157.229'),(2022111323361156,'146.59.157.229'),(2022111323361190,'146.59.157.229'),(2022111400062787,'146.59.157.229'),(2022111400063623,'146.59.157.229'),(2022111400164240,'146.59.157.229'),(2022111400170574,'146.59.157.229'),(2022111400174114,'146.59.157.229'),(2022111400175188,'146.59.157.229'),(2022111400183154,'146.59.157.229'),(2022111400185449,'146.59.157.229'),(2022111400192702,'146.59.157.229'),(2022111400192961,'146.59.157.229'),(2022111400195374,'146.59.157.229'),(2022111400200081,'146.59.157.229'),(2022111400224304,'146.59.157.229'),(2022111400225126,'146.59.157.229'),(2022111400255497,'146.59.157.229'),(2022111400260030,'146.59.157.229'),(2022111400294865,'146.59.157.229'),(2022111400294993,'146.59.157.229'),(2022111401103217,'146.59.157.229'),(2022111401103787,'146.59.157.229'),(2022111401130554,'51.210.182.66'),(2022111401151487,'51.210.182.66'),(2022111401151522,'51.210.182.66'),(2022111401151757,'51.210.182.66'),(2022111401151789,'51.210.182.66'),(2022111401152088,'51.210.182.66'),(2022111401152123,'51.210.182.66'),(2022111401152502,'51.210.182.66'),(2022111401152537,'51.210.182.66'),(2022111401152637,'51.210.182.66'),(2022111401152671,'51.210.182.66'),(2022111401152903,'51.210.182.66'),(2022111401152938,'51.210.182.66'),(2022111401153247,'51.210.182.66'),(2022111401153279,'51.210.182.66'),(2022111401154786,'51.210.182.66'),(2022111401154821,'51.210.182.66'),(2022111401450425,'51.210.182.66'),(2022111401450693,'51.210.182.66'),(2022111401553518,'51.210.182.66'),(2022111401553597,'51.210.182.66'),(2022111401562360,'51.210.182.66'),(2022111401562518,'51.210.182.66'),(2022111401594761,'51.210.182.66'),(2022111402002119,'51.210.182.66'),(2022111402012598,'51.210.182.66'),(2022111402012865,'51.210.182.66'),(2022111402023409,'51.210.182.66'),(2022111402024379,'51.210.182.66'),(2022111402032551,'51.210.182.66'),(2022111402032630,'51.210.182.66'),(2022111402054519,'51.210.182.66'),(2022111402055705,'51.210.182.66'),(2022111402223573,'146.59.157.229'),(2022111402243063,'51.210.182.66'),(2022111402244634,'146.59.157.229'),(2022111402244668,'146.59.157.229'),(2022111402244756,'51.210.182.66'),(2022111402244910,'146.59.157.229'),(2022111402244944,'146.59.157.229'),(2022111402245252,'146.59.157.229'),(2022111402245287,'146.59.157.229'),(2022111402245664,'146.59.157.229'),(2022111402245698,'146.59.157.229'),(2022111402245799,'146.59.157.229'),(2022111402245834,'146.59.157.229'),(2022111402250072,'146.59.157.229'),(2022111402250107,'146.59.157.229'),(2022111402250395,'146.59.157.229'),(2022111402250430,'146.59.157.229'),(2022111402251945,'146.59.157.229'),(2022111402251980,'146.59.157.229'),(2022111403191201,'54.37.233.116'),(2022111403213229,'54.37.233.116'),(2022111403213266,'54.37.233.116'),(2022111403213526,'54.37.233.116'),(2022111403213563,'54.37.233.116'),(2022111403213890,'54.37.233.116'),(2022111403213928,'54.37.233.116'),(2022111403214339,'54.37.233.116'),(2022111403214377,'54.37.233.116'),(2022111403214498,'54.37.233.116'),(2022111403214536,'54.37.233.116'),(2022111403214798,'54.37.233.116'),(2022111403214834,'54.37.233.116'),(2022111403215151,'54.37.233.116'),(2022111403215189,'54.37.233.116'),(2022111403220837,'54.37.233.116'),(2022111403220875,'54.37.233.116'),(2022111403451416,'54.37.233.116'),(2022111403453571,'54.37.233.116'),(2022111403565841,'54.37.233.116'),(2022111403570757,'54.37.233.116'),(2022111403574949,'54.37.233.116'),(2022111403575161,'54.37.233.116'),(2022111404003693,'54.37.233.116'),(2022111404010778,'54.37.233.116'),(2022111404031053,'54.37.233.116'),(2022111404031174,'54.37.233.116'),(2022111404031808,'54.37.233.116'),(2022111404032066,'54.37.233.116'),(2022111404041180,'54.37.233.116'),(2022111404041740,'54.37.233.116'),(2022111404045787,'54.37.233.116'),(2022111404045896,'54.37.233.116'),(2022111404162062,'51.210.182.66'),(2022111404183006,'51.210.182.66'),(2022111404183042,'51.210.182.66'),(2022111404183282,'51.210.182.66'),(2022111404183316,'51.210.182.66'),(2022111404183624,'51.210.182.66'),(2022111404183659,'51.210.182.66'),(2022111404184040,'51.210.182.66'),(2022111404184075,'51.210.182.66'),(2022111404184179,'51.210.182.66'),(2022111404184212,'51.210.182.66'),(2022111404184453,'51.210.182.66'),(2022111404184488,'51.210.182.66'),(2022111404184780,'51.210.182.66'),(2022111404184815,'51.210.182.66'),(2022111404190361,'51.210.182.66'),(2022111404190396,'51.210.182.66'),(2022111404271743,'54.37.233.116'),(2022111404273042,'54.37.233.116'),(2022111404535470,'51.210.182.66'),(2022111404535676,'51.210.182.66'),(2022111405190929,'51.195.90.229'),(2022111405212281,'51.195.90.229'),(2022111405212317,'51.195.90.229'),(2022111405212558,'51.195.90.229'),(2022111405212593,'51.195.90.229'),(2022111405212899,'51.195.90.229'),(2022111405212934,'51.195.90.229'),(2022111405213316,'51.195.90.229'),(2022111405213351,'51.195.90.229'),(2022111405213460,'51.195.90.229'),(2022111405213494,'51.195.90.229'),(2022111405213737,'51.195.90.229'),(2022111405213772,'51.195.90.229'),(2022111405214070,'51.195.90.229'),(2022111405214105,'51.195.90.229'),(2022111405215663,'51.195.90.229'),(2022111405215698,'51.195.90.229'),(2022111406051744,'51.210.182.66'),(2022111406072551,'51.210.182.66'),(2022111406072586,'51.210.182.66'),(2022111406072831,'51.210.182.66'),(2022111406072865,'51.210.182.66'),(2022111406073173,'51.210.182.66'),(2022111406073209,'51.210.182.66'),(2022111406073595,'51.210.182.66'),(2022111406073629,'51.210.182.66'),(2022111406073732,'51.210.182.66'),(2022111406073767,'51.210.182.66'),(2022111406074020,'51.210.182.66'),(2022111406074054,'51.210.182.66'),(2022111406074345,'51.210.182.66'),(2022111406074378,'51.210.182.66'),(2022111406075900,'51.210.182.66'),(2022111406075935,'51.210.182.66'),(2022111407240873,'51.195.216.255'),(2022111407261618,'51.195.216.255'),(2022111407261653,'51.195.216.255'),(2022111407261888,'51.195.216.255'),(2022111407261921,'51.195.216.255'),(2022111407262225,'51.195.216.255'),(2022111407262259,'51.195.216.255'),(2022111407262630,'51.195.216.255'),(2022111407262665,'51.195.216.255'),(2022111407262766,'51.195.216.255'),(2022111407262798,'51.195.216.255'),(2022111407263031,'51.195.216.255'),(2022111407263066,'51.195.216.255'),(2022111407263353,'51.195.216.255'),(2022111407263388,'51.195.216.255'),(2022111407264886,'51.195.216.255'),(2022111407264920,'51.195.216.255'),(2022111407542924,'51.195.216.255'),(2022111407543154,'51.195.216.255'),(2022111408020241,'51.195.216.255'),(2022111408020331,'51.195.216.255'),(2022111408021541,'51.195.216.255'),(2022111408021603,'51.195.216.255'),(2022111408022853,'51.195.216.255'),(2022111408022918,'51.195.216.255'),(2022111408024223,'51.195.216.255'),(2022111408024290,'51.195.216.255'),(2022111408024777,'51.195.216.255'),(2022111408024858,'51.195.216.255'),(2022111408030026,'51.195.216.255'),(2022111408030097,'51.195.216.255'),(2022111408030955,'51.195.216.255'),(2022111408031113,'51.195.216.255'),(2022111408042665,'51.195.216.255'),(2022111408042811,'51.195.216.255'),(2022111408085573,'51.195.216.255'),(2022111408085641,'51.195.216.255'),(2022111408115614,'51.195.216.255'),(2022111408115680,'51.195.216.255'),(2022111408125010,'51.195.216.255'),(2022111408125083,'51.195.216.255'),(2022111408132071,'51.195.216.255'),(2022111408132243,'51.195.216.255'),(2022111408142414,'51.195.216.255'),(2022111408142789,'51.195.216.255'),(2022111408143415,'51.195.216.255'),(2022111408143489,'51.195.216.255'),(2022111408144281,'51.195.216.255'),(2022111408144343,'51.195.216.255'),(2022111408150765,'51.195.216.255'),(2022111408150831,'51.195.216.255'),(2022111408175411,'51.195.216.255'),(2022111408175481,'51.195.216.255'),(2022111408274015,'51.195.216.255'),(2022111408274095,'51.195.216.255'),(2022111414575841,'121.133.32.145'),(2022111515392241,'207.46.13.48'),(2022111515393327,'157.55.39.29'),(2022111515394448,'207.46.13.12'),(2022111515400560,'207.46.13.174'),(2022111515553618,'207.46.13.12'),(2022111517402665,'148.251.168.205'),(2022111518052692,'148.251.168.205'),(2022111518054970,'148.251.168.205'),(2022111518061361,'148.251.168.205'),(2022111518063662,'148.251.168.205'),(2022111518070062,'148.251.168.205'),(2022111518074776,'148.251.168.205'),(2022111518081286,'148.251.168.205'),(2022111518100716,'148.251.168.205'),(2022111518562930,'148.251.168.205'),(2022111519294531,'148.251.168.205'),(2022111519340591,'148.251.168.205'),(2022111519342906,'148.251.168.205'),(2022111519344962,'148.251.168.205'),(2022111519351517,'148.251.168.205'),(2022111519353759,'148.251.168.205'),(2022111519355989,'148.251.168.205'),(2022111519362278,'148.251.168.205'),(2022111519364695,'148.251.168.205'),(2022111604415769,'118.235.6.3'),(2022111604423253,'118.235.6.3'),(2022111604425077,'118.235.6.3'),(2022111702410117,'207.46.13.12'),(2022111704411309,'207.46.13.12'),(2022111721323928,'207.46.13.174'),(2022111723115271,'207.46.13.12'),(2022111806010794,'207.46.13.48'),(2022111807413112,'207.46.13.12'),(2022111812490412,'207.46.13.12'),(2022111814434673,'121.133.32.145'),(2022111814434719,'121.133.32.145'),(2022111822132894,'40.77.167.61'),(2022111903035779,'207.46.13.174'),(2022111907431360,'207.46.13.174'),(2022111914241031,'40.77.167.61'),(2022111918074053,'207.46.13.12'),(2022111918534392,'::1');
/*!40000 ALTER TABLE `g5_uniqid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit`
--

DROP TABLE IF EXISTS `g5_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit` (
                            `vi_id` int(11) NOT NULL DEFAULT 0,
                            `vi_ip` varchar(100) NOT NULL DEFAULT '',
                            `vi_date` date NOT NULL DEFAULT '0000-00-00',
                            `vi_time` time NOT NULL DEFAULT '00:00:00',
                            `vi_referer` text NOT NULL,
                            `vi_agent` varchar(200) NOT NULL DEFAULT '',
                            `vi_browser` varchar(255) NOT NULL DEFAULT '',
                            `vi_os` varchar(255) NOT NULL DEFAULT '',
                            `vi_device` varchar(255) NOT NULL DEFAULT '',
                            PRIMARY KEY (`vi_id`),
                            UNIQUE KEY `index1` (`vi_ip`,`vi_date`),
                            KEY `index2` (`vi_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit`
--

LOCK TABLES `g5_visit` WRITE;
/*!40000 ALTER TABLE `g5_visit` DISABLE KEYS */;
INSERT INTO `g5_visit` VALUES (1,'::1','2022-10-18','14:36:32','http://localhost/install/install_db.php','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15','','',''),(2,'::1','2022-10-21','15:19:44','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(3,'::1','2022-10-24','16:39:17','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(4,'::1','2022-10-25','01:08:33','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15','','',''),(5,'::1','2022-10-28','15:37:15','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(6,'::1','2022-10-30','16:19:47','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(7,'::1','2022-10-31','16:23:11','http://localhost:8080/bbs/board.php?bo_table=free&wr_id=3','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(8,'::1','2022-11-04','11:29:06','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(9,'::1','2022-11-05','12:24:55','http://localhost:8080/adm/shop_admin/configform.php','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(10,'::1','2022-11-07','20:37:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(11,'::1','2022-11-09','09:40:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(12,'::1','2022-11-10','15:50:51','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(13,'::1','2022-11-12','11:08:29','http://localhost:8080/shop/','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(14,'192.168.0.8','2022-11-12','12:42:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(15,'192.168.0.1','2022-11-12','12:42:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(16,'118.235.12.127','2022-11-12','12:53:33','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(17,'118.235.12.169','2022-11-12','12:53:49','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(18,'118.235.13.43','2022-11-12','12:53:59','http://125.141.67.249:8080/','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(19,'118.235.12.165','2022-11-12','12:54:12','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(20,'118.235.12.193','2022-11-12','12:54:25','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(21,'118.235.12.57','2022-11-12','12:55:43','http://125.141.67.249:8080/?device=mobile','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(22,'118.235.13.203','2022-11-12','12:55:50','http://125.141.67.249:8080/?device=pc','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(23,'118.235.13.41','2022-11-12','12:56:03','http://125.141.67.249:8080/bbs/group.php?gr_id=market','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(24,'164.90.204.15','2022-11-12','13:04:41','','Go-http-client/1.1','','',''),(25,'211.234.181.24','2022-11-12','13:16:26','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36 Edg/107.0.1418.35','','',''),(26,'61.104.227.199','2022-11-12','13:25:39','http://www.google.com','Mozila/4.0','','',''),(27,'118.235.12.249','2022-11-12','14:16:14','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(28,'205.210.31.17','2022-11-12','14:38:44','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(29,'85.96.6.105','2022-11-12','14:51:14','','curl/7.64.0','','',''),(30,'138.197.153.71','2022-11-12','15:07:18','','Go-http-client/1.1','','',''),(31,'164.92.217.206','2022-11-12','17:06:03','','Go-http-client/1.1','','',''),(32,'118.235.5.105','2022-11-12','17:25:28','','Mozilla/5.0 (Linux; Android 12; SM-G977N Build/SP1A.210812.016; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/107.0.5304.91 Mobile Safari/537.36;KAKAOTALK 2409960','','',''),(33,'45.142.192.5','2022-11-12','17:27:22','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(34,'141.98.10.36','2022-11-12','17:47:33','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36','','',''),(35,'212.224.76.224','2022-11-12','17:54:34','','Go-http-client/1.1','','',''),(36,'78.108.177.51','2022-11-12','19:05:04','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(37,'185.132.53.220','2022-11-12','20:04:58','','Go-http-client/1.1','','',''),(38,'45.142.192.6','2022-11-12','20:21:59','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(39,'46.174.191.32','2022-11-12','21:14:05','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(40,'104.248.247.218','2022-11-12','21:31:37','','Mozilla/5.0 zgrab/0.x','','',''),(41,'176.111.173.223','2022-11-12','21:41:45','','Python/3.7 aiohttp/3.8.3','','',''),(42,'81.16.247.69','2022-11-12','23:00:11','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(43,'198.98.59.132','2022-11-12','23:17:12','','Hello World','','',''),(44,'177.52.26.62','2022-11-12','23:33:44','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(45,'45.142.192.7','2022-11-13','00:11:04','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(46,'205.210.31.139','2022-11-13','00:23:04','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(47,'45.142.192.6','2022-11-13','01:23:08','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(48,'185.209.15.51','2022-11-13','02:00:24','','Go-http-client/1.1','','',''),(49,'34.77.127.183','2022-11-13','02:02:54','','python-requests/2.28.1','','',''),(50,'183.136.225.32','2022-11-13','02:07:17','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','','',''),(51,'87.252.246.13','2022-11-13','03:07:06','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(52,'162.142.125.220','2022-11-13','03:07:21','','','','',''),(53,'46.43.102.24','2022-11-13','03:11:02','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(54,'198.98.59.132','2022-11-13','03:26:22','','Hello World','','',''),(55,'128.14.141.34','2022-11-13','03:38:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(56,'91.98.112.114','2022-11-13','04:40:37','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(57,'192.168.0.1','2022-11-13','04:41:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(58,'45.142.192.8','2022-11-13','04:47:42','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(59,'45.142.192.5','2022-11-13','04:49:42','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(60,'80.82.77.33','2022-11-13','04:52:10','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36','','',''),(61,'184.105.247.248','2022-11-13','04:54:11','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.42','','',''),(62,'192.241.198.96','2022-11-13','05:03:53','','Mozilla/5.0 zgrab/0.x','','',''),(63,'164.90.204.15','2022-11-13','05:28:22','','Go-http-client/1.1','','',''),(64,'185.132.53.220','2022-11-13','05:29:28','','Go-http-client/1.1','','',''),(65,'198.199.95.154','2022-11-13','05:39:03','','Mozilla/5.0 zgrab/0.x','','',''),(66,'138.197.169.111','2022-11-13','05:53:32','','Go-http-client/1.1','','',''),(67,'194.146.24.107','2022-11-13','06:05:29','','Hello World','','',''),(68,'45.184.16.118','2022-11-13','06:15:26','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(69,'103.149.192.134','2022-11-13','06:43:57','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36','','',''),(70,'75.119.147.141','2022-11-13','06:47:03','','','','',''),(71,'134.209.194.194','2022-11-13','06:51:40','','Go-http-client/1.1','','',''),(72,'193.118.53.194','2022-11-13','06:55:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(73,'157.55.39.205','2022-11-13','07:01:04','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(74,'46.174.191.29','2022-11-13','08:11:26','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(75,'118.235.7.96','2022-11-13','08:12:07','','Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-G977N/KSU6HVJ5) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/19.0 Chrome/102.0.5005.125 Mobile Safari/537.36','','',''),(76,'192.168.0.8','2022-11-13','14:11:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(77,'142.93.134.27','2022-11-13','14:20:37','','Mozilla/5.0 zgrab/0.x','','',''),(78,'195.206.54.215','2022-11-13','14:54:23','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(79,'159.65.197.108','2022-11-13','15:20:13','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','','',''),(80,'13.52.231.18','2022-11-13','16:40:17','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','','',''),(81,'192.71.10.105','2022-11-13','16:47:45','','Mozilla/5.0 (Linux; Android 9; BDL8051C Build/BDL3552T; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/66.0.3359.158 Safari/537.36','','',''),(82,'148.113.142.228','2022-11-13','17:12:47','','Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36','','',''),(83,'202.158.70.149','2022-11-13','17:48:01','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(84,'54.36.162.160','2022-11-13','17:50:53','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.83 Safari/537.1','','',''),(85,'212.224.76.224','2022-11-13','17:53:35','','Go-http-client/1.1','','',''),(86,'159.203.15.85','2022-11-13','18:43:16','','','','',''),(87,'117.214.222.6','2022-11-13','18:54:10','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(88,'139.99.61.171','2022-11-13','19:29:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','','',''),(89,'87.236.176.175','2022-11-13','20:07:06','','Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)','','',''),(90,'151.247.207.115','2022-11-13','20:14:54','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(91,'89.104.100.10','2022-11-13','20:19:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(92,'123.60.81.76','2022-11-13','20:48:20','','Mozilla/5.0 (Windows NT 6.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.2976.88 Safari/537.36','','',''),(93,'40.77.167.24','2022-11-13','21:00:37','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(94,'44.236.207.248','2022-11-13','21:03:45','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.119 Safari/537.36','','',''),(95,'192.81.129.251','2022-11-13','21:20:26','','Go-http-client/1.1','','',''),(96,'137.184.161.231','2022-11-13','21:26:59','','Mozilla/5.0 zgrab/0.x','','',''),(97,'85.96.6.105','2022-11-13','21:30:34','','curl/7.64.0','','',''),(98,'4.227.245.176','2022-11-13','21:50:55','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0','','',''),(99,'128.14.209.242','2022-11-13','22:07:04','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36','','',''),(100,'20.235.105.97','2022-11-13','22:51:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(101,'20.150.146.176','2022-11-13','23:12:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(102,'146.59.157.229','2022-11-13','23:32:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(103,'41.90.182.61','2022-11-13','23:36:04','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(104,'167.94.146.59','2022-11-13','23:36:14','','','','',''),(105,'135.148.195.15','2022-11-13','23:36:41','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_2) AppleWebKit/537.17 (KHTML, like Gecko) Chrome/24.0.1309.0 Safari/537.17','','',''),(106,'45.90.60.185','2022-11-13','23:40:38','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(107,'185.181.60.12','2022-11-13','23:43:43','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36 Edg/91.0.864.54','','',''),(108,'146.59.157.229','2022-11-14','00:01:09','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(109,'95.139.111.221','2022-11-14','00:02:12','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(110,'123.60.81.76','2022-11-14','00:32:30','','Mozilla/5.0 (Windows NT 5.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3981.88 Safari/537.36','','',''),(111,'109.207.78.185','2022-11-14','00:34:15','','Go-http-client/1.1','','',''),(112,'23.251.102.74','2022-11-14','00:42:26','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(113,'184.105.247.243','2022-11-14','00:49:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 OPR/90.0.4480.84','','',''),(114,'45.142.192.9','2022-11-14','00:50:01','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(115,'164.90.204.15','2022-11-14','00:58:38','','Go-http-client/1.1','','',''),(116,'51.210.182.66','2022-11-14','01:12:13','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(117,'34.76.96.55','2022-11-14','01:51:04','','python-requests/2.28.1','','',''),(118,'46.174.191.31','2022-11-14','01:55:53','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(119,'85.31.44.156','2022-11-14','01:58:04','','','','',''),(120,'185.16.139.122','2022-11-14','01:58:29','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(121,'94.102.61.10','2022-11-14','01:59:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(122,'78.108.177.52','2022-11-14','01:59:53','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(123,'95.154.146.90','2022-11-14','02:03:55','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(124,'78.38.51.213','2022-11-14','02:06:28','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(125,'104.248.148.229','2022-11-14','02:38:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(126,'35.88.108.30','2022-11-14','02:41:29','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:57.0) Gecko/20100101 Firefox/57.0','','',''),(127,'185.164.172.241','2022-11-14','02:52:47','','','','',''),(128,'157.230.185.174','2022-11-14','03:04:05','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(129,'75.119.147.141','2022-11-14','03:13:09','','','','',''),(130,'20.213.240.186','2022-11-14','03:14:46','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(131,'54.37.233.116','2022-11-14','03:18:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','','',''),(132,'8.215.81.187','2022-11-14','03:22:40','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','','',''),(133,'87.236.176.24','2022-11-14','03:40:53','','Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)','','',''),(134,'188.119.51.126','2022-11-14','03:52:56','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(135,'198.98.59.132','2022-11-14','03:59:32','','Hello World','','',''),(136,'134.209.194.194','2022-11-14','04:13:09','','Go-http-client/1.1','','',''),(137,'176.111.173.223','2022-11-14','04:17:11','','Python/3.7 aiohttp/3.8.3','','',''),(138,'146.190.222.71','2022-11-14','04:40:29','','Mozilla/5.0 zgrab/0.x','','',''),(139,'45.142.192.5','2022-11-14','04:45:01','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(140,'68.183.181.15','2022-11-14','05:12:18','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(141,'41.216.183.151','2022-11-14','05:16:05','','','','',''),(142,'51.195.90.229','2022-11-14','05:18:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(143,'52.229.103.48','2022-11-14','05:28:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36','','',''),(144,'37.44.238.205','2022-11-14','06:47:56','','Linux Gnu (cow)','','',''),(145,'45.142.192.7','2022-11-14','06:48:12','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(146,'37.44.238.230','2022-11-14','07:10:02','','Linux Gnu (cow)','','',''),(147,'45.142.192.6','2022-11-14','07:18:28','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(148,'51.195.216.255','2022-11-14','07:23:17','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','','',''),(149,'146.190.36.157','2022-11-14','07:36:47','','','','',''),(150,'89.104.100.166','2022-11-14','07:40:07','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(151,'172.245.217.87','2022-11-14','07:44:19','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36','','',''),(152,'104.165.199.178','2022-11-14','07:49:44','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36','','',''),(153,'64.57.140.72','2022-11-14','08:06:53','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.63 Safari/537.36','','',''),(154,'109.248.6.45','2022-11-14','08:20:48','','masscan-ng/1.3 (https://github.com/bi-zone/masscan-ng)','','',''),(155,'192.168.0.1','2022-11-14','08:58:17','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(156,'198.244.152.59','2022-11-14','09:06:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0','','',''),(157,'162.248.53.56','2022-11-14','09:15:58','','','','',''),(158,'192.241.201.68','2022-11-14','09:27:41','','Mozilla/5.0 zgrab/0.x','','',''),(159,'41.216.183.131','2022-11-14','09:30:00','','','','',''),(160,'192.241.193.126','2022-11-14','09:30:41','','Mozilla/5.0 zgrab/0.x','','',''),(161,'103.149.192.162','2022-11-14','09:44:46','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36','','',''),(162,'71.6.135.131','2022-11-14','09:46:02','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36','','',''),(163,'139.59.106.244','2022-11-14','09:47:17','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','','',''),(164,'128.1.248.42','2022-11-14','09:50:29','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(165,'192.241.199.91','2022-11-14','10:10:49','','Mozilla/5.0 zgrab/0.x','','',''),(166,'20.229.51.198','2022-11-14','10:15:41','','Go-http-client/1.1','','',''),(167,'185.246.220.20','2022-11-14','10:21:34','','','','',''),(168,'34.223.93.92','2022-11-14','10:43:48','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36','','',''),(169,'184.105.247.214','2022-11-14','10:51:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.53','','',''),(170,'27.115.124.6','2022-11-14','10:54:33','http://baidu.com/','Mozilla/5.0 (Linux; U; Android 8.0.0; zh-cn; Mi Note 2 Build/OPR1.170623.032) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/61.0.3163.128 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.1.1','','',''),(171,'40.113.118.83','2022-11-14','11:14:42','','Go-http-client/1.1','','',''),(172,'147.182.241.6','2022-11-14','11:19:24','','','','',''),(173,'146.190.40.85','2022-11-14','11:19:58','','','','',''),(174,'121.156.47.201','2022-11-14','11:50:09','','Python/3.8 aiohttp/3.6.2','','',''),(175,'183.136.225.32','2022-11-14','11:50:38','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','','',''),(176,'94.102.61.45','2022-11-14','12:15:04','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(177,'121.156.47.224','2022-11-14','12:18:33','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3','','',''),(178,'121.156.47.207','2022-11-14','12:27:02','','Python/3.8 aiohttp/3.6.2','','',''),(179,'40.117.185.219','2022-11-14','12:33:46','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.24 (KHTML, like Gecko) Chrome/11.0.696.71 Safari/534.24','','',''),(180,'20.127.203.214','2022-11-14','12:34:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(181,'206.189.231.200','2022-11-14','12:39:45','','Go-http-client/1.1','','',''),(182,'71.6.232.23','2022-11-14','13:08:32','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','','',''),(183,'121.156.47.221','2022-11-14','13:15:55','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3','','',''),(184,'113.125.51.198','2022-11-14','13:17:04','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(185,'169.50.87.37','2022-11-14','13:46:33','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','','',''),(186,'45.142.192.8','2022-11-14','14:12:51','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(187,'54.189.230.128','2022-11-14','14:26:48','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.5304.107 Safari/537.36','','',''),(188,'121.133.32.145','2022-11-14','14:57:48','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(189,'211.249.40.28','2022-11-14','15:22:03','','Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1','','',''),(190,'185.213.175.12','2022-11-14','15:24:31','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(191,'45.61.161.61','2022-11-14','15:31:59','','Go-http-client/1.1','','',''),(192,'43.156.25.237','2022-11-14','15:33:25','','\'Mozilla/5.0','','',''),(193,'176.53.220.228','2022-11-14','15:37:43','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(194,'111.7.100.21','2022-11-14','15:45:38','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(195,'111.7.100.23','2022-11-14','15:46:48','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(196,'111.7.100.22','2022-11-14','15:46:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(197,'36.99.136.141','2022-11-14','15:47:41','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(198,'36.99.136.142','2022-11-14','15:47:42','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(199,'36.99.136.143','2022-11-14','15:47:42','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(200,'111.7.100.26','2022-11-14','15:47:44','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(201,'36.99.136.135','2022-11-14','15:47:45','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(202,'36.99.136.134','2022-11-14','15:47:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(203,'111.7.100.27','2022-11-14','15:47:51','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(204,'36.99.136.132','2022-11-14','15:48:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(205,'111.7.100.24','2022-11-14','15:48:26','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(206,'111.7.100.20','2022-11-14','15:48:49','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(207,'36.99.136.133','2022-11-14','15:49:07','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(208,'111.7.100.25','2022-11-14','15:49:10','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(209,'36.99.136.138','2022-11-14','15:49:11','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(210,'36.99.136.131','2022-11-14','15:49:12','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(211,'36.99.136.130','2022-11-14','15:49:13','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(212,'36.99.136.139','2022-11-14','15:49:21','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(213,'36.99.136.140','2022-11-14','15:50:44','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(214,'122.176.203.180','2022-11-14','15:51:06','','','','',''),(215,'164.77.147.186','2022-11-14','15:54:51','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(216,'3.89.5.218','2022-11-14','16:01:05','','Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/52.0.3024.65 Safari/537.32','','',''),(217,'45.79.38.68','2022-11-14','16:13:44','','curl/7.29.0','','',''),(218,'176.60.70.126','2022-11-14','16:27:30','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(219,'54.91.149.51','2022-11-14','16:27:34','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(220,'138.197.78.232','2022-11-14','17:36:51','','Mozilla/5.0 zgrab/0.x','','',''),(221,'5.144.72.166','2022-11-14','17:52:31','','','','',''),(222,'212.224.76.224','2022-11-14','17:53:52','','Go-http-client/1.1','','',''),(223,'58.251.94.154','2022-11-14','18:47:09','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36','','',''),(224,'144.168.158.171','2022-11-14','18:47:48','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(225,'144.168.218.228','2022-11-14','18:47:55','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(226,'146.70.28.54','2022-11-14','19:01:42','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36','','',''),(227,'89.248.168.55','2022-11-14','19:04:48','','','','',''),(228,'37.44.238.114','2022-11-14','19:09:34','','Linux Gnu (cow)','','',''),(229,'154.89.5.105','2022-11-14','19:22:58','','','','',''),(230,'64.62.197.199','2022-11-14','19:33:06','','Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0','','',''),(231,'41.204.92.228','2022-11-14','19:35:21','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(232,'45.82.121.61','2022-11-14','19:35:34','','Go-http-client/1.1','','',''),(233,'34.77.127.183','2022-11-14','19:37:39','','python-requests/2.28.1','','',''),(234,'20.0.210.58','2022-11-14','19:37:51','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(235,'206.189.39.228','2022-11-14','19:49:29','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(236,'103.254.56.241','2022-11-14','20:32:11','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(237,'170.254.224.114','2022-11-14','20:33:58','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(238,'41.216.183.132','2022-11-14','20:39:55','','','','',''),(239,'13.95.133.245','2022-11-14','21:18:18','','Go-http-client/1.1','','',''),(240,'85.96.6.105','2022-11-14','21:27:52','','curl/7.64.0','','',''),(241,'8.41.221.50','2022-11-14','21:49:22','','Mozilla/5.0 Firefox/33.0','','',''),(242,'109.69.66.101','2022-11-14','22:19:31','','webtech/1.2.11','','',''),(243,'165.227.0.21','2022-11-14','23:02:26','','Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0','','',''),(244,'95.177.177.25','2022-11-14','23:14:29','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1','','',''),(245,'121.159.21.119','2022-11-14','23:34:25','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/5E2536','','',''),(246,'210.250.89.5','2022-11-14','23:34:26','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/70461C','','',''),(247,'51.158.100.91','2022-11-14','23:51:37','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.53','','',''),(248,'198.50.243.162','2022-11-14','23:54:54','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(249,'51.158.97.23','2022-11-15','00:09:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4469.0 Safari/537.36','','',''),(250,'164.90.204.15','2022-11-15','00:09:45','','Go-http-client/1.1','','',''),(251,'20.229.51.198','2022-11-15','00:18:22','','Go-http-client/1.1','','',''),(252,'163.172.145.85','2022-11-15','00:18:46','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(253,'51.158.96.200','2022-11-15','00:18:46','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 OPR/91.0.4516.20','','',''),(254,'51.158.98.238','2022-11-15','00:18:48','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/602.1 (KHTML, like Gecko) splash Version/10.0 Safari/602.1','','',''),(255,'51.158.100.125','2022-11-15','00:18:48','','Mozilla/5.0 (iPhone; CPU iPhone OS 15_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Mobile/15E148 Safari/604.1','','',''),(256,'51.158.68.35','2022-11-15','00:18:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(257,'51.15.236.143','2022-11-15','00:18:50','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(258,'51.15.223.189','2022-11-15','00:18:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(259,'163.172.173.238','2022-11-15','00:18:51','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(260,'51.158.112.159','2022-11-15','00:18:51','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(261,'51.158.109.29','2022-11-15','00:18:52','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(262,'51.15.247.139','2022-11-15','00:18:57','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(263,'163.172.171.198','2022-11-15','00:19:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(264,'51.158.112.208','2022-11-15','00:19:01','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15','','',''),(265,'51.158.74.117','2022-11-15','00:19:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(266,'212.47.253.217','2022-11-15','00:19:09','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(267,'51.158.100.53','2022-11-15','00:19:11','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.17','','',''),(268,'51.158.111.124','2022-11-15','00:20:58','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.5296.0 Safari/537.36','','',''),(269,'46.4.33.48','2022-11-15','00:36:53','','Mozilla/5.0 (Windows; U; Windows NT 5.1; ru; rv:1.9.0.1) Gecko/2008070208','','',''),(270,'13.68.148.49','2022-11-15','00:43:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(271,'130.211.54.158','2022-11-15','01:40:43','','python-requests/2.28.1','','',''),(272,'153.246.135.238','2022-11-15','01:59:04','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/104.0.0.0 Mobile/15E148 Safari/604.1','','',''),(273,'45.142.192.8','2022-11-15','02:14:39','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(274,'13.95.133.245','2022-11-15','02:20:23','','Go-http-client/1.1','','',''),(275,'205.210.31.132','2022-11-15','02:22:21','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(276,'60.246.212.139','2022-11-15','02:53:41','','Mozilla/5.0 (Windows NT 6.1; WOW64) Chrome','','',''),(277,'45.142.192.5','2022-11-15','02:57:56','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(278,'188.166.35.250','2022-11-15','03:02:11','','Mozilla/5.0 zgrab/0.x','','',''),(279,'78.108.177.52','2022-11-15','03:12:00','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(280,'114.160.71.84','2022-11-15','03:21:54','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/104.0.0.0 Mobile/15E148 Safari/604.1','','',''),(281,'220.70.4.83','2022-11-15','03:26:35','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/D8F56A','','',''),(282,'38.42.18.246','2022-11-15','03:26:37','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/E14026','','',''),(283,'121.156.47.201','2022-11-15','03:27:18','','Python/3.8 aiohttp/3.6.2','','',''),(284,'170.254.179.177','2022-11-15','03:31:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(285,'198.98.59.132','2022-11-15','03:36:49','','Hello World','','',''),(286,'89.144.162.120','2022-11-15','03:38:57','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(287,'121.156.47.207','2022-11-15','03:41:51','','Python/3.8 aiohttp/3.6.2','','',''),(288,'20.205.117.179','2022-11-15','03:48:12','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(289,'111.7.100.20','2022-11-15','04:03:10','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(290,'111.7.100.23','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(291,'111.7.100.26','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(292,'111.7.100.25','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(293,'111.7.100.22','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(294,'111.7.100.24','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(295,'111.7.100.27','2022-11-15','04:05:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(296,'36.99.136.134','2022-11-15','04:05:04','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(297,'36.99.136.130','2022-11-15','04:05:04','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(298,'36.99.136.143','2022-11-15','04:05:04','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(299,'36.99.136.142','2022-11-15','04:05:05','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(300,'111.7.100.21','2022-11-15','04:05:09','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(301,'36.99.136.140','2022-11-15','04:05:11','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(302,'36.99.136.138','2022-11-15','04:05:48','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(303,'36.99.136.135','2022-11-15','04:06:16','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(304,'36.99.136.139','2022-11-15','04:06:41','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(305,'36.99.136.131','2022-11-15','04:06:43','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(306,'75.119.147.141','2022-11-15','04:27:04','','','','',''),(307,'89.143.168.154','2022-11-15','04:53:00','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(308,'183.136.225.32','2022-11-15','04:59:20','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','','',''),(309,'71.6.232.25','2022-11-15','05:27:18','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36','','',''),(310,'188.166.0.85','2022-11-15','05:30:44','','Mozilla/5.0 zgrab/0.x','','',''),(311,'109.123.243.174','2022-11-15','05:32:53','','Go-http-client/1.1','','',''),(312,'72.46.129.179','2022-11-15','05:50:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(313,'45.135.17.155','2022-11-15','05:56:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(314,'20.213.240.186','2022-11-15','06:04:40','','Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0','','',''),(315,'23.111.114.116','2022-11-15','06:11:57','','Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.127 Mobile Safari/537.36','','',''),(316,'46.174.191.32','2022-11-15','06:13:29','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(317,'20.232.23.128','2022-11-15','06:28:53','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(318,'45.142.192.9','2022-11-15','07:00:20','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(319,'104.131.2.76','2022-11-15','07:01:36','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36','','',''),(320,'198.235.24.174','2022-11-15','07:07:17','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(321,'45.135.16.2','2022-11-15','07:31:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(322,'51.142.93.71','2022-11-15','07:41:19','http://zm2life.com','Mozilla/5.0 (Macintosh; Intel Mac OS X 12.5; rv:102.0) Gecko/20100101 Firefox/102.0','','',''),(323,'103.147.185.14','2022-11-15','07:41:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0 Safari/537.36','','',''),(324,'45.142.192.7','2022-11-15','08:06:56','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(325,'195.201.41.238','2022-11-15','08:13:53','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5','','',''),(326,'45.142.192.6','2022-11-15','08:19:09','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(327,'37.49.230.15','2022-11-15','08:25:38','','','','',''),(328,'54.244.177.77','2022-11-15','08:45:27','','CheckMarkNetwork/1.0 (+http://www.checkmarknetwork.com/spider.html)','','',''),(329,'20.86.56.244','2022-11-15','08:46:41','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(330,'154.89.5.38','2022-11-15','08:52:22','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','','',''),(331,'167.99.70.73','2022-11-15','08:54:40','','python-requests/2.28.1','','',''),(332,'8.215.81.187','2022-11-15','08:56:02','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','','',''),(333,'149.102.154.165','2022-11-15','09:07:57','','','','',''),(334,'65.49.20.68','2022-11-15','09:10:13','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(335,'8.41.221.48','2022-11-15','09:14:33','','Mozilla/5.0 Firefox/33.0','','',''),(336,'202.164.208.226','2022-11-15','09:21:25','','curl/7.29.0','','',''),(337,'103.47.219.15','2022-11-15','09:24:42','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(338,'198.199.96.218','2022-11-15','09:30:09','','Mozilla/5.0 zgrab/0.x','','',''),(339,'192.241.201.125','2022-11-15','09:32:19','','Mozilla/5.0 zgrab/0.x','','',''),(340,'138.197.155.124','2022-11-15','09:37:08','','','','',''),(341,'162.142.125.211','2022-11-15','09:50:02','','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','','',''),(342,'106.75.178.84','2022-11-15','09:51:20','','','','',''),(343,'20.127.203.214','2022-11-15','10:18:26','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(344,'45.90.63.97','2022-11-15','10:23:57','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(345,'141.255.166.2','2022-11-15','10:54:07','','Hello World','','',''),(346,'154.89.5.45','2022-11-15','11:01:04','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','','',''),(347,'35.194.102.29','2022-11-15','11:07:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36','','',''),(348,'154.89.5.36','2022-11-15','11:38:29','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.112 Safari/537.36','','',''),(349,'159.223.82.69','2022-11-15','12:02:52','','Mozilla/5.0 zgrab/0.x','','',''),(350,'133.242.140.127','2022-11-15','12:18:16','','Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1','','',''),(351,'185.180.143.140','2022-11-15','12:19:56','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(352,'133.242.174.119','2022-11-15','12:20:07','','Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1','','',''),(353,'182.140.82.79','2022-11-15','12:28:44','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36','','',''),(354,'185.164.172.241','2022-11-15','12:29:23','','','','',''),(355,'123.60.81.76','2022-11-15','12:30:34','','Mozilla/5.0 (Windows NT 9.9; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.1293.88 Safari/537.36','','',''),(356,'167.172.85.27','2022-11-15','12:35:10','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(357,'42.83.147.43','2022-11-15','13:03:34','','Mozilla/5.0 (Linux; U; Android 2.2; en-us; Nexus One Build/FRF91) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1','','',''),(358,'37.44.238.205','2022-11-15','13:03:47','','Linux Gnu (cow)','','',''),(359,'80.120.129.210','2022-11-15','13:15:02','','Mozilla/5.0 Firefox/26.0','','',''),(360,'179.107.51.101','2022-11-15','13:28:02','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(361,'185.228.49.198','2022-11-15','13:44:29','','python-requests/2.28.1','','',''),(362,'37.44.238.230','2022-11-15','13:57:36','','Linux Gnu (cow)','','',''),(363,'129.126.226.113','2022-11-15','14:13:43','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15','','',''),(364,'223.111.175.25','2022-11-15','14:24:05','','curl/7.29.0','','',''),(365,'205.210.31.149','2022-11-15','14:34:11','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(366,'104.152.52.214','2022-11-15','14:37:57','','masscan/1.3 (https://github.com/robertdavidgraham/masscan)','','',''),(367,'185.180.143.8','2022-11-15','14:40:05','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(368,'103.83.144.92','2022-11-15','14:41:50','','','','',''),(369,'34.171.52.20','2022-11-15','14:51:28','http://www.google.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','','',''),(370,'86.119.25.98','2022-11-15','14:58:14','','Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko','','',''),(371,'34.170.231.50','2022-11-15','15:04:04','http://www.google.com/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36','','',''),(372,'157.55.39.96','2022-11-15','15:34:52','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(373,'207.46.13.48','2022-11-15','15:38:40','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(374,'157.55.39.29','2022-11-15','15:38:42','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(375,'207.46.13.37','2022-11-15','15:38:42','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(376,'207.46.13.174','2022-11-15','15:38:45','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(377,'128.14.134.134','2022-11-15','15:38:47','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(378,'207.46.13.12','2022-11-15','15:38:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(379,'164.90.133.231','2022-11-15','15:43:07','','','','',''),(380,'185.180.143.71','2022-11-15','15:43:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(381,'122.194.0.238','2022-11-15','15:47:24','','Chrome/69.0.3497.81 Safari/537.36','','',''),(382,'40.113.118.83','2022-11-15','15:47:54','','Go-http-client/1.1','','',''),(383,'167.94.138.46','2022-11-15','16:09:24','','','','',''),(384,'86.191.219.135','2022-11-15','16:31:36','','','','',''),(385,'148.251.168.205','2022-11-15','16:33:36','','serpstatbot/2.1 (advanced backlink tracking bot; https://serpstatbot.com/; abuse@serpstatbot.com)','','',''),(386,'128.14.209.162','2022-11-15','16:57:45','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(387,'78.108.177.51','2022-11-15','17:05:11','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(388,'117.214.218.207','2022-11-15','17:07:22','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(389,'14.116.152.103','2022-11-15','17:38:47','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(390,'167.94.146.59','2022-11-15','17:49:01','','','','',''),(391,'212.224.76.224','2022-11-15','17:54:10','','Go-http-client/1.1','','',''),(392,'173.214.175.178','2022-11-15','18:03:21','','Go-http-client/1.1','','',''),(393,'94.131.79.28','2022-11-15','18:17:08','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.87 Safari/537.36','','',''),(394,'64.62.197.39','2022-11-15','18:28:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36','','',''),(395,'44.203.215.196','2022-11-15','18:29:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.0 Safari/537.36','','',''),(396,'223.111.175.64','2022-11-15','18:40:03','','curl/7.29.0','','',''),(397,'31.39.3.238','2022-11-15','18:41:56','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(398,'36.99.136.141','2022-11-15','18:56:12','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(399,'36.99.136.132','2022-11-15','18:56:20','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(400,'36.99.136.133','2022-11-15','18:56:22','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(401,'35.233.62.116','2022-11-15','19:03:30','','python-requests/2.28.1','','',''),(402,'173.249.24.73','2022-11-15','19:54:39','','Python/3.6 aiohttp/3.5.4','','',''),(403,'34.28.81.205','2022-11-15','19:56:58','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36','','',''),(404,'128.14.141.34','2022-11-15','21:28:00','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(405,'89.187.163.208','2022-11-15','21:28:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(406,'221.2.155.200','2022-11-15','21:28:48','','Mozilla/5.0','','',''),(407,'54.37.86.182','2022-11-15','21:30:17','','PycURL/7.43.0.6 libcurl/7.29.0 NSS/3.53.1 zlib/1.2.7 libidn/1.28 libssh2/1.8.0','','',''),(408,'185.54.230.242','2022-11-15','21:44:17','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(409,'54.36.148.7','2022-11-15','21:47:36','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(410,'95.177.177.25','2022-11-15','21:58:03','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1','','',''),(411,'58.122.232.207','2022-11-15','22:07:33','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/285585','','',''),(412,'144.64.118.152','2022-11-15','22:07:35','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/EA60D0','','',''),(413,'163.107.73.235','2022-11-15','22:08:32','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','','',''),(414,'85.96.6.105','2022-11-15','22:14:30','','curl/7.64.0','','',''),(415,'54.36.148.104','2022-11-15','22:18:26','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(416,'52.186.179.138','2022-11-15','22:23:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(417,'139.59.247.161','2022-11-15','22:26:28','','','','',''),(418,'54.36.148.241','2022-11-15','22:34:17','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(419,'51.222.253.6','2022-11-15','22:49:04','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(420,'180.247.47.97','2022-11-15','23:02:53','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(421,'51.222.253.13','2022-11-15','23:03:36','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(422,'51.222.253.18','2022-11-15','23:28:52','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(423,'118.235.6.3','2022-11-15','23:35:42','','Mozilla/5.0 (Linux; Android 12; SAMSUNG SM-G977N/KSU6HVJ5) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/19.0 Chrome/102.0.5005.125 Mobile Safari/537.36','','',''),(424,'51.222.253.19','2022-11-15','23:41:29','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(425,'51.222.253.10','2022-11-15','23:53:59','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(426,'164.90.204.15','2022-11-16','00:04:39','','Go-http-client/1.1','','',''),(427,'51.222.253.5','2022-11-16','00:08:32','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(428,'51.222.253.18','2022-11-16','00:56:36','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(429,'34.207.231.31','2022-11-16','01:02:23','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36','','',''),(430,'13.68.148.49','2022-11-16','01:03:10','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(431,'89.104.101.220','2022-11-16','01:09:17','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(432,'128.14.133.58','2022-11-16','01:31:36','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(433,'45.142.192.7','2022-11-16','01:38:55','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(434,'184.105.247.228','2022-11-16','01:40:06','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Safari/605.1.15','','',''),(435,'46.109.8.120','2022-11-16','01:41:55','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(436,'123.60.81.76','2022-11-16','01:43:53','','Mozilla/5.0 (Windows NT 9.7; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3231.88 Safari/537.36','','',''),(437,'133.242.140.127','2022-11-16','01:52:10','','Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1','','',''),(438,'133.242.174.119','2022-11-16','01:52:23','','Mozilla/5.0 (Linux; U; Android 2.2; ja-jp; SC-02B Build/FROYO) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1','','',''),(439,'198.98.59.132','2022-11-16','01:57:53','','Hello World','','',''),(440,'128.1.248.26','2022-11-16','02:23:09','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(441,'117.33.227.207','2022-11-16','03:32:27','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(442,'141.255.166.2','2022-11-16','04:08:28','','Hello World','','',''),(443,'121.156.47.201','2022-11-16','04:45:52','','Python/3.8 aiohttp/3.6.2','','',''),(444,'54.174.173.150','2022-11-16','04:58:56','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(445,'54.242.157.167','2022-11-16','04:58:57','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(446,'121.156.47.207','2022-11-16','05:57:26','','Python/3.8 aiohttp/3.6.2','','',''),(447,'122.51.129.197','2022-11-16','06:45:02','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/18.17763','','',''),(448,'85.31.44.178','2022-11-16','06:51:53','','','','',''),(449,'139.59.107.133','2022-11-16','06:54:22','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(450,'212.224.76.224','2022-11-16','07:15:12','','Go-http-client/1.1','','',''),(451,'179.43.169.180','2022-11-16','07:44:17','','Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0','','',''),(452,'83.61.24.136','2022-11-16','08:26:25','','Mozilla/5.0 (Linux; Android 9.0; MI 8 SE) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.119 Mobile Safari/537.36','','',''),(453,'103.83.144.92','2022-11-16','08:46:01','','','','',''),(454,'185.231.73.48','2022-11-16','08:54:41','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(455,'167.248.133.45','2022-11-16','09:15:21','','','','',''),(456,'62.87.242.216','2022-11-16','09:20:16','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(457,'206.189.150.21','2022-11-16','09:21:11','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(458,'223.111.175.50','2022-11-16','09:29:54','','curl/7.29.0','','',''),(459,'104.214.100.30','2022-11-16','09:34:01','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36','','',''),(460,'85.96.6.105','2022-11-16','09:45:42','','curl/7.64.0','','',''),(461,'66.240.236.116','2022-11-16','10:25:47','','Mozilla/5.0 zgrab/0.x','','',''),(462,'78.108.177.54','2022-11-16','10:51:01','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(463,'162.142.125.212','2022-11-16','11:05:55','','Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)','','',''),(464,'95.177.177.25','2022-11-16','11:35:33','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1','','',''),(465,'185.62.22.205','2022-11-16','11:50:20','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(466,'64.62.197.149','2022-11-16','11:52:08','','Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101 Firefox/91.0','','',''),(467,'89.248.168.55','2022-11-16','12:00:09','','','','',''),(468,'216.131.79.135','2022-11-16','12:02:11','','Mozilla/5.0 (Macintosh; Intel Mac OS X 12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 YaBrowser/22.7.0 Yowser/2.5 Safari/537.36','','',''),(469,'159.65.54.48','2022-11-16','12:03:26','','Mozilla/5.0 zgrab/0.x','','',''),(470,'207.46.13.48','2022-11-16','12:10:49','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(471,'35.216.166.72','2022-11-16','12:17:36','','Mozilla/5.0','','',''),(472,'167.172.85.27','2022-11-16','23:18:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(473,'185.149.40.210','2022-11-16','23:28:47','','Python/3.9 python-socks/2.0.3','','',''),(474,'45.55.58.87','2022-11-17','00:03:04','','','','',''),(475,'198.98.59.132','2022-11-17','00:11:52','','Hello World','','',''),(476,'184.105.139.120','2022-11-17','00:26:27','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36','','',''),(477,'85.31.44.178','2022-11-17','00:31:37','','','','',''),(478,'167.172.85.27','2022-11-17','00:33:50','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(479,'40.77.167.43','2022-11-17','00:36:35','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(480,'164.90.204.15','2022-11-17','00:44:41','','Go-http-client/1.1','','',''),(481,'159.65.178.187','2022-11-17','00:53:53','','Mozilla/5.0 (X11; Linux x86_64; rv:73.0) Gecko/20100101 Firefox/73.0','','',''),(482,'192.241.206.179','2022-11-17','00:55:46','','Mozilla/5.0 zgrab/0.x','','',''),(483,'141.255.166.2','2022-11-17','01:26:14','','Hello World','','',''),(484,'198.199.119.138','2022-11-17','01:29:40','','Mozilla/5.0 zgrab/0.x','','',''),(485,'20.213.34.80','2022-11-17','01:34:13','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(486,'85.31.44.156','2022-11-17','02:08:04','','','','',''),(487,'176.53.222.136','2022-11-17','02:33:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(488,'207.46.13.12','2022-11-17','02:41:00','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(489,'123.60.81.76','2022-11-17','02:41:50','','Mozilla/5.0 (Windows NT 8.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.1980.88 Safari/537.36','','',''),(490,'193.47.61.60','2022-11-17','03:01:44','','','','',''),(491,'167.248.133.120','2022-11-17','03:19:37','','','','',''),(492,'128.199.161.73','2022-11-17','04:35:42','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(493,'207.46.13.48','2022-11-17','05:04:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(494,'216.218.206.90','2022-11-17','05:05:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101 Firefox/91.0','','',''),(495,'109.207.78.185','2022-11-17','05:11:24','','Go-http-client/1.1','','',''),(496,'20.124.193.111','2022-11-17','05:40:45','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(497,'157.55.39.29','2022-11-17','05:42:49','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(498,'157.55.39.96','2022-11-17','05:45:27','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(499,'20.203.174.59','2022-11-17','05:52:37','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36','','',''),(500,'45.142.192.8','2022-11-17','05:56:23','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(501,'167.94.138.63','2022-11-17','06:18:21','','','','',''),(502,'78.108.177.52','2022-11-17','06:18:34','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(503,'51.75.146.189','2022-11-17','06:20:54','','Mozilla/5.0 zgrab/0.x','','',''),(504,'87.236.176.35','2022-11-17','06:37:04','','Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)','','',''),(505,'159.65.138.70','2022-11-17','07:05:49','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(506,'183.136.225.32','2022-11-17','07:23:55','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0','','',''),(507,'198.244.216.41','2022-11-17','07:41:58','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(508,'103.254.167.58','2022-11-17','08:12:15','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(509,'179.43.169.180','2022-11-17','08:58:13','','Mozilla/5.0 (X11; Linux i686; rv:10.0) Gecko/20100101 Firefox/10.0','','',''),(510,'212.224.76.224','2022-11-17','09:10:46','','Go-http-client/1.1','','',''),(511,'46.174.191.28','2022-11-17','09:34:32','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(512,'36.40.72.66','2022-11-17','09:53:39','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(513,'185.164.172.241','2022-11-17','10:04:00','','','','',''),(514,'205.169.39.87','2022-11-17','10:41:37','','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36','','',''),(515,'85.96.6.105','2022-11-17','11:02:37','','curl/7.64.0','','',''),(516,'207.46.13.174','2022-11-17','11:10:42','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(517,'94.102.61.10','2022-11-17','12:01:58','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(518,'45.142.192.7','2022-11-17','12:03:13','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(519,'167.94.145.60','2022-11-17','12:07:21','','','','',''),(520,'178.62.211.107','2022-11-17','21:16:35','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36','','',''),(521,'185.132.53.34','2022-11-17','21:17:49','','Go-http-client/1.1','','',''),(522,'146.70.120.14','2022-11-17','21:39:31','','python-requests/2.22.0','','',''),(523,'45.142.192.5','2022-11-17','21:42:59','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(524,'95.177.177.25','2022-11-17','22:24:30','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1','','',''),(525,'40.77.167.61','2022-11-17','23:08:20','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(526,'188.86.116.108','2022-11-17','23:08:30','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(527,'103.143.196.5','2022-11-17','23:17:49','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(528,'128.14.133.58','2022-11-17','23:18:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(529,'206.189.150.21','2022-11-17','23:49:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(530,'103.164.138.14','2022-11-18','00:00:40','','Go-http-client/1.1','','',''),(531,'110.13.191.191','2022-11-18','00:20:52','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/21E86F','','',''),(532,'134.236.22.91','2022-11-18','00:21:07','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/A5F383','','',''),(533,'3.80.230.15','2022-11-18','00:21:09','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36','','',''),(534,'45.61.161.61','2022-11-18','00:36:14','','Go-http-client/1.1','','',''),(535,'40.77.167.43','2022-11-18','00:39:17','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(536,'34.76.96.55','2022-11-18','00:41:26','','python-requests/2.28.1','','',''),(537,'141.255.166.2','2022-11-18','00:48:17','','Hello World','','',''),(538,'45.83.66.14','2022-11-18','00:52:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','','',''),(539,'198.98.59.132','2022-11-18','01:12:02','','Hello World','','',''),(540,'45.61.188.24','2022-11-18','01:15:53','','Hello World','','',''),(541,'193.124.176.102','2022-11-18','01:33:20','','','','',''),(542,'23.225.199.250','2022-11-18','01:55:20','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36','','',''),(543,'40.77.167.61','2022-11-18','01:58:26','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(544,'128.14.133.58','2022-11-18','01:58:35','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(545,'148.72.165.2','2022-11-18','02:16:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(546,'45.142.192.6','2022-11-18','02:27:18','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(547,'20.123.45.127','2022-11-18','02:38:00','','Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.2150.98 Safari/537.36','','',''),(548,'20.5.98.110','2022-11-18','03:02:41','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36','','',''),(549,'185.132.53.219','2022-11-18','03:28:56','','Go-http-client/1.1','','',''),(550,'167.172.85.27','2022-11-18','03:29:44','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(551,'207.46.13.174','2022-11-18','04:10:46','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(552,'40.76.235.246','2022-11-18','04:13:40','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(553,'173.214.175.178','2022-11-18','04:31:27','','Go-http-client/1.1','','',''),(554,'157.55.39.96','2022-11-18','04:42:27','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(555,'207.46.13.12','2022-11-18','04:46:23','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(556,'164.92.231.143','2022-11-18','04:57:33','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0','','',''),(557,'20.25.71.34','2022-11-18','05:13:53','','Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36','','',''),(558,'170.64.132.221','2022-11-18','05:32:20','','Go-http-client/1.1','','',''),(559,'193.163.116.176','2022-11-18','05:42:28','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(560,'207.46.13.48','2022-11-18','06:01:07','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(561,'176.113.43.225','2022-11-18','06:19:11','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36','','',''),(562,'78.108.177.52','2022-11-18','06:27:16','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(563,'128.14.209.162','2022-11-18','06:29:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(564,'162.142.125.222','2022-11-18','06:45:45','','','','',''),(565,'151.246.127.10','2022-11-18','07:07:11','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(566,'123.60.81.76','2022-11-18','07:17:12','','Mozilla/5.0 (Windows NT 5.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.1721.88 Safari/537.36','','',''),(567,'205.169.39.241','2022-11-18','07:22:08','','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36','','',''),(568,'207.154.248.148','2022-11-18','07:46:17','','Go-http-client/1.1','','',''),(569,'157.245.79.190','2022-11-18','07:48:25','','Go-http-client/1.1','','',''),(570,'45.142.192.5','2022-11-18','07:49:35','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(571,'87.236.176.62','2022-11-18','08:02:50','','Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)','','',''),(572,'194.26.192.251','2022-11-18','08:03:35','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(573,'44.200.93.151','2022-11-18','08:05:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36','','',''),(574,'146.190.67.239','2022-11-18','08:25:29','','Go-http-client/1.1','','',''),(575,'193.47.61.60','2022-11-18','08:55:08','','','','',''),(576,'198.235.24.161','2022-11-18','08:56:38','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(577,'164.90.204.15','2022-11-18','09:01:38','','Go-http-client/1.1','','',''),(578,'47.243.170.7','2022-11-18','09:10:44','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.132 Safari/537.36','','',''),(579,'81.172.44.118','2022-11-18','09:18:41','','Java/1.8.0_351','','',''),(580,'167.248.133.60','2022-11-18','09:23:00','','','','',''),(581,'192.241.202.145','2022-11-18','09:43:02','','Mozilla/5.0 zgrab/0.x','','',''),(582,'192.241.209.116','2022-11-18','09:45:11','','Mozilla/5.0 zgrab/0.x','','',''),(583,'20.185.35.227','2022-11-18','09:47:41','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.106 Safari/537.36','','',''),(584,'162.221.192.26','2022-11-18','09:49:45','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(585,'43.158.218.124','2022-11-18','09:56:30','','\'Mozilla/5.0','','',''),(586,'161.35.100.73','2022-11-18','10:00:43','','Go-http-client/1.1','','',''),(587,'162.142.125.213','2022-11-18','10:05:33','','','','',''),(588,'184.105.247.238','2022-11-18','10:32:27','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36 Edg/106.0.1370.37','','',''),(589,'54.191.11.224','2022-11-18','10:46:23','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML','','',''),(590,'154.89.5.81','2022-11-18','10:56:06','','','','',''),(591,'205.210.31.13','2022-11-18','11:09:30','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(592,'146.190.84.120','2022-11-18','11:13:15','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','','',''),(593,'23.251.102.74','2022-11-18','13:18:18','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(594,'41.184.92.43','2022-11-18','13:26:43','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(595,'185.224.128.15','2022-11-18','13:36:28','','Mozilla/5.0 zgrab/0.x','','',''),(596,'106.75.36.68','2022-11-18','13:51:58','','','','',''),(597,'92.223.85.72','2022-11-18','14:08:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(598,'157.230.36.143','2022-11-18','14:15:30','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(599,'85.31.44.178','2022-11-18','14:37:28','','','','',''),(600,'121.133.32.145','2022-11-18','14:43:38','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(601,'46.174.191.30','2022-11-18','15:15:08','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(602,'181.51.169.3','2022-11-18','15:38:49','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(603,'64.62.197.114','2022-11-18','16:27:16','','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:103.0) Gecko/20100101 Firefox/103.0','','',''),(604,'164.92.118.169','2022-11-18','16:45:47','','Go-http-client/1.1','','',''),(605,'45.142.192.9','2022-11-18','16:59:40','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(606,'168.232.14.170','2022-11-18','17:03:06','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(607,'113.142.131.55','2022-11-18','17:27:16','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(608,'20.224.48.22','2022-11-18','17:49:26','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(609,'212.224.76.224','2022-11-18','17:54:32','','Go-http-client/1.1','','',''),(610,'121.156.47.201','2022-11-18','18:01:54','','Python/3.8 aiohttp/3.6.2','','',''),(611,'121.156.47.207','2022-11-18','18:14:32','','Python/3.8 aiohttp/3.6.2','','',''),(612,'72.13.46.5','2022-11-18','19:38:36','','Mozilla/5.0 (compatible; ips-agent)','','',''),(613,'102.37.155.201','2022-11-18','20:01:01','','Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30','','',''),(614,'84.21.172.102','2022-11-18','20:25:23','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36','','',''),(615,'41.191.204.153','2022-11-18','21:03:02','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(616,'95.177.177.25','2022-11-18','22:29:57','','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1','','',''),(617,'89.44.178.221','2022-11-18','22:36:00','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(618,'185.132.53.130','2022-11-18','22:52:14','','Go-http-client/1.1','','',''),(619,'134.209.189.39','2022-11-18','23:01:30','','Mozilla/5.0 zgrab/0.x','','',''),(620,'85.96.6.105','2022-11-18','23:10:10','','curl/7.64.0','','',''),(621,'193.118.53.194','2022-11-18','23:10:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(622,'103.220.28.22','2022-11-18','23:24:38','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(623,'14.29.206.197','2022-11-18','23:25:03','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(624,'14.29.223.121','2022-11-18','23:25:03','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(625,'151.236.218.112','2022-11-18','23:49:14','','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0','','',''),(626,'51.222.253.20','2022-11-19','00:06:04','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(627,'115.60.55.231','2022-11-19','00:07:49','','Mozilla/4.0 (compatible; Win32; WinHttp.WinHttpRequest.5)','','',''),(628,'35.233.62.116','2022-11-19','00:23:24','','python-requests/2.28.1','','',''),(629,'31.25.177.249','2022-11-19','00:32:35','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(630,'207.46.13.174','2022-11-19','00:50:45','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(631,'207.46.13.12','2022-11-19','01:18:54','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(632,'36.40.72.66','2022-11-19','01:35:28','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(633,'198.98.59.132','2022-11-19','01:40:38','','Hello World','','',''),(634,'113.125.140.19','2022-11-19','01:42:10','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(635,'140.246.136.252','2022-11-19','01:42:14','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(636,'113.142.131.55','2022-11-19','01:42:59','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(637,'113.108.9.38','2022-11-19','01:43:15','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(638,'14.116.184.240','2022-11-19','01:43:31','','Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1','','',''),(639,'185.132.53.130','2022-11-19','01:52:42','','Go-http-client/1.1','','',''),(640,'141.255.166.2','2022-11-19','02:00:23','','Hello World','','',''),(641,'167.172.85.27','2022-11-19','02:04:39','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(642,'85.31.44.156','2022-11-19','02:13:30','','','','',''),(643,'128.1.248.42','2022-11-19','02:36:44','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(644,'64.62.197.189','2022-11-19','02:54:14','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.42','','',''),(645,'121.156.47.201','2022-11-19','02:55:07','','Python/3.8 aiohttp/3.6.2','','',''),(646,'185.164.172.241','2022-11-19','03:00:21','','','','',''),(647,'121.156.47.207','2022-11-19','03:12:49','','Python/3.8 aiohttp/3.6.2','','',''),(648,'45.142.192.5','2022-11-19','03:15:16','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(649,'78.108.177.54','2022-11-19','03:25:44','','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0;  Trident/5.0)','','',''),(650,'36.99.136.132','2022-11-19','03:33:22','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(651,'36.99.136.131','2022-11-19','03:34:49','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(652,'36.99.136.130','2022-11-19','03:35:00','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(653,'111.7.100.23','2022-11-19','03:35:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(654,'111.7.100.20','2022-11-19','03:35:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(655,'111.7.100.27','2022-11-19','03:35:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(656,'111.7.100.21','2022-11-19','03:35:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(657,'36.99.136.135','2022-11-19','03:35:28','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(658,'36.99.136.143','2022-11-19','03:35:29','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(659,'111.7.100.25','2022-11-19','03:35:29','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(660,'36.99.136.133','2022-11-19','03:35:30','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(661,'36.99.136.140','2022-11-19','03:35:31','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(662,'36.99.136.138','2022-11-19','03:35:33','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(663,'36.99.136.134','2022-11-19','03:35:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(664,'36.99.136.142','2022-11-19','03:35:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(665,'111.7.100.26','2022-11-19','03:36:34','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(666,'111.7.100.24','2022-11-19','03:36:45','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(667,'111.7.100.22','2022-11-19','03:36:52','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(668,'36.99.136.139','2022-11-19','03:37:03','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(669,'36.99.136.141','2022-11-19','03:37:09','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36','','',''),(670,'194.55.186.97','2022-11-19','03:45:32','http://125.141.67.249:80/left.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0','','',''),(671,'164.90.204.15','2022-11-19','03:46:59','','Go-http-client/1.1','','',''),(672,'191.7.211.90','2022-11-19','04:06:37','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(673,'185.235.139.212','2022-11-19','04:10:25','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(674,'40.77.167.61','2022-11-19','04:17:32','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(675,'45.142.192.6','2022-11-19','05:09:35','','Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)','','',''),(676,'193.47.61.218','2022-11-19','05:28:28','','Linux Gnu (cow)','','',''),(677,'207.46.13.48','2022-11-19','05:40:54','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(678,'191.101.217.235','2022-11-19','05:46:23','http://zm2life.com/','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36 OPR/54.0.2952.71','','',''),(679,'65.49.20.79','2022-11-19','05:46:26','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36','','',''),(680,'89.163.140.178','2022-11-19','06:50:08','','Mozilla/5.0 (compatible; Googlebot/2.1 +http://www.googlebot.com/bot.html)','','',''),(681,'206.189.39.228','2022-11-19','07:00:18','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(682,'128.14.134.170','2022-11-19','07:07:08','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(683,'154.89.5.123','2022-11-19','07:18:39','','','','',''),(684,'143.198.38.115','2022-11-19','07:20:56','','Mozilla/5.0 zgrab/0.x','','',''),(685,'167.94.145.59','2022-11-19','07:23:39','','','','',''),(686,'34.212.131.78','2022-11-19','08:25:55','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36','','',''),(687,'54.245.37.126','2022-11-19','08:26:28','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.97 Safari/537.36','','',''),(688,'40.77.167.43','2022-11-19','09:14:20','','Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/103.0.5060.134 Safari/537.36','','',''),(689,'121.156.47.224','2022-11-19','09:24:39','','Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.3','','',''),(690,'125.26.174.96','2022-11-19','09:36:11','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(691,'173.214.175.178','2022-11-19','09:37:25','','Go-http-client/1.1','','',''),(692,'192.241.204.129','2022-11-19','09:46:10','','Mozilla/5.0 zgrab/0.x','','',''),(693,'192.241.207.245','2022-11-19','09:48:13','','Mozilla/5.0 zgrab/0.x','','',''),(694,'20.92.127.52','2022-11-19','09:54:37','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(695,'192.241.212.9','2022-11-19','10:18:35','','Mozilla/5.0 zgrab/0.x','','',''),(696,'46.174.191.32','2022-11-19','10:25:52','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/534.30 (KHTML, like Gecko) Chrome/12.0.742.100 Safari/534.30','','',''),(697,'188.166.60.18','2022-11-19','10:38:26','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36','','',''),(698,'184.105.139.126','2022-11-19','10:49:20','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:105.0) Gecko/20100101 Firefox/105.0','','',''),(699,'185.198.0.171','2022-11-19','10:54:23','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(700,'205.210.31.184','2022-11-19','10:57:04','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(701,'40.77.167.74','2022-11-19','11:29:38','','Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)','','',''),(702,'80.41.168.199','2022-11-19','12:05:26','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(703,'91.240.140.21','2022-11-19','12:21:37','','','','',''),(704,'123.60.81.76','2022-11-19','12:45:08','','Mozilla/5.0 (Windows NT 7.6; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.1208.88 Safari/537.36','','',''),(705,'51.222.253.12','2022-11-19','13:03:45','','Mozilla/5.0 (compatible; AhrefsBot/7.0; +http://ahrefs.com/robot/)','','',''),(706,'138.197.68.164','2022-11-19','13:05:54','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','','',''),(707,'165.232.188.233','2022-11-19','13:06:07','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','','',''),(708,'139.59.239.168','2022-11-19','13:08:37','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(709,'36.37.160.223','2022-11-19','13:08:45','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(710,'167.71.224.175','2022-11-19','13:13:59','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36','','',''),(711,'45.95.55.176','2022-11-19','13:16:13','','Go-http-client/1.1','','',''),(712,'176.111.173.223','2022-11-19','13:38:48','','Python/3.7 aiohttp/3.8.3','','',''),(713,'20.213.34.80','2022-11-19','13:44:45','','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36','','',''),(714,'78.26.180.129','2022-11-19','14:20:19','','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7','','',''),(715,'40.76.235.246','2022-11-19','14:22:22','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36','','',''),(716,'64.62.197.202','2022-11-19','14:39:56','','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:105.0) Gecko/20100101 Firefox/105.0','','',''),(717,'37.235.138.6','2022-11-19','15:25:12','','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36','','',''),(718,'37.44.238.183','2022-11-19','15:47:41','','Mozilla/5.0 zgrab/0.x','','',''),(719,'167.94.138.118','2022-11-19','15:52:06','','','','',''),(720,'91.109.154.50','2022-11-19','16:27:18','','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36','','',''),(721,'205.210.31.39','2022-11-19','16:55:26','','Expanse, a Palo Alto Networks company, searches across the global IPv4 space multiple times per day to identify customers&#39; presences on the Internet. If you would like to be excluded from our scan','','',''),(722,'192.168.0.1','2022-11-19','16:57:32','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','',''),(723,'206.189.239.164','2022-11-19','17:15:14','','Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:56.0) Gecko/20100101 Firefox/56.0','','',''),(724,'128.14.209.162','2022-11-19','17:37:19','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36','','',''),(725,'94.102.61.10','2022-11-19','17:50:55','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36','','',''),(726,'212.224.76.224','2022-11-19','17:54:21','','Go-http-client/1.1','','',''),(727,'::1','2022-11-19','18:53:25','','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.5249.114 Whale/3.17.145.12 Safari/537.36','','','');
/*!40000 ALTER TABLE `g5_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_visit_sum`
--

DROP TABLE IF EXISTS `g5_visit_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_visit_sum` (
                                `vs_date` date NOT NULL DEFAULT '0000-00-00',
                                `vs_count` int(11) NOT NULL DEFAULT 0,
                                PRIMARY KEY (`vs_date`),
                                KEY `index1` (`vs_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_visit_sum`
--

LOCK TABLES `g5_visit_sum` WRITE;
/*!40000 ALTER TABLE `g5_visit_sum` DISABLE KEYS */;
INSERT INTO `g5_visit_sum` VALUES ('2022-10-18',1),('2022-10-21',1),('2022-10-24',1),('2022-10-25',1),('2022-10-28',1),('2022-10-30',1),('2022-10-31',1),('2022-11-04',1),('2022-11-05',1),('2022-11-07',1),('2022-11-09',1),('2022-11-10',1),('2022-11-12',32),('2022-11-16',48),('2022-11-17',56),('2022-11-13',63),('2022-11-18',96),('2022-11-19',102),('2022-11-14',141),('2022-11-15',177);
/*!40000 ALTER TABLE `g5_visit_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_class`
--

DROP TABLE IF EXISTS `g5_write_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_class` (
                                  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                  `wr_num` int(11) NOT NULL DEFAULT 0,
                                  `wr_reply` varchar(10) NOT NULL,
                                  `wr_parent` int(11) NOT NULL DEFAULT 0,
                                  `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                  `wr_comment` int(11) NOT NULL DEFAULT 0,
                                  `wr_comment_reply` varchar(5) NOT NULL,
                                  `ca_name` varchar(255) NOT NULL,
                                  `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                  `wr_subject` varchar(255) NOT NULL,
                                  `wr_content` text NOT NULL,
                                  `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                  `wr_link1` text NOT NULL,
                                  `wr_link2` text NOT NULL,
                                  `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_good` int(11) NOT NULL DEFAULT 0,
                                  `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                  `mb_id` varchar(20) NOT NULL,
                                  `wr_password` varchar(255) NOT NULL,
                                  `wr_name` varchar(255) NOT NULL,
                                  `wr_email` varchar(255) NOT NULL,
                                  `wr_homepage` varchar(255) NOT NULL,
                                  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                  `wr_last` varchar(19) NOT NULL,
                                  `wr_ip` varchar(255) NOT NULL,
                                  `wr_facebook_user` varchar(255) NOT NULL,
                                  `wr_twitter_user` varchar(255) NOT NULL,
                                  `wr_1` varchar(255) NOT NULL,
                                  `wr_2` varchar(255) NOT NULL,
                                  `wr_3` varchar(255) NOT NULL,
                                  `wr_4` varchar(255) NOT NULL,
                                  `wr_5` varchar(255) NOT NULL,
                                  `wr_6` varchar(255) NOT NULL,
                                  `wr_7` varchar(255) NOT NULL,
                                  `wr_8` varchar(255) NOT NULL,
                                  `wr_9` varchar(255) NOT NULL,
                                  `wr_10` varchar(255) NOT NULL,
                                  PRIMARY KEY (`wr_id`),
                                  KEY `wr_seo_title` (`wr_seo_title`),
                                  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_class`
--

LOCK TABLES `g5_write_class` WRITE;
/*!40000 ALTER TABLE `g5_write_class` DISABLE KEYS */;
INSERT INTO `g5_write_class` VALUES (10,-1,'',10,0,0,'','','','ㄴ','ㅎ','ㄴ','','',0,0,2,0,0,'zm2life','','최고관리자','nimuro@naver.com','','2022-11-16 04:42:50',0,'2022-11-16 04:42:50','118.235.6.3','','','1','1000','','','','','','','','');
/*!40000 ALTER TABLE `g5_write_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_class_live`
--

DROP TABLE IF EXISTS `g5_write_class_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_class_live` (
                                       `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                       `wr_num` int(11) NOT NULL DEFAULT 0,
                                       `wr_reply` varchar(10) NOT NULL,
                                       `wr_parent` int(11) NOT NULL DEFAULT 0,
                                       `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                       `wr_comment` int(11) NOT NULL DEFAULT 0,
                                       `wr_comment_reply` varchar(5) NOT NULL,
                                       `ca_name` varchar(255) NOT NULL,
                                       `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                       `wr_subject` varchar(255) NOT NULL,
                                       `wr_content` text NOT NULL,
                                       `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                       `wr_link1` text NOT NULL,
                                       `wr_link2` text NOT NULL,
                                       `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_good` int(11) NOT NULL DEFAULT 0,
                                       `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                       `mb_id` varchar(20) NOT NULL,
                                       `wr_password` varchar(255) NOT NULL,
                                       `wr_name` varchar(255) NOT NULL,
                                       `wr_email` varchar(255) NOT NULL,
                                       `wr_homepage` varchar(255) NOT NULL,
                                       `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                       `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                       `wr_last` varchar(19) NOT NULL,
                                       `wr_ip` varchar(255) NOT NULL,
                                       `wr_facebook_user` varchar(255) NOT NULL,
                                       `wr_twitter_user` varchar(255) NOT NULL,
                                       `wr_1` varchar(255) NOT NULL,
                                       `wr_2` varchar(255) NOT NULL,
                                       `wr_3` varchar(255) NOT NULL,
                                       `wr_4` varchar(255) NOT NULL,
                                       `wr_5` varchar(255) NOT NULL,
                                       `wr_6` varchar(255) NOT NULL,
                                       `wr_7` varchar(255) NOT NULL,
                                       `wr_8` varchar(255) NOT NULL,
                                       `wr_9` varchar(255) NOT NULL,
                                       `wr_10` varchar(255) NOT NULL,
                                       PRIMARY KEY (`wr_id`),
                                       KEY `wr_seo_title` (`wr_seo_title`),
                                       KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                       KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_class_live`
--

LOCK TABLES `g5_write_class_live` WRITE;
/*!40000 ALTER TABLE `g5_write_class_live` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_class_live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_ebook`
--

DROP TABLE IF EXISTS `g5_write_ebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_ebook` (
                                  `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                  `wr_num` int(11) NOT NULL DEFAULT 0,
                                  `wr_reply` varchar(10) NOT NULL,
                                  `wr_parent` int(11) NOT NULL DEFAULT 0,
                                  `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                  `wr_comment` int(11) NOT NULL DEFAULT 0,
                                  `wr_comment_reply` varchar(5) NOT NULL,
                                  `ca_name` varchar(255) NOT NULL,
                                  `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                  `wr_subject` varchar(255) NOT NULL,
                                  `wr_content` text NOT NULL,
                                  `wr_seo_title` varchar(255) NOT NULL,
                                  `wr_link1` text NOT NULL,
                                  `wr_link2` text NOT NULL,
                                  `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_hit` int(11) NOT NULL DEFAULT 0,
                                  `wr_good` int(11) NOT NULL DEFAULT 0,
                                  `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                  `mb_id` varchar(20) NOT NULL,
                                  `wr_password` varchar(255) NOT NULL,
                                  `wr_name` varchar(255) NOT NULL,
                                  `wr_email` varchar(255) NOT NULL,
                                  `wr_homepage` varchar(255) NOT NULL,
                                  `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                  `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                  `wr_last` varchar(19) NOT NULL,
                                  `wr_ip` varchar(255) NOT NULL,
                                  `wr_facebook_user` varchar(255) NOT NULL,
                                  `wr_twitter_user` varchar(255) NOT NULL,
                                  `wr_1` varchar(255) NOT NULL,
                                  `wr_2` varchar(255) NOT NULL,
                                  `wr_3` varchar(255) NOT NULL,
                                  `wr_4` varchar(255) NOT NULL,
                                  `wr_5` varchar(255) NOT NULL,
                                  `wr_6` varchar(255) NOT NULL,
                                  `wr_7` varchar(255) NOT NULL,
                                  `wr_8` varchar(255) NOT NULL,
                                  `wr_9` varchar(255) NOT NULL,
                                  `wr_10` varchar(255) NOT NULL,
                                  PRIMARY KEY (`wr_id`),
                                  KEY `wr_seo_title` (`wr_seo_title`),
                                  KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                  KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_ebook`
--

LOCK TABLES `g5_write_ebook` WRITE;
/*!40000 ALTER TABLE `g5_write_ebook` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_ebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_edu`
--

DROP TABLE IF EXISTS `g5_write_edu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_edu` (
                                `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                `wr_num` int(11) NOT NULL DEFAULT 0,
                                `wr_reply` varchar(10) NOT NULL,
                                `wr_parent` int(11) NOT NULL DEFAULT 0,
                                `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                `wr_comment` int(11) NOT NULL DEFAULT 0,
                                `wr_comment_reply` varchar(5) NOT NULL,
                                `ca_name` varchar(255) NOT NULL,
                                `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                `wr_subject` varchar(255) NOT NULL,
                                `wr_content` text NOT NULL,
                                `wr_seo_title` varchar(255) NOT NULL,
                                `wr_link1` text NOT NULL,
                                `wr_link2` text NOT NULL,
                                `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_good` int(11) NOT NULL DEFAULT 0,
                                `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                `mb_id` varchar(20) NOT NULL,
                                `wr_password` varchar(255) NOT NULL,
                                `wr_name` varchar(255) NOT NULL,
                                `wr_email` varchar(255) NOT NULL,
                                `wr_homepage` varchar(255) NOT NULL,
                                `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                `wr_last` varchar(19) NOT NULL,
                                `wr_ip` varchar(255) NOT NULL,
                                `wr_facebook_user` varchar(255) NOT NULL,
                                `wr_twitter_user` varchar(255) NOT NULL,
                                `wr_1` varchar(255) NOT NULL,
                                `wr_2` varchar(255) NOT NULL,
                                `wr_3` varchar(255) NOT NULL,
                                `wr_4` varchar(255) NOT NULL,
                                `wr_5` varchar(255) NOT NULL,
                                `wr_6` varchar(255) NOT NULL,
                                `wr_7` varchar(255) NOT NULL,
                                `wr_8` varchar(255) NOT NULL,
                                `wr_9` varchar(255) NOT NULL,
                                `wr_10` varchar(255) NOT NULL,
                                PRIMARY KEY (`wr_id`),
                                KEY `wr_seo_title` (`wr_seo_title`),
                                KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_edu`
--

LOCK TABLES `g5_write_edu` WRITE;
/*!40000 ALTER TABLE `g5_write_edu` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_edu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_free`
--

DROP TABLE IF EXISTS `g5_write_free`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_free` (
                                 `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                 `wr_num` int(11) NOT NULL DEFAULT 0,
                                 `wr_reply` varchar(10) NOT NULL,
                                 `wr_parent` int(11) NOT NULL DEFAULT 0,
                                 `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                 `wr_comment` int(11) NOT NULL DEFAULT 0,
                                 `wr_comment_reply` varchar(5) NOT NULL,
                                 `ca_name` varchar(255) NOT NULL,
                                 `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                 `wr_subject` varchar(255) NOT NULL,
                                 `wr_content` text NOT NULL,
                                 `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                 `wr_link1` text NOT NULL,
                                 `wr_link2` text NOT NULL,
                                 `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                 `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                 `wr_hit` int(11) NOT NULL DEFAULT 0,
                                 `wr_good` int(11) NOT NULL DEFAULT 0,
                                 `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                 `mb_id` varchar(20) NOT NULL,
                                 `wr_password` varchar(255) NOT NULL,
                                 `wr_name` varchar(255) NOT NULL,
                                 `wr_email` varchar(255) NOT NULL,
                                 `wr_homepage` varchar(255) NOT NULL,
                                 `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                 `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                 `wr_last` varchar(19) NOT NULL,
                                 `wr_ip` varchar(255) NOT NULL,
                                 `wr_facebook_user` varchar(255) NOT NULL,
                                 `wr_twitter_user` varchar(255) NOT NULL,
                                 `wr_1` varchar(255) NOT NULL,
                                 `wr_2` varchar(255) NOT NULL,
                                 `wr_3` varchar(255) NOT NULL,
                                 `wr_4` varchar(255) NOT NULL,
                                 `wr_5` varchar(255) NOT NULL,
                                 `wr_6` varchar(255) NOT NULL,
                                 `wr_7` varchar(255) NOT NULL,
                                 `wr_8` varchar(255) NOT NULL,
                                 `wr_9` varchar(255) NOT NULL,
                                 `wr_10` varchar(255) NOT NULL,
                                 PRIMARY KEY (`wr_id`),
                                 KEY `wr_seo_title` (`wr_seo_title`),
                                 KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                 KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_free`
--

LOCK TABLES `g5_write_free` WRITE;
/*!40000 ALTER TABLE `g5_write_free` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_free` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_gallery`
--

DROP TABLE IF EXISTS `g5_write_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_gallery` (
                                    `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                    `wr_num` int(11) NOT NULL DEFAULT 0,
                                    `wr_reply` varchar(10) NOT NULL,
                                    `wr_parent` int(11) NOT NULL DEFAULT 0,
                                    `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                    `wr_comment` int(11) NOT NULL DEFAULT 0,
                                    `wr_comment_reply` varchar(5) NOT NULL,
                                    `ca_name` varchar(255) NOT NULL,
                                    `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                    `wr_subject` varchar(255) NOT NULL,
                                    `wr_content` text NOT NULL,
                                    `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                    `wr_link1` text NOT NULL,
                                    `wr_link2` text NOT NULL,
                                    `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_good` int(11) NOT NULL DEFAULT 0,
                                    `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                    `mb_id` varchar(20) NOT NULL,
                                    `wr_password` varchar(255) NOT NULL,
                                    `wr_name` varchar(255) NOT NULL,
                                    `wr_email` varchar(255) NOT NULL,
                                    `wr_homepage` varchar(255) NOT NULL,
                                    `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                    `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                    `wr_last` varchar(19) NOT NULL,
                                    `wr_ip` varchar(255) NOT NULL,
                                    `wr_facebook_user` varchar(255) NOT NULL,
                                    `wr_twitter_user` varchar(255) NOT NULL,
                                    `wr_1` varchar(255) NOT NULL,
                                    `wr_2` varchar(255) NOT NULL,
                                    `wr_3` varchar(255) NOT NULL,
                                    `wr_4` varchar(255) NOT NULL,
                                    `wr_5` varchar(255) NOT NULL,
                                    `wr_6` varchar(255) NOT NULL,
                                    `wr_7` varchar(255) NOT NULL,
                                    `wr_8` varchar(255) NOT NULL,
                                    `wr_9` varchar(255) NOT NULL,
                                    `wr_10` varchar(255) NOT NULL,
                                    PRIMARY KEY (`wr_id`),
                                    KEY `wr_seo_title` (`wr_seo_title`),
                                    KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                    KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_gallery`
--

LOCK TABLES `g5_write_gallery` WRITE;
/*!40000 ALTER TABLE `g5_write_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_howtouse`
--

DROP TABLE IF EXISTS `g5_write_howtouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_howtouse` (
                                     `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                     `wr_num` int(11) NOT NULL DEFAULT 0,
                                     `wr_reply` varchar(10) NOT NULL,
                                     `wr_parent` int(11) NOT NULL DEFAULT 0,
                                     `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                     `wr_comment` int(11) NOT NULL DEFAULT 0,
                                     `wr_comment_reply` varchar(5) NOT NULL,
                                     `ca_name` varchar(255) NOT NULL,
                                     `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                     `wr_subject` varchar(255) NOT NULL,
                                     `wr_content` text NOT NULL,
                                     `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                     `wr_link1` text NOT NULL,
                                     `wr_link2` text NOT NULL,
                                     `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                     `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                     `wr_hit` int(11) NOT NULL DEFAULT 0,
                                     `wr_good` int(11) NOT NULL DEFAULT 0,
                                     `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                     `mb_id` varchar(20) NOT NULL,
                                     `wr_password` varchar(255) NOT NULL,
                                     `wr_name` varchar(255) NOT NULL,
                                     `wr_email` varchar(255) NOT NULL,
                                     `wr_homepage` varchar(255) NOT NULL,
                                     `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                     `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                     `wr_last` varchar(19) NOT NULL,
                                     `wr_ip` varchar(255) NOT NULL,
                                     `wr_facebook_user` varchar(255) NOT NULL,
                                     `wr_twitter_user` varchar(255) NOT NULL,
                                     `wr_1` varchar(255) NOT NULL,
                                     `wr_2` varchar(255) NOT NULL,
                                     `wr_3` varchar(255) NOT NULL,
                                     `wr_4` varchar(255) NOT NULL,
                                     `wr_5` varchar(255) NOT NULL,
                                     `wr_6` varchar(255) NOT NULL,
                                     `wr_7` varchar(255) NOT NULL,
                                     `wr_8` varchar(255) NOT NULL,
                                     `wr_9` varchar(255) NOT NULL,
                                     `wr_10` varchar(255) NOT NULL,
                                     PRIMARY KEY (`wr_id`),
                                     KEY `wr_seo_title` (`wr_seo_title`),
                                     KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                     KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_howtouse`
--

LOCK TABLES `g5_write_howtouse` WRITE;
/*!40000 ALTER TABLE `g5_write_howtouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_howtouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_jaetech`
--

DROP TABLE IF EXISTS `g5_write_jaetech`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_jaetech` (
                                    `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                    `wr_num` int(11) NOT NULL DEFAULT 0,
                                    `wr_reply` varchar(10) NOT NULL,
                                    `wr_parent` int(11) NOT NULL DEFAULT 0,
                                    `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                    `wr_comment` int(11) NOT NULL DEFAULT 0,
                                    `wr_comment_reply` varchar(5) NOT NULL,
                                    `ca_name` varchar(255) NOT NULL,
                                    `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                    `wr_subject` varchar(255) NOT NULL,
                                    `wr_content` text NOT NULL,
                                    `wr_seo_title` varchar(255) NOT NULL,
                                    `wr_link1` text NOT NULL,
                                    `wr_link2` text NOT NULL,
                                    `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_hit` int(11) NOT NULL DEFAULT 0,
                                    `wr_good` int(11) NOT NULL DEFAULT 0,
                                    `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                    `mb_id` varchar(20) NOT NULL,
                                    `wr_password` varchar(255) NOT NULL,
                                    `wr_name` varchar(255) NOT NULL,
                                    `wr_email` varchar(255) NOT NULL,
                                    `wr_homepage` varchar(255) NOT NULL,
                                    `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                    `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                    `wr_last` varchar(19) NOT NULL,
                                    `wr_ip` varchar(255) NOT NULL,
                                    `wr_facebook_user` varchar(255) NOT NULL,
                                    `wr_twitter_user` varchar(255) NOT NULL,
                                    `wr_1` varchar(255) NOT NULL,
                                    `wr_2` varchar(255) NOT NULL,
                                    `wr_3` varchar(255) NOT NULL,
                                    `wr_4` varchar(255) NOT NULL,
                                    `wr_5` varchar(255) NOT NULL,
                                    `wr_6` varchar(255) NOT NULL,
                                    `wr_7` varchar(255) NOT NULL,
                                    `wr_8` varchar(255) NOT NULL,
                                    `wr_9` varchar(255) NOT NULL,
                                    `wr_10` varchar(255) NOT NULL,
                                    PRIMARY KEY (`wr_id`),
                                    KEY `wr_seo_title` (`wr_seo_title`),
                                    KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                    KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_jaetech`
--

LOCK TABLES `g5_write_jaetech` WRITE;
/*!40000 ALTER TABLE `g5_write_jaetech` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_jaetech` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_notice`
--

DROP TABLE IF EXISTS `g5_write_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_notice` (
                                   `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                   `wr_num` int(11) NOT NULL DEFAULT 0,
                                   `wr_reply` varchar(10) NOT NULL,
                                   `wr_parent` int(11) NOT NULL DEFAULT 0,
                                   `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                   `wr_comment` int(11) NOT NULL DEFAULT 0,
                                   `wr_comment_reply` varchar(5) NOT NULL,
                                   `ca_name` varchar(255) NOT NULL,
                                   `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                   `wr_subject` varchar(255) NOT NULL,
                                   `wr_content` text NOT NULL,
                                   `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                                   `wr_link1` text NOT NULL,
                                   `wr_link2` text NOT NULL,
                                   `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                   `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                   `wr_hit` int(11) NOT NULL DEFAULT 0,
                                   `wr_good` int(11) NOT NULL DEFAULT 0,
                                   `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                   `mb_id` varchar(20) NOT NULL,
                                   `wr_password` varchar(255) NOT NULL,
                                   `wr_name` varchar(255) NOT NULL,
                                   `wr_email` varchar(255) NOT NULL,
                                   `wr_homepage` varchar(255) NOT NULL,
                                   `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                   `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                   `wr_last` varchar(19) NOT NULL,
                                   `wr_ip` varchar(255) NOT NULL,
                                   `wr_facebook_user` varchar(255) NOT NULL,
                                   `wr_twitter_user` varchar(255) NOT NULL,
                                   `wr_1` varchar(255) NOT NULL,
                                   `wr_2` varchar(255) NOT NULL,
                                   `wr_3` varchar(255) NOT NULL,
                                   `wr_4` varchar(255) NOT NULL,
                                   `wr_5` varchar(255) NOT NULL,
                                   `wr_6` varchar(255) NOT NULL,
                                   `wr_7` varchar(255) NOT NULL,
                                   `wr_8` varchar(255) NOT NULL,
                                   `wr_9` varchar(255) NOT NULL,
                                   `wr_10` varchar(255) NOT NULL,
                                   PRIMARY KEY (`wr_id`),
                                   KEY `wr_seo_title` (`wr_seo_title`),
                                   KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                   KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_notice`
--

LOCK TABLES `g5_write_notice` WRITE;
/*!40000 ALTER TABLE `g5_write_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_qa`
--

DROP TABLE IF EXISTS `g5_write_qa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_qa` (
                               `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                               `wr_num` int(11) NOT NULL DEFAULT 0,
                               `wr_reply` varchar(10) NOT NULL,
                               `wr_parent` int(11) NOT NULL DEFAULT 0,
                               `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                               `wr_comment` int(11) NOT NULL DEFAULT 0,
                               `wr_comment_reply` varchar(5) NOT NULL,
                               `ca_name` varchar(255) NOT NULL,
                               `wr_option` set('html1','html2','secret','mail') NOT NULL,
                               `wr_subject` varchar(255) NOT NULL,
                               `wr_content` text NOT NULL,
                               `wr_seo_title` varchar(255) NOT NULL DEFAULT '',
                               `wr_link1` text NOT NULL,
                               `wr_link2` text NOT NULL,
                               `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                               `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                               `wr_hit` int(11) NOT NULL DEFAULT 0,
                               `wr_good` int(11) NOT NULL DEFAULT 0,
                               `wr_nogood` int(11) NOT NULL DEFAULT 0,
                               `mb_id` varchar(20) NOT NULL,
                               `wr_password` varchar(255) NOT NULL,
                               `wr_name` varchar(255) NOT NULL,
                               `wr_email` varchar(255) NOT NULL,
                               `wr_homepage` varchar(255) NOT NULL,
                               `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                               `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                               `wr_last` varchar(19) NOT NULL,
                               `wr_ip` varchar(255) NOT NULL,
                               `wr_facebook_user` varchar(255) NOT NULL,
                               `wr_twitter_user` varchar(255) NOT NULL,
                               `wr_1` varchar(255) NOT NULL,
                               `wr_2` varchar(255) NOT NULL,
                               `wr_3` varchar(255) NOT NULL,
                               `wr_4` varchar(255) NOT NULL,
                               `wr_5` varchar(255) NOT NULL,
                               `wr_6` varchar(255) NOT NULL,
                               `wr_7` varchar(255) NOT NULL,
                               `wr_8` varchar(255) NOT NULL,
                               `wr_9` varchar(255) NOT NULL,
                               `wr_10` varchar(255) NOT NULL,
                               PRIMARY KEY (`wr_id`),
                               KEY `wr_seo_title` (`wr_seo_title`),
                               KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                               KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_qa`
--

LOCK TABLES `g5_write_qa` WRITE;
/*!40000 ALTER TABLE `g5_write_qa` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_qa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_somoim_off`
--

DROP TABLE IF EXISTS `g5_write_somoim_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_somoim_off` (
                                       `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                       `wr_num` int(11) NOT NULL DEFAULT 0,
                                       `wr_reply` varchar(10) NOT NULL,
                                       `wr_parent` int(11) NOT NULL DEFAULT 0,
                                       `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                       `wr_comment` int(11) NOT NULL DEFAULT 0,
                                       `wr_comment_reply` varchar(5) NOT NULL,
                                       `ca_name` varchar(255) NOT NULL,
                                       `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                       `wr_subject` varchar(255) NOT NULL,
                                       `wr_content` text NOT NULL,
                                       `wr_seo_title` varchar(255) NOT NULL,
                                       `wr_link1` text NOT NULL,
                                       `wr_link2` text NOT NULL,
                                       `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_hit` int(11) NOT NULL DEFAULT 0,
                                       `wr_good` int(11) NOT NULL DEFAULT 0,
                                       `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                       `mb_id` varchar(20) NOT NULL,
                                       `wr_password` varchar(255) NOT NULL,
                                       `wr_name` varchar(255) NOT NULL,
                                       `wr_email` varchar(255) NOT NULL,
                                       `wr_homepage` varchar(255) NOT NULL,
                                       `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                       `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                       `wr_last` varchar(19) NOT NULL,
                                       `wr_ip` varchar(255) NOT NULL,
                                       `wr_facebook_user` varchar(255) NOT NULL,
                                       `wr_twitter_user` varchar(255) NOT NULL,
                                       `wr_1` varchar(255) NOT NULL,
                                       `wr_2` varchar(255) NOT NULL,
                                       `wr_3` varchar(255) NOT NULL,
                                       `wr_4` varchar(255) NOT NULL,
                                       `wr_5` varchar(255) NOT NULL,
                                       `wr_6` varchar(255) NOT NULL,
                                       `wr_7` varchar(255) NOT NULL,
                                       `wr_8` varchar(255) NOT NULL,
                                       `wr_9` varchar(255) NOT NULL,
                                       `wr_10` varchar(255) NOT NULL,
                                       PRIMARY KEY (`wr_id`),
                                       KEY `wr_seo_title` (`wr_seo_title`),
                                       KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                       KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_somoim_off`
--

LOCK TABLES `g5_write_somoim_off` WRITE;
/*!40000 ALTER TABLE `g5_write_somoim_off` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_somoim_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_somoim_on`
--

DROP TABLE IF EXISTS `g5_write_somoim_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_somoim_on` (
                                      `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                      `wr_num` int(11) NOT NULL DEFAULT 0,
                                      `wr_reply` varchar(10) NOT NULL,
                                      `wr_parent` int(11) NOT NULL DEFAULT 0,
                                      `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                      `wr_comment` int(11) NOT NULL DEFAULT 0,
                                      `wr_comment_reply` varchar(5) NOT NULL,
                                      `ca_name` varchar(255) NOT NULL,
                                      `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                      `wr_subject` varchar(255) NOT NULL,
                                      `wr_content` text NOT NULL,
                                      `wr_seo_title` varchar(255) NOT NULL,
                                      `wr_link1` text NOT NULL,
                                      `wr_link2` text NOT NULL,
                                      `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                      `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                      `wr_hit` int(11) NOT NULL DEFAULT 0,
                                      `wr_good` int(11) NOT NULL DEFAULT 0,
                                      `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                      `mb_id` varchar(20) NOT NULL,
                                      `wr_password` varchar(255) NOT NULL,
                                      `wr_name` varchar(255) NOT NULL,
                                      `wr_email` varchar(255) NOT NULL,
                                      `wr_homepage` varchar(255) NOT NULL,
                                      `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                      `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                      `wr_last` varchar(19) NOT NULL,
                                      `wr_ip` varchar(255) NOT NULL,
                                      `wr_facebook_user` varchar(255) NOT NULL,
                                      `wr_twitter_user` varchar(255) NOT NULL,
                                      `wr_1` varchar(255) NOT NULL,
                                      `wr_2` varchar(255) NOT NULL,
                                      `wr_3` varchar(255) NOT NULL,
                                      `wr_4` varchar(255) NOT NULL,
                                      `wr_5` varchar(255) NOT NULL,
                                      `wr_6` varchar(255) NOT NULL,
                                      `wr_7` varchar(255) NOT NULL,
                                      `wr_8` varchar(255) NOT NULL,
                                      `wr_9` varchar(255) NOT NULL,
                                      `wr_10` varchar(255) NOT NULL,
                                      PRIMARY KEY (`wr_id`),
                                      KEY `wr_seo_title` (`wr_seo_title`),
                                      KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                      KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_somoim_on`
--

LOCK TABLES `g5_write_somoim_on` WRITE;
/*!40000 ALTER TABLE `g5_write_somoim_on` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_somoim_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g5_write_tip`
--

DROP TABLE IF EXISTS `g5_write_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g5_write_tip` (
                                `wr_id` int(11) NOT NULL AUTO_INCREMENT,
                                `wr_num` int(11) NOT NULL DEFAULT 0,
                                `wr_reply` varchar(10) NOT NULL,
                                `wr_parent` int(11) NOT NULL DEFAULT 0,
                                `wr_is_comment` tinyint(4) NOT NULL DEFAULT 0,
                                `wr_comment` int(11) NOT NULL DEFAULT 0,
                                `wr_comment_reply` varchar(5) NOT NULL,
                                `ca_name` varchar(255) NOT NULL,
                                `wr_option` set('html1','html2','secret','mail') NOT NULL,
                                `wr_subject` varchar(255) NOT NULL,
                                `wr_content` text NOT NULL,
                                `wr_seo_title` varchar(255) NOT NULL,
                                `wr_link1` text NOT NULL,
                                `wr_link2` text NOT NULL,
                                `wr_link1_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_link2_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_hit` int(11) NOT NULL DEFAULT 0,
                                `wr_good` int(11) NOT NULL DEFAULT 0,
                                `wr_nogood` int(11) NOT NULL DEFAULT 0,
                                `mb_id` varchar(20) NOT NULL,
                                `wr_password` varchar(255) NOT NULL,
                                `wr_name` varchar(255) NOT NULL,
                                `wr_email` varchar(255) NOT NULL,
                                `wr_homepage` varchar(255) NOT NULL,
                                `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `wr_file` tinyint(4) NOT NULL DEFAULT 0,
                                `wr_last` varchar(19) NOT NULL,
                                `wr_ip` varchar(255) NOT NULL,
                                `wr_facebook_user` varchar(255) NOT NULL,
                                `wr_twitter_user` varchar(255) NOT NULL,
                                `wr_1` varchar(255) NOT NULL,
                                `wr_2` varchar(255) NOT NULL,
                                `wr_3` varchar(255) NOT NULL,
                                `wr_4` varchar(255) NOT NULL,
                                `wr_5` varchar(255) NOT NULL,
                                `wr_6` varchar(255) NOT NULL,
                                `wr_7` varchar(255) NOT NULL,
                                `wr_8` varchar(255) NOT NULL,
                                `wr_9` varchar(255) NOT NULL,
                                `wr_10` varchar(255) NOT NULL,
                                PRIMARY KEY (`wr_id`),
                                KEY `wr_seo_title` (`wr_seo_title`),
                                KEY `wr_num_reply_parent` (`wr_num`,`wr_reply`,`wr_parent`),
                                KEY `wr_is_comment` (`wr_is_comment`,`wr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g5_write_tip`
--

LOCK TABLES `g5_write_tip` WRITE;
/*!40000 ALTER TABLE `g5_write_tip` DISABLE KEYS */;
/*!40000 ALTER TABLE `g5_write_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_book`
--

DROP TABLE IF EXISTS `sms5_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_book` (
                             `bk_no` int(11) NOT NULL AUTO_INCREMENT,
                             `bg_no` int(11) NOT NULL DEFAULT 0,
                             `mb_no` int(11) NOT NULL DEFAULT 0,
                             `mb_id` varchar(20) NOT NULL DEFAULT '',
                             `bk_name` varchar(255) NOT NULL DEFAULT '',
                             `bk_hp` varchar(255) NOT NULL DEFAULT '',
                             `bk_receipt` tinyint(4) NOT NULL DEFAULT 0,
                             `bk_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                             `bk_memo` text NOT NULL,
                             PRIMARY KEY (`bk_no`),
                             KEY `bk_name` (`bk_name`),
                             KEY `bk_hp` (`bk_hp`),
                             KEY `mb_no` (`mb_no`),
                             KEY `bg_no` (`bg_no`,`bk_no`),
                             KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_book`
--

LOCK TABLES `sms5_book` WRITE;
/*!40000 ALTER TABLE `sms5_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_book_group`
--

DROP TABLE IF EXISTS `sms5_book_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_book_group` (
                                   `bg_no` int(11) NOT NULL AUTO_INCREMENT,
                                   `bg_name` varchar(255) NOT NULL DEFAULT '',
                                   `bg_count` int(11) NOT NULL DEFAULT 0,
                                   `bg_member` int(11) NOT NULL DEFAULT 0,
                                   `bg_nomember` int(11) NOT NULL DEFAULT 0,
                                   `bg_receipt` int(11) NOT NULL DEFAULT 0,
                                   `bg_reject` int(11) NOT NULL DEFAULT 0,
                                   PRIMARY KEY (`bg_no`),
                                   KEY `bg_name` (`bg_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_book_group`
--

LOCK TABLES `sms5_book_group` WRITE;
/*!40000 ALTER TABLE `sms5_book_group` DISABLE KEYS */;
INSERT INTO `sms5_book_group` VALUES (1,'미분류',0,0,0,0,0);
/*!40000 ALTER TABLE `sms5_book_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_config`
--

DROP TABLE IF EXISTS `sms5_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_config` (
                               `cf_phone` varchar(255) NOT NULL DEFAULT '',
                               `cf_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_config`
--

LOCK TABLES `sms5_config` WRITE;
/*!40000 ALTER TABLE `sms5_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_form`
--

DROP TABLE IF EXISTS `sms5_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_form` (
                             `fo_no` int(11) NOT NULL AUTO_INCREMENT,
                             `fg_no` tinyint(4) NOT NULL DEFAULT 0,
                             `fg_member` char(1) NOT NULL DEFAULT '0',
                             `fo_name` varchar(255) NOT NULL DEFAULT '',
                             `fo_content` text NOT NULL,
                             `fo_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                             PRIMARY KEY (`fo_no`),
                             KEY `fg_no` (`fg_no`,`fo_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_form`
--

LOCK TABLES `sms5_form` WRITE;
/*!40000 ALTER TABLE `sms5_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_form_group`
--

DROP TABLE IF EXISTS `sms5_form_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_form_group` (
                                   `fg_no` int(11) NOT NULL AUTO_INCREMENT,
                                   `fg_name` varchar(255) NOT NULL DEFAULT '',
                                   `fg_count` int(11) NOT NULL DEFAULT 0,
                                   `fg_member` tinyint(4) NOT NULL,
                                   PRIMARY KEY (`fg_no`),
                                   KEY `fg_name` (`fg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_form_group`
--

LOCK TABLES `sms5_form_group` WRITE;
/*!40000 ALTER TABLE `sms5_form_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_form_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_history`
--

DROP TABLE IF EXISTS `sms5_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_history` (
                                `hs_no` int(11) NOT NULL AUTO_INCREMENT,
                                `wr_no` int(11) NOT NULL DEFAULT 0,
                                `wr_renum` int(11) NOT NULL DEFAULT 0,
                                `bg_no` int(11) NOT NULL DEFAULT 0,
                                `mb_no` int(11) NOT NULL DEFAULT 0,
                                `mb_id` varchar(20) NOT NULL DEFAULT '',
                                `bk_no` int(11) NOT NULL DEFAULT 0,
                                `hs_name` varchar(30) NOT NULL DEFAULT '',
                                `hs_hp` varchar(255) NOT NULL DEFAULT '',
                                `hs_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                                `hs_flag` tinyint(4) NOT NULL DEFAULT 0,
                                `hs_code` varchar(255) NOT NULL DEFAULT '',
                                `hs_memo` varchar(255) NOT NULL DEFAULT '',
                                `hs_log` varchar(255) NOT NULL DEFAULT '',
                                PRIMARY KEY (`hs_no`),
                                KEY `wr_no` (`wr_no`),
                                KEY `mb_no` (`mb_no`),
                                KEY `bk_no` (`bk_no`),
                                KEY `hs_hp` (`hs_hp`),
                                KEY `hs_code` (`hs_code`),
                                KEY `bg_no` (`bg_no`),
                                KEY `mb_id` (`mb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_history`
--

LOCK TABLES `sms5_history` WRITE;
/*!40000 ALTER TABLE `sms5_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms5_write`
--

DROP TABLE IF EXISTS `sms5_write`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms5_write` (
                              `wr_no` int(11) NOT NULL DEFAULT 1,
                              `wr_renum` int(11) NOT NULL DEFAULT 0,
                              `wr_reply` varchar(255) NOT NULL DEFAULT '',
                              `wr_message` text NOT NULL,
                              `wr_booking` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `wr_total` int(11) NOT NULL DEFAULT 0,
                              `wr_re_total` int(11) NOT NULL DEFAULT 0,
                              `wr_success` int(11) NOT NULL DEFAULT 0,
                              `wr_failure` int(11) NOT NULL DEFAULT 0,
                              `wr_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
                              `wr_memo` text NOT NULL,
                              KEY `wr_no` (`wr_no`,`wr_renum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms5_write`
--

LOCK TABLES `sms5_write` WRITE;
/*!40000 ALTER TABLE `sms5_write` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms5_write` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-19 19:13:10
