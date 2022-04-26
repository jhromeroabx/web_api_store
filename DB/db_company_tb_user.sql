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
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_user_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_user` (`id_user_type`),
  CONSTRAINT `fk_type_user` FOREIGN KEY (`id_user_type`) REFERENCES `tb_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'Jhosep Adbel','Romero Loa','74810248','928769204','jhromero.abx@gmail.com','2001-01-26',1,1),(2,'Diego Abbel','Romero Loa','74810249','957043843','dromero.abx@gmail.com','2003-09-03',1,2),(3,'Ximena Maritza','Romero Loa','74810500','932123123','ximenaromeroloa@gmail.com','2005-02-05',1,3),(4,'gato','felino','12345678','999555111','wasd@gmail.com','2001-01-26',1,1),(8,'pepita','palotes','12345601','912312312','pepit1.abx@gmail.com','2005-02-05',1,5),(9,'pepita','palotes','12345600','912312312','pepitooo.abx@gmail.com','2005-02-05',1,5),(10,'Flutter','Dart','12345679','925769204','Flutter.abx@gmail.com','0000-00-00',1,5),(11,'vicky','v','16125887','6767934','vimaloa@gmail.com','0000-00-00',1,5),(12,'celu','xiaomi','12345677','6767934','celu.loasi@gmail.com','0000-00-00',1,5),(13,'DLoa','EPC','74810243','957043843','dloa@papu','0000-00-00',1,5),(14,'mouse','disney','67679344','928769204','mouse.loasi@gmail.com','2015-02-05',1,5),(15,'mouse','disney','67679355','928769204','mouse.loasi@loasi','2015-02-05',1,5),(16,'123','123','12312312','123','123','2015-01-01',1,5),(17,'ffff','fffff','12345121','6767934','ffffff','2010-01-01',1,5);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 10:52:19
