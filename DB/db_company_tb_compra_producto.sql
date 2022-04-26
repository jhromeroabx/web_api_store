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
-- Table structure for table `tb_compra_producto`
--

DROP TABLE IF EXISTS `tb_compra_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_compra_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_comprada` int NOT NULL,
  `cantidad_restante` int NOT NULL,
  `precio_comprado` double NOT NULL,
  `precio_actual` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_compra`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tb_compra_producto_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `tb_compra` (`id`),
  CONSTRAINT `tb_compra_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compra_producto`
--

LOCK TABLES `tb_compra_producto` WRITE;
/*!40000 ALTER TABLE `tb_compra_producto` DISABLE KEYS */;
INSERT INTO `tb_compra_producto` VALUES (1,1,3,5,5,1.5,1.5,1),(2,1,4,10,10,2.5,2.5,1),(3,2,3,10,10,1.5,1.5,1),(4,2,4,20,20,2.5,2.5,1),(6,4,6,10,10,1.2,1.2,1),(7,4,7,10,10,1,1,1),(8,5,6,10,10,1.2,1.2,1),(9,5,7,10,10,1,1,1),(10,6,6,10,10,1.2,1.2,1),(11,6,7,10,10,1,1,1),(12,7,6,10,10,1.2,1.2,1),(13,7,7,10,10,1,1,1),(14,8,6,10,10,1.2,1.2,1),(15,8,7,10,10,1,1,1),(16,9,9,50,50,1.5,1.5,1);
/*!40000 ALTER TABLE `tb_compra_producto` ENABLE KEYS */;
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
