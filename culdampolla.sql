-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2020 a las 00:40:15
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culdampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `registre` timestamp NOT NULL DEFAULT current_timestamp(),
  `email` varchar(30) NOT NULL,
  `contacte_id` int(11) NOT NULL,
  `recomenat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `registre`, `email`, `contacte_id`, `recomenat`) VALUES
(1, 'client 3', '2020-04-28 20:20:43', 'email 3', 9, NULL),
(8, 'client 4', '2020-04-28 20:24:48', 'email 4', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactes`
--

CREATE TABLE `contactes` (
  `id_contacte` int(11) NOT NULL,
  `tlf` int(9) NOT NULL,
  `carrer` varchar(30) NOT NULL,
  `num` int(6) NOT NULL,
  `pis` int(3) NOT NULL,
  `porta` int(4) NOT NULL,
  `ciutat` varchar(30) NOT NULL,
  `CP` varchar(5) NOT NULL,
  `pais` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `contactes`
--

INSERT INTO `contactes` (`id_contacte`, `tlf`, `carrer`, `num`, `pis`, `porta`, `ciutat`, `CP`, `pais`) VALUES
(5, 611111111, 'Carrer 1', 19, 0, 0, 'Barcelona', '08080', 'Espanya'),
(6, 62222222, 'Carrer 2', 24, 145, 33, 'Dubai', '66666', 'EAU'),
(9, 633333333, 'Avinguda 1', 45, 3, 4, 'Barcelona', '08081', 'Espanya'),
(11, 644444444, 'Passatge 1', 2, 0, 0, 'Barcelona', '08082', 'Espanya'),
(12, 999999999, 'Camí 1', 3, 10, 0, 'Barcelona', '08083', 'Espanya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factures`
--

CREATE TABLE `factures` (
  `id_factura` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `ulleres_id` int(11) NOT NULL,
  `unitats` int(4) NOT NULL DEFAULT 0,
  `pagat` tinyint(1) NOT NULL DEFAULT 0,
  `empleat` set('empleat 1','empleat 2','empleat 3','empleat 4') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factures`
--

INSERT INTO `factures` (`id_factura`, `client_id`, `ulleres_id`, `unitats`, `pagat`, `empleat`) VALUES
(4, 1, 1, 1, 1, 'empleat 1'),
(5, 1, 2, 1, 1, 'empleat 2'),
(6, 1, 8, 1, 0, 'empleat 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marques`
--

CREATE TABLE `marques` (
  `id_marca` int(11) NOT NULL,
  `marca` varchar(30) NOT NULL,
  `proveidor_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marques`
--

INSERT INTO `marques` (`id_marca`, `marca`, `proveidor_id`) VALUES
(4, 'Dulce & Cabaña', 3),
(5, 'Ray Pam', 3),
(6, 'Allahu Alglass', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `NIF` varchar(9) NOT NULL,
  `fax` int(9) NOT NULL,
  `contacte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_proveidor`, `nom`, `NIF`, `fax`, `contacte_id`) VALUES
(3, 'Barna Optics', '11111111A', 611111111, 5),
(4, 'Dubai Sunglasses', '22222222B', 622222222, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `model` varchar(30) NOT NULL,
  `dioptria_L` decimal(4,2) NOT NULL DEFAULT 0.00,
  `dioptria_R` decimal(4,2) NOT NULL DEFAULT 0.00,
  `muntura_type` set('flotant','pasta','metall') NOT NULL,
  `muntura_color` set('black','white','purple','red','blue','pink','orange','green','lime','gold','silver') NOT NULL,
  `vidre_color` set('transparent','sun 1','sun 2','metalized','paleyellow','paleblue') NOT NULL,
  `preu` decimal(5,2) NOT NULL DEFAULT 0.00,
  `stock` int(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca_id`, `model`, `dioptria_L`, `dioptria_R`, `muntura_type`, `muntura_color`, `vidre_color`, `preu`, `stock`) VALUES
(1, 4, 'Dulce 101', '0.75', '0.50', 'pasta', 'black', 'transparent', '80.50', 100),
(2, 4, 'Dulce 101', '0.00', '0.00', 'flotant', 'silver', 'metalized', '120.80', 50),
(3, 6, 'Allahu 666', '0.00', '0.00', 'metall', 'gold', 'sun 2', '200.00', 100),
(8, 5, 'Ray Pam classic', '2.00', '2.00', 'flotant', 'purple', 'paleblue', '120.00', 86);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contacte_id` (`contacte_id`),
  ADD KEY `recomenat` (`recomenat`);

--
-- Indices de la tabla `contactes`
--
ALTER TABLE `contactes`
  ADD PRIMARY KEY (`id_contacte`),
  ADD UNIQUE KEY `tlf` (`tlf`);

--
-- Indices de la tabla `factures`
--
ALTER TABLE `factures`
  ADD PRIMARY KEY (`id_factura`),
  ADD UNIQUE KEY `ulleres_id` (`ulleres_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indices de la tabla `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `marca` (`marca`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `NIF` (`NIF`),
  ADD UNIQUE KEY `fax` (`fax`),
  ADD UNIQUE KEY `contacte_id` (`contacte_id`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `marca_id` (`marca_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `contactes`
--
ALTER TABLE `contactes`
  MODIFY `id_contacte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `factures`
--
ALTER TABLE `factures`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `marques`
--
ALTER TABLE `marques`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`recomenat`) REFERENCES `clients` (`id_client`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`contacte_id`) REFERENCES `contactes` (`id_contacte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factures`
--
ALTER TABLE `factures`
  ADD CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id_ulleres`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factures_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `marques_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_proveidor`);

--
-- Filtros para la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD CONSTRAINT `proveidors_ibfk_1` FOREIGN KEY (`contacte_id`) REFERENCES `contactes` (`id_contacte`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marques` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
