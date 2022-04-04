-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2022 a las 03:03:04
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
CREATE DEFINER=`qwert`@`%` PROCEDURE `employeeAddOrEdit` (`_id` INT, `_name` VARCHAR(50), `_salary` DECIMAL, `_id_employee_type` INT)  BEGIN
	SET @EXISTE := 0;
    SET @ERROR := 'no error';
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
    SET @MSG := 'no error, hay otro ROW con data';	
    	SET @ACCESS := IF( EXISTS(
            SELECT * FROM tb_profile tp
            INNER JOIN tb_user tu 
            ON tp.id_user = tu.id 
            WHERE tu.email = _user AND tp.contrasenia = 				_contrasenia), 1, 0);
    	IF @ACCESS = 1 THEN
        	UPDATE tb_profile tp SET tp.last_connection = 					NOW() WHERE tp.user = _user;
        	SELECT @MSG as msg;
            SELECT * FROM tb_user tu WHERE tu.email = 				_user;
        ELSE
        	SET @MSG = 'ACCESOS INCORRECTOS!!!';
            SELECT @MSG as msg;
    	END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userAddOrEdit` (IN `_id` INT, IN `_nombre` VARCHAR(200), IN `_apellido` VARCHAR(200), IN `_dni` VARCHAR(10), IN `_telefono` VARCHAR(30), IN `_email` VARCHAR(200), IN `_fecha_nacimiento` DATE, IN `_estado` TINYINT(1), IN `_id_user_type` INT, IN `_contrasenia` VARCHAR(15))  BEGIN
	SET @EXISTE_user := 0;
    SET @EXISTE_dni := 0;
    SET @EXISTE_email := 0;
    SET @ERROR := 'no error';	    
    
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
        ELSE
        	INSERT INTO tb_user (nombre, apellido, dni, telefono, email, 					fecha_nacimiento, estado, id_user_type) VALUES (_nombre, _apellido, 			_dni, _telefono, _email, _fecha_nacimiento, _estado, _id_user_type);
        
        	SET _id = last_insert_id();
        
            INSERT INTO tb_profile (id_user, `user`, contrasenia, last_connection) VALUES (_id, _email, _contrasenia, NOW());                
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
        ELSEIF @EXISTE_email = 1 THEN
        	SET @ERROR = 'EL CORREO YA EXISTE';
        ELSEIF @EXISTE_user = 0 THEN
        	SET @ERROR = 'EL USER NO EXISTE';
        ELSE
        	UPDATE tb_user SET nombre = _nombre, apellido = _apellido, dni = _dni, telefono = _telefono, email = _email, fecha_nacimiento = _fecha_nacimiento, estado = _estado, id_user_type = _id_user_type WHERE id = _id;
            
            UPDATE tb_profile SET `user` = _email, last_connection = NOW() WHERE id_user = _id;
            
    	END IF;    
	END IF;
    SELECT _id AS id, @ERROR as error;
END$$

DELIMITER ;

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
(23, 'JHOSEP', 30000, 1),
(24, 'Ximena', 3500, 2),
(25, 'EDUARDAZO', 123123, 3);

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
(2, 'help', 'help support', 0),
(3, 'assitant', 'assitant for queries or guides', 1);

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
(1, 1, 'jhromero.abx@gmail.com', '12345', '2022-03-27 16:59:47'),
(2, 2, 'dromero.abx@gmail.com', '12345', '2022-03-27 17:00:00'),
(3, 4, 'wasd@gmail.com', '12345', '2022-03-27 18:02:10');

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
(4, 'gato', 'felino', '12345678', '999555111', 'wasd@gmail.com', '2001-01-26', 1, 1);

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
(4, 'client guide', 'Guia de los clientes para ubicacion de todo el sistema', 0);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_profile_user` (`id_user`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tb_employee_type`
--
ALTER TABLE `tb_employee_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tb_user_type`
--
ALTER TABLE `tb_user_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD CONSTRAINT `fk_type_employee` FOREIGN KEY (`id_employee_type`) REFERENCES `tb_employee_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tb_profile`
--
ALTER TABLE `tb_profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`id_user`) REFERENCES `tb_user` (`id`);

--
-- Filtros para la tabla `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `fk_type_user` FOREIGN KEY (`id_user_type`) REFERENCES `tb_user_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
