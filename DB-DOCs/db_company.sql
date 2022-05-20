-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-04-2022 a las 16:00:51
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_company`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `categoriaAddOrEdit` (IN `_id` INT, IN `_nombre` VARCHAR(30), IN `_comentario` VARCHAR(150), IN `_active` BOOLEAN)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `compraAdd` (IN `_comentario` VARCHAR(150), IN `_id_user_responsable` INT, IN `_productos_concat` VARCHAR(250), IN `_cantidad_productos` INT)  BEGIN
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
END$$

CREATE DEFINER=`qwert`@`%` PROCEDURE `employeeAddOrEdit` (`_id` INT, `_name` VARCHAR(50), `_salary` DECIMAL, `_id_employee_type` INT)  BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login` (IN `_user` VARCHAR(30), IN `_contrasenia` VARCHAR(30))  BEGIN
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
END$$

CREATE DEFINER=`qwert`@`%` PROCEDURE `productoAddOrEdit` (`_id` INT, `_nombre` VARCHAR(20), `_comentario` VARCHAR(200), `_id_categoria` INT, `_active` INT)  BEGIN	
    SET @error = 'TODO BIEN';
    
    SET @existe_categoria = IF( EXISTS(select * from tb_categoria cat WHERE cat.id = _id_categoria AND cat.active = 1),1,0);
	IF @existe_categoria = 1 THEN    
		IF _id = 0 THEN
			INSERT INTO tb_producto (nombre, comentario, cantidad, precio, id_categoria, active) VALUES (_nombre, _comentario, 0, 0, _id_categoria, 0);
            SET _id = last_insert_id();
		ELSE
			SET @existe_producto = IF( EXISTS(select * from tb_producto prod WHERE prod.id = _id),1,0);
			IF @existe_producto = 1 THEN
				UPDATE tb_producto SET nombre = _nombre, comentario = _comentario, id_categoria = _id_categoria, active = _active WHERE id = _id;
			ELSE
				SET @error = 'NO EXISTE EL PRODUCTO';
			END IF;
        END IF;
	ELSE
		SET @error = 'NO EXISTE LA CATEGORIA';
	END IF;
    SELECT _id AS id, @error as error;
END$$

CREATE DEFINER=`qwert`@`%` PROCEDURE `SPLIT_LOOP_COUNTER_while` (`valores` VARCHAR(500), `_cant_valores` INT)  BEGIN
SET @contador = 1;

	WHILE (@contador <= _cant_valores) DO		
		INSERT INTO test (valor,counter) VALUES (SPLIT_STR(valores, '|', @contador),@contador);
        SET @contador=@contador+1;
    END WHILE;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userAddOrEdit` (IN `_id` INT, IN `_nombre` VARCHAR(200), IN `_apellido` VARCHAR(200), IN `_dni` VARCHAR(10), IN `_telefono` VARCHAR(30), IN `_email` VARCHAR(50), IN `_fecha_nacimiento` DATE, IN `_estado` TINYINT(1), IN `_id_user_type` INT, IN `_contrasenia` VARCHAR(15))  BEGIN
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
END$$

--
-- Funciones
--
CREATE DEFINER=`qwert`@`%` FUNCTION `SPLIT_STR` (`x` VARCHAR(255), `delim` VARCHAR(12), `pos` INT) RETURNS VARCHAR(255) CHARSET utf8mb4 RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(x, delim, pos),
       LENGTH(SUBSTRING_INDEX(x, delim, pos -1)) + 1),
       delim, '')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `nombre`, `comentario`, `active`) VALUES
(1, 'menestras', 'Menestras de todo tipo que se pesan en gramos', 1),
(2, 'bebidas', 'Bebidas de todo tipo que tiene diferentes presentaciones', 1),
(4, 'Lacteos', 'Son queso y leche empaquetados o en embotellados, no se vende en partes, vienen en diferentes presentaciones', 1),
(5, 'productos de aseo personal', 'Jabones, crema dental, Shampoo, entro otros para el aseo personal', 1),
(6, 'productos de limpieza', 'Son productos solo para limpiar superficies, no para uso humano', 1),
(7, 'comestibles', 'Son golosinas en general', 1),
(8, 'comestible para mascotas', 'Comida para todo tipo de mascotas en distintas presentaciones', 1),
(9, 'Herramientas', 'Herramientas para la cocina y aseo del hogar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compra`
--

CREATE TABLE `tb_compra` (
  `id` int(11) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_compra`
--

INSERT INTO `tb_compra` (`id`, `comentario`, `fecha`, `id_user_responsable`, `active`) VALUES
(1, 'Compra de agua y Rellenitas', '2022-04-09 21:10:54', 1, 1),
(2, 'Compra de agua y Rellenitas', '2022-04-09 21:22:20', 1, 1),
(4, 'Compra de galleta casino y Chistris', '2022-04-09 21:40:17', 3, 1),
(5, 'Compra de galleta casino y Chistris', '2022-04-09 21:42:56', 3, 1),
(6, 'Comida para todo tipo de mascotas en distintas presentaciones', '2022-04-10 15:58:28', 3, 1),
(7, 'Comida para todo tipo de mascotas en distintas presentaciones', '2022-04-10 16:00:37', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compra_producto`
--

CREATE TABLE `tb_compra_producto` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_comprada` int(11) NOT NULL,
  `cantidad_restante` int(11) NOT NULL,
  `precio_comprado` double NOT NULL,
  `precio_actual` double NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_compra_producto`
--

INSERT INTO `tb_compra_producto` (`id`, `id_compra`, `id_producto`, `cantidad_comprada`, `cantidad_restante`, `precio_comprado`, `precio_actual`, `active`) VALUES
(1, 1, 3, 5, 5, 1.5, 1.5, 1),
(2, 1, 4, 10, 10, 2.5, 2.5, 1),
(3, 2, 3, 10, 10, 1.5, 1.5, 1),
(4, 2, 4, 20, 20, 2.5, 2.5, 1),
(6, 4, 6, 10, 10, 1.2, 1.2, 1),
(7, 4, 7, 10, 10, 1, 1, 1),
(8, 5, 6, 10, 10, 1.2, 1.2, 1),
(9, 5, 7, 10, 10, 1, 1, 1),
(10, 6, 6, 10, 10, 1.2, 1.2, 1),
(11, 6, 7, 10, 10, 1, 1, 1),
(12, 7, 6, 10, 10, 1.2, 1.2, 1),
(13, 7, 7, 10, 10, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_employee`
--

CREATE TABLE `tb_employee` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `id_employee_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_employee`
--

INSERT INTO `tb_employee` (`id`, `name`, `salary`, `id_employee_type`) VALUES
(1, 'Ing de sistemas e Informatica', 45000, 1),
(2, 'Administrador general', 50000, 1),
(3, 'Contador y Financista', 25000, 4),
(4, 'Asistente de contabilidad y almacen', 5000, 3),
(5, 'Almacenero', 3500, 3),
(6, 'Atencion  y soporte cliente', 4500, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_employee_type`
--

CREATE TABLE `tb_employee_type` (
  `id` int(11) NOT NULL,
  `nom_type` varchar(45) NOT NULL,
  `desc` varchar(150) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_employee_type`
--

INSERT INTO `tb_employee_type` (`id`, `nom_type`, `desc`, `estado`) VALUES
(1, 'admin', 'admin', 1),
(2, 'help', 'help support', 1),
(3, 'assitant', 'assitant for queries or guides', 1),
(4, 'accounting', 'Contabilidad general', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `comentario` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_producto`
--

INSERT INTO `tb_producto` (`id`, `nombre`, `comentario`, `cantidad`, `precio`, `id_categoria`, `active`) VALUES
(3, 'Agua Cielo', 'Agua Cielo de 650 Ml', 15, 1.5, 2, 1),
(4, 'Rellenitas', 'Rellenitas de 6 galletas', 30, 2.5, 7, 1),
(6, 'Chistris', 'Snack de queso Chistris', 40, 1.2, 7, 1),
(7, 'Casino', 'Galleta con relleno de menta', 40, 1, 7, 1),
(9, 'Picaras clasicas', 'Galleta picaras sabor clasica', 0, 0, 7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_profile`
--

CREATE TABLE `tb_profile` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `contrasenia` varchar(15) NOT NULL,
  `last_connection` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_profile`
--

INSERT INTO `tb_profile` (`id`, `id_user`, `user`, `contrasenia`, `last_connection`) VALUES
(1, 1, 'jhromero.abx@gmail.com', '12345', '2022-04-13 00:32:15'),
(2, 2, 'dromero.abx@gmail.com', '12345', '2022-03-27 17:00:00'),
(3, 4, 'wasd@gmail.com', '12345', '2022-04-12 22:41:52'),
(7, 8, 'pepit1.abx@gmail.com', '12345', '2022-04-12 22:18:55'),
(8, 9, 'pepitooo.abx@gmail.com', '12345', '2022-04-12 22:19:24'),
(9, 10, 'Flutter.abx@gmail.com', '12345', '2022-04-12 23:34:10'),
(10, 11, 'vimaloa@gmail.com', '123', '2022-04-13 00:31:22'),
(11, 12, 'celu.loasi@gmail.com', '123', '2022-04-13 00:15:20'),
(12, 13, 'dloa@papu', '1234', '2022-04-13 00:35:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_retiro`
--

CREATE TABLE `tb_retiro` (
  `id` int(11) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_user_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_retiro_producto`
--

CREATE TABLE `tb_retiro_producto` (
  `id` int(11) NOT NULL,
  `id_retiro` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_unidad_medida`
--

CREATE TABLE `tb_unidad_medida` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `comentario` varchar(150) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_unidad_medida`
--

INSERT INTO `tb_unidad_medida` (`id`, `nombre`, `comentario`, `level`) VALUES
(1, '1 Litro', '1 Litro para todo', 1),
(2, '500 ml', 'medio litro para todo', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `apellido` varchar(200) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_user_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_user`
--

INSERT INTO `tb_user` (`id`, `nombre`, `apellido`, `dni`, `telefono`, `email`, `fecha_nacimiento`, `estado`, `id_user_type`) VALUES
(1, 'Jhosep Adbel', 'Romero Loa', '74810248', '928769204', 'jhromero.abx@gmail.com', '2001-01-26', 1, 1),
(2, 'Diego Abbel', 'Romero Loa', '74810249', '957043843', 'dromero.abx@gmail.com', '2003-09-03', 1, 2),
(3, 'Ximena Maritza', 'Romero Loa', '74810500', '932123123', 'ximenaromeroloa@gmail.com', '2005-02-05', 1, 3),
(4, 'gato', 'felino', '12345678', '999555111', 'wasd@gmail.com', '2001-01-26', 1, 1),
(8, 'pepita', 'palotes', '12345601', '912312312', 'pepit1.abx@gmail.com', '2005-02-05', 1, 5),
(9, 'pepita', 'palotes', '12345600', '912312312', 'pepitooo.abx@gmail.com', '2005-02-05', 1, 5),
(10, 'Flutter', 'Dart', '12345679', '925769204', 'Flutter.abx@gmail.com', '0000-00-00', 1, 5),
(11, 'vicky', 'v', '16125887', '6767934', 'vimaloa@gmail.com', '0000-00-00', 1, 5),
(12, 'celu', 'xiaomi', '12345677', '6767934', 'celu.loasi@gmail.com', '0000-00-00', 1, 5),
(13, 'DLoa', 'EPC', '74810243', '957043843', 'dloa@papu', '0000-00-00', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_user_type`
--

CREATE TABLE `tb_user_type` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tb_user_type`
--

INSERT INTO `tb_user_type` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'admin', 'administrador del sistema en general', 1),
(2, 'developer senior', 'desarrollador del sistema y analista de nuevas funciones', 1),
(3, 'client assitant', 'asistente del cliente y recepcion de reqs de los clientes', 1),
(4, 'client guide', 'Guia de los clientes para ubicacion de todo el sistema', 1),
(5, 'User Default', 'Usuario Default listo para ser asignado por el administrador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `valor` varchar(30) NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `test`
--

INSERT INTO `test` (`id`, `valor`, `counter`) VALUES
(1, '20', 1),
(2, 'galleta', 2),
(3, 'comestible', 3),
(4, '1', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_compra_producto`
--
ALTER TABLE `tb_compra_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_type_employee` (`id_employee_type`);

--
-- Indices de la tabla `tb_employee_type`
--
ALTER TABLE `tb_employee_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_producto_ibfk_1` (`id_categoria`);

--
-- Indices de la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_profile_user` (`id_user`);

--
-- Indices de la tabla `tb_retiro`
--
ALTER TABLE `tb_retiro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_retiro_producto`
--
ALTER TABLE `tb_retiro_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_retiro_producto` (`id_producto`),
  ADD KEY `fk_retiro` (`id_retiro`);

--
-- Indices de la tabla `tb_unidad_medida`
--
ALTER TABLE `tb_unidad_medida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_type_user` (`id_user_type`);

--
-- Indices de la tabla `tb_user_type`
--
ALTER TABLE `tb_user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_compra_producto`
--
ALTER TABLE `tb_compra_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_employee_type`
--
ALTER TABLE `tb_employee_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_retiro`
--
ALTER TABLE `tb_retiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_retiro_producto`
--
ALTER TABLE `tb_retiro_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_unidad_medida`
--
ALTER TABLE `tb_unidad_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tb_user_type`
--
ALTER TABLE `tb_user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_compra_producto`
--
ALTER TABLE `tb_compra_producto`
  ADD CONSTRAINT `tb_compra_producto_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `tb_compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tb_compra_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD CONSTRAINT `fk_type_employee` FOREIGN KEY (`id_employee_type`) REFERENCES `tb_employee_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_retiro_producto`
--
ALTER TABLE `tb_retiro_producto`
  ADD CONSTRAINT `fk_retiro` FOREIGN KEY (`id_retiro`) REFERENCES `tb_retiro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_retiro_producto` FOREIGN KEY (`id_producto`) REFERENCES `tb_producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `fk_type_user` FOREIGN KEY (`id_user_type`) REFERENCES `tb_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
