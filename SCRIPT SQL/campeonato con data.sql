-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonatofutbol
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `ARBITRO_ID` decimal(5,0) NOT NULL,
  `ARBITRO_NOMBRE` char(20) NOT NULL,
  `ARBITRO_APELLIDO` char(20) NOT NULL,
  `ARBITRO_TELEFONO` char(10) NOT NULL,
  PRIMARY KEY (`ARBITRO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Néstor','Pitana','0982645612'),(2,'Markus','Merk','0826354716'),(3,'Pierluigi','Collina','0928372124');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campeonato` (
  `CAMP_ID` decimal(4,0) NOT NULL,
  `DIVISION_ID` decimal(11,0) NOT NULL,
  `TIPOCAMP_ID` decimal(5,0) NOT NULL,
  `CAMP_NOMBRE` char(40) NOT NULL,
  `CAMP_FECHAINICIO` date NOT NULL,
  `CAMP_FECHAFIN` date NOT NULL,
  PRIMARY KEY (`CAMP_ID`),
  KEY `FK_ES` (`TIPOCAMP_ID`),
  KEY `FK_ESTA` (`DIVISION_ID`),
  CONSTRAINT `FK_ES` FOREIGN KEY (`TIPOCAMP_ID`) REFERENCES `tipo_campeonato` (`TIPOCAMP_ID`),
  CONSTRAINT `FK_ESTA` FOREIGN KEY (`DIVISION_ID`) REFERENCES `division` (`DIVISION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
INSERT INTO `campeonato` VALUES (1,1,1,'Campeonato MM 2020','2020-02-12','2020-11-20'),(2,2,1,'Campeonato MP 2020','2020-02-20','2020-11-30');
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancha` (
  `CANCHA_ID` decimal(5,0) NOT NULL,
  `CANCHA_NOMBRE` char(40) NOT NULL,
  `CANCHA_DIRECICON` char(40) NOT NULL,
  `CANCHA_MAXPERSONA` decimal(5,0) NOT NULL,
  PRIMARY KEY (`CANCHA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
INSERT INTO `cancha` VALUES (1,'Estadio La Batea','Naranjito 221, Quito 170141',300),(2,'Estadio Sixto Duran Ballen','Luis Chiriboga, Quito 170121',280);
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `DIVISION_ID` decimal(11,0) NOT NULL,
  `DIVISION_DETALLE` text,
  PRIMARY KEY (`DIVISION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Maxima'),(2,'Primera'),(3,'Segunda A'),(4,'Segunda B'),(5,'Femenino A'),(6,'Femenino B');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `EQUI_ID` decimal(5,0) NOT NULL,
  `CAMP_ID` decimal(4,0) NOT NULL,
  `EQUI_NOMBRE` char(40) NOT NULL,
  `EQUI_ESTADO` char(10) NOT NULL COMMENT 'Aqui se guarda la informacion de si el equipo esta activo o no ',
  `EQUI_LEMA` text NOT NULL,
  PRIMARY KEY (`EQUI_ID`),
  KEY `FK_NECESITA` (`CAMP_ID`),
  CONSTRAINT `FK_NECESITA` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1,'Necaxa','necaxa@gma','El esfuerzo es la base del exito'),(2,1,'Nuevos Horizontes','defensorHo','Que la fuerza les acompañe'),(3,1,'DefensorOriental','defOrienta','Cualquier lema que ya no sé'),(4,2,'San Franciso','sanFrancis','Tampoco se que poner'),(5,2,'Racing Juvenil','racJuvenil','Ya no me se ni un lema '),(6,2,'Peñarol','peñarol@gm','Despues editamos los lemas');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `JUG_ID` decimal(4,0) NOT NULL,
  `TARJ_ID` decimal(5,0) DEFAULT NULL,
  `EQUI_ID` decimal(5,0) DEFAULT NULL,
  `JUG_NOMBRE` char(20) NOT NULL,
  `JUG_APELLIDO` char(20) NOT NULL,
  `JUG_FECHANACIMIENTO` date NOT NULL,
  PRIMARY KEY (`JUG_ID`),
  KEY `FK_JUEGA` (`EQUI_ID`),
  KEY `FK_POSEE` (`TARJ_ID`),
  CONSTRAINT `FK_JUEGA` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`),
  CONSTRAINT `FK_POSEE` FOREIGN KEY (`TARJ_ID`) REFERENCES `tarjeta_jugador` (`TARJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,NULL,1,'Steven','Bombon','1998-10-08'),(2,NULL,1,'Luis','Loachamin','1998-11-23'),(3,NULL,2,'Edwin','Caiza','1997-07-21'),(4,NULL,2,'Byron','Condor','1996-12-23');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugar`
--

DROP TABLE IF EXISTS `jugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugar` (
  `PARTIDO_ID` decimal(5,0) NOT NULL,
  `EQUI_ID` decimal(5,0) NOT NULL,
  `GOLES` int(11) DEFAULT NULL,
  `RESULTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PARTIDO_ID`,`EQUI_ID`),
  KEY `FK_JUGAR2` (`EQUI_ID`),
  CONSTRAINT `FK_JUGAR` FOREIGN KEY (`PARTIDO_ID`) REFERENCES `partido` (`PARTIDO_ID`),
  CONSTRAINT `FK_JUGAR2` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugar`
--

LOCK TABLES `jugar` WRITE;
/*!40000 ALTER TABLE `jugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `PARTIDO_ID` decimal(5,0) NOT NULL,
  `CAMP_ID` decimal(4,0) NOT NULL,
  `ARBITRO_ID` decimal(5,0) NOT NULL,
  `CANCHA_ID` decimal(5,0) DEFAULT NULL,
  `PARTIDO_FECHAPARTIDO` date NOT NULL,
  `PARTIDO_HORA` time NOT NULL,
  `PARTIDO_JORNADA` char(40) NOT NULL,
  PRIMARY KEY (`PARTIDO_ID`),
  KEY `FK_ARBITRAR` (`ARBITRO_ID`),
  KEY `FK_PERTENECE` (`CAMP_ID`),
  KEY `FK_SE_JUEGA` (`CANCHA_ID`),
  CONSTRAINT `FK_ARBITRAR` FOREIGN KEY (`ARBITRO_ID`) REFERENCES `arbitro` (`ARBITRO_ID`),
  CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  CONSTRAINT `FK_SE_JUEGA` FOREIGN KEY (`CANCHA_ID`) REFERENCES `cancha` (`CANCHA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_posiciones`
--

DROP TABLE IF EXISTS `tabla_posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_posiciones` (
  `TABLA_ID` decimal(5,0) NOT NULL,
  `EQUI_ID` decimal(5,0) NOT NULL,
  `PARTIDO_ID` decimal(5,0) DEFAULT NULL,
  `JUG_EQUI_ID` decimal(5,0) DEFAULT NULL,
  `CAMP_ID` decimal(4,0) DEFAULT NULL,
  `TABLA_PARTIDOSJUGADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSGANADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSPERDIDOS` decimal(5,0) NOT NULL,
  `TABLA_GOLESFAVOR` decimal(5,0) NOT NULL,
  `TABLA_GOLESCONTRA` decimal(5,0) NOT NULL,
  `TABLA_PUNTOS` decimal(5,0) NOT NULL,
  PRIMARY KEY (`TABLA_ID`),
  KEY `FK_ORGANIZA` (`CAMP_ID`),
  KEY `FK_REFERENCE_12` (`PARTIDO_ID`,`JUG_EQUI_ID`),
  KEY `FK_TIENE` (`EQUI_ID`),
  CONSTRAINT `FK_ORGANIZA` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`PARTIDO_ID`, `JUG_EQUI_ID`) REFERENCES `jugar` (`PARTIDO_ID`, `EQUI_ID`),
  CONSTRAINT `FK_TIENE` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_posiciones`
--

LOCK TABLES `tabla_posiciones` WRITE;
/*!40000 ALTER TABLE `tabla_posiciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_posiciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_jugador`
--

DROP TABLE IF EXISTS `tarjeta_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_jugador` (
  `TARJ_ID` decimal(5,0) NOT NULL,
  `TARJ_FECHA` date NOT NULL,
  `TARJ_CANTIDAD` decimal(3,0) NOT NULL,
  `TARJ_TIPO` char(20) NOT NULL,
  PRIMARY KEY (`TARJ_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_jugador`
--

LOCK TABLES `tarjeta_jugador` WRITE;
/*!40000 ALTER TABLE `tarjeta_jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta_jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_campeonato`
--

DROP TABLE IF EXISTS `tipo_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_campeonato` (
  `TIPOCAMP_ID` decimal(5,0) NOT NULL,
  `TIPOCAMP_TIPO` char(40) NOT NULL,
  PRIMARY KEY (`TIPOCAMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_campeonato`
--

LOCK TABLES `tipo_campeonato` WRITE;
/*!40000 ALTER TABLE `tipo_campeonato` DISABLE KEYS */;
INSERT INTO `tipo_campeonato` VALUES (1,'Masculino'),(2,'Femenino');
/*!40000 ALTER TABLE `tipo_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'campeonatofutbol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-26 17:16:24
