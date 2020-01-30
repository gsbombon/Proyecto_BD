-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonatobd
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES (1,'Nestor Camilo','Pitana Maldonado','0898371728'),(2,'Carlos','Villareal','0987362122');
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
  `Estado` int(11) NOT NULL,
  PRIMARY KEY (`ENCUENTRO_ID`),
  KEY `FK_REFERENCE_17` (`EQUI_ID`),
  KEY `FK_REFERENCE_18` (`PARTIDO_ID`),
  CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`PARTIDO_ID`) REFERENCES `partido` (`PARTIDO_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuentro`
--

LOCK TABLES `encuentro` WRITE;
/*!40000 ALTER TABLE `encuentro` DISABLE KEYS */;
INSERT INTO `encuentro` VALUES (181,1,157,1,0,1),(182,6,157,3,3,1),(183,2,158,3,3,1),(184,5,158,1,0,1),(185,3,159,2,0,1),(186,4,159,5,3,1),(187,1,160,0,0,0),(188,5,160,0,0,0),(189,6,161,4,6,0),(190,4,161,4,6,0),(191,2,162,0,0,0),(192,3,162,0,0,0),(193,1,163,0,0,0),(194,4,163,0,0,0),(195,5,164,0,0,0),(196,3,164,0,0,0),(197,6,165,0,0,0),(198,2,165,0,0,0),(199,1,166,2,0,1),(200,3,166,7,3,1),(201,4,167,0,0,0),(202,2,167,0,0,0),(203,5,168,0,0,0),(204,6,168,0,0,0),(205,1,169,0,0,0),(206,2,169,0,0,0),(207,3,170,0,0,0),(208,6,170,0,0,0),(209,4,171,0,0,0),(210,5,171,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1,'Necaxa','necaxa@gmail.com','Yo le voy al Necaxa x100pre'),(2,1,'Barcelonash','barcelona@falso.com','Saqueo saqueo saqueo'),(3,1,'Peñarol','peñarol@gmail.com','Que las fuerza les acompañe'),(4,1,'Nuevos Horizontes','nh@hotmail.com','No se que poner mi pex'),(5,1,'America','america@charool.com','El deporte amemos nuestras nobles virtudes'),(6,1,'Falsooo','edwin.@fabrin.com','squeoossss');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada`
--

LOCK TABLES `jornada` WRITE;
/*!40000 ALTER TABLE `jornada` DISABLE KEYS */;
INSERT INTO `jornada` VALUES (1,1,0,'2020-03-13'),(2,1,1,'2020-03-13'),(3,1,2,'2020-03-13'),(4,1,3,'2020-03-13'),(5,1,4,'2020-03-13');
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_partido`
--

LOCK TABLES `jornada_partido` WRITE;
/*!40000 ALTER TABLE `jornada_partido` DISABLE KEYS */;
INSERT INTO `jornada_partido` VALUES (133,1,157,1),(134,1,158,1),(135,1,159,1),(136,1,160,2),(137,1,161,2),(138,1,162,2),(139,1,163,3),(140,1,164,3),(141,1,165,3),(142,1,166,4),(143,1,167,4),(144,1,168,4),(145,1,169,5),(146,1,170,5),(147,1,171,5);
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
  `DORSAL` int(11) NOT NULL,
  `JUG_FECHANACIMIENTO` date NOT NULL,
  PRIMARY KEY (`JUG_ID`),
  KEY `FK_REFERENCE_21` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_21` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,3,'Steven','Bombon',10,'1998-10-08'),(2,3,'Steven','Bombon',10,'1998-10-08');
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
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES (1,1,1,1,'10:00:00'),(2,1,1,1,'12:00:00'),(3,1,1,1,'14:00:00'),(4,1,1,1,'02:00:00'),(5,1,1,1,'18:00:00'),(6,1,1,1,'18:00:00'),(7,1,1,1,'18:00:00'),(8,1,1,1,'18:00:00'),(9,1,1,1,'18:00:00'),(10,1,1,1,'18:00:00'),(11,1,1,1,'18:00:00'),(12,1,1,1,'18:00:00'),(13,1,1,1,'18:00:00'),(14,1,1,1,'18:00:00'),(15,1,1,1,'18:00:00'),(16,1,1,1,'18:00:00'),(17,1,1,1,'18:00:00'),(18,1,1,1,'18:00:00'),(19,1,1,1,'18:00:00'),(20,1,1,1,'18:00:00'),(21,1,1,1,'18:00:00'),(22,1,1,1,'18:00:00'),(23,1,1,1,'18:00:00'),(24,1,1,1,'18:00:00'),(25,1,1,1,'18:00:00'),(26,1,1,1,'18:00:00'),(27,1,1,1,'18:00:00'),(28,1,1,1,'18:00:00'),(29,1,1,1,'18:00:00'),(30,1,1,1,'18:00:00'),(31,1,1,1,'18:00:00'),(32,1,1,1,'18:00:00'),(33,1,1,1,'18:00:00'),(34,1,1,1,'18:00:00'),(35,1,1,1,'18:00:00'),(36,1,1,1,'18:00:00'),(37,1,1,1,'18:00:00'),(38,1,1,1,'18:00:00'),(39,1,1,1,'18:00:00'),(40,1,1,1,'18:00:00'),(41,1,1,1,'18:00:00'),(42,1,1,1,'18:00:00'),(43,1,1,1,'18:00:00'),(44,1,1,1,'18:00:00'),(45,1,1,1,'18:00:00'),(46,1,1,1,'18:00:00'),(47,1,1,1,'18:00:00'),(48,1,1,1,'18:00:00'),(49,1,1,1,'18:00:00'),(50,1,1,1,'18:00:00'),(51,1,1,1,'18:00:00'),(52,1,1,1,'18:00:00'),(53,1,1,1,'18:00:00'),(54,1,1,1,'18:00:00'),(55,1,1,1,'18:00:00'),(56,1,1,1,'18:00:00'),(57,1,1,1,'18:00:00'),(58,1,1,1,'18:00:00'),(59,1,1,1,'18:00:00'),(60,1,1,1,'18:00:00'),(61,1,1,1,'18:00:00'),(62,1,1,1,'18:00:00'),(63,1,1,1,'18:00:00'),(64,1,1,1,'18:00:00'),(65,1,1,1,'18:00:00'),(66,1,1,1,'18:00:00'),(67,1,1,1,'18:00:00'),(68,1,1,1,'18:00:00'),(69,1,1,1,'18:00:00'),(70,1,1,1,'18:00:00'),(71,1,1,1,'18:00:00'),(72,1,1,1,'18:00:00'),(73,1,1,1,'18:00:00'),(74,1,1,1,'18:00:00'),(75,1,1,1,'18:00:00'),(76,1,1,1,'18:00:00'),(77,1,1,1,'18:00:00'),(78,1,1,1,'18:00:00'),(79,1,1,1,'18:00:00'),(80,1,1,1,'18:00:00'),(81,1,1,1,'18:00:00'),(82,1,1,1,'18:00:00'),(83,1,1,1,'18:00:00'),(84,1,1,1,'18:00:00'),(85,1,1,1,'18:00:00'),(86,1,1,1,'18:00:00'),(87,1,1,1,'18:00:00'),(88,1,1,1,'18:00:00'),(89,1,1,1,'18:00:00'),(90,1,1,1,'18:00:00'),(91,1,1,1,'18:00:00'),(92,1,1,1,'18:00:00'),(93,1,1,1,'18:00:00'),(94,1,1,1,'18:00:00'),(95,1,1,1,'18:00:00'),(96,1,1,1,'18:00:00'),(97,1,1,1,'18:00:00'),(98,1,1,1,'18:00:00'),(99,1,1,1,'18:00:00'),(100,1,1,1,'18:00:00'),(101,1,1,1,'18:00:00'),(102,1,1,1,'18:00:00'),(103,1,1,1,'18:00:00'),(104,1,1,1,'18:00:00'),(105,1,1,1,'18:00:00'),(106,1,1,1,'18:00:00'),(107,1,1,1,'18:00:00'),(108,1,1,1,'18:00:00'),(109,1,1,1,'18:00:00'),(110,1,1,1,'18:00:00'),(111,1,1,1,'18:00:00'),(112,1,1,1,'18:00:00'),(113,1,1,1,'18:00:00'),(114,1,1,1,'18:00:00'),(115,1,1,1,'18:00:00'),(116,1,1,1,'18:00:00'),(117,1,1,1,'18:00:00'),(118,1,1,1,'18:00:00'),(119,1,1,1,'18:00:00'),(120,1,1,1,'18:00:00'),(121,1,1,1,'18:00:00'),(122,1,1,1,'18:00:00'),(123,1,1,1,'18:00:00'),(124,1,1,1,'18:00:00'),(125,1,1,1,'18:00:00'),(126,1,1,1,'18:00:00'),(127,1,1,1,'18:00:00'),(128,1,1,1,'18:00:00'),(129,1,1,1,'18:00:00'),(130,1,1,1,'18:00:00'),(131,1,1,1,'18:00:00'),(132,1,1,1,'18:00:00'),(133,1,1,1,'18:00:00'),(134,1,1,1,'18:00:00'),(135,1,1,1,'18:00:00'),(136,1,1,1,'18:00:00'),(137,1,1,1,'18:00:00'),(138,1,1,1,'18:00:00'),(139,1,1,1,'18:00:00'),(140,1,1,1,'18:00:00'),(141,1,1,1,'18:00:00'),(142,1,1,1,'18:00:00'),(143,1,1,1,'18:00:00'),(144,1,1,1,'18:00:00'),(145,1,1,1,'18:00:00'),(146,1,1,1,'18:00:00'),(147,1,1,1,'18:00:00'),(148,1,1,1,'18:00:00'),(149,1,1,1,'18:00:00'),(150,1,1,1,'18:00:00'),(151,1,1,1,'18:00:00'),(152,1,1,1,'18:00:00'),(153,1,1,1,'18:00:00'),(154,1,1,1,'18:00:00'),(155,1,1,1,'18:00:00'),(156,1,1,1,'18:00:00'),(157,1,1,1,'18:00:00'),(158,1,1,1,'18:00:00'),(159,1,1,1,'18:00:00'),(160,1,1,1,'18:00:00'),(161,1,1,1,'18:00:00'),(162,1,1,1,'18:00:00'),(163,1,1,1,'18:00:00'),(164,1,1,1,'18:00:00'),(165,1,1,1,'18:00:00'),(166,1,1,1,'18:00:00'),(167,1,1,1,'18:00:00'),(168,1,1,1,'18:00:00'),(169,1,1,1,'18:00:00'),(170,1,1,1,'18:00:00'),(171,1,1,1,'18:00:00');
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
  `TABLA_PARTIDOS_EMPATADOS` int(4) DEFAULT NULL,
  `TABLA_PARTIDOSPERDIDOS` decimal(5,0) NOT NULL,
  `TABLA_GOLESFAVOR` decimal(5,0) NOT NULL,
  `TABLA_PUNTOS` decimal(5,0) NOT NULL,
  PRIMARY KEY (`TABLA_ID`),
  KEY `FK_REFERENCE_19` (`CAMP_ID`),
  KEY `FK_TIENE` (`EQUI_ID`),
  CONSTRAINT `FK_REFERENCE_19` FOREIGN KEY (`CAMP_ID`) REFERENCES `campeonato` (`CAMP_ID`),
  CONSTRAINT `FK_TIENE` FOREIGN KEY (`EQUI_ID`) REFERENCES `equipo` (`EQUI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_posiciones`
--

LOCK TABLES `tabla_posiciones` WRITE;
/*!40000 ALTER TABLE `tabla_posiciones` DISABLE KEYS */;
INSERT INTO `tabla_posiciones` VALUES (1,1,1,2,0,0,2,3,0),(2,2,1,1,1,0,0,3,3),(3,3,1,2,1,0,1,9,3),(4,4,1,1,1,0,0,5,3);
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
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(30) NOT NULL,
  `usu_correo` varchar(30) NOT NULL,
  `usu_password` varchar(30) NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Steven Bombon','gsbt08@outlook.com','12345678');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'campeonatobd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-30  3:04:45
