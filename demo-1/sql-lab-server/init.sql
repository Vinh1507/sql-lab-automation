-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: sql_lab_cms
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `contest_issues`
--

DROP TABLE IF EXISTS `contest_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contestId` int NOT NULL,
  `issueId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contestId` (`contestId`),
  KEY `issueId` (`issueId`),
  CONSTRAINT `contest_issues_ibfk_1` FOREIGN KEY (`contestId`) REFERENCES `contests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contest_issues_ibfk_2` FOREIGN KEY (`issueId`) REFERENCES `issues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_issues`
--

LOCK TABLES `contest_issues` WRITE;
/*!40000 ALTER TABLE `contest_issues` DISABLE KEYS */;
INSERT INTO `contest_issues` VALUES (1,1,1),(2,1,2),(3,2,1),(4,3,1),(5,3,3),(6,4,4),(7,4,5),(8,5,2),(9,5,3),(19,1,5),(20,1,3),(21,1,4),(22,1,16);
/*!40000 ALTER TABLE `contest_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_users`
--

DROP TABLE IF EXISTS `contest_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contestId` int NOT NULL,
  `userId` int NOT NULL,
  `participantRole` tinyint NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contestId` (`contestId`),
  KEY `userId` (`userId`),
  CONSTRAINT `contest_users_ibfk_1` FOREIGN KEY (`contestId`) REFERENCES `contests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contest_users_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_users`
--

LOCK TABLES `contest_users` WRITE;
/*!40000 ALTER TABLE `contest_users` DISABLE KEYS */;
INSERT INTO `contest_users` VALUES (1,1,1,1,NULL,NULL),(2,1,2,1,NULL,NULL),(3,2,1,1,NULL,NULL),(4,3,1,1,NULL,NULL);
/*!40000 ALTER TABLE `contest_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `openTime` datetime DEFAULT NULL,
  `closeTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
INSERT INTO `contests` VALUES (1,'contest1','Programming Contest','2024-04-15 08:00:00','2024-11-20 12:00:00'),(2,'contest2','Math Contest','2024-05-01 09:00:00','2024-05-01 11:00:00'),(3,'contest3','Science Quiz','2024-05-10 14:00:00','2024-05-10 16:00:00'),(4,'contest4','History Bee','2024-05-15 10:00:00','2024-05-15 12:00:00'),(5,'contest5','Art Competition','2024-05-20 13:00:00','2024-05-20 15:00:00');
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `questionContent` text,
  `point` int DEFAULT NULL,
  `limitedTime` float DEFAULT NULL,
  `useTables` varchar(255) DEFAULT NULL,
  `executeType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,'SQL1','Customer1','<p>Viết câu truy vấn trả về tất cả thông tin của 3 khách hàng đầu tiên trong bảng <b>Customer</b></p>',10,61,'Customer123','SELECT'),(2,'SQL2','Category insert basic','<p> Thêm vào bảng Category123 một bản ghi như sau: </p> CategoryID = 9, CategoryName = \'Clothes\', Description =\'pretty\' ',15,61,'Category123','INSERT'),(3,'SQL3','Category update basic','<p>Cập nhật lại description = categoryName + categoryId đối với các Category có categoryId lớn hơn 4</p>',20,61,'Category123','UPDATE'),(4,'SQL4','create table Product123','<p>Tạo bảng Product123 có id là khóa chính (int), name dạng text</p>',12,161,'Products123123','CREATE_TABLE'),(5,'SQL5','alter table test_table','<p>Thay đôi cấu trúc bảng <b>test_table</b>, xóa cột name dạng text, thêm cột product_date dạng data</p>',18,169,'test_table123','ALTER_TABLE'),(13,'SQL6','TEST TABLE 2','<p>This is the question content for Problem 5.</p>',NULL,360,'Customer,Category123','SELECT'),(16,'SQL1715349747141','USERS 123','<p><span style=\"font-size: 20px\">Thông tin bảng Users123 gồm có id, name, gpa. Lấy thông tin của tất cả các bản ghi và sắp xếp theo gpa giảm dần</span></p>',NULL,182,'Category123','SELECT');
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submitions`
--

DROP TABLE IF EXISTS `submitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contestUserId` int NOT NULL,
  `contestIssueId` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `compiler` varchar(255) NOT NULL,
  `srcCode` text,
  `submitTime` datetime DEFAULT NULL,
  `executionTime` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contestUserId` (`contestUserId`),
  KEY `contestIssueId` (`contestIssueId`),
  CONSTRAINT `submitions_ibfk_1` FOREIGN KEY (`contestUserId`) REFERENCES `contest_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `submitions_ibfk_2` FOREIGN KEY (`contestIssueId`) REFERENCES `contest_issues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submitions`
--

LOCK TABLES `submitions` WRITE;
/*!40000 ALTER TABLE `submitions` DISABLE KEYS */;
INSERT INTO `submitions` VALUES (1,1,1,'AC','mysql',NULL,'2024-04-23 23:24:12',3),(2,1,1,'AC','mysql',NULL,'2024-04-23 23:24:12',2),(3,1,2,'WA','mysql',NULL,'2024-04-23 23:24:12',4),(4,2,1,'TLE','sql server',NULL,'2024-04-23 23:24:12',NULL),(5,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,7),(6,1,20,'LTE','COMPILER_MYSQL','update Category1234 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(7,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,6),(8,1,20,'LTE','COMPILER_MYSQL','update Category1234 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(9,1,20,'LTE','COMPILER_MYSQL','update Category1234 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(10,1,20,'LTE','COMPILER_MYSQL','update Category1234 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(11,1,20,'LTE','COMPILER_MYSQL','update Category set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(12,1,20,'LTE','COMPILER_MYSQL','update Category set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(13,1,20,'LTE','COMPILER_MYSQL','update Category set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,NULL),(14,1,20,'RTE','COMPILER_MYSQL','update Category set description = CONCAT(categoryName, categoryId) where categoryId > 4\n',NULL,0),(15,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 07:07:51',7),(16,1,20,'RTE','COMPILER_MYSQL','','2024-05-15 14:09:24',0),(17,1,20,'RTE','COMPILER_MYSQL','update Category set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:09:37',0),(18,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:09:42',11),(19,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:19:11',12),(20,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:19:47',9),(21,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:21:26',7),(22,1,20,'RTE','COMPILER_MYSQL','update Category12356 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:21:36',0),(23,1,20,'RTE','COMPILER_MYSQL','update Category12356 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:21:42',0),(24,1,20,'RTE','COMPILER_MYSQL','update Category12356 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-05-15 14:22:10',0),(25,1,2,'AC','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-05-15 14:25:49',7),(26,1,22,'ERROR','COMPILER_SQL_SERVER','select * from users123\norder by gpa desc\n','2024-05-15 14:26:17',0),(27,3,3,'AC','COMPILER_SQL_SERVER','select Top(3) * from customer123','2024-05-15 14:27:26',2),(28,1,1,'AC','COMPILER_MYSQL','select * from Customer123 limit 3;\n','2024-05-15 14:41:17',2),(29,1,21,'RTE','COMPILER_SQL_SERVER','create table Products123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:18:14',0),(30,1,21,'RTE','COMPILER_SQL_SERVER','create table Products123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:18:19',0),(31,1,21,'RTE','COMPILER_SQL_SERVER','create table Products123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:18:47',0),(32,1,21,'RTE12','COMPILER_SQL_SERVER','create table Products123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:19:08',0),(33,1,21,'WA','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:20:04',109),(34,1,21,'WA','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:21:23',73),(35,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:07',75),(36,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:09',69),(37,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:10',27),(38,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:10',28),(39,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:10',26),(40,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:10',27),(41,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:10',25),(42,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:11',27),(43,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:11',25),(44,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:37',99),(45,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:48',69),(46,1,21,'RTE','COMPILER_SQL_SERVER','create table Products1231123 (\n     id int primary key,\n     name text\n)\n','2024-05-16 15:22:52',0),(47,1,21,'ERROR','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\ncommit;','2024-05-16 15:53:40',0),(48,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)','2024-05-16 15:54:33',88),(49,1,1,'AC','COMPILER_MYSQL','select * from Customer123 limit 3;\n','2024-07-04 16:22:05',7),(50,1,1,'WA','COMPILER_MYSQL','select * from Customer123 limit 31;\n','2024-07-04 16:22:09',1),(51,1,1,'ERROR','COMPILER_SQL_SERVER','select * from Customer123 limit 31;\n','2024-07-04 16:22:15',0),(52,1,1,'ERROR','COMPILER_MYSQL','select top(3) from Customer123','2024-07-04 16:22:38',0),(53,1,1,'ERROR','COMPILER_MYSQL','select top(3) from Customer123;','2024-07-04 16:22:49',0),(54,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-04 16:23:20',87),(55,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-04 16:23:31',87),(56,1,21,'WA','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key\n     name text\n)\n','2024-07-04 16:23:36',2),(57,1,22,'ERROR','COMPILER_MYSQL','select * from Users123 order by gpa desc;','2024-07-04 16:24:17',0),(58,1,22,'ERROR','COMPILER_MYSQL','select * from Category123 order by gpa desc;','2024-07-04 16:24:25',0),(59,1,1,'ERROR','COMPILER_SQL_SERVER','select top(3) from Customer123;','2024-07-04 16:24:55',0),(60,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-04 16:25:02',3),(61,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:19:18',5),(62,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:21:01',2),(63,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:22:05',3),(64,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:22:34',2),(65,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:23:19',3),(66,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:23:56',2),(67,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:24:40',2),(68,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:26:17',2),(69,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:27:34',2),(70,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:30:17',2),(71,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:34:38',2),(72,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:34:41',3),(73,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 14:40:22',3),(74,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:05:32',1),(75,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:06:07',0),(76,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:11:34',0),(77,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:12:32',2),(78,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:13:24',0),(79,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:18:47',0),(80,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:20:49',1),(81,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:21:48',0),(82,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:32:32',3),(83,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:35:40',2),(84,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:36:45',1),(85,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:37:44',2),(86,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:39:50',1),(87,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:41:51',2),(88,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:44:18',1),(89,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:44:29',3),(90,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:06',2),(91,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:15',1),(92,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:21',2),(93,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:22',2),(94,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:22',1),(95,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',1),(96,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',1),(97,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',2),(98,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',2),(99,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',1),(100,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:40',1),(101,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:41',1),(102,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:41',1),(103,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:46:41',1),(104,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:51:32',1),(105,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 15:51:51',1),(106,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:24:30',NULL),(107,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:25:10',NULL),(108,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:25:31',NULL),(109,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:25:50',NULL),(110,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:26:07',NULL),(111,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:27:27',NULL),(112,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:30:04',NULL),(113,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:35:41',NULL),(114,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:35:55',NULL),(115,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:38:53',2),(116,1,1,'LTE','COMPILER_MYSQL','select top(3) * from Customer1232;','2024-07-20 17:39:00',NULL),(117,1,1,'LTE','COMPILER_MYSQL','select top(3) * from Customer1232;','2024-07-20 17:40:17',NULL),(118,1,1,'LTE','COMPILER_MYSQL','select top(3) * from Customer123;','2024-07-20 17:40:28',NULL),(119,1,1,'WA','COMPILER_SQL_SERVER','','2024-07-20 17:40:58',0),(120,1,1,'ERROR','COMPILER_SQL_SERVER','select top(3) * from Customer1223;','2024-07-20 17:41:13',0),(121,1,1,'LTE','COMPILER_MYSQL','select top(3) * from Customer123;','2024-07-20 17:41:22',NULL),(122,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-20 17:41:30',1),(123,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:02:26',NULL),(124,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:04:23',NULL),(125,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:05:14',4),(126,1,1,'ERROR','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:06:11',0),(127,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:07:06',2),(128,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-22 17:09:19',2),(129,1,1,'LTE','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-29 21:27:24',NULL),(130,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-29 21:28:31',2),(131,1,2,'WA','COMPILER_SQL_SERVER','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 21:40:47',6),(132,1,2,'LTE','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 21:40:57',NULL),(133,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-29 22:03:03',1),(134,1,2,'LTE','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:06:14',NULL),(135,1,2,'LTE','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:08:14',NULL),(136,1,2,'LTE','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:10:30',NULL),(137,1,2,'LTE','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:11:16',NULL),(138,1,2,'AC','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:12:24',16),(139,1,2,'AC','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:15:05',16),(140,1,2,'AC','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-29 22:17:10',16),(141,1,2,'RTE','COMPILER_MYSQL','','2024-07-29 22:17:35',0),(142,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-30 22:25:01',3),(143,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-30 22:53:10',3),(144,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-30 22:54:40',1),(145,1,1,'ERROR','COMPILER_MYSQL','select top(3) * from Customer123;','2024-07-30 22:55:02',0),(146,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-30 23:04:08',1),(147,1,2,'AC','COMPILER_MYSQL','insert into Category123 (CategoryID, CategoryName, Description)\nvalues (9, \'Clothes\', \"pretty\");\n','2024-07-30 23:04:31',19),(148,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-07-30 23:05:45',9),(149,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-07-30 23:05:56',10),(150,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-07-30 23:06:14',10),(151,1,20,'RTE','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n123','2024-07-30 23:06:21',0),(152,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:06:45',88),(153,1,21,'LTE','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:07:10',169),(154,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:07:19',128),(155,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:07:30',129),(156,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:55:02',124),(157,1,21,'LTE','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:55:33',170),(158,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:58:10',117),(159,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:58:27',130),(160,1,21,'AC','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:58:31',114),(161,1,21,'RTE','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:59:26',0),(162,1,21,'LTE','COMPILER_MYSQL','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-30 23:59:32',294),(163,1,21,'AC','COMPILER_SQL_SERVER','create table Products123123 (\n     id int primary key,\n     name text\n)\n','2024-07-31 00:02:06',115),(164,1,20,'AC','COMPILER_MYSQL','update Category123 set description = CONCAT(categoryName, categoryId) where categoryId > 4\n','2024-07-31 00:07:30',13),(165,1,1,'ERROR','COMPILER_MYSQL','select top(3) * from Customer123;','2024-07-31 00:07:45',0),(166,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-31 00:07:56',2),(167,1,1,'ERROR','COMPILER_MYSQL','select top(3) * from Customer123;','2024-07-31 00:08:08',0),(168,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-31 00:08:26',1),(169,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-31 00:08:46',2),(170,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-31 00:08:56',2),(171,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-07-31 00:09:09',2),(172,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-08-01 20:16:00',4),(173,1,1,'AC','COMPILER_SQL_SERVER','select top(3) * from Customer123;','2024-08-01 20:16:12',1);
/*!40000 ALTER TABLE `submitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testcases`
--

DROP TABLE IF EXISTS `testcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testcases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `issueId` int DEFAULT NULL,
  `outputPath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issueId` (`issueId`),
  CONSTRAINT `testcases_ibfk_1` FOREIGN KEY (`issueId`) REFERENCES `issues` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testcases`
--

LOCK TABLES `testcases` WRITE;
/*!40000 ALTER TABLE `testcases` DISABLE KEYS */;
INSERT INTO `testcases` VALUES (1,1,'issue_1.json'),(2,2,'issue_2.json'),(3,3,'issue_3.json'),(4,4,'issue_4.json'),(9,13,'TEST_TABLE_21713973188518.json'),(10,5,'issue_5.json'),(11,16,'1715349747140.json');
/*!40000 ALTER TABLE `testcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'v','v','Vinh','Bui'),(2,'g','v','Giang','Bui');
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

-- Dump completed on 2024-08-01 20:24:49