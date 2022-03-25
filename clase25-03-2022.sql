-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 13:19:04
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clase25-03-2022`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacén`
--

CREATE TABLE `almacén` (
  `nit_almacen` int(11) NOT NULL,
  `direccion_almacen` varchar(45) NOT NULL,
  `nombre_almacen` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `almacén`
--

INSERT INTO `almacén` (`nit_almacen`, `direccion_almacen`, `nombre_almacen`) VALUES
(25784, 'crra 8-nro-104', 'justo y bueno'),
(257844, 'crra 8-nro-104', 'justo y bueno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueño`
--

CREATE TABLE `dueño` (
  `id_dueño` int(11) NOT NULL,
  `nombre_dueño` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dueño`
--

INSERT INTO `dueño` (`id_dueño`, `nombre_dueño`, `telefono`) VALUES
(583496, 'juan diaz', 315487542),
(38364775, 'juan rojas ', 322364861);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedad`
--

CREATE TABLE `propiedad` (
  `id_propiedad` int(11) NOT NULL,
  `almacén_nit_almacen` int(11) NOT NULL,
  `dueño_id_dueño` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propiedad`
--

INSERT INTO `propiedad` (`id_propiedad`, `almacén_nit_almacen`, `dueño_id_dueño`) VALUES
(52847, 25784, 583496),
(52874, 257844, 38364775);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id_susursal` int(11) NOT NULL,
  `almacén_nit_almacen` int(11) NOT NULL,
  `direccion_sucursal` varchar(45) NOT NULL,
  `numero_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id_susursal`, `almacén_nit_almacen`, `direccion_sucursal`, `numero_sucursal`) VALUES
(852147, 25784, 'carrera6numero108', 12345),
(8521456, 25784, 'carrera9calle21', 852369);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacén`
--
ALTER TABLE `almacén`
  ADD PRIMARY KEY (`nit_almacen`);

--
-- Indices de la tabla `dueño`
--
ALTER TABLE `dueño`
  ADD PRIMARY KEY (`id_dueño`);

--
-- Indices de la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD PRIMARY KEY (`id_propiedad`,`almacén_nit_almacen`,`dueño_id_dueño`),
  ADD KEY `fk_propiedad_almacén1_idx` (`almacén_nit_almacen`),
  ADD KEY `fk_propiedad_dueño1_idx` (`dueño_id_dueño`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id_susursal`,`almacén_nit_almacen`),
  ADD KEY `fk_sucursales_almacén1_idx` (`almacén_nit_almacen`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propiedad`
--
ALTER TABLE `propiedad`
  ADD CONSTRAINT `fk_propiedad_almacén1` FOREIGN KEY (`almacén_nit_almacen`) REFERENCES `almacén` (`nit_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_propiedad_dueño1` FOREIGN KEY (`dueño_id_dueño`) REFERENCES `dueño` (`id_dueño`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD CONSTRAINT `fk_sucursales_almacén1` FOREIGN KEY (`almacén_nit_almacen`) REFERENCES `almacén` (`nit_almacen`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
