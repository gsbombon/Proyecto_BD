-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 26-01-2020 a las 20:10:40
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_bdnuevo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arbitro`
--

CREATE TABLE `arbitro` (
  `ARBITRO_ID` decimal(5,0) NOT NULL,
  `ARBITRO_NOMBRE` char(20) NOT NULL,
  `ARBITRO_APELLIDO` char(20) NOT NULL,
  `ARBITRO_TELEFONO` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato`
--

CREATE TABLE `campeonato` (
  `CAMP_ID` decimal(4,0) NOT NULL,
  `DIVISION_ID` decimal(11,0) NOT NULL,
  `TIPOCAMP_ID` decimal(5,0) NOT NULL,
  `CAMP_NOMBRE` char(40) NOT NULL,
  `CAMP_FECHAINICIO` date NOT NULL,
  `CAMP_FECHAFIN` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE `cancha` (
  `CANCHA_ID` decimal(5,0) NOT NULL,
  `CANCHA_NOMBRE` char(40) NOT NULL,
  `CANCHA_DIRECICON` char(40) NOT NULL,
  `CANCHA_MAXPERSONA` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `division`
--

CREATE TABLE `division` (
  `DIVISION_ID` decimal(11,0) NOT NULL,
  `DIVISION_DETALLE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `EQUI_ID` decimal(5,0) NOT NULL,
  `JUG_ID` decimal(4,0) NOT NULL,
  `CAMP_ID` decimal(4,0) NOT NULL,
  `EQUI_NOMBRE` char(40) NOT NULL,
  `EQUI_ESTADO` char(10) NOT NULL COMMENT 'Aqui se guarda la informacion de si el equipo esta activo o no ',
  `EQUI_LEMA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `JUG_ID` decimal(4,0) NOT NULL,
  `TARJ_ID` decimal(5,0) DEFAULT NULL,
  `JUG_NOMBRE` char(20) NOT NULL,
  `JUG_APELLIDO` char(20) NOT NULL,
  `JUG_FECHANACIMIENTO` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugar`
--

CREATE TABLE `jugar` (
  `PARTIDO_ID` decimal(5,0) NOT NULL,
  `EQUI_ID` decimal(5,0) NOT NULL,
  `GOLES` int(11) DEFAULT NULL,
  `RESULTADO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `PARTIDO_ID` decimal(5,0) NOT NULL,
  `CAMP_ID` decimal(4,0) NOT NULL,
  `ARBITRO_ID` decimal(5,0) NOT NULL,
  `CANCHA_ID` decimal(5,0) DEFAULT NULL,
  `PARTIDO_FECHAPARTIDO` date NOT NULL,
  `PARTIDO_HORA` time NOT NULL,
  `PARTIDO_JORNADA` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_posiciones`
--

CREATE TABLE `tabla_posiciones` (
  `TABLA_ID` decimal(5,0) NOT NULL,
  `EQUI_ID` decimal(5,0) NOT NULL,
  `PARTIDO_ID` decimal(5,0) DEFAULT NULL,
  `JUG_EQUI_ID` decimal(5,0) DEFAULT NULL,
  `TABLA_PARTIDOSJUGADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSGANADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSPERDIDOS` decimal(5,0) NOT NULL,
  `TABLA_GOLESFAVOR` decimal(5,0) NOT NULL,
  `TABLA_GOLESCONTRA` decimal(5,0) NOT NULL,
  `TABLA_PUNTOS` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_jugador`
--

CREATE TABLE `tarjeta_jugador` (
  `TARJ_ID` decimal(5,0) NOT NULL,
  `TARJ_FECHA` date NOT NULL,
  `TARJ_CANTIDAD` decimal(3,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_campeonato`
--

CREATE TABLE `tipo_campeonato` (
  `TIPOCAMP_ID` decimal(5,0) NOT NULL,
  `TIPOCAMP_TIPO` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`ARBITRO_ID`);

--
-- Indices de la tabla `campeonato`
--
ALTER TABLE `campeonato`
  ADD PRIMARY KEY (`CAMP_ID`),
  ADD KEY `FK_ES` (`TIPOCAMP_ID`),
  ADD KEY `FK_ESTA` (`DIVISION_ID`);

--
-- Indices de la tabla `cancha`
--
ALTER TABLE `cancha`
  ADD PRIMARY KEY (`CANCHA_ID`);

--
-- Indices de la tabla `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`DIVISION_ID`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`EQUI_ID`),
  ADD KEY `FK_JUEGA` (`JUG_ID`),
  ADD KEY `FK_NECESITA` (`CAMP_ID`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`JUG_ID`),
  ADD KEY `FK_POSEE` (`TARJ_ID`);

--
-- Indices de la tabla `jugar`
--
ALTER TABLE `jugar`
  ADD PRIMARY KEY (`PARTIDO_ID`,`EQUI_ID`),
  ADD KEY `FK_JUGAR2` (`EQUI_ID`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`PARTIDO_ID`),
  ADD KEY `FK_ARBITRAR` (`ARBITRO_ID`),
  ADD KEY `FK_PERTENECE` (`CAMP_ID`),
  ADD KEY `FK_SE_JUEGA` (`CANCHA_ID`);

--
-- Indices de la tabla `tabla_posiciones`
--
ALTER TABLE `tabla_posiciones`
  ADD PRIMARY KEY (`TABLA_ID`),
  ADD KEY `FK_REFERENCE_12` (`PARTIDO_ID`,`JUG_EQUI_ID`),
  ADD KEY `FK_TIENE` (`EQUI_ID`);

--
-- Indices de la tabla `tarjeta_jugador`
--
ALTER TABLE `tarjeta_jugador`
  ADD PRIMARY KEY (`TARJ_ID`);

--
-- Indices de la tabla `tipo_campeonato`
--
ALTER TABLE `tipo_campeonato`
  ADD PRIMARY KEY (`TIPOCAMP_ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campeonato`
--
ALTER TABLE `campeonato`
  ADD CONSTRAINT `FK_ES` FOREIGN KEY (`TIPOCAMP_ID`) REFERENCES `tipo_campeonato` (`TIPOCAMP_ID`),
  ADD CONSTRAINT `FK_ESTA` FOREIGN KEY (`DIVISION_ID`) REFERENCES `division` (`DIVISION_ID`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `FK_JUEGA` FOREIGN KEY (`JUG_ID`) REFERENCES `jugador` (`JUG_ID`),
  ADD CONSTRAINT `FK_NECESITA` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `FK_POSEE` FOREIGN KEY (`TARJ_ID`) REFERENCES `tarjeta_jugador` (`TARJ_ID`);

--
-- Filtros para la tabla `jugar`
--
ALTER TABLE `jugar`
  ADD CONSTRAINT `FK_JUGAR` FOREIGN KEY (`PARTIDO_ID`) REFERENCES `partido` (`PARTIDO_ID`),
  ADD CONSTRAINT `FK_JUGAR2` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `FK_ARBITRAR` FOREIGN KEY (`ARBITRO_ID`) REFERENCES `arbitro` (`ARBITRO_ID`),
  ADD CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  ADD CONSTRAINT `FK_SE_JUEGA` FOREIGN KEY (`CANCHA_ID`) REFERENCES `cancha` (`CANCHA_ID`);

--
-- Filtros para la tabla `tabla_posiciones`
--
ALTER TABLE `tabla_posiciones`
  ADD CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`PARTIDO_ID`,`JUG_EQUI_ID`) REFERENCES `jugar` (`PARTIDO_ID`, `EQUI_ID`),
  ADD CONSTRAINT `FK_TIENE` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
