-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: db_company
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `user` varchar(50) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_user` (`id_user`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile`
--

LOCK TABLES `tb_profile` WRITE;
/*!40000 ALTER TABLE `tb_profile` DISABLE KEYS */;
INSERT INTO `tb_profile` VALUES (1,1,'jhromero.abx@gmail.com','123','2022-04-26 04:50:26'),(2,2,'dromero.abx@gmail.com','12345','2022-03-27 17:00:00'),(3,4,'wasd@gmail.com','12345','2022-04-23 23:22:44'),(7,8,'pepit1.abx@gmail.com','12345','2022-04-12 22:18:55'),(8,9,'pepitooo.abx@gmail.com','12345','2022-04-12 22:19:24'),(9,10,'Flutter.abx@gmail.com','12345','2022-04-12 23:34:10'),(10,11,'vimaloa@gmail.com','123','2022-04-15 04:37:36'),(11,12,'celu.loasi@gmail.com','123','2022-04-13 00:15:20'),(12,13,'dloa@papu','1234','2022-04-13 00:35:24'),(13,14,'mouse.loasi@gmail.com','123','2022-04-14 22:32:28'),(14,16,'123','123','2022-04-14 22:50:34'),(15,17,'ffffff','123','2022-04-14 23:37:02');
/*!40000 ALTER TABLE `tb_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 10:52:20
