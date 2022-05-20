CREATE DATABASE  IF NOT EXISTS `db_company` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_company`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 192.168.18.6    Database: db_company
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
-- Temporary view structure for view `QuantityAllProducts`
--

DROP TABLE IF EXISTS `QuantityAllProducts`;
/*!50001 DROP VIEW IF EXISTS `QuantityAllProducts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `QuantityAllProducts` AS SELECT 
 1 AS `id`,
 1 AS `nombre`,
 1 AS `comentario`,
 1 AS `cantidad`,
 1 AS `precio`,
 1 AS `id_categoria`,
 1 AS `active`,
 1 AS `barcode`,
 1 AS `imagen_url`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `losafutbol`
--

DROP TABLE IF EXISTS `losafutbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `losafutbol` (
  `NomLosa` varchar(50) NOT NULL,
  `id_losa` int NOT NULL AUTO_INCREMENT,
  `Aforo` int NOT NULL,
  `MaxJugadores` int NOT NULL,
  `Estado` char(1) NOT NULL,
  PRIMARY KEY (`id_losa`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `losafutbol`
--

LOCK TABLES `losafutbol` WRITE;
/*!40000 ALTER TABLE `losafutbol` DISABLE KEYS */;
INSERT INTO `losafutbol` VALUES ('VERDE',12,18,40,'I'),('Deportiva',13,500,600,'A'),('VERDE',14,12,40,'I'),('www',15,12,33,'A'),('ggggggg',16,12,333,'I'),('dawda',17,2,3,'A');
/*!40000 ALTER TABLE `losafutbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria`
--

LOCK TABLES `tb_categoria` WRITE;
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` VALUES (1,'menestras','Menestras de todo tipo que se pesan en gramos',1),(2,'bebidas','Bebidas de todo tipo que tiene diferentes presentaciones',1),(4,'Lacteos','Son queso y leche empaquetados o en embotellados, no se vende en partes, vienen en diferentes presentaciones',1),(5,'productos de aseo personal','Jabones, crema dental, Shampoo, entro otros para el aseo personal',1),(6,'productos de limpieza','Son productos solo para limpiar superficies, no para uso humano',1),(7,'comestibles','Son golosinas en general',1),(8,'comestible para mascotas','Comida para todo tipo de mascotas en distintas presentaciones',1),(9,'Herramientas','Herramientas para la cocina y aseo del hogar',1),(10,'Dispositivos electronicos','Utiles eletronicos y digitales preferible de linea blanca',1);
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_compra`
--

DROP TABLE IF EXISTS `tb_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_compra` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(150) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compra`
--

LOCK TABLES `tb_compra` WRITE;
/*!40000 ALTER TABLE `tb_compra` DISABLE KEYS */;
INSERT INTO `tb_compra` VALUES (1,'Compra de agua y Rellenitas','2022-04-09 21:10:54',1,1),(2,'Compra de agua y Rellenitas','2022-04-09 21:22:20',1,1),(4,'Compra de galleta casino y Chistris','2022-04-09 21:40:17',3,1),(5,'Compra de galleta casino y Chistris','2022-04-09 21:42:56',3,1),(6,'Comida para todo tipo de mascotas en distintas presentaciones','2022-04-10 15:58:28',3,1),(7,'Comida para todo tipo de mascotas en distintas presentaciones','2022-04-10 16:00:37',3,1),(8,'Comida para todo tipo de mascotas en distintas presentaciones','2022-04-14 03:54:46',3,1),(9,'Comprar picaras','2022-04-15 05:05:59',3,1),(10,'test compra','2022-05-15 19:33:51',16,1),(11,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 19:35:59',3,1),(12,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 19:36:47',3,1),(13,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 19:36:59',3,1),(17,'com','2022-05-15 20:26:27',16,1),(18,'com','2022-05-15 20:32:17',16,1),(21,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:47:15',3,1),(22,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:47:57',3,1),(23,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:48:35',3,1),(24,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:51:13',3,1),(25,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:51:44',3,1),(26,'Comida para todo tipo de mascotas en distintas presentaciones','2022-05-15 20:51:59',3,1),(27,'Compra test','2022-05-15 22:07:00',16,1),(28,'Compra test','2022-05-15 22:12:59',16,1),(29,'Compra test','2022-05-15 22:13:42',16,1),(30,'Compra test','2022-05-15 22:19:23',16,1),(31,'Compra test','2022-05-15 22:20:04',16,1),(32,'Compra test','2022-05-15 22:23:56',16,1);
/*!40000 ALTER TABLE `tb_compra` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_compra_producto`
--

LOCK TABLES `tb_compra_producto` WRITE;
/*!40000 ALTER TABLE `tb_compra_producto` DISABLE KEYS */;
INSERT INTO `tb_compra_producto` VALUES (1,1,3,5,5,1.5,1.5,1),(2,1,4,10,10,2.5,2.5,1),(3,2,3,10,10,1.5,1.5,1),(4,2,4,20,20,2.5,2.5,1),(6,4,6,10,10,1.2,1.2,1),(7,4,7,10,10,1,1,1),(8,5,6,10,10,1.2,1.2,1),(9,5,7,10,10,1,1,1),(10,6,6,10,10,1.2,1.2,1),(11,6,7,10,10,1,1,1),(12,7,6,10,10,1.2,1.2,1),(13,7,7,10,10,1,1,1),(14,8,6,10,10,1.2,1.2,1),(15,8,7,10,10,1,1,1),(16,9,9,50,50,1.5,1.5,1),(17,10,27,250,250,10,10,1),(18,10,28,100,100,15,15,1),(19,11,6,10,10,1.2,1.2,1),(20,11,7,10,10,1,1,1),(21,12,6,10,10,1.2,1.2,1),(22,12,7,10,10,1,1,1),(23,13,6,10,10,1.2,1.2,1),(24,13,7,10,10,1,1,1),(28,17,27,250,250,10,10,1),(29,17,28,100,100,15,15,1),(30,18,27,250,250,10,10,1),(31,18,28,100,100,15,15,1),(33,21,6,10,10,1.2,1.2,1),(34,21,7,10,10,1,1,1),(35,22,6,10,10,1.2,1.2,1),(36,22,7,10,10,1,1,1),(37,23,6,10,10,1.2,1.2,1),(38,23,7,10,10,1,1,1),(39,24,6,10,10,1.2,1.2,1),(40,24,7,10,10,1,1,1),(41,25,6,10,10,1.2,1.2,1),(42,25,7,10,10,1,1,1),(43,26,6,10,10,1.2,1.2,1),(44,26,7,10,10,1,1,1),(45,27,28,100,100,15,15,1),(46,27,27,5000,5000,1.9,1.9,1),(47,28,27,5000,5000,1.9001139999999999,1.9001139999999999,1),(48,28,28,100,100,15,15,1),(49,29,27,5000,5000,1.9001139999999999,1.9001139999999999,1),(50,29,28,100,100,15,15,1),(51,30,27,5000,5000,1.90015,1.90015,1),(52,30,28,100,100,15,15,1),(53,31,27,5000,5000,1.90015,1.90015,1),(54,31,28,100,100,15,15,1),(55,32,27,1000,1000,3.5,3.5,1),(56,32,28,100,100,15.0045,15.0045,1);
/*!40000 ALTER TABLE `tb_compra_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `id_employee_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_employee` (`id_employee_type`),
  CONSTRAINT `fk_type_employee` FOREIGN KEY (`id_employee_type`) REFERENCES `tb_employee_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee`
--

LOCK TABLES `tb_employee` WRITE;
/*!40000 ALTER TABLE `tb_employee` DISABLE KEYS */;
INSERT INTO `tb_employee` VALUES (1,'Ing de sistemas e Informatica',45000,1),(2,'Administrador general',50000,1),(3,'Contador y Financista',25000,4),(4,'Asistente de contabilidad y almacen',5000,3),(5,'Almacenero',3500,3),(6,'Atencion  y soporte cliente',4500,3),(8,'wasd123333e',1255,2);
/*!40000 ALTER TABLE `tb_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_employee_type`
--

DROP TABLE IF EXISTS `tb_employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_employee_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(45) NOT NULL,
  `desc` varchar(150) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_employee_type`
--

LOCK TABLES `tb_employee_type` WRITE;
/*!40000 ALTER TABLE `tb_employee_type` DISABLE KEYS */;
INSERT INTO `tb_employee_type` VALUES (1,'admin','admin',1),(2,'help','help support',1),(3,'assitant','assitant for queries or guides',1),(4,'accounting','Contabilidad general',1);
/*!40000 ALTER TABLE `tb_employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producto`
--

DROP TABLE IF EXISTS `tb_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto`
--

LOCK TABLES `tb_producto` WRITE;
/*!40000 ALTER TABLE `tb_producto` DISABLE KEYS */;
INSERT INTO `tb_producto` VALUES (3,'Agua Cielo','Agua Cielo de 500 ml',15,1.5,'7750670244954','https://www.ajegroup.com/en/wp-content/uploads/sites/3/2020/05/colombia-cielo.jpg',2,1),(4,'Rellenitas','Rellenitas de 6 galletas',30,2.5,'234','https://pbs.twimg.com/media/FFuZ7zpXMAkAf0Y.jpg',7,1),(6,'Chistris','Snack de queso Chistris',140,1.2,'7758574003219','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMW_jP4ozCdC1c9BiiDBj--fdPaA8JR3zBFQ&usqp=CAU',7,1),(7,'Casino','Galleta con relleno de menta',140,1,'789','https://scontent.flim33-1.fna.fbcdn.net/v/t1.6435-9/71323181_530995607711671_7328968735476154368_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=9267fe&_nc_ohc=qQn6_MJCcKEAX8c-ct7&_nc_ht=scontent.flim33-1.fna&oh=00_AT8JpFExVmXEMIrZhamoPuNf1204ztcpX4WVscAsz-Vyvw&oe=628D6ECD',7,1),(9,'Picaras clasicas','Galleta picaras sabor clasica',50,1.5,'111','https://marketpedidoslima.pe/images/slideshow/picaras-xl.png',7,1),(10,'Ventilador portatil 123','Ventiladores pequeños portatil conbateria de litio incluida',0,0,'123456','https://falabella.scene7.com/is/image/FalabellaPE/17703192_1?wid=800&hei=800&qlt=70',10,1),(11,'NFT','gaaaa',0,0,'','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcWpwqTsUeIYI4HqWmoWP2tn0o5x7eHkkU9w&usqp=CAU',1,1),(12,'Big Cola','Gaseosa BigCola',0,0,'7751731004722','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGIZG49jAb8ACamLz6DG-slyH770VskE2sqg&usqp=CAU',2,1),(13,'test','test 111',0,0,'','',1,1),(14,'test','test 111',0,0,'','',1,1),(15,'test','test 111',0,0,'','',10,1),(16,'test','test 111',0,0,'','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxTQ_y_tbsdmqUMmZK2zyqPzvvd2LRV0HfVw&usqp=CAU',10,1),(17,'Manzanas roja','manzanas orgánicas jugosas',0,0,'','http://pngimg.com/uploads/apple/apple_PNG12405.png',7,1),(18,'frac','galleta de chocolate',0,0,'7750885012881','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ARMRFuIStzBcFLWVee36ABt33WPx6mxYRA&usqp=CAU',7,1),(19,'gretel','galleta gretel de chocolate',0,0,'7750885011907','https://www.pidemeperu.com/files/productos/galleta-gretel-chocolate.jpg',7,1),(20,'foquito','foco de carrito o refrigerador',0,0,'7751279245021','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqdtTIesLRkJUfYJgjB-ISL6JdNJhaK8oCKQ&usqp=CAU',10,1),(21,'cifrut granadilla personal','bebida de granadilla',0,0,'7750670014632','https://dojiw2m9tvv09.cloudfront.net/53648/product/sintitulo0357.jpg',2,1),(22,'alcohol','alcohol de 1 litro',0,0,'7750075055810','https://vivanda.vtexassets.com/arquivos/ids/230956/20198336.jpg?v=637422289081000000',5,1),(23,'líquido paper standford','lápiz corrector stanford',0,0,'7750822007697','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVofq04NSVvB6Rg83Nd_Cl9Wuwmc8pgossQ&usqp=CAU',9,1),(24,'sporade','botella personal de sporade',0,0,'7750670010238','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrfk7fWLD_bzrcOJgxS3UNYHhR1LoPhTrMrw&usqp=CAU',2,1),(25,'johan','johan',0,0,'74906411','',4,0),(26,'DNI','DNI de papa',0,0,'10532635','',10,0),(27,'desodorante Rexona men sport','desodorante aerosol',26750,3.5,'7791293041629','https://www.urumercado.com/wp-content/uploads/2021/08/7791293041629.png',5,1),(28,'banco de energía zmi aura','banco de energía de 20mAh',900,15.0045,'6934263401073','https://m.media-amazon.com/images/I/61omytS3m8L._AC_SL1500_.jpg',10,1),(29,'palillos chinos para restaurante','caja de 100 palillos chinos',0,0,'6936805409066','https://mh-1-banco-de-imagen.panthermedia.net/media/media_detail/0001000000/01636000/~mondadientes_01636319_detail.jpg',9,1);
/*!40000 ALTER TABLE `tb_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `user` varchar(50) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_user` (`id_user`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile`
--

LOCK TABLES `tb_profile` WRITE;
/*!40000 ALTER TABLE `tb_profile` DISABLE KEYS */;
INSERT INTO `tb_profile` VALUES (1,1,'jhromero.abx@gmail.com','123','2022-05-18 20:13:29'),(2,2,'dromero.abx@gmail.com','123','2022-03-27 17:00:00'),(3,4,'wasd@gmail.com','123','2022-05-14 22:06:21'),(7,8,'pepit1.abx@gmail.com','12345','2022-04-12 22:18:55'),(8,9,'pepitooo.abx@gmail.com','12345','2022-04-12 22:19:24'),(9,10,'Flutter.abx@gmail.com','12345','2022-04-12 23:34:10'),(10,11,'vimaloa@gmail.com','123','2022-04-15 04:37:36'),(11,12,'celu.loasi@gmail.com','123','2022-04-13 00:15:20'),(12,13,'dloa@papu','1234','2022-04-13 00:35:24'),(13,14,'mouse.loasi@gmail.com','123','2022-04-14 22:32:28'),(14,16,'123','123','2022-05-15 02:39:06'),(15,17,'ffffff','123','2022-04-14 23:37:02'),(16,18,'jgarcia.abx@gmail.com','123','2022-05-13 19:14:40');
/*!40000 ALTER TABLE `tb_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_retiro`
--

DROP TABLE IF EXISTS `tb_retiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_retiro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(150) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_retiro`
--

LOCK TABLES `tb_retiro` WRITE;
/*!40000 ALTER TABLE `tb_retiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_retiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_retiro_producto`
--

DROP TABLE IF EXISTS `tb_retiro_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_retiro_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_retiro` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  `active` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_retiro_producto` (`id_producto`),
  KEY `fk_retiro` (`id_retiro`),
  CONSTRAINT `fk_retiro` FOREIGN KEY (`id_retiro`) REFERENCES `tb_retiro` (`id`),
  CONSTRAINT `fk_retiro_producto` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_retiro_producto`
--

LOCK TABLES `tb_retiro_producto` WRITE;
/*!40000 ALTER TABLE `tb_retiro_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_retiro_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unidad_medida`
--

DROP TABLE IF EXISTS `tb_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_unidad_medida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_unidad_medida`
--

LOCK TABLES `tb_unidad_medida` WRITE;
/*!40000 ALTER TABLE `tb_unidad_medida` DISABLE KEYS */;
INSERT INTO `tb_unidad_medida` VALUES (1,'1 Litro','1 Litro para todo',1),(2,'500 ml','medio litro para todo',1);
/*!40000 ALTER TABLE `tb_unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'Jhosep Adbel','Romero Loa','74810248','928769204','jhromero.abx@gmail.com','2001-01-26',1,1),(2,'Diego Abbel','Romero Loa','74810249','957043843','dromero.abx@gmail.com','2003-09-03',1,2),(3,'Ximena Maritza','Romero Loa','74810500','932123123','ximenaromeroloa@gmail.com','2005-02-05',1,3),(4,'gato','felino','12345678','999555111','wasd@gmail.com','2001-01-26',1,1),(8,'pepita','palotes','12345601','912312312','pepit1.abx@gmail.com','2005-02-05',1,5),(9,'pepita','palotes','12345600','912312312','pepitooo.abx@gmail.com','2005-02-05',1,5),(10,'Flutter','Dart','12345679','925769204','Flutter.abx@gmail.com','0000-00-00',1,5),(11,'vicky','v','16125887','6767934','vimaloa@gmail.com','0000-00-00',1,5),(12,'celu','xiaomi','12345677','6767934','celu.loasi@gmail.com','0000-00-00',1,5),(13,'DLoa','EPC','74810243','957043843','dloa@papu','0000-00-00',1,5),(14,'mouse','disney','67679344','928769204','mouse.loasi@gmail.com','2015-02-05',1,5),(15,'mouse','disney','67679355','928769204','mouse.loasi@loasi','2015-02-05',1,5),(16,'123','123','12312312','123','123','2015-01-01',1,5),(17,'ffff','fffff','12345121','6767934','ffffff','2010-01-01',1,5),(18,'juan','García Supa','70936394','925591889','jgarcia.abx@gmail.com','1996-07-15',1,5);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_type`
--

DROP TABLE IF EXISTS `tb_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_type`
--

LOCK TABLES `tb_user_type` WRITE;
/*!40000 ALTER TABLE `tb_user_type` DISABLE KEYS */;
INSERT INTO `tb_user_type` VALUES (1,'admin','administrador del sistema en general',1),(2,'developer senior','desarrollador del sistema y analista de nuevas funciones',1),(3,'client assitant','asistente del cliente y recepcion de reqs de los clientes',1),(4,'client guide','Guia de los clientes para ubicacion de todo el sistema',1),(5,'User Default','Usuario Default listo para ser asignado por el administrador',1);
/*!40000 ALTER TABLE `tb_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` varchar(30) NOT NULL,
  `counter` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'20',1),(2,'galleta',2),(3,'comestible',3),(4,'1',4);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_company'
--

SET GLOBAL log_bin_trust_function_creators = 1;

--
-- Dumping routines for database 'db_company'
--
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `SPLIT_STR`(`x` VARCHAR(255), `delim` VARCHAR(12), `pos` INT) RETURNS varchar(255) CHARSET utf8mb4
BEGIN
-- SET GLOBAL log_bin_trust_function_creators = 1;
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(30), IN `_comentario` VARCHAR(150), IN `_active` BOOLEAN)
BEGIN
SET @error = 'TODO BIEN!!!';
IF _id = 0 THEN
	INSERT INTO tb_categoria (nombre, comentario, active) VALUES (_nombre, _comentario, 1);
    SET _id = last_insert_id();
ELSE
	SET @existe_categoria = IF( EXISTS(select * from tb_categoria cat WHERE cat.id = _id),1,0);
    IF @existe_categoria = 1 THEN
    	UPDATE tb_categoria SET nombre = _nombre, comentario = _comentario, active = _active WHERE id = _id;
    ELSE
    	SET @error = 'NO EXISTE LA CATEGORIA';
    END IF;
END IF;
SELECT _id AS id, @error as error;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `compraAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compraAdd`(IN `_comentario` VARCHAR(150), IN `_id_user_responsable` INT, IN `_productos_concat` VARCHAR(250), IN `_cantidad_productos` INT)
BEGIN
	-- call db_company.compraAdd('Comida para todo tipo de mascotas en distintas presentaciones', 3, '6|10|1.2@7|10|1', 2);
	START TRANSACTION;
	SET AUTOCOMMIT=0;
    SET @response = 'COMPRA EXITOSA!!!';
    INSERT INTO tb_compra (comentario,fecha,id_user_responsable,active) VALUES (_comentario, NOW(), _id_user_responsable, 1);
    SET @id_compra = last_insert_id();
    
    
    SET @contadorProductos = 1;
    SET @state = 1;
    
    WHILE (@contadorProductos <= _cantidad_productos AND @state = 1) DO
    	SET @producto = SPLIT_STR(_productos_concat, '@', @contadorProductos);
        
        SET @contadorProductos = @contadorProductos + 1;
        
        SET @id_producto = SPLIT_STR(@producto, '|', 1);
        SET @cantidad_comprada = SPLIT_STR(@producto, '|', 2);
        SET @precio_comprado = SPLIT_STR(@producto, '|', 3);
        
        SET @existe_producto = IF( EXISTS(
             SELECT *
             FROM tb_producto tp
             WHERE tp.id = @id_producto), 1, 0);
        IF @existe_producto = 1 THEN
        	INSERT INTO tb_compra_producto (id_compra, id_producto, cantidad_comprada, cantidad_restante, precio_comprado, precio_actual,   active)
            VALUES (@id_compra, @id_producto, @cantidad_comprada, @cantidad_comprada, @precio_comprado, @precio_comprado, 1);
            
            SET @cantidad_producto = (SELECT cantidad FROM tb_producto where id = @id_producto);
            
            SET @cantidad_producto = @cantidad_producto + @cantidad_comprada;
            
            UPDATE tb_producto SET cantidad = @cantidad_producto, precio = @precio_comprado, active = 1 WHERE id = @id_producto;
        ELSE
            SET @state = 0;            
        	SET @response = CONCAT('NO EXISTE EL PRODUCTO', ': ' , @id_producto);
        	ROLLBACK;
        END IF;
    END WHILE;
    COMMIT;
    SELECT @state AS state, @response as response;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `employeeAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `employeeAddOrEdit`(`_id` INT, `_name` VARCHAR(50), `_salary` DECIMAL, `_id_employee_type` INT)
BEGIN
	SET @EXISTE := 0;
    SET @ERROR := 'TODO BIEN!!!';
	IF _id = 0 THEN
		INSERT INTO tb_employee (name, salary, id_employee_type)
        VALUES (_name,_salary, _id_employee_type);
        
        SET _id = last_insert_id();
	ELSE
    	SET @EXISTE := IF( EXISTS(
             SELECT *
             FROM tb_employee te
             WHERE te.id = _id), 1, 0);
    	IF @EXISTE = 1 THEN
        	UPDATE tb_employee
        	SET
			name = _name,
            salary = _salary,
            id_employee_type = _id_employee_type
            WHERE id = _id;
        ELSE
        	SET @ERROR = 'NO EXISTE EL USER';
    	END IF;    
	END IF;
    SELECT _id AS id, @ERROR as error;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findProductBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `findProductBy`(IN `_id` INT, IN `_barcode` VARCHAR(50))
BEGIN
	IF _id = 0 THEN    	
        SELECT * FROM tb_producto pro WHERE 
        -- pro.active = 1 AND 
        pro.barcode = _barcode;
    ELSEIF _barcode = 0 THEN
    	SELECT * FROM tb_producto pro WHERE 
        -- pro.active = 1 AND 
        pro.id = _id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(IN `_user` VARCHAR(30), IN `_contrasenia` VARCHAR(30))
BEGIN
	SET @ACCESS := 0;
    SET @MSG := 'TODO BIEN, HAY DATOS DEL USER!!!';	
    	SET @ACCESS := IF( EXISTS(
            SELECT * FROM tb_profile tp
            INNER JOIN tb_user tu 
            ON tp.id_user = tu.id 
            WHERE tu.email = _user AND tp.contrasenia = _contrasenia), 1, 0);
    	IF @ACCESS = 1 THEN
        	UPDATE tb_profile tp SET tp.last_connection = NOW() WHERE tp.user = _user;
        	SELECT @MSG as msg, true as state LIMIT 1;
            SELECT * FROM tb_user tu WHERE tu.email = _user LIMIT 1;
        ELSE
        	SET @MSG = 'ACCESOS INCORRECTOS!!!';
            SELECT @MSG as msg, false as state LIMIT 1;
    	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productoAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `productoAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(50), IN `_comentario` VARCHAR(200), IN `_barcode` VARCHAR(50), IN `_imagen_url` TEXT, IN `_id_categoria` INT, IN `_active` INT)
BEGIN	
    SET @error = 'TODO BIEN';
    SET @STATE := true;
    
    SET @existe_categoria = IF( EXISTS(select * from tb_categoria cat WHERE cat.id = _id_categoria AND cat.active = 1),1,0);
	IF @existe_categoria = 1 THEN    
		IF _id = 0 THEN
			INSERT INTO tb_producto (nombre, comentario, cantidad, precio, barcode, imagen_url,id_categoria, active) VALUES 
            (_nombre, _comentario, 0, 0,_barcode,_imagen_url, _id_categoria, 0);
            SET _id = last_insert_id();
		ELSE
			SET @existe_producto = IF( EXISTS(select * from tb_producto prod WHERE prod.id = _id),1,0);
			IF @existe_producto = 1 THEN
				UPDATE tb_producto 
                SET nombre = _nombre,
                comentario = _comentario,
                id_categoria = _id_categoria,
                active = _active,
                barcode = _barcode,
                imagen_url = _imagen_url
                WHERE id = _id;
			ELSE
				SET @error = 'NO EXISTE EL PRODUCTO';
                SET @STATE := false;
			END IF;
        END IF;
	ELSE
		SET @error = 'NO EXISTE LA CATEGORIA';
        SET @STATE := false;
	END IF;
    SELECT _id AS id, @error as error, @STATE as state;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductsByCategoryANDORActive` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ProductsByCategoryANDORActive`(IN `_id_categoria` INT, IN `_active` INT)
BEGIN
	IF _id_categoria = 0 THEN    	
        -- SOLO ACTIVOS Y DESACTIVOS
        SELECT * FROM tb_producto pro WHERE 
        pro.active = _active;
    ELSE
    	-- CATEGORIAS CON ACTIVO/ DESACTIVO
    	SELECT * FROM tb_producto pro WHERE 
        pro.active = _active AND 
        pro.id_categoria = _id_categoria;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SPLIT_LOOP_COUNTER_while` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `SPLIT_LOOP_COUNTER_while`(`valores` VARCHAR(500), `_cant_valores` INT)
BEGIN
SET @contador = 1;

	WHILE (@contador <= _cant_valores) DO		
		INSERT INTO test (valor,counter) VALUES (SPLIT_STR(valores, '|', @contador),@contador);
        SET @contador=@contador+1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EditarLosa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EditarLosa`(IN `_aforo` INT, IN `_estado` CHAR(1), IN `_maxjugadores` INT, IN `_nomlosa` VARCHAR(50), IN `_id_losa` INT)
    NO SQL
BEGIN
UPDATE losafutbol
set Aforo= _aforo,
Estado= _estado,
MaxJugadores= _maxjugadores ,
NomLosa=  _nomlosa
WHERE id_losa= _id_losa;


IF (ROW_COUNT() > 0) THEN
	SELECT 1 AS CodResultado,
    'Actulizó correctamente' AS DesResultado;
ELSE
	SELECT 0 AS CodResultado,
    'Ocurrió un error al actualizar el registro' AS DesResultado;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_EliminarLosa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_EliminarLosa`(IN `_id_losa` INT)
    NO SQL
BEGIN

UPDATE losafutbol set Estado = 'I'
 where id_losa = _id_losa;
 
 IF (ROW_COUNT() > 0) THEN
	SELECT 1 AS CodResultado,
    'Se eliminó correctamente' AS DesResultado;
ELSE
	SELECT 0 AS CodResultado,
    'Ocurrió un error al eliminar el registro' AS DesResultado;
END IF;

 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarLosa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarLosa`()
    NO SQL
begin
	SELECT Aforo, Estado, id_losa,MaxJugadores, NomLosa
	FROM		losafutbol lf WHERE lf.Estado = 'A'
	ORDER BY	id_losa DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ListarLosaPorCodigo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ListarLosaPorCodigo`(IN `_id_losa` INT)
    NO SQL
begin
	SELECT lf.Aforo,lf. Estado, lf.id_losa,lf.MaxJugadores, 	lf.NomLosa
	FROM		losafutbol lf WHERE lf.id_losa = _id_losa
	ORDER BY	lf.id_losa DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegistrarLosa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_RegistrarLosa`(IN `_aforo` INT, IN `_estado` CHAR(1), IN `_max_jugadores` INT, IN `_nomlosa` VARCHAR(50))
    NO SQL
BEGIN
INSERT INTO losafutbol(Aforo,Estado,MaxJugadores,NomLosa) VALUES (_aforo,_estado,_max_jugadores,_nomlosa);

IF (ROW_COUNT() > 0) THEN
	SELECT 1 AS CodResultado,
    'Registró correctamente' AS DesResultado;
ELSE
	SELECT 0 AS CodResultado,
    'Ocurrió un error al registrar' AS DesResultado;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(200), IN `_apellido` VARCHAR(200), IN `_dni` VARCHAR(10), IN `_telefono` VARCHAR(30), IN `_email` VARCHAR(50), IN `_fecha_nacimiento` DATE, IN `_estado` TINYINT(1), IN `_id_user_type` INT, IN `_contrasenia` VARCHAR(15))
BEGIN
	SET @EXISTE_user := 0;
    SET @EXISTE_dni := 0;
    SET @EXISTE_email := 0;
    SET @STATE := true;
    SET @ERROR := 'TODO BIEN!!!';
    
    IF _id = 0 THEN
    	SET @EXISTE_dni := IF( EXISTS(
             SELECT *
             FROM tb_user tu
             WHERE tu.dni = _dni), 1, 0);
		SET @EXISTE_email := IF( EXISTS(
             SELECT *
             FROM tb_user tu
             WHERE tu.email = _email), 1, 0);             
    	IF @EXISTE_dni = 1 OR @EXISTE_email = 1 THEN
        	SET @ERROR = 'EL DNI EXISTE Y/O EL EMAIL EXISTE';
            SET @STATE := false;
        ELSE
        	INSERT INTO tb_user (nombre, apellido, dni, telefono, email,fecha_nacimiento, estado, id_user_type)
            VALUES (_nombre, _apellido,_dni, _telefono, _email, _fecha_nacimiento, _estado, _id_user_type);
        
        	SET _id = last_insert_id();
        
            INSERT INTO tb_profile (id_user, `user`, contrasenia, last_connection)
            VALUES (_id, _email, _contrasenia, NOW());
    	END IF;		
	ELSE
    	SET @EXISTE_dni := IF( EXISTS(
             SELECT *
             FROM tb_user tu
             WHERE tu.dni = _dni AND tu.id <> _id), 1, 0);
		SET @EXISTE_email := IF( EXISTS(
             SELECT *
             FROM tb_user tu
             WHERE tu.email = _email AND tu.id <> _id), 1, 0);
        SET @EXISTE_user := IF( EXISTS(
             SELECT *
             FROM tb_user tu
             WHERE tu.id = _id), 1, 0);
             
    	IF @EXISTE_dni = 1 THEN
        	SET @ERROR = 'EL DNI YA EXISTE';
            SET @STATE := false;
        ELSEIF @EXISTE_email = 1 THEN
        	SET @ERROR = 'EL CORREO YA EXISTE';
            SET @STATE := false;
        ELSEIF @EXISTE_user = 0 THEN
        	SET @ERROR = 'EL USER NO EXISTE';
            SET @STATE := false;
        ELSE
        	UPDATE tb_user SET nombre = _nombre, apellido = _apellido, dni = _dni, telefono = _telefono, email = _email, fecha_nacimiento = _fecha_nacimiento, estado = _estado, id_user_type = _id_user_type WHERE id = _id;
            
            UPDATE tb_profile SET `user` = _email WHERE id_user = _id;            
    	END IF;    
	END IF;
    SELECT _id AS id, @ERROR as error, @STATE as state;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `QuantityAllProducts`
--

/*!50001 DROP VIEW IF EXISTS `QuantityAllProducts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `QuantityAllProducts` AS select `p`.`id` AS `id`,`p`.`nombre` AS `nombre`,`p`.`comentario` AS `comentario`,`p`.`cantidad` AS `cantidad`,`p`.`precio` AS `precio`,`p`.`id_categoria` AS `id_categoria`,`p`.`active` AS `active`,`p`.`barcode` AS `barcode`,`p`.`imagen_url` AS `imagen_url`,`cat`.`nombre` AS `categoria` from (`tb_producto` `p` join `tb_categoria` `cat` on((`p`.`id_categoria` = `cat`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-18 15:43:43
