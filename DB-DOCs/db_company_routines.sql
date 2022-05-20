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

--
-- Dumping events for database 'db_company'
--

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
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compraAdd`(IN `_comentario` VARCHAR(150), IN `_id_user_responsable` INT, IN `_productos_concat` VARCHAR(250), IN `_cantidad_productos` INT)
BEGIN
	-- call db_company.compraAdd('Comida para todo tipo de mascotas en distintas presentaciones', 3, '6|10|1.2@7|10|1', 2);
	START TRANSACTION;
	SET AUTOCOMMIT=0;
    SET @error = 'TODO BIEN!!!';
    INSERT INTO tb_compra (comentario,fecha,id_user_responsable,active) VALUES (_comentario, NOW(), _id_user_responsable, 1);
    SET @id_compra = last_insert_id();
    
    
    SET @contadorProductos = 1;
    SET @error_gestion_productos = 0;
    WHILE (@contadorProductos <= _cantidad_productos AND @error_gestion_productos = 0) DO
    	SET @producto = SPLIT_STR(_productos_concat, '@', @contadorProductos);
        
        SET @contadorProductos = @contadorProductos + 1;
        
        SET @id_producto = SPLIT_STR(@producto, '|', 1);
        SET @cantidad_comprada = SPLIT_STR(@producto, '|', 2);
        SET @precio_comprado = SPLIT_STR(@producto, '|', 3);
        
        SET @existe_producto := IF( EXISTS(
             SELECT *
             FROM tb_producto tp
             WHERE tp.id = @id_producto), 1, 0);
        IF @existe_producto = 1 THEN
        	INSERT INTO tb_compra_producto (id_compra, id_producto, cantidad_comprada, cantidad_restante, precio_comprado, precio_actual,   active)
            VALUES (@id_compra, @id_producto, @cantidad_comprada, @cantidad_comprada, @precio_comprado, @precio_comprado, 1);
            
            SET @cantidad_producto := (SELECT cantidad FROM tb_producto where id = @id_producto);
            
            SET @cantidad_producto = @cantidad_producto + @cantidad_comprada;
            
            UPDATE tb_producto SET cantidad = @cantidad_producto, precio = @precio_comprado, active = 1 WHERE id = @id_producto;
        ELSE
            SET @error_gestion_productos = 1;
        	SET @error = 'NO EXISTE EL PRODUCTO';
        	ROLLBACK;
        END IF;
    END WHILE;
    COMMIT;
    SELECT @id_compra AS id, @error as error;
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
CREATE DEFINER=`qwert`@`%` PROCEDURE `productoAddOrEdit`(IN `_id` INT, IN `_nombre` VARCHAR(20), IN `_comentario` VARCHAR(200), IN `_barcode` VARCHAR(50), IN `_imagen_url` TEXT, IN `_id_categoria` INT, IN `_active` INT)
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26 10:52:20
