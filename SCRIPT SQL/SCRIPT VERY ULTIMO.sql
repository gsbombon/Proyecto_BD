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
  `ARBITRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ARBITRO_NOMBRE` char(20) NOT NULL,
  `ARBITRO_APELLIDO` char(20) NOT NULL,
  `ARBITRO_TELEFONO` char(10) NOT NULL,
  PRIMARY KEY (`ARBITRO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Nestor','Pitana','0298371728');
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calendario` (
  `CALENDARIO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAMP_ID` int(11) DEFAULT NULL,
  `CALENDARIO_FECHA` date DEFAULT NULL,
  PRIMARY KEY (`CALENDARIO_ID`),
  KEY `FK_REFERENCE_16` (`CAMP_ID`),
  CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,1,'2020-12-01');
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campeonato` (
  `CAMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIVISION_ID` int(11) NOT NULL,
  `TIPOCAMP_ID` int(11) NOT NULL,
  `CAMP_NOMBRE` char(40) NOT NULL,
  `CAMP_FECHAINICIO` date NOT NULL,
  `CAMP_FECHAFIN` date NOT NULL,
  PRIMARY KEY (`CAMP_ID`),
  KEY `FK_ES` (`TIPOCAMP_ID`),
  KEY `FK_ESTA` (`DIVISION_ID`),
  CONSTRAINT `FK_ES` FOREIGN KEY (`TIPOCAMP_ID`) REFERENCES `tipo_campeonato` (`TIPOCAMP_ID`),
  CONSTRAINT `FK_ESTA` FOREIGN KEY (`DIVISION_ID`) REFERENCES `division` (`DIVISION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
INSERT INTO `campeonato` VALUES (1,1,1,'Camp M-M 2020','2020-02-20','2020-12-02');
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancha`
--

DROP TABLE IF EXISTS `cancha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancha` (
  `CANCHA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CANCHA_NOMBRE` char(40) NOT NULL,
  `CANCHA_DIRECICON` char(40) NOT NULL,
  `CANCHA_MAXPERSONA` decimal(5,0) NOT NULL,
  PRIMARY KEY (`CANCHA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancha`
--

LOCK TABLES `cancha` WRITE;
/*!40000 ALTER TABLE `cancha` DISABLE KEYS */;
INSERT INTO `cancha` VALUES (1,'Estadio La Batea','Quito',200);
/*!40000 ALTER TABLE `cancha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `division` (
  `DIVISION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIVISION_DETALLE` text,
  PRIMARY KEY (`DIVISION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (1,'Maxima'),(2,'Primera'),(3,'Segunda');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuentro`
--

DROP TABLE IF EXISTS `encuentro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuentro` (
  `ENCUENTRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUI_ID` int(11) DEFAULT NULL,
  `PARTIDO_ID` int(11) DEFAULT NULL,
  `GOLES` int(11) DEFAULT NULL,
  `RESULTADO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ENCUENTRO_ID`),
  KEY `FK_REFERENCE_17` (`EQUI_ID`),
  KEY `FK_REFERENCE_18` (`PARTIDO_ID`),
  CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`PARTIDO_ID`) REFERENCES `partido` (`PARTIDO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuentro`
--

LOCK TABLES `encuentro` WRITE;
/*!40000 ALTER TABLE `encuentro` DISABLE KEYS */;
INSERT INTO `encuentro` VALUES (2,1,1,2,3),(3,2,1,1,0),(4,3,2,4,1),(5,4,2,4,1),(6,1,3,2,3),(7,3,3,0,0);
/*!40000 ALTER TABLE `encuentro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `EQUI_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAMP_ID` int(11) NOT NULL,
  `EQUI_NOMBRE` char(40) NOT NULL,
  `EQUI_CORREO` char(20) NOT NULL COMMENT 'Aqui se guarda la informacion de si el equipo esta activo o no ',
  `EQUI_LEMA` text NOT NULL,
  PRIMARY KEY (`EQUI_ID`),
  KEY `FK_NECESITA` (`CAMP_ID`),
  CONSTRAINT `FK_NECESITA` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1,'Necaxa','necaxa@gmail.com','Yo le voy al Necaxa x100pre'),(2,1,'Barcelonash','barcelona@falso.com','Saqueo saqueo saqueo'),(3,1,'Peñarol','peñarol@gmail.com','Que las fuerza les acompañe'),(4,1,'Nuevos Horizontes','nh@hotmail.com','No se que poner mi pex');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada`
--

DROP TABLE IF EXISTS `jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada` (
  `JORNADA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CALENDARIO_ID` int(11) DEFAULT NULL,
  `NUM_JORNADA` int(11) DEFAULT NULL,
  `JORNADA_FECHA` date DEFAULT NULL,
  PRIMARY KEY (`JORNADA_ID`),
  KEY `FK_REFERENCE_25` (`CALENDARIO_ID`),
  CONSTRAINT `FK_REFERENCE_25` FOREIGN KEY (`CALENDARIO_ID`) REFERENCES `calendario` (`CALENDARIO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
INSERT INTO `jornada` VALUES (1,1,1,'2020-03-12');
/*!40000 ALTER TABLE `jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_partido`
--

DROP TABLE IF EXISTS `jornada_partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jornada_partido` (
  `JORENCUENTRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAMP_ID` int(11) DEFAULT NULL,
  `PARTIDO_ID` int(11) DEFAULT NULL,
  `JORNADA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`JORENCUENTRO_ID`),
  KEY `FK_REFERENCE_22` (`CAMP_ID`),
  KEY `FK_REFERENCE_23` (`PARTIDO_ID`),
  KEY `FK_REFERENCE_24` (`JORNADA_ID`),
  CONSTRAINT `FK_REFERENCE_22` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  CONSTRAINT `FK_REFERENCE_23` FOREIGN KEY (`PARTIDO_ID`) REFERENCES `partido` (`PARTIDO_ID`),
  CONSTRAINT `FK_REFERENCE_24` FOREIGN KEY (`JORNADA_ID`) REFERENCES `jornada` (`JORNADA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_partido`
--

LOCK TABLES `jornada_partido` WRITE;
/*!40000 ALTER TABLE `jornada_partido` DISABLE KEYS */;
INSERT INTO `jornada_partido` VALUES (1,1,1,1),(2,1,2,1);
/*!40000 ALTER TABLE `jornada_partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `JUG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUI_ID` int(11) DEFAULT NULL,
  `JUG_NOMBRE` char(20) NOT NULL,
  `JUG_APELLIDO` char(20) NOT NULL,
  `JUG_FECHANACIMIENTO` date NOT NULL,
  PRIMARY KEY (`JUG_ID`),
  KEY `FK_REFERENCE_21` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_21` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partido` (
  `PARTIDO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAMP_ID` int(11) NOT NULL,
  `ARBITRO_ID` int(11) NOT NULL,
  `CANCHA_ID` int(11) DEFAULT NULL,
  `PARTIDO_HORA` time NOT NULL,
  PRIMARY KEY (`PARTIDO_ID`),
  KEY `FK_ARBITRAR` (`ARBITRO_ID`),
  KEY `FK_PERTENECE` (`CAMP_ID`),
  KEY `FK_SE_JUEGA` (`CANCHA_ID`),
  CONSTRAINT `FK_ARBITRAR` FOREIGN KEY (`ARBITRO_ID`) REFERENCES `arbitro` (`ARBITRO_ID`),
  CONSTRAINT `FK_PERTENECE` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  CONSTRAINT `FK_SE_JUEGA` FOREIGN KEY (`CANCHA_ID`) REFERENCES `cancha` (`CANCHA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,1,1,'10:00:00'),(2,1,1,1,'12:00:00'),(3,1,1,1,'14:00:00');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_posiciones`
--

DROP TABLE IF EXISTS `tabla_posiciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_posiciones` (
  `TABLA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUI_ID` int(11) NOT NULL,
  `CAMP_ID` int(11) DEFAULT NULL,
  `TABLA_PARTIDOSJUGADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSGANADOS` decimal(5,0) NOT NULL,
  `TABLA_PARTIDOSPERDIDOS` decimal(5,0) NOT NULL,
  `TABLA_GOLESFAVOR` decimal(5,0) NOT NULL,
  `TABLA_GOLESCONTRA` decimal(5,0) NOT NULL,
  `TABLA_PUNTOS` decimal(5,0) NOT NULL,
  PRIMARY KEY (`TABLA_ID`),
  KEY `FK_REFERENCE_19` (`CAMP_ID`),
  KEY `FK_TIENE` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_19` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
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
-- Table structure for table `tipo_campeonato`
--

DROP TABLE IF EXISTS `tipo_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_campeonato` (
  `TIPOCAMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIPOCAMP_TIPO` char(40) NOT NULL,
  PRIMARY KEY (`TIPOCAMP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
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

-- Dump completed on 2020-01-29 11:10:21
