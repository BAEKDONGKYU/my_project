-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: jspbeginner
-- ------------------------------------------------------
-- Server version	5.6.45-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `p_board`
--

DROP TABLE IF EXISTS `p_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_board` (
  `num` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `pass` varchar(10) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL,
  `regdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_board`
--

LOCK TABLES `p_board` WRITE;
/*!40000 ALTER TABLE `p_board` DISABLE KEYS */;
INSERT INTO `p_board` VALUES (1,'admin','글테스트','글내용입니다','1234',0,'123.123.123.0','2019-12-18 17:21:22'),(2,'admin','글테스트','글내용입니다','1234',2,'123.123.123.0','2019-12-18 17:21:25'),(5,'admin','글테스트','글내용입니다','1234',1,'123.123.123.0','2019-12-18 17:21:29'),(6,'admin','글테스트','글내용입니다','1234',0,'123.123.123.0','2019-12-18 17:21:30'),(7,'admin','글테스트','글내용입니다','1234',0,'123.123.123.0','2019-12-18 17:21:32'),(9,'admin','글테스트','글내용입니다','1234',2,'123.123.123.0','2019-12-18 17:21:36'),(11,'admin','글테스트','글내용입니다','1234',2,'123.123.123.0','2019-12-18 17:21:40'),(12,'admin','글테스트','글내용입니다','1234',12,'123.123.123.0','2019-12-18 17:21:41'),(16,'admin','16','b','',68,'0:0:0:0:0:0:0:1','2019-12-23 14:26:03'),(17,'admin','한글테스트13','13','',13,'0:0:0:0:0:0:0:1','2019-12-23 14:26:51'),(18,'admin','aaaaa','1234','',1,'0:0:0:0:0:0:0:1','2019-12-24 01:27:05'),(20,'admin','aaaa','aaaaaaaa','',2,'0:0:0:0:0:0:0:1','2019-12-24 16:43:07'),(21,'admin','aaaaaa','aaaaaaaaaaaa','',0,'0:0:0:0:0:0:0:1','2019-12-24 16:43:20'),(22,'thsdbgus','ㅋㅋㅋ','ㅋㅋㅋㅋ','1234',1,'192.168.2.20','2019-12-26 14:41:16'),(23,'admin','aa','aaa','',0,'0:0:0:0:0:0:0:1','2020-01-31 15:07:53'),(24,'admin','aaaaaaaaaaa','aaaaaaaaaaaaaaa','',0,'0:0:0:0:0:0:0:1','2020-01-31 15:08:02');
/*!40000 ALTER TABLE `p_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_cart`
--

DROP TABLE IF EXISTS `p_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_cart` (
  `cartNum` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(50) NOT NULL,
  `prdNum` varchar(50) NOT NULL,
  `cartStock` int(11) NOT NULL,
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartNum`,`userId`),
  KEY `p_cart_userId` (`userId`),
  KEY `p_cart_prdNum` (`prdNum`),
  CONSTRAINT `p_cart_prdNum` FOREIGN KEY (`prdNum`) REFERENCES `p_product` (`p_num`),
  CONSTRAINT `p_cart_userId` FOREIGN KEY (`userId`) REFERENCES `p_member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_cart`
--

LOCK TABLES `p_cart` WRITE;
/*!40000 ALTER TABLE `p_cart` DISABLE KEYS */;
INSERT INTO `p_cart` VALUES (1,'admin','B100009',1,'2019-12-26 03:52:35'),(2,'admin','B100009',1,'2019-12-26 04:11:41'),(3,'admin','B100009',1,'2019-12-26 04:19:50');
/*!40000 ALTER TABLE `p_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_member`
--

DROP TABLE IF EXISTS `p_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_member` (
  `id` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(3) NOT NULL,
  `phone2` varchar(4) NOT NULL,
  `phone3` varchar(4) NOT NULL,
  `year` varchar(4) NOT NULL,
  `month` varchar(2) NOT NULL,
  `date` varchar(2) NOT NULL,
  `zipcode` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `address2` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `joinDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_member`
--

LOCK TABLES `p_member` WRITE;
/*!40000 ALTER TABLE `p_member` DISABLE KEYS */;
INSERT INTO `p_member` VALUES ('admin','1234','백동규','남','010','1111','2222','1988','11','22','06027','서울 강남구 압구정로 102 (신사동, 형지제2빌딩)','11','wcdls@naver.com','2019-12-15 12:21:06'),('admin1','1234','백동규','남','010','5555','3333','1988','2','12','46760','부산 강서구 르노삼성대로 14 (신호동)','dd','wcdls1234@naver.com','2019-12-26 02:24:16'),('thsdbgus','12345678','손유현','남','010','1234','5671','1992','10','28','06267','서울 강남구 강남대로 238 (도곡동, 스카이쏠라빌딩)','집','wg@naver.com','2019-12-26 05:38:36');
/*!40000 ALTER TABLE `p_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_product`
--

DROP TABLE IF EXISTS `p_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_product` (
  `p_num` varchar(15) NOT NULL DEFAULT '',
  `p_name` varchar(100) NOT NULL,
  `p_category` varchar(20) NOT NULL,
  `p_price` int(11) NOT NULL,
  `p_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `p_count` int(11) NOT NULL,
  `p_total_count` int(11) NOT NULL,
  PRIMARY KEY (`p_num`),
  UNIQUE KEY `p_name_UNIQUE` (`p_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_product`
--

LOCK TABLES `p_product` WRITE;
/*!40000 ALTER TABLE `p_product` DISABLE KEYS */;
INSERT INTO `p_product` VALUES ('B100001','닭강정','main',14000,'2019-12-14 13:36:54',1000,10000),('B100002','돼지불백','main',16000,'2019-12-14 13:37:29',1000,9900),('B100003','불족발','main',18000,'2019-12-14 13:37:48',1000,9800),('B100004','소불고기전골','main',20000,'2019-12-14 13:38:17',1000,9700),('B100005','순살찜닭','main',18000,'2019-12-14 13:38:40',1000,9500),('B100006','스키야키','main',20000,'2019-12-14 13:39:58',1000,9400),('B100007','야채제육','main',16000,'2019-12-14 13:40:43',1000,9300),('B100008','연잎삽겹살슬라이드','main',17000,'2019-12-14 13:41:07',1000,9000),('B100009','쫄면골뱅이무침','main',14000,'2019-12-14 13:41:41',1000,8800);
/*!40000 ALTER TABLE `p_product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-04 11:43:59
