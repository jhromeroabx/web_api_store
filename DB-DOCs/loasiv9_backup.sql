CREATE DATABASE  IF NOT EXISTS `db_company` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
/*!50503 SET character_set_client = utf8 */;
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
-- Table structure for table `tb_categoria`
--

DROP TABLE IF EXISTS `tb_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `tb_employee`
--

DROP TABLE IF EXISTS `tb_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `id_employee_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_employee` (`id_employee_type`),
  CONSTRAINT `fk_type_employee` FOREIGN KEY (`id_employee_type`) REFERENCES `tb_employee_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_employee_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Table structure for table `tb_ingreso`
--

DROP TABLE IF EXISTS `tb_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_ingreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ingreso`
--

LOCK TABLES `tb_ingreso` WRITE;
/*!40000 ALTER TABLE `tb_ingreso` DISABLE KEYS */;
INSERT INTO `tb_ingreso` VALUES (1,'COMPRA GASEOSA Y CHISTRIS','2022-05-29 17:47:48',3,1),(2,'COMPRA GASEOSA Y CHISTRIS','2022-05-29 17:47:50',3,1),(3,'COMPRA GASEOSA Y CHISTRIS','2022-05-29 17:47:51',3,1),(4,'COMPRA GASEOSA Y CHISTRIS','2022-05-29 17:47:52',3,1),(6,'COMPRA GASEOSA Y CHISTRIS','2022-06-12 23:27:26',3,1),(7,'COMPRA GASEOSA Y CHISTRIS','2022-06-19 22:24:10',1,1),(8,'COMPRA GASEOSA Y CHISTRIS','2022-06-19 22:24:23',1,1),(9,'COMPRA GASEOSA Y CHISTRIS','2022-06-19 22:24:36',1,1),(10,'COMPRA GASEOSA Y CHISTRIS','2022-06-20 21:33:34',1,1);
/*!40000 ALTER TABLE `tb_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ingreso_producto`
--

DROP TABLE IF EXISTS `tb_ingreso_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_ingreso_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_ingreso` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_comprada` int NOT NULL,
  `cantidad_restante` int NOT NULL,
  `precio_comprado` double NOT NULL,
  `precio_actual` double NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_compra` (`id_ingreso`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tb_ingreso_producto_ibfk_1` FOREIGN KEY (`id_ingreso`) REFERENCES `tb_ingreso` (`id`),
  CONSTRAINT `tb_ingreso_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ingreso_producto`
--

LOCK TABLES `tb_ingreso_producto` WRITE;
/*!40000 ALTER TABLE `tb_ingreso_producto` DISABLE KEYS */;
INSERT INTO `tb_ingreso_producto` VALUES (1,1,3,40,0,1,1,0),(2,1,4,40,0,1,1,0),(3,2,3,40,0,1,1,0),(4,2,4,40,0,1,1,0),(5,3,3,40,0,1,1,0),(6,3,4,40,0,1,1,0),(7,4,3,40,0,1,1,0),(8,4,4,40,0,1,1,0),(10,6,3,100,0,1,1,0),(11,6,4,400,274,1,1,1),(12,7,3,100,0,1,1,0),(13,7,4,400,400,1,1,1),(14,8,3,3,0,1,1,0),(15,8,4,3,3,1,1,1),(16,9,3,3,0,1,1,0),(17,9,4,3,3,1,1,1),(18,10,3,3,3,7,7,1),(19,10,4,3,3,7,7,1);
/*!40000 ALTER TABLE `tb_ingreso_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_orden_compra`
--

DROP TABLE IF EXISTS `tb_orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_orden_compra` (
  `id_orden_compra` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `stock_min` int NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_orden_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_orden_compra`
--

LOCK TABLES `tb_orden_compra` WRITE;
/*!40000 ALTER TABLE `tb_orden_compra` DISABLE KEYS */;
INSERT INTO `tb_orden_compra` VALUES (1,3,'Agua Cielo',20,'2022-06-20 21:33:34'),(2,6,'Chistris',20,'2022-06-20 21:33:34'),(3,7,'Casino',20,'2022-06-20 21:33:34'),(4,9,'Picaras clasicas',20,'2022-06-20 21:33:34'),(5,10,'Ventilador portatil 123',20,'2022-06-20 21:33:34'),(6,11,'NFT',20,'2022-06-20 21:33:34'),(7,12,'Big Cola',20,'2022-06-20 21:33:34'),(8,13,'test13',50,'2022-06-20 21:33:34'),(9,14,'test',20,'2022-06-20 21:33:34'),(10,15,'test',20,'2022-06-20 21:33:34'),(11,16,'test',20,'2022-06-20 21:33:34'),(12,17,'Manzanas roja',20,'2022-06-20 21:33:34'),(13,18,'frac',20,'2022-06-20 21:33:34'),(14,19,'gretel',20,'2022-06-20 21:33:34'),(15,20,'foquito',20,'2022-06-20 21:33:34'),(16,21,'cifrut granadilla personal',20,'2022-06-20 21:33:34'),(17,22,'alcohol',20,'2022-06-20 21:33:34'),(18,23,'líquido paper standford',20,'2022-06-20 21:33:34'),(19,24,'sporade',20,'2022-06-20 21:33:34'),(20,25,'johan',20,'2022-06-20 21:33:34'),(21,26,'DNI',20,'2022-06-20 21:33:34'),(22,27,'desodorante Rexona men sport',20,'2022-06-20 21:33:34'),(23,28,'banco de energía zmi aura',20,'2022-06-20 21:33:34'),(24,29,'palillos chinos para restaurante',20,'2022-06-20 21:33:34');
/*!40000 ALTER TABLE `tb_orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_producto`
--

DROP TABLE IF EXISTS `tb_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  `barcode` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_min` int NOT NULL DEFAULT '20',
  `imagen_url` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `id_categoria` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tb_producto_ibfk_1` (`id_categoria`),
  CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_producto`
--

LOCK TABLES `tb_producto` WRITE;
/*!40000 ALTER TABLE `tb_producto` DISABLE KEYS */;
INSERT INTO `tb_producto` VALUES (3,'Agua Cielo','Agua Cielo de 500 ml',3,7,'7750670244954',20,'https://www.ajegroup.com/en/wp-content/uploads/sites/3/2020/05/colombia-cielo.jpg',2,1),(4,'Rellenitas','Rellenitas de 6 galletas',683,7,'234',20,'https://pbs.twimg.com/media/FFuZ7zpXMAkAf0Y.jpg',7,1),(6,'Chistris','Snack de queso Chistris',0,0,'7758574003219',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMW_jP4ozCdC1c9BiiDBj--fdPaA8JR3zBFQ&usqp=CAU',7,0),(7,'Casino','Galleta con relleno de menta',0,0,'789',20,'https://scontent.flim33-1.fna.fbcdn.net/v/t1.6435-9/71323181_530995607711671_7328968735476154368_n.jpg?_nc_cat=111&ccb=1-5&_nc_sid=9267fe&_nc_ohc=qQn6_MJCcKEAX8c-ct7&_nc_ht=scontent.flim33-1.fna&oh=00_AT8JpFExVmXEMIrZhamoPuNf1204ztcpX4WVscAsz-Vyvw&oe=628D6ECD',7,0),(9,'Picaras clasicas','Galleta picaras sabor clasica',0,0,'111',20,'https://marketpedidoslima.pe/images/slideshow/picaras-xl.png',7,0),(10,'Ventilador portatil 123','Ventiladores pequeños portatil conbateria de litio incluida',0,0,'123456',20,'https://falabella.scene7.com/is/image/FalabellaPE/17703192_1?wid=800&hei=800&qlt=70',10,0),(11,'NFT','gaaaa',0,0,'',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcWpwqTsUeIYI4HqWmoWP2tn0o5x7eHkkU9w&usqp=CAU',1,0),(12,'Big Cola','Gaseosa BigCola',0,0,'7751731004722',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGIZG49jAb8ACamLz6DG-slyH770VskE2sqg&usqp=CAU',2,0),(13,'test13','test 11113',0,0,'',50,'',2,1),(14,'test','test 111',0,0,'',20,'',1,0),(15,'test','test 111',0,0,'',20,'',10,0),(16,'test','test 111',0,0,'',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxTQ_y_tbsdmqUMmZK2zyqPzvvd2LRV0HfVw&usqp=CAU',10,0),(17,'Manzanas roja','manzanas orgánicas jugosas',0,0,'',20,'http://pngimg.com/uploads/apple/apple_PNG12405.png',7,0),(18,'frac','galleta de chocolate',0,0,'7750885012881',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5ARMRFuIStzBcFLWVee36ABt33WPx6mxYRA&usqp=CAU',7,0),(19,'gretel','galleta gretel de chocolate',0,0,'7750885011907',20,'https://www.pidemeperu.com/files/productos/galleta-gretel-chocolate.jpg',7,0),(20,'foquito','foco de carrito o refrigerador',0,0,'7751279245021',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqdtTIesLRkJUfYJgjB-ISL6JdNJhaK8oCKQ&usqp=CAU',10,0),(21,'cifrut granadilla personal','bebida de granadilla',0,0,'7750670014632',20,'https://dojiw2m9tvv09.cloudfront.net/53648/product/sintitulo0357.jpg',2,0),(22,'alcohol','alcohol de 1 litro',0,0,'7750075055810',20,'https://vivanda.vtexassets.com/arquivos/ids/230956/20198336.jpg?v=637422289081000000',5,0),(23,'líquido paper standford','lápiz corrector stanford',0,0,'7750822007697',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCVofq04NSVvB6Rg83Nd_Cl9Wuwmc8pgossQ&usqp=CAU',9,0),(24,'sporade','botella personal de sporade',0,0,'7750670010238',20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrfk7fWLD_bzrcOJgxS3UNYHhR1LoPhTrMrw&usqp=CAU',2,0),(25,'johan','johan',0,0,'74906411',20,'',4,0),(26,'DNI','DNI de papa',0,0,'10532635',20,'',10,0),(27,'desodorante Rexona men sport','desodorante aerosol',0,0,'7791293041629',20,'https://www.urumercado.com/wp-content/uploads/2021/08/7791293041629.png',5,0),(28,'banco de energía zmi aura','banco de energía de 20mAh',0,0,'6934263401073',20,'https://m.media-amazon.com/images/I/61omytS3m8L._AC_SL1500_.jpg',10,0),(29,'palillos chinos para restaurante','caja de 100 palillos chinos',0,0,'6936805409066',20,'https://mh-1-banco-de-imagen.panthermedia.net/media/media_detail/0001000000/01636000/~mondadientes_01636319_detail.jpg',9,0);
/*!40000 ALTER TABLE `tb_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profile`
--

DROP TABLE IF EXISTS `tb_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contrasenia` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `last_connection` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profile_user` (`id_user`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profile`
--

LOCK TABLES `tb_profile` WRITE;
/*!40000 ALTER TABLE `tb_profile` DISABLE KEYS */;
INSERT INTO `tb_profile` VALUES (1,1,'jhromero.abx@gmail.com','123','2022-06-05 17:08:23'),(2,2,'dromero.abx@gmail.com','123','2022-03-27 17:00:00'),(3,4,'wasd@gmail.com','123','2022-05-14 22:06:21'),(7,8,'pepit1.abx@gmail.com','12345','2022-04-12 22:18:55'),(8,9,'pepitooo.abx@gmail.com','12345','2022-04-12 22:19:24'),(9,10,'Flutter.abx@gmail.com','12345','2022-04-12 23:34:10'),(10,11,'vimaloa@gmail.com','123','2022-04-15 04:37:36'),(11,12,'celu.loasi@gmail.com','123','2022-04-13 00:15:20'),(12,13,'dloa@papu','1234','2022-04-13 00:35:24'),(13,14,'mouse.loasi@gmail.com','123','2022-04-14 22:32:28'),(14,16,'123','123','2022-06-19 00:15:50'),(15,17,'ffffff','123','2022-04-14 23:37:02'),(16,18,'jgarcia.abx@gmail.com','123','2022-05-13 19:14:40'),(17,19,'new123','new123','2022-06-19 00:22:56'),(18,2,'newemail.com','123','2022-06-19 00:51:20');
/*!40000 ALTER TABLE `tb_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_retiro`
--

DROP TABLE IF EXISTS `tb_retiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_retiro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_retiro`
--

LOCK TABLES `tb_retiro` WRITE;
/*!40000 ALTER TABLE `tb_retiro` DISABLE KEYS */;
INSERT INTO `tb_retiro` VALUES (1,'TEST RETIRO','2022-05-29 17:49:00',3,1),(2,'RETIRO GASEOSA','2022-05-29 18:26:24',3,1),(3,'RETIRO GASEOSA','2022-05-29 18:28:23',3,1),(4,'RETIRO GASEOSA','2022-05-29 18:33:52',3,1),(5,'RETIRO GASEOSA','2022-05-29 18:35:48',3,1),(6,'RETIRO GASEOSA','2022-05-29 18:36:20',3,1),(7,'RETIRO GASEOSA','2022-05-29 18:36:40',3,1),(8,'RETIRO GASEOSA','2022-05-29 18:36:43',3,1),(9,'RETIRO GASEOSA','2022-05-29 23:48:30',3,1),(10,'RETIRO GASEOSA','2022-05-30 23:59:42',3,1),(11,'RETIRO GASEOSA','2022-05-31 00:01:00',3,1),(12,'RETIRO GASEOSA','2022-05-31 00:08:46',3,1),(13,'RETIRO GASEOSA','2022-05-31 00:09:16',3,1),(14,'RETIRO GASEOSA','2022-05-31 00:19:05',3,1),(15,'RETIRO GASEOSA','2022-05-31 00:20:04',3,1),(16,'RETIRO GASEOSA','2022-05-31 00:20:34',3,1),(17,'RETIRO GASEOSA','2022-05-31 00:21:27',3,1),(18,'RETIRO GASEOSA','2022-06-04 22:57:18',3,1),(19,'RETIRO GASEOSA','2022-06-04 23:10:04',3,1),(20,'RETIRO GASEOSA','2022-06-04 23:11:29',3,1),(21,'RETIRO GASEOSA','2022-06-12 22:47:31',3,1),(22,'RETIRO GASEOSA','2022-06-12 22:48:19',3,1),(23,'RETIRO GASEOSA','2022-06-12 22:49:55',3,1),(24,'RETIRO GASEOSA','2022-06-12 22:51:06',3,1),(25,'RETIRO GASEOSA','2022-06-12 22:56:05',3,1),(26,'RETIRO GASEOSA','2022-06-12 22:58:23',3,1),(27,'RETIRO GASEOSA','2022-06-12 23:10:51',3,1),(28,'RETIRO GASEOSA','2022-06-12 23:22:41',3,1),(29,'RETIRO GASEOSA','2022-06-12 23:24:22',3,1),(30,'RETIRO GASEOSA','2022-06-12 23:25:12',3,1),(32,'RETIRO GASEOSA','2022-06-12 23:27:36',3,1),(33,'RETIRO GASEOSA','2022-06-12 23:28:50',3,1),(34,'RETIRO GASEOSA','2022-06-12 23:31:15',3,1),(35,'RETIRO GASEOSA','2022-06-12 23:31:42',3,1),(36,'RETIRO GASEOSA','2022-06-12 23:32:35',3,1),(37,'RETIRO GASEOSA','2022-06-12 23:33:31',3,1),(38,'RETIRO GASEOSA','2022-06-12 23:36:13',3,1),(39,'RETIRO GASEOSA','2022-06-12 23:36:32',3,1),(40,'RETIRO GASEOSA','2022-06-12 23:37:51',3,1),(41,'RETIRO GASEOSA','2022-06-19 22:48:12',1,1),(42,'RETIRO GASEOSA','2022-06-19 22:50:31',1,1),(43,'RETIRO GASEOSA','2022-06-19 22:54:05',1,1),(44,'RETIRO GASEOSA','2022-06-19 22:54:26',1,1),(45,'RETIRO GASEOSA','2022-06-19 22:56:48',1,1),(46,'RETIRO GASEOSA','2022-06-19 22:57:41',1,1);
/*!40000 ALTER TABLE `tb_retiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_retiro_producto`
--

DROP TABLE IF EXISTS `tb_retiro_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_retiro_producto`
--

LOCK TABLES `tb_retiro_producto` WRITE;
/*!40000 ALTER TABLE `tb_retiro_producto` DISABLE KEYS */;
INSERT INTO `tb_retiro_producto` VALUES (1,1,3,10,1,1),(2,1,4,10,1,1),(3,2,4,10,1,1),(4,2,3,10,1,1),(5,3,4,10,1,1),(6,3,3,10,1,1),(7,4,4,10,1,1),(8,4,3,10,1,1),(9,5,4,10,1,1),(10,5,3,10,1,1),(11,6,4,10,1,1),(12,6,3,10,1,1),(13,7,4,10,1,1),(14,7,3,10,1,1),(15,8,4,10,1,1),(16,8,3,10,1,1),(17,9,4,10,1,1),(18,9,3,10,1,1),(19,10,4,10,1,1),(20,10,3,10,1,1),(21,11,4,15,1,1),(22,11,3,15,1,1),(23,12,4,15,1,1),(24,12,3,15,1,1),(25,13,4,5,1,1),(26,13,3,5,1,1),(27,14,4,5,1,1),(28,14,3,5,1,1),(29,15,4,5,1,1),(30,15,3,5,1,1),(31,16,4,1,1,1),(32,16,3,1,1,1),(33,17,4,1,1,1),(34,17,3,1,1,1),(35,18,4,1,1,1),(36,18,3,1,1,1),(37,19,4,1,1,1),(38,19,3,1,1,1),(39,20,4,1,1,1),(40,20,3,1,1,1),(41,21,4,1,1,1),(42,21,3,1,1,1),(43,22,4,1,1,1),(44,22,3,1,1,1),(45,23,4,1,1,1),(46,23,3,1,1,1),(47,24,4,1,1,1),(48,24,3,1,1,1),(49,25,4,1,1,1),(50,25,3,1,1,1),(51,26,4,1,1,1),(52,26,3,1,1,1),(53,27,4,1,1,1),(54,27,3,1,1,1),(55,28,4,1,1,1),(56,28,3,1,1,1),(57,29,4,1,1,1),(58,29,3,1,1,1),(59,30,4,1,1,1),(60,30,3,1,1,1),(61,32,4,1,1,1),(62,32,3,1,1,1),(63,33,4,1,1,1),(64,33,3,1,1,1),(65,34,4,1,1,1),(66,34,3,1,1,1),(67,35,4,1,1,1),(68,35,3,1,1,1),(69,36,4,1,1,1),(70,36,3,1,1,1),(71,37,4,1,1,1),(72,37,3,1,1,1),(73,38,4,1,1,1),(74,38,3,1,1,1),(75,39,4,1,1,1),(76,39,3,1,1,1),(77,40,4,1,1,1),(78,40,3,1,1,1),(79,41,4,7,1,1),(80,41,3,7,1,1),(81,42,4,10,1,1),(82,42,3,10,1,1),(83,43,4,80,1,1),(84,43,3,80,1,1),(85,44,4,-80,1,1),(86,44,3,80,1,1),(87,45,4,80,1,1),(88,46,4,20,1,1),(89,46,3,20,1,1);
/*!40000 ALTER TABLE `tb_retiro_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_unidad_medida`
--

DROP TABLE IF EXISTS `tb_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_unidad_medida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `dni` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_user_type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_user` (`id_user_type`),
  CONSTRAINT `fk_type_user` FOREIGN KEY (`id_user_type`) REFERENCES `tb_user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'Jhosep Adbel','Romero Loa','74810248','928769204','jhosepromero14@gmail.com','2001-01-26',1,3),(2,'test','test','12345612','928769123','newemail.com','2001-01-26',1,5);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_type`
--

DROP TABLE IF EXISTS `tb_user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_type`
--

LOCK TABLES `tb_user_type` WRITE;
/*!40000 ALTER TABLE `tb_user_type` DISABLE KEYS */;
INSERT INTO `tb_user_type` VALUES (1,'Administrador del Sistema','administrador del sistema en general todas las funciones del developer y mas!!!.',1),(2,'Developer senior','desarrollador del sistema y analista de nuevas funciones, ver los logs de errores internos SQLite y externos 500 internal server.',1),(3,'Administrador Negocio','Es el supervisor del Negocio, tiene acceso a la gestión de usuarios y productos, ver movimientos de ingreso y egreso, registrar ingreso y egreso.',1),(4,'Almacenero','Encargado de registrar los producto que ingresan y salen de almacen.',1),(5,'Vendedor','Es el encargado de ventas.',1);
/*!40000 ALTER TABLE `tb_user_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_company'
--

--
-- Dumping routines for database 'db_company'
--
/*!50003 DROP FUNCTION IF EXISTS `contadorTrama` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `contadorTrama`(`_concat` VARCHAR(5000), `_delim` CHAR) RETURNS int
BEGIN

	RETURN LENGTH(_concat) - LENGTH(REPLACE(_concat, _delim, '')) + 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `SPLIT_STR` */;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` FUNCTION `SPLIT_STR`(`x` VARCHAR(500), `delim` VARCHAR(2), `pos` INT) RETURNS varchar(500) CHARSET utf8
BEGIN

-- EJECUTAMOS ANTES YA QUE LAS FUNCION NECESITA DESACTIVAR SEGURIDAD

-- SET GLOBAL log_bin_trust_function_creators = 1;



RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),

       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),

       delim, '');

       

-- ANTES DE EJECUTAR CREAMOS DELIMITADORES

-- DELIMITER //

-- CREATE FUCNTION holaMundo() RETURNS VARCHAR(20)

-- BEGIN

--     RETURN ‘HolaMundo’;

-- END

-- //

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `categoriaAddOrEdit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(30), IN `_comentario` VARCHAR(150), IN `_active` BOOLEAN, IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

	

	SELECT @state state, @response response; -- ENVIAMOS RPTA

	IF @state = 1 THEN

    	SET @state = 1;

		SET @message = 'Registro exitoso!';

		IF _id = 0 THEN

			INSERT INTO tb_categoria (nombre, comentario, active)

			VALUES (_nombre, _comentario, 1);

			SET _id = last_insert_id();

		ELSE

			SET @existe_categoria = IF( 

			EXISTS(SELECT * FROM tb_categoria cat WHERE cat.id = _id)

			,1,0);

			IF @existe_categoria = 1 THEN

				UPDATE tb_categoria 

				SET nombre = _nombre,

				comentario = _comentario,

				active = _active 

				WHERE id = _id;

			ELSE

				SET @message = 'No existe la categoria!';

                SET @state = 0;

			END IF;

		END IF;

		SELECT _id id,@state state,@message message;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `DeleteCategoria`(IN `_id` INT, IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3|1|2', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		DELETE FROM tb_categoria WHERE id = _id;

        -- CREAR GESTION ESTADOS

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `descontarStockProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `descontarStockProducto`(IN `_id_producto` INT, IN `_cantidad_retirar` INT)
BEGIN

	SET @cantidad_bucle = _cantidad_retirar;-- iniciamos bucle

    -- 

    WHILE (@cantidad_bucle != 0) DO		

        -- id de ingreso, HACERLO FUNCION

        SET @id_ingreso = (

			SELECT TIP.id FROM tb_ingreso_producto TIP

            INNER JOIN tb_ingreso TI ON TIP.id_ingreso = TI.id

            INNER JOIN tb_producto TP ON TIP.id_producto = TP.id

            WHERE TP.id = _id_producto AND TIP.active = 1

            ORDER BY TI.fecha ASC

            LIMIT 1);

        -- cantidad restante compra mas antigua disponible, HACERLO FUNCION

        SET @cantidad_rest_compra = (

			SELECT TIP.cantidad_restante FROM tb_ingreso_producto TIP 

            INNER JOIN tb_ingreso TI ON TIP.id_ingreso = TI.id 

            INNER JOIN tb_producto TP ON TIP.id_producto = TP.id 

            WHERE TP.id = _id_producto AND TIP.active = 1 

            ORDER BY TI.fecha ASC LIMIT 1);

		

        -- calculamos el resto

		-- SI ES POSITIVO, sobrara la compra & termina bucle

        -- SI ES 0, consumimos toda la compra desactivandola & termina bucle

        -- SI ES NEGATIVO, faltara mas compra, consumimos toda la compra desactivandola & bucle continua, tdv registramos retiro-producto

        SET @resto = @cantidad_rest_compra - @cantidad_bucle;        

        -- retiro sobrante, la compra sigue disponible con menos stock, cortamos el bucle

        IF @resto > 0 THEN			

            -- SET @prueba = CONCAT(@prueba,CONCAT('PROCESO DESCONTAR: ', @resto , ' sobrante', 'BCL:',@cantidad_bucle),'|');

			SET @cantidad_bucle = 0; -- cortamos el bucle

			-- FALTA SETEAR PRECIO, hacerlo funcion

            SET @precio_retiro = (

				SELECT TP.precio FROM tb_producto TP

                WHERE TP.id = _id_producto);

            -- insertamos el retiro producto por que no habra mas que iterar en el bucle

            INSERT INTO tb_retiro_producto (id_retiro,id_producto,cantidad,precio,active) 

            VALUES (@id_retiro, _id_producto, _cantidad_retirar, @precio_retiro, 1);

			-- actualizamos la compra restando retiro

            UPDATE tb_ingreso_producto

            SET cantidad_restante = @resto

            WHERE id = @id_ingreso;

			-- obtenemos el precio del producto global, lo necesitamos para actualizar

            SET @cantidad_producto_global = (SELECT TP.cantidad FROM tb_producto TP WHERE TP.id = _id_producto);

            -- actualizamos el producto restando el retiro

            UPDATE tb_producto

            SET cantidad = (@cantidad_producto_global - _cantidad_retirar)

            WHERE id = _id_producto;

        END IF;

        -- retiro exacto de la compra actual, cortamos el bucle

        IF @resto = 0 THEN

			-- SET @prueba = CONCAT(@prueba,CONCAT('PROCESO DESCONTAR: ', @resto , ' exacto', 'BCL:',@cantidad_bucle),'|');

			SET @cantidad_bucle = 0; -- cortamos el bucle

			-- FALTA SETEAR PRECIO, hacerlo funcion

            SET @precio_retiro = (

				SELECT TP.precio FROM tb_producto TP

                WHERE TP.id = _id_producto);

            -- insertamos el retiro producto por que no habra mas que iterar en el bucle

            INSERT INTO tb_retiro_producto (id_retiro,id_producto,cantidad,precio,active) 

            VALUES (@id_retiro, _id_producto, _cantidad_retirar, @precio_retiro , 1);

			-- actualizamos la compra restando todo y desactivamos

            UPDATE tb_ingreso_producto

            SET cantidad_restante = @resto,

            active = 0

            WHERE id = @id_ingreso;

			-- obtenemos el precio del producto global, lo necesitamos para actualizar

            SET @cantidad_producto_global = (SELECT TP.cantidad FROM tb_producto TP WHERE TP.id = _id_producto);

            -- actualizamos el producto restando el retiro

            UPDATE tb_producto

            SET cantidad = (@cantidad_producto_global - _cantidad_retirar)

            WHERE id = _id_producto;

        END IF;        

        -- retiro faltante, necesita mas compra

        IF @resto < 0 THEN

			-- SET @prueba = CONCAT(@prueba,CONCAT('PROCESO DESCONTAR: ', @resto , ' falta:', 'BCL:',@cantidad_bucle),'|');

			SET @cantidad_bucle = @cantidad_bucle - @cantidad_rest_compra; -- mantenemos al bucle restando la cant rest compra, para avanzar con otra compra.

			-- actualizamos la compra restando todo y desactivamos POR QUE NECESITAMOS MAS COMPRAS

			UPDATE tb_ingreso_producto

            SET cantidad_restante = 0,

            active = 0

            WHERE id = @id_ingreso;

        END IF;

    END WHILE;    

    -- SET resto = @prueba;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `disableOrActivateProductById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `disableOrActivateProductById`(IN `_id_producto` INT, IN `_id_user` INT, IN `_factor` INT)
BEGIN

	-- CALL disableProductById(10, 1);

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		UPDATE tb_producto SET

        active = _factor

        WHERE id = _id_producto;

    END IF;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `employeeAddOrEdit`(IN `_id` INT, IN `_name` VARCHAR(50), IN `_salary` DECIMAL, IN `_id_employee_type` INT, IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state, @response;-- ENVIAMOS RPTA

	IF @state = 1 THEN		

		IF _id = 0 THEN

			INSERT INTO tb_employee (name, salary, id_employee_type)

			VALUES (_name,_salary, _id_employee_type);

			SET _id = last_insert_id();

		ELSE

			SET @exite = IF( 

				EXISTS(SELECT * FROM tb_employee te

				WHERE te.id = _id)

				,1,0);

			IF @exite = 1 THEN

				UPDATE tb_employee SET

				name = _name,

				salary = _salary,

				id_employee_type = _id_employee_type

				WHERE id = _id;

				SET @message = 'Registro exitoso!';

			ELSE

				SET @message = 'No existe el usuario!';

			END IF;

		END IF;

		SELECT _id id, @message;

	END IF;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `findProductBy`(IN `_id` INT, IN `_barcode` VARCHAR(50), IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state state, @response response;-- ENVIAMOS RPTA

	IF @state = 1 THEN -- SI ES ADMIN NO TIENE LIMITES

		IF _id = 0 THEN

			SELECT * FROM tb_producto pro WHERE

			pro.barcode = _barcode;

		ELSEIF _barcode = 0 THEN

			SELECT * FROM tb_producto pro WHERE

			pro.id = _id;

		END IF;

	ELSE -- SI ES OTRO ROL, SOLO SE MUESTRA ACTIVOS

		IF _id = 0 THEN

			SELECT * FROM tb_producto pro WHERE 

			pro.active = 1 AND

			pro.barcode = _barcode;

		ELSEIF _barcode = 0 THEN

			SELECT * FROM tb_producto pro WHERE 

			pro.active = 1 AND 

			pro.id = _id;

		END IF;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `generarOrdenCompra` */;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `generarOrdenCompra`(IN `_exportable` BOOLEAN, OUT `procesado` VARCHAR(5000))
BEGIN

    SET @orden_compra_message = 'PROCESADO';

    

    TRUNCATE TABLE tb_orden_compra;

    -- DELETE FROM tb_orden_compra;

    

    SET @cantidad = (SELECT COUNT(*) FROM tb_producto TP WHERE TP.cantidad < TP.stock_min);

    

    IF @cantidad > 0 THEN

    

        INSERT INTO tb_orden_compra (`id_producto`, `nombre`, `stock_min`, `fecha`)

        SELECT TP.id, TP.nombre, TP.stock_min, NOW() FROM tb_producto TP WHERE TP.cantidad < TP.stock_min;

        

        IF _exportable = 1 THEN

            -- SELECT GROUP_CONCAT( CONCAT_WS('|',id,nombre,stock_min,fecha) SEPARATOR '@') as ORDEN_COMPRA FROM tb_orden_compra;

            SET @orden_compra_message = (SELECT GROUP_CONCAT( CONCAT_WS('|',id_producto,nombre,stock_min,fecha) SEPARATOR '@') FROM tb_orden_compra);

           

           SET procesado = @orden_compra_message;

           -- SELECT @orden_compra_message AS procesado;

        END IF;        

    END IF;    

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllCategory`(IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3|1|2', @state, @response);-- SI ES 1 TIENE ACCESO	

    

    IF @state = 1 THEN

		SELECT @state state, @response response;

    	SELECT * FROM tb_ingreso;

    ELSE

    	CALL validarRolDelUsuario(_id_user, '4|5', @state, @response);-- SI ES 1 TIENE ACCESO

        IF @state = 1 THEN

        	SELECT @state state, @response response;

    		SELECT * FROM tb_ingreso tc WHERE tc.active = 1; -- solo los activos

        END IF;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllIngresos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `getAllIngresos`(IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		SELECT * FROM tb_ingreso tc WHERE tc.active = 1;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllIngresosDetailById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllIngresosDetailById`(IN `_id_ingreso` INT, IN `_id_user` INT)
BEGIN

	-- CALL getAllIngresosDetailById(10, 1);

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		SELECT TIP.*,TP.nombre,TI.active ingresoState FROM tb_ingreso_producto TIP 

        INNER JOIN tb_ingreso TI ON TI.id = TIP.id_ingreso 

        INNER JOIN tb_producto TP ON TIP.id_producto = TP.id 

        WHERE TIP.id_ingreso = _id_ingreso;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllRetiros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllRetiros`(IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		SELECT * FROM tb_retiro TR WHERE TR.active = 1;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllRetirosDetailById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllRetirosDetailById`(IN `_id_retiro` INT, IN `_id_user` INT)
BEGIN

	-- CALL getAllRetirosDetailById(10, 1);

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

    

	SELECT @state state, @response response;

    IF @state = 1 THEN

		SELECT TRP.*,TP.nombre,TR.comentario FROM tb_retiro TR 

        INNER JOIN tb_retiro_producto TRP ON TR.id = TRP.id_retiro 

        INNER JOIN tb_producto TP ON TRP.id_producto = TP.id 

        WHERE TRP.id_retiro = _id_retiro;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllUser`(IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3|1|2', @state, @response);-- SI ES 1 TIENE ACCESO	

    

    IF @state = 1 THEN

		SELECT @state state, @response response;

    	SELECT * FROM tb_user tu;

    ELSE

    	CALL validarRolDelUsuario(_id_user, '4|5', @state, @response);-- SI ES 1 TIENE ACCESO

        IF @state = 1 THEN

        	SELECT @state state, @response response;

    		SELECT * FROM tb_user tu WHERE tu.estado = 1; -- solo los activos

        END IF;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUserType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getAllUserType`(IN `_id_user` INT)
BEGIN

 	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

    CALL validarRolDelUsuario(_id_user, '3|1|2', @state, @response);-- SI ES 1 TIENE ACCESO	

    

    IF @state = 1 THEN

		SELECT @state state, @response response;

    	SELECT * FROM tb_user_type tuy;

    ELSE

    	CALL validarRolDelUsuario(_id_user, '4|5', @state, @response);-- SI ES 1 TIENE ACCESO

        IF @state = 1 THEN

        	SELECT @state state, @response response;

    		SELECT * FROM tb_user_type tuy WHERE tuy.estado = 1; -- solo los activos

        END IF;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingresoAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresoAdd`(IN `_comentario` VARCHAR(150), IN `_id_user_responsable` INT, IN `_productos_concat` VARCHAR(250))
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user_responsable, '3|4', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state state, @response response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

-- call db_company.ingresoAdd('Comida para todo tipo de mascotas en distintas presentaciones', 3, '6|10|1.2@7|10|1', 2);

		START TRANSACTION;

		SET AUTOCOMMIT=0;

		

		SET @message = 'Compra exitosa!';

		

		INSERT INTO tb_ingreso (comentario,fecha,id_user_responsable,active)

		VALUES (_comentario, NOW(), _id_user_responsable, 1);

		SET @id_ingreso = last_insert_id();

		

		SET @contadorProductos = 1;

		SET @cantidad_productos = contadorTrama(_productos_concat, '@');

		SET @state = 1;

	

		WHILE (@contadorProductos <= @cantidad_productos AND @state = 1) DO

			SET @producto = SPLIT_STR(_productos_concat, '@', @contadorProductos);

			SET @contadorProductos = @contadorProductos + 1;

	

			SET @id_producto = SPLIT_STR(@producto, '|', 1);

			SET @cantidad_comprada = SPLIT_STR(@producto, '|', 2);

			SET @precio_comprado = SPLIT_STR(@producto, '|', 3);

			

			SET @existe_producto = IF( 

				EXISTS(SELECT *

				FROM tb_producto tp

				WHERE tp.id = @id_producto),

				1, 0);

			IF @existe_producto = 1 THEN

				INSERT INTO tb_ingreso_producto (id_ingreso, id_producto, cantidad_comprada,

				cantidad_restante, precio_comprado, precio_actual, active)

				VALUES (@id_ingreso, @id_producto, @cantidad_comprada, @cantidad_comprada, 

				@precio_comprado, @precio_comprado, 1);

				

				SET @cantidad_producto = (SELECT cantidad FROM tb_producto where id = @id_producto);

	

				SET @cantidad_producto = @cantidad_producto + @cantidad_comprada;

	

				UPDATE tb_producto

				SET cantidad = @cantidad_producto,

				precio = @precio_comprado,

				active = 1

				WHERE id = @id_producto;

				

				CALL generarOrdenCompra(0,@procesado);

			ELSE

				SET @state = 0;

				SET @message = CONCAT('No existe el producto', ': ' , @id_producto);

				ROLLBACK;

			END IF;

		END WHILE;

		COMMIT;

		SELECT @state state, @message message;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `productoAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(50), IN `_comentario` VARCHAR(200), IN `_barcode` VARCHAR(50), IN `_stock_min` INT, IN `_imagen_url` TEXT, IN `_id_categoria` INT, IN `_active` INT, IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state state, @response response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

		SET @message = 'Registro exitoso!';

		SET @state = true;

		SET @existe_categoria = IF(

			EXISTS(SELECT * FROM tb_categoria cat 

			WHERE cat.id = _id_categoria 

			AND cat.active = 1),

			1,0);

		IF @existe_categoria = 1 THEN

			IF _id = 0 THEN

				INSERT INTO tb_producto (nombre, comentario, cantidad, precio, barcode, 

				stock_min, imagen_url,id_categoria, active) VALUES 

				(_nombre, _comentario, 0, 0,_barcode,_stock_min,_imagen_url, _id_categoria, 0);

				SET _id = last_insert_id();

			ELSE

				SET @existe_producto = IF( 

					EXISTS(SELECT * FROM tb_producto prod 

					WHERE prod.id = _id),

					1,0);

				IF @existe_producto = 1 THEN

					UPDATE tb_producto 

					SET nombre = _nombre,

					comentario = _comentario,

					id_categoria = _id_categoria,

					active = _active,

					barcode = _barcode,

					stock_min = _stock_min,

					imagen_url = _imagen_url

					WHERE id = _id;

				ELSE

					SET @message = 'No existe el producto!';

					SET @state = false;

				END IF;

			END IF;

		ELSE

			SET @message = 'No existe la categoria!';

			SET @state = false;

		END IF;

		SELECT _id AS id, @message message, @state state;

	END IF;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
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

        pro.active = _active

        AND pro.id_categoria = _id_categoria;

    END IF;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `retiroAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `retiroAdd`(IN `_comentario` VARCHAR(250), IN `_id_user_responsable` INT, IN `_productos_concat` VARCHAR(250))
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user_responsable, '3|4', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state state, @response response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

		START TRANSACTION; -- iniciamos transaction para evaluar

		SET AUTOCOMMIT=0; -- desactivamos la insercciones

		-- insertamos el retiro cabecera para los retiros de productos

		INSERT INTO tb_retiro (comentario,fecha,id_user_responsable, active)

		VALUES (_comentario, NOW(), _id_user_responsable, 1);

		-- obtenemos el id autoincrementable generado

		SET @id_retiro = (select @@identity);

		-- seteamos el mensaje ya exitoso

		SET @message = 'Retiro exitoso!';

		-- ejecutamos la validacion de stock para cada producto

		SET @cantidad_productos = contadorTrama(_productos_concat,'@');

		CALL validarRetiros(_productos_concat, @cantidad_productos, @result);

		-- seteamos el estado, si es 1 todos los productos tiene stock suficiente

		SET @state = CAST(SPLIT_STR(@result, '@', 1) AS UNSIGNED);-- parseamos a int

		-- si el estado es valido

		IF @state = 1 THEN

			SET @contador = 1;

			WHILE ( @contador <= @cantidad_productos ) DO

				-- deserializamos un producto

				SET @producto = SPLIT_STR(_productos_concat, '@',@contador); -- DESERIALIZAMOS LOS PRODUCTOS

				-- deserializamos el id_producto y la cantidad a retirar

				SET @id_producto = SPLIT_STR(@producto, '|', 1);

				SET @cantidad_retirar = SPLIT_STR(@producto, '|', 2);

				--

				CALL descontarStockProducto(@id_producto, @cantidad_retirar);

				--

				SET @contador = @contador + 1;

			END WHILE;

			-- generamos la lista de productos a comprar constantemente, pero colocamos "true" para exportar la data y enviar EMAIL

			CALL generarOrdenCompra(true,@procesado);

			COMMIT;

		ELSE

			-- si sale invalido, hacemos rollback a todo y respondemos la rpta del error

			SET @message = SPLIT_STR(@result, '@', 2);

			ROLLBACK;

		END IF;

	-- enviamos rpta del proceso y estado

	SELECT @state state, @message message,@procesado procesado;

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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(200), IN `_apellido` VARCHAR(200), IN `_dni` VARCHAR(10), IN `_telefono` VARCHAR(30), IN `_email` VARCHAR(50), IN `_fecha_nacimiento` DATE, IN `_estado` TINYINT(1), IN `_id_user_type` INT, IN `_contrasenia` VARCHAR(15), IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3', @state, @response);-- SI ES 1 TIENE ACCESO

	SELECT @state state, @response response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

		SET @EXISTE_user = 0;

    	SET @EXISTE_dni = 0;

    	SET @EXISTE_email = 0;

    	SET @state = true;

    	SET @message = 'Registro exitoso!';

    	--

		IF _id = 0 THEN

			SET @EXISTE_dni = IF(

				EXISTS(SELECT * 

				FROM tb_user tu

				WHERE tu.dni = _dni),

				1, 0);

			SET @EXISTE_email = IF(

				EXISTS(SELECT *

				FROM tb_user tu

				WHERE tu.email = _email),

				1, 0);

			--

			IF @EXISTE_dni = 1 OR @EXISTE_email = 1 THEN

				SET @message = 'El Dni ya existe!';

				SET @state = false;

			ELSEIF @EXISTE_email = 1 THEN

				SET @message = 'El Correo ya existe!';

				SET @state = false;

			ELSE

				INSERT INTO tb_user (nombre, apellido, dni, telefono, email,fecha_nacimiento, estado, id_user_type)

				VALUES (_nombre, _apellido,_dni, _telefono, _email, _fecha_nacimiento, _estado, _id_user_type);

				SET _id = last_insert_id();

				--

				INSERT INTO tb_profile (id_user, `user`, contrasenia, last_connection)

				VALUES (_id, _email, _contrasenia, NOW());

			END IF;

		ELSE

			SET @EXISTE_dni = IF( 

				EXISTS(SELECT *

				FROM tb_user tu

				WHERE tu.dni = _dni AND tu.id <> _id),

				1, 0);

			SET @EXISTE_email = IF(

				EXISTS(SELECT *

				FROM tb_user tu

				WHERE tu.email = _email AND tu.id <> _id),

				1, 0);

			SET @EXISTE_user = IF( 

				EXISTS(SELECT *

				FROM tb_user tu

				WHERE tu.id = _id),

				1, 0);

			--

			IF @EXISTE_dni = 1 THEN

				SET @message = 'EL DNI YA EXISTE';

				SET @state = false;

			ELSEIF @EXISTE_email = 1 THEN

				SET @message = 'EL CORREO YA EXISTE';

				SET @state = false;

			ELSEIF @EXISTE_user = 0 THEN

				SET @message = 'EL USER NO EXISTE';

				SET @state = false;

			ELSE

				UPDATE tb_user SET 

				nombre = _nombre, 

				apellido = _apellido, 

				dni = _dni, 

				telefono = _telefono, 

				email = _email, 

				fecha_nacimiento = _fecha_nacimiento, 

				estado = _estado, 

				id_user_type = _id_user_type 

				WHERE id = _id;

				--

				UPDATE tb_profile SET 

				`user` = _email

				WHERE id_user = _id;            

			END IF;    

		END IF;

    SELECT _id id, @message message, @state state;

	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `validarRetiros` */;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `validarRetiros`(IN `_productos_concat` VARCHAR(250), IN `_cantidad_productos` INT, OUT `result` VARCHAR(250))
BEGIN

-- OBSERVACION: en los parametros colocamos el campo final como retorno para la rpta general



-- call db_company.validarRetiros('11|10@10|0', 2, @result);

-- SELECT @result;



SET @state = 1; -- INICIAMOS ESTADO TRUE

SET @error_mensaje = ''; -- SIN MENSAJE DE ERROR

SET @mensaje_general = ''; -- MENSAJE DATAGRAMA



SET @contador = 1; -- CONTADOR DE PRODUCTOS A REVISADOS

SET @contador_error = 1; -- CONTADOR DE PRODUCTOS CON STOCK INSUFICIENTE



WHILE (

    -- @state = 1 AND

    @contador <= _cantidad_productos -- SIEMPRE QUE EL CONTADOR PRODUCTOS SEA MENOR A LA CANTIDAD A RETIRAR

) DO 



SET @producto = SPLIT_STR(_productos_concat, '@',@contador); -- DESERIALIZAMOS LOS PRODUCTOS



SET @id_producto = SPLIT_STR(@producto, '|', 1);

SET @cantidad_retirar = SPLIT_STR(@producto, '|', 2);



    SET @cantidad_real = (SELECT

        SUM(TIP.cantidad_restante)

    FROM

        tb_ingreso_producto TIP

        INNER JOIN tb_ingreso TI ON TIP.id_ingreso = TI.id

        INNER JOIN tb_producto TP ON TIP.id_producto = TP.id

    WHERE

        TP.id = @id_producto

        AND TIP.active = 1

    ORDER BY

        TI.fecha ASC); -- SETTEAMOS LA CANTIDAD QUE DISPONE EL PRODUCTO



	SET @cantidad_real = IF(@cantidad_real IS NULL, 0, @cantidad_real); -- SI LA CANTIDAD ES NULLA POR QUE NO TIENE REGISTROS SE CAMBIA A 0



	-- SELECT CONCAT('valor',@cantidad_real);



    IF @cantidad_real < @cantidad_retirar THEN -- VERIFICAMOS STOCK INSUFICIENTE

        SET @state = 0; -- SETEAMOS ERROR EN VERIFICACION

        SET @nombre_producto = (SELECT nombre FROM tb_producto WHERE id = @id_producto); -- OBTENEMOS EL NOMBRE DEL PRODUCTO PARA INDICARLO EN EL ERROR

		

		SET @separador = IF(@contador_error > 1, '|', ''); -- si el contador de errores tiene mas de uno, adelante se agrega |

        

		-- SELECT CONCAT('separador',@separador);

        

        -- ACUMULAR LOS DATOS DEL PRODUCTO CON STOCK INSUFICIENTE ERROR

        SET @error_mensaje = CONCAT(@error_mensaje,CONCAT(@separador,'STOCK BAJO RETIRAR ', @cantidad_retirar ,' uds. (', @id_producto, ':', @nombre_producto, ')'));

        -- INCREMENTAMOS EL ERROR

        SET @contador_error = @contador_error + 1;

    END IF; -- TERMINA BUBLE

    SET @contador = @contador + 1; -- INCREMENTAMOS EL CONTADOR DE PRODUCTOS A VERIFICAR

END WHILE;



-- SELECT @state AS state, @error_mensaje AS response;

SET result = CONCAT(@state , '@' , @error_mensaje); -- CON EL PARAMETRO DE RETORNO, DEVOLVEMOS EL ESTADO Y LOS PRODUCTOS CON STOCK INSUFICIENTES

-- SELECT @result; -- SI SE MUESTRA FUERA DEL SP

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `db_company` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `validarRolDelUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `validarRolDelUsuario`(IN `_id_user` INT, IN `_id_user_type_concat` VARCHAR(250), OUT `state` INT, OUT `response` VARCHAR(250))
BEGIN

	-- CALL `validarRolDelUsuario`(8, '3|1', @p2, @p3); SELECT @p2 state, @p3 response;

    CREATE TEMPORARY TABLE tempTable (var INT);

	-- 

    SET @cantidad_items = contadorTrama(_id_user_type_concat,'|');

    -- 

    SET @contador = 1;

	WHILE (@contador <= @cantidad_items) DO

		INSERT INTO tempTable SELECT CAST(SPLIT_STR(_id_user_type_concat, '|', @contador) AS UNSIGNED);

        SET @contador = @contador + 1;

	END WHILE;

    -- 

    SET @ROL = (SELECT GROUP_CONCAT( TUT.nombre SEPARATOR ' ') FROM tb_user_type TUT WHERE TUT.id IN (SELECT * FROM tempTable));

    -- 

    SET @ACCESO = IF( EXISTS(

    	SELECT * FROM tb_user TU

		INNER JOIN tb_user_type TUT ON TU.id_user_type = TUT.id

    	WHERE TU.id = _id_user AND TUT.id IN (SELECT * FROM tempTable)

        ),1,0);

        

    IF @ACCESO = 0 THEN

    	SET state = @ACCESO;

        SET response = CONCAT('El usuario ', _id_user ,' no tiene permisos de: ', @ROL);

    ELSE

    	SET state = @ACCESO;

        SET response = CONCAT('El usuario ', _id_user ,' tiene acceso de: ', @ROL);

    END IF;

    

    DROP TABLE tempTable;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verIngresosPorProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `verIngresosPorProducto`(IN `_id_producto` INT, IN `_active` BOOLEAN, IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3|4', @state, @response);-- 1 TIENE ACCESO

	SELECT @state, @response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

		SELECT TI.id AS id_ingreso,

	   		TIP.id AS id_movimiento,

	   		TP.nombre AS nombre_producto,

       		TIP.cantidad_comprada,

       		TIP.cantidad_restante,

       		TIP.precio_comprado,

       		TIP.precio_actual,

       		TI.id_user_responsable,

       		TU.nombre AS nombre_usuario_responsable,

       		TI.fecha,

       		TIP.active

		FROM tb_ingreso_producto TIP

		INNER JOIN tb_ingreso TI ON TI.id = TIP.id_ingreso

		INNER JOIN tb_producto TP ON TIP.id_producto = TP.id

		INNER JOIN tb_user TU ON TI.id_user_responsable = TU.id

		WHERE TP.id = _id_producto

    	-- si _active es 5 ALL sino 0-1

    	AND TIP.active = IF(_active = 5,TIP.active, _active)

		ORDER BY TI.fecha DESC;

	END IF;

	-- SELECT NOW(); --SI ENTRA, EL ALMACENERO SOLO VER EL DIA DE HOY

	-- SELECT CURDATE();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verRetiroPorProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`qwert`@`%` PROCEDURE `verRetiroPorProducto`(IN `_id_producto` INT, IN `_active` BOOLEAN, IN `_id_user` INT)
BEGIN

	-- VALIDAMOS EL ROL DE USUARIO -- 3 ADMINISTRADOR

	CALL validarRolDelUsuario(_id_user, '3|4', @state, @response);-- 1 TIENE ACCESO

	SELECT @state, @response;-- ENVIAMOS RPTA

	IF @state = 1 THEN

		-- CALL `retiroPorProducto`(3, 5);

		-- MOSTRAR LOS MOVIMIENTOS DE RETIRO DE UN PRODUCTO

		SELECT TR.id AS id_retiro,

		TRP.id AS id_movimiento,

		TP.nombre AS nombre_producto,

		TRP.cantidad,

		TRP.precio,

		TR.id_user_responsable,

		TU.nombre AS nombre_usuario_responsable,

		TR.fecha,

		TRP.active

		FROM tb_retiro_producto TRP

		INNER JOIN tb_retiro TR ON TR.id = TRP.id_retiro

		INNER JOIN tb_producto TP ON TRP.id_producto = TP.id

		INNER JOIN tb_user TU ON TR.id_user_responsable = TU.id

		WHERE TP.id = _id_producto AND

		TRP.active = IF(_active = 5,TRP.active, _active)

		ORDER BY TR.fecha DESC;

	END IF;

	-- SELECT NOW(); --SI ENTRA, EL ALMACENERO SOLO VER EL DIA DE HOY

	-- SELECT CURDATE();

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
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
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

-- Dump completed on 2022-06-26  0:45:41
