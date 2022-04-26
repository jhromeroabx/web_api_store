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
-- Table structure for table `tb_producto`
--

DROP TABLE IF EXISTS `tb_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `comentario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  `barcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imagen_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_categoria` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_producto_ibfk_1` (`id_categoria`),
  CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto`
--

LOCK TABLES `tb_producto` WRITE;
/*!40000 ALTER TABLE `tb_producto` DISABLE KEYS */;
INSERT INTO `tb_producto` VALUES (3,'Agua Cielo','Agua Cielo de 500 Ml',15,1.5,'7750670244954','https://www.ajegroup.com/en/wp-content/uploads/sites/3/2020/05/colombia-cielo.jpg',2,1),(4,'Rellenitas','Rellenitas de 6 galletas',30,2.5,'234','https://pbs.twimg.com/media/FFuZ7zpXMAkAf0Y.jpg',7,1),(6,'Chistris','Snack de queso Chistris',50,1.2,'456','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMW_jP4ozCdC1c9BiiDBj--fdPaA8JR3zBFQ&usqp=CAU',7,1),(7,'Casino','Galleta con relleno de menta',50,1,'789','https://scontent.flim33-1.fna.fbcdn.net/v/t1.6435-9/71323181_530995607711671_7328968735476154368_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=9267fe&_nc_ohc=qQn6_MJCcKEAX8c-ct7&_nc_ht=scontent.flim33-1.fna&oh=00_AT8JpFExVmXEMIrZhamoPuNf1204ztcpX4WVscAsz-Vyvw&oe=628D6ECD',7,1),(9,'Picaras clasicas','Galleta picaras sabor clasica',50,1.5,'111','https://marketpedidoslima.pe/images/slideshow/picaras-xl.png',7,1),(10,'Ventilador portatil','Ventiladores pequeños portatil conbateria de litio incluida',0,0,'123456','https://falabella.scene7.com/is/image/FalabellaPE/17703192_1?wid=800&hei=800&qlt=70',10,0),(11,'NFT','gaaaa',0,0,'','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcWpwqTsUeIYI4HqWmoWP2tn0o5x7eHkkU9w&usqp=CAU',1,0),(12,'Big Cola','Gaseosa BigCola',0,0,'7751731004722','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGIZG49jAb8ACamLz6DG-slyH770VskE2sqg&usqp=CAU',2,1),(13,'test','test 111',0,0,'','',1,0),(14,'test','test 111',0,0,'','',1,0),(15,'test','test 111',0,0,'','',10,1),(16,'test','test 111',0,0,'','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxTQ_y_tbsdmqUMmZK2zyqPzvvd2LRV0HfVw&usqp=CAU',10,1),(17,'Manzanas roja','manzanas orgánicas jugosas',0,0,'','http://pngimg.com/uploads/apple/apple_PNG12405.png',7,0),(18,'frac','galleta de chocolate',0,0,'7750885012881','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ARMRFuIStzBcFLWVee36ABt33WPx6mxYRA&usqp=CAU',7,1),(19,'gretel','galleta gretel de chocolate',0,0,'7750885011907','https://www.pidemeperu.com/files/productos/galleta-gretel-chocolate.jpg',7,0),(20,'foquito','foco de carrito o refrigerador',0,0,'7751279245021','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqdtTIesLRkJUfYJgjB-ISL6JdNJhaK8oCKQ&usqp=CAU',10,0);
/*!40000 ALTER TABLE `tb_producto` ENABLE KEYS */;
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
