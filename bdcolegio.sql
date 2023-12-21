CREATE DATABASE  IF NOT EXISTS `colegio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `colegio`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: colegio
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aula` (
  `id_aula` int NOT NULL AUTO_INCREMENT,
  `número` varchar(10) NOT NULL,
  `capacidad` int NOT NULL,
  `ubicación` varchar(255) NOT NULL,
  PRIMARY KEY (`id_aula`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,'Aula01',29,'U1'),(2,'Aula02',31,'U2'),(3,'Aula03',35,'U3'),(4,'Aula04',28,'U4'),(5,'Aula05',35,'U5'),(6,'Aula06',33,'U6'),(7,'Aula07',28,'U7'),(8,'Aula08',31,'U8'),(9,'Aula09',30,'U9'),(10,'Aula10',26,'U10'),(11,'Aula11',35,'U11'),(12,'Aula12',31,'U12'),(13,'Aula13',31,'U13'),(14,'Aula14',35,'U14'),(15,'Aula15',33,'U15'),(16,'Aula16',34,'U16'),(17,'Aula17',29,'U17'),(18,'Aula18',27,'U18'),(19,'Aula19',27,'U19'),(20,'Aula20',30,'U20'),(21,'Aula21',28,'U21'),(22,'Aula22',27,'U22'),(23,'Aula23',28,'U23'),(24,'Aula24',35,'U24'),(25,'Aula25',31,'U25');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `id_nivel` int NOT NULL,
  `id_grado` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `id_nivel` (`id_nivel`),
  KEY `id_grado` (`id_grado`),
  CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`),
  CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`id_grado`) REFERENCES `grado` (`id_grado`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'PRIMERO DE PRIMARIA YELLOW','1PRI',1,1),(2,'PRIMERO DE PRIMARIA BLUE','1PRI',1,1),(3,'PRIMERO DE PRIMARIA RED','1PRI',1,1),(4,'SEGUNDO DE PRIMARIA YELLOW','2PRI',1,2),(5,'SEGUNDO DE PRIMARIA BLUE','2PRI',1,2),(6,'SEGUNDO DE PRIMARIA RED','2PRI',1,2),(7,'TERCERO DE PRIMARIA YELLOW','3PRI',1,3),(8,'TERCERO DE PRIMARIA BLUE','3PRI',1,3),(9,'TERCERO DE PRIMARIA RED','3PRI',1,3),(10,'CUARTO DE PRIMARIA YELLOW','4PRI',1,4),(11,'CUARTO DE PRIMARIA BLUE','4PRI',1,4),(12,'CUARTO DE PRIMARIA RED','4PRI',1,4),(13,'QUINTO DE PRIMARIA YELLOW','5PRI',1,5),(14,'QUINTO DE PRIMARIA BLUE','5PRI',1,5),(15,'QUINTO DE PRIMARIA RED','5PRI',1,5),(16,'SEXTO DE PRIMARIA YELLOW','6PRI',1,6),(17,'SEXTO DE PRIMARIA BLUE','6PRI',1,6),(18,'SEXTO DE PRIMARIA RED','6PRI',1,6),(19,'PRIMERO DE SECUNDARIA YELLOW','1SEC',2,1),(20,'PRIMERO DE SECUNDARIA BLUE','1SEC',2,1),(21,'PRIMERO DE SECUNDARIA RED','1SEC',2,1),(22,'SEGUNDO DE SECUNDARIA YELLOW','2SEC',2,2),(23,'SEGUNDO DE SECUNDARIA BLUE','2SEC',2,2),(24,'SEGUNDO DE SECUNDARIA RED','2SEC',2,2),(25,'TERCERO DE SECUNDARIA YELLOW','3SEC',2,3),(26,'TERCERO DE SECUNDARIA BLUE','3SEC',2,3),(27,'TERCERO DE SECUNDARIA RED','3SEC',2,3),(28,'CUARTO DE SECUNDARIA YELLOW','4SEC',2,4),(29,'CUARTO DE SECUNDARIA BLUE','4SEC',2,4),(30,'CUARTO DE SECUNDARIA RED','4SEC',2,4),(31,'QUINTO DE SECUNDARIA YELLOW','5SEC',2,5),(32,'QUINTO DE SECUNDARIA BLUE','5SEC',2,5),(33,'QUINTO DE SECUNDARIA RED','5SEC',2,5);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_materia`
--

DROP TABLE IF EXISTS `curso_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_materia` (
  `id_curso_materia` int NOT NULL AUTO_INCREMENT,
  `id_curso` int NOT NULL,
  `id_materia` int NOT NULL,
  `periodos_semanales` int NOT NULL,
  PRIMARY KEY (`id_curso_materia`),
  KEY `id_curso` (`id_curso`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `curso_materia_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `curso_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_materia`
--

LOCK TABLES `curso_materia` WRITE;
/*!40000 ALTER TABLE `curso_materia` DISABLE KEYS */;
INSERT INTO `curso_materia` VALUES (1,1,1,4),(2,1,2,4),(3,1,3,4),(4,1,4,4),(5,1,5,4),(6,1,6,4),(7,1,7,4),(8,1,8,4),(9,1,9,4),(10,1,10,4),(11,2,1,4),(12,2,2,4),(13,2,3,4),(14,2,4,4),(15,2,5,4),(16,2,6,4),(17,2,7,4),(18,2,8,4),(19,2,9,4),(20,2,10,4),(21,3,1,4),(22,3,2,4),(23,3,3,4),(24,3,4,4),(25,3,5,4),(26,3,6,4),(27,3,7,4),(28,3,8,4),(29,3,9,4),(30,3,10,4),(31,4,11,4),(32,4,12,4),(33,4,13,4),(34,4,14,4),(35,4,15,4),(36,4,16,4),(37,4,17,4),(38,4,18,4),(39,4,19,4),(40,4,20,4),(41,5,11,4),(42,5,12,4),(43,5,13,4),(44,5,14,4),(45,5,15,4),(46,5,16,4),(47,5,17,4),(48,5,18,4),(49,5,19,4),(50,5,20,4),(51,6,11,4),(52,6,12,4),(53,6,13,4),(54,6,14,4),(55,6,15,4),(56,6,16,4),(57,6,17,4),(58,6,18,4),(59,6,19,4),(60,6,20,4),(61,7,21,4),(62,7,22,4),(63,7,23,4),(64,7,24,4),(65,7,25,4),(66,7,26,4),(67,7,27,4),(68,7,28,4),(69,7,29,4),(70,7,30,4),(71,8,21,4),(72,8,22,4),(73,8,23,4),(74,8,24,4),(75,8,25,4),(76,8,26,4),(77,8,27,4),(78,8,28,4),(79,8,29,4),(80,8,30,4),(81,9,21,4),(82,9,22,4),(83,9,23,4),(84,9,24,4),(85,9,25,4),(86,9,26,4),(87,9,27,4),(88,9,28,4),(89,9,29,4),(90,9,30,4),(91,10,31,4),(92,10,32,4),(93,10,33,4),(94,10,34,4),(95,10,35,4),(96,10,36,4),(97,10,37,4),(98,10,38,4),(99,10,39,4),(100,10,40,4),(101,11,31,4),(102,11,32,4),(103,11,33,4),(104,11,34,4),(105,11,35,4),(106,11,36,4),(107,11,37,4),(108,11,38,4),(109,11,39,4),(110,11,40,4),(111,12,31,4),(112,12,32,4),(113,12,33,4),(114,12,34,4),(115,12,35,4),(116,12,36,4),(117,12,37,4),(118,12,38,4),(119,12,39,4),(120,12,40,4),(121,13,41,4),(122,13,42,4),(123,13,43,4),(124,13,44,4),(125,13,45,4),(126,13,46,4),(127,13,47,4),(128,13,48,4),(129,13,49,4),(130,13,50,4),(131,14,41,4),(132,14,42,4),(133,14,43,4),(134,14,44,4),(135,14,45,4),(136,14,46,4),(137,14,47,4),(138,14,48,4),(139,14,49,4),(140,14,50,4),(141,15,41,4),(142,15,42,4),(143,15,43,4),(144,15,44,4),(145,15,45,4),(146,15,46,4),(147,15,47,4),(148,15,48,4),(149,15,49,4),(150,15,50,4),(151,16,51,4),(152,16,52,4),(153,16,53,4),(154,16,54,4),(155,16,55,4),(156,16,56,4),(157,16,57,4),(158,16,58,4),(159,16,59,4),(160,16,60,4),(161,17,51,4),(162,17,52,4),(163,17,53,4),(164,17,54,4),(165,17,55,4),(166,17,56,4),(167,17,57,4),(168,17,58,4),(169,17,59,4),(170,17,60,4),(171,18,51,4),(172,18,52,4),(173,18,53,4),(174,18,54,4),(175,18,55,4),(176,18,56,4),(177,18,57,4),(178,18,58,4),(179,18,59,4),(180,18,60,4),(181,19,61,4),(182,19,62,4),(183,19,63,4),(184,19,64,4),(185,19,65,4),(186,19,66,4),(187,19,67,4),(188,19,68,4),(189,19,69,4),(190,19,70,4),(191,20,61,4),(192,20,62,4),(193,20,63,4),(194,20,64,4),(195,20,65,4),(196,20,66,4),(197,20,67,4),(198,20,68,4),(199,20,69,4),(200,20,70,4),(201,21,61,4),(202,21,62,4),(203,21,63,4),(204,21,64,4),(205,21,65,4),(206,21,66,4),(207,21,67,4),(208,21,68,4),(209,21,69,4),(210,21,70,4),(211,22,71,4),(212,22,72,4),(213,22,73,4),(214,22,74,4),(215,22,75,4),(216,22,76,4),(217,22,77,4),(218,22,78,4),(219,22,79,4),(220,22,80,4),(221,23,71,4),(222,23,72,4),(223,23,73,4),(224,23,74,4),(225,23,75,4),(226,23,76,4),(227,23,77,4),(228,23,78,4),(229,23,79,4),(230,23,80,4),(231,24,71,4),(232,24,72,4),(233,24,73,4),(234,24,74,4),(235,24,75,4),(236,24,76,4),(237,24,77,4),(238,24,78,4),(239,24,79,4),(240,24,80,4),(241,25,81,4),(242,25,82,4),(243,25,83,4),(244,25,84,4),(245,25,85,4),(246,25,86,4),(247,25,87,4),(248,25,88,4),(249,25,89,4),(250,25,90,4),(251,26,81,4),(252,26,82,4),(253,26,83,4),(254,26,84,4),(255,26,85,4),(256,26,86,4),(257,26,87,4),(258,26,88,4),(259,26,89,4),(260,26,90,4),(261,27,81,4),(262,27,82,4),(263,27,83,4),(264,27,84,4),(265,27,85,4),(266,27,86,4),(267,27,87,4),(268,27,88,4),(269,27,89,4),(270,27,90,4),(271,28,91,4),(272,28,92,4),(273,28,93,4),(274,28,94,4),(275,28,95,4),(276,28,96,4),(277,28,97,4),(278,28,98,4),(279,28,99,4),(280,28,100,4),(281,29,91,4),(282,29,92,4),(283,29,93,4),(284,29,94,4),(285,29,95,4),(286,29,96,4),(287,29,97,4),(288,29,98,4),(289,29,99,4),(290,29,100,4),(291,30,91,4),(292,30,92,4),(293,30,93,4),(294,30,94,4),(295,30,95,4),(296,30,96,4),(297,30,97,4),(298,30,98,4),(299,30,99,4),(300,30,100,4),(301,31,101,4),(302,31,102,4),(303,31,103,4),(304,31,104,4),(305,31,105,4),(306,31,106,4),(307,31,107,4),(308,31,108,4),(309,31,109,4),(310,31,110,4),(311,32,101,4),(312,32,102,4),(313,32,103,4),(314,32,104,4),(315,32,105,4),(316,32,106,4),(317,32,107,4),(318,32,108,4),(319,32,109,4),(320,32,110,4),(321,33,101,4),(322,33,102,4),(323,33,103,4),(324,33,104,4),(325,33,105,4),(326,33,106,4),(327,33,107,4),(328,33,108,4),(329,33,109,4),(330,33,110,4);
/*!40000 ALTER TABLE `curso_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia` (
  `id_dia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  PRIMARY KEY (`id_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia`
--

LOCK TABLES `dia` WRITE;
/*!40000 ALTER TABLE `dia` DISABLE KEYS */;
INSERT INTO `dia` VALUES (1,'Lunes','Lu'),(2,'Martes','Ma'),(3,'Miércoles','Mi'),(4,'Jueves','Ju'),(5,'Viernes','Vi');
/*!40000 ALTER TABLE `dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `id_grado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `id_nivel` int NOT NULL,
  PRIMARY KEY (`id_grado`),
  KEY `id_nivel` (`id_nivel`),
  CONSTRAINT `grado_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'PRIMERO DE PRIMARIA','1ro PRI',1),(2,'SEGUNDO DE PRIMARIA','2do PRI',1),(3,'TERCERO DE PRIMARIA','3ro PRI',1),(4,'CUARTO DE PRIMARIA','4to PRI',1),(5,'QUINTO DE PRIMARIA','5to PRI',1),(6,'SEXTO DE PRIMARIA','6to PRI',1),(7,'PRIMERO DE SECUNDARIA','1ro SEC',2),(8,'SEGUNDO DE SECUNDARIA','2do SEC',2),(9,'TERCERO DE SECUNDARIA','3ro SEC',2),(10,'CUARTO DE SECUNDARIA','4to SEC',2),(11,'QUINTO DE SECUNDARIA','5to SEC',2);
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `gestion` int NOT NULL,
  `id_dia` int NOT NULL,
  `id_periodo` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_aula` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_dia` (`id_dia`),
  KEY `id_periodo` (`id_periodo`),
  KEY `id_materia` (`id_materia`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_aula` (`id_aula`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id_dia`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`),
  CONSTRAINT `horario_ibfk_3` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `horario_ibfk_4` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `horario_ibfk_5` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`),
  CONSTRAINT `horario_ibfk_6` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_prueba`
--

DROP TABLE IF EXISTS `horario_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_prueba` (
  `id_horario` int NOT NULL AUTO_INCREMENT,
  `gestion` int NOT NULL,
  `id_dia` int NOT NULL,
  `id_periodo` int NOT NULL,
  `id_materia` int NOT NULL,
  `id_profesor` int NOT NULL,
  `id_aula` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_dia` (`id_dia`),
  KEY `id_periodo` (`id_periodo`),
  KEY `id_materia` (`id_materia`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_aula` (`id_aula`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `horario_ibfk_10` FOREIGN KEY (`id_dia`) REFERENCES `dia` (`id_dia`),
  CONSTRAINT `horario_ibfk_20` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`),
  CONSTRAINT `horario_ibfk_30` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`),
  CONSTRAINT `horario_ibfk_40` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `horario_ibfk_50` FOREIGN KEY (`id_aula`) REFERENCES `aula` (`id_aula`),
  CONSTRAINT `horario_ibfk_60` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_prueba`
--

LOCK TABLES `horario_prueba` WRITE;
/*!40000 ALTER TABLE `horario_prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `nivel` varchar(255) NOT NULL,
  `grado` varchar(255) NOT NULL,
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Materia 1 - 1eroPRI','MAT1eroPRI','1','1'),(2,'Materia 2 - 1eroPRI','MAT1eroPRI','1','1'),(3,'Materia 3 - 1eroPRI','MAT1eroPRI','1','1'),(4,'Materia 4 - 1eroPRI','MAT1eroPRI','1','1'),(5,'Materia 5 - 1eroPRI','MAT1eroPRI','1','1'),(6,'Materia 6 - 1eroPRI','MAT1eroPRI','1','1'),(7,'Materia 7 - 1eroPRI','MAT1eroPRI','1','1'),(8,'Materia 8 - 1eroPRI','MAT1eroPRI','1','1'),(9,'Materia 9 - 1eroPRI','MAT1eroPRI','1','1'),(10,'Materia 10 - 1eroPRI','MAT1eroPRI','1','1'),(11,'Materia 11 - 2doPRI','MAT2doPRI','1','2'),(12,'Materia 12 - 2doPRI','MAT2doPRI','1','2'),(13,'Materia 13 - 2doPRI','MAT2doPRI','1','2'),(14,'Materia 14 - 2doPRI','MAT2doPRI','1','2'),(15,'Materia 15 - 2doPRI','MAT2doPRI','1','2'),(16,'Materia 16 - 2doPRI','MAT2doPRI','1','2'),(17,'Materia 17 - 2doPRI','MAT2doPRI','1','2'),(18,'Materia 18 - 2doPRI','MAT2doPRI','1','2'),(19,'Materia 19 - 2doPRI','MAT2doPRI','1','2'),(20,'Materia 20 - 2doPRI','MAT2doPRI','1','2'),(21,'Materia 21 - 3roPRI','MAT3roPRI','1','3'),(22,'Materia 22 - 3roPRI','MAT3roPRI','1','3'),(23,'Materia 23 - 3roPRI','MAT3roPRI','1','3'),(24,'Materia 24 - 3roPRI','MAT3roPRI','1','3'),(25,'Materia 25 - 3roPRI','MAT3roPRI','1','3'),(26,'Materia 26 - 3roPRI','MAT3roPRI','1','3'),(27,'Materia 27 - 3roPRI','MAT3roPRI','1','3'),(28,'Materia 28 - 3roPRI','MAT3roPRI','1','3'),(29,'Materia 29 - 3roPRI','MAT3roPRI','1','3'),(30,'Materia 30 - 3roPRI','MAT3roPRI','1','3'),(31,'Materia 31 - 4toPRI','MAT4toPRI','1','4'),(32,'Materia 32 - 4toPRI','MAT4toPRI','1','4'),(33,'Materia 33 - 4toPRI','MAT4toPRI','1','4'),(34,'Materia 34 - 4toPRI','MAT4toPRI','1','4'),(35,'Materia 35 - 4toPRI','MAT4toPRI','1','4'),(36,'Materia 36 - 4toPRI','MAT4toPRI','1','4'),(37,'Materia 37 - 4toPRI','MAT4toPRI','1','4'),(38,'Materia 38 - 4toPRI','MAT4toPRI','1','4'),(39,'Materia 39 - 4toPRI','MAT4toPRI','1','4'),(40,'Materia 40 - 4toPRI','MAT4toPRI','1','4'),(41,'Materia 41 - 5toPRI','MAT5toPRI','1','5'),(42,'Materia 42 - 5toPRI','MAT5toPRI','1','5'),(43,'Materia 43 - 5toPRI','MAT5toPRI','1','5'),(44,'Materia 44 - 5toPRI','MAT5toPRI','1','5'),(45,'Materia 45 - 5toPRI','MAT5toPRI','1','5'),(46,'Materia 46 - 5toPRI','MAT5toPRI','1','5'),(47,'Materia 47 - 5toPRI','MAT5toPRI','1','5'),(48,'Materia 48 - 5toPRI','MAT5toPRI','1','5'),(49,'Materia 49 - 5toPRI','MAT5toPRI','1','5'),(50,'Materia 50 - 5toPRI','MAT5toPRI','1','5'),(51,'Materia 51 - 6toPRI','MAT6toPRI','1','6'),(52,'Materia 52 - 6toPRI','MAT6toPRI','1','6'),(53,'Materia 53 - 6toPRI','MAT6toPRI','1','6'),(54,'Materia 54 - 6toPRI','MAT6toPRI','1','6'),(55,'Materia 55 - 6toPRI','MAT6toPRI','1','6'),(56,'Materia 56 - 6toPRI','MAT6toPRI','1','6'),(57,'Materia 57 - 6toPRI','MAT6toPRI','1','6'),(58,'Materia 58 - 6toPRI','MAT6toPRI','1','6'),(59,'Materia 59 - 6toPRI','MAT6toPRI','1','6'),(60,'Materia 60 - 6toPRI','MAT6toPRI','1','6'),(61,'Materia 61 - 1eroSEC','MAT1eroSEC','2','1'),(62,'Materia 62 - 1eroSEC','MAT1eroSEC','2','1'),(63,'Materia 63 - 1eroSEC','MAT1eroSEC','2','1'),(64,'Materia 64 - 1eroSEC','MAT1eroSEC','2','1'),(65,'Materia 65 - 1eroSEC','MAT1eroSEC','2','1'),(66,'Materia 66 - 1eroSEC','MAT1eroSEC','2','1'),(67,'Materia 67 - 1eroSEC','MAT1eroSEC','2','1'),(68,'Materia 68 - 1eroSEC','MAT1eroSEC','2','1'),(69,'Materia 69 - 1eroSEC','MAT1eroSEC','2','1'),(70,'Materia 70 - 1eroSEC','MAT1eroSEC','2','1'),(71,'Materia 71 - 2doSEC','MAT2doSEC','2','2'),(72,'Materia 72 - 2doSEC','MAT2doSEC','2','2'),(73,'Materia 73 - 2doSEC','MAT2doSEC','2','2'),(74,'Materia 74 - 2doSEC','MAT2doSEC','2','2'),(75,'Materia 75 - 2doSEC','MAT2doSEC','2','2'),(76,'Materia 76 - 2doSEC','MAT2doSEC','2','2'),(77,'Materia 77 - 2doSEC','MAT2doSEC','2','2'),(78,'Materia 78 - 2doSEC','MAT2doSEC','2','2'),(79,'Materia 79 - 2doSEC','MAT2doSEC','2','2'),(80,'Materia 80 - 2doSEC','MAT2doSEC','2','2'),(81,'Materia 81 - 3roSEC','MAT3roSEC','2','3'),(82,'Materia 82 - 3roSEC','MAT3roSEC','2','3'),(83,'Materia 83 - 3roSEC','MAT3roSEC','2','3'),(84,'Materia 84 - 3roSEC','MAT3roSEC','2','3'),(85,'Materia 85 - 3roSEC','MAT3roSEC','2','3'),(86,'Materia 86 - 3roSEC','MAT3roSEC','2','3'),(87,'Materia 87 - 3roSEC','MAT3roSEC','2','3'),(88,'Materia 88 - 3roSEC','MAT3roSEC','2','3'),(89,'Materia 89 - 3roSEC','MAT3roSEC','2','3'),(90,'Materia 90 - 3roSEC','MAT3roSEC','2','3'),(91,'Materia 91 - 4toSEC','MAT4toSEC','2','4'),(92,'Materia 92 - 4toSEC','MAT4toSEC','2','4'),(93,'Materia 93 - 4toSEC','MAT4toSEC','2','4'),(94,'Materia 94 - 4toSEC','MAT4toSEC','2','4'),(95,'Materia 95 - 4toSEC','MAT4toSEC','2','4'),(96,'Materia 96 - 4toSEC','MAT4toSEC','2','4'),(97,'Materia 97 - 4toSEC','MAT4toSEC','2','4'),(98,'Materia 98 - 4toSEC','MAT4toSEC','2','4'),(99,'Materia 99 - 4toSEC','MAT4toSEC','2','4'),(100,'Materia 100 - 4toSEC','MAT4toSEC','2','4'),(101,'Materia 101 - 5toSEC','MAT5toSEC','2','5'),(102,'Materia 102 - 5toSEC','MAT5toSEC','2','5'),(103,'Materia 103 - 5toSEC','MAT5toSEC','2','5'),(104,'Materia 104 - 5toSEC','MAT5toSEC','2','5'),(105,'Materia 105 - 5toSEC','MAT5toSEC','2','5'),(106,'Materia 106 - 5toSEC','MAT5toSEC','2','5'),(107,'Materia 107 - 5toSEC','MAT5toSEC','2','5'),(108,'Materia 108 - 5toSEC','MAT5toSEC','2','5'),(109,'Materia 109 - 5toSEC','MAT5toSEC','2','5'),(110,'Materia 110 - 5toSEC','MAT5toSEC','2','5');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,'Primaria','PRI'),(2,'Secundaria','SEC');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `id_periodo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `abrev` varchar(10) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES (1,'P1','P1','08:00:00','08:50:00'),(2,'P2','P2','08:55:00','09:40:00'),(3,'P3','P3','09:45:00','10:30:00'),(4,'BREAK','BREAK','10:30:00','10:50:00'),(5,'P4','P4','10:55:00','11:40:00'),(6,'P5','P5','11:45:00','12:30:00'),(7,'LUNCH','LUNCH','12:30:00','13:15:00'),(8,'P6','P6','13:20:00','14:05:00'),(9,'P7','P7','14:10:00','15:00:00');
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id_profesor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`id_profesor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'NombreP1','ApellidoP1'),(2,'NombreP2','ApellidoP2'),(3,'NombreP3','ApellidoP3'),(4,'NombreP4','ApellidoP4'),(5,'NombreP5','ApellidoP5'),(6,'NombreP6','ApellidoP6'),(7,'NombreP7','ApellidoP7'),(8,'NombreP8','ApellidoP8'),(9,'NombreP9','ApellidoP9'),(10,'NombreP10','ApellidoP10'),(11,'NombreP11','ApellidoP11'),(12,'NombreP12','ApellidoP12');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor_materia`
--

DROP TABLE IF EXISTS `profesor_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor_materia` (
  `id_profesor_materia` int NOT NULL AUTO_INCREMENT,
  `id_profesor` int NOT NULL,
  `id_materia` int NOT NULL,
  PRIMARY KEY (`id_profesor_materia`),
  KEY `id_profesor` (`id_profesor`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `profesor_materia_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id_profesor`),
  CONSTRAINT `profesor_materia_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor_materia`
--

LOCK TABLES `profesor_materia` WRITE;
/*!40000 ALTER TABLE `profesor_materia` DISABLE KEYS */;
INSERT INTO `profesor_materia` VALUES (1,8,1),(2,1,2),(3,7,3),(4,1,4),(5,3,5),(6,12,6),(7,11,7),(8,7,8),(9,8,9),(10,11,10),(11,12,11),(12,4,12),(13,5,13),(14,1,14),(15,11,15),(16,10,16),(17,6,17),(18,11,18),(19,5,19),(20,7,20),(21,9,21),(22,9,22),(23,8,23),(24,3,24),(25,5,25),(26,10,26),(27,12,27),(28,9,28),(29,3,29),(30,2,30),(31,7,31),(32,4,32),(33,4,33),(34,7,34),(35,7,35),(36,4,36),(37,9,37),(38,12,38),(39,9,39),(40,12,40),(41,1,41),(42,1,42),(43,8,43),(44,4,44),(45,11,45),(46,1,46),(47,7,47),(48,3,48),(49,9,49),(50,11,50),(51,1,51),(52,5,52),(53,11,53),(54,11,54),(55,2,55),(56,3,56),(57,12,57),(58,8,58),(59,3,59),(60,2,60),(61,9,61),(62,12,62),(63,12,63),(64,9,64),(65,9,65),(66,6,66),(67,4,67),(68,4,68),(69,6,69),(70,9,70),(71,1,71),(72,11,72),(73,12,73),(74,4,74),(75,4,75),(76,2,76),(77,4,77),(78,2,78),(79,6,79),(80,7,80),(81,5,81),(82,9,82),(83,5,83),(84,10,84),(85,3,85),(86,3,86),(87,2,87),(88,4,88),(89,12,89),(90,12,90),(91,3,91),(92,11,92),(93,2,93),(94,8,94),(95,1,95),(96,5,96),(97,1,97),(98,12,98),(99,3,99),(100,6,100),(101,6,101),(102,4,102),(103,10,103),(104,6,104),(105,8,105),(106,12,106),(107,8,107),(108,9,108),(109,9,109),(110,8,110);
/*!40000 ALTER TABLE `profesor_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vnumero_aulas`
--

DROP TABLE IF EXISTS `vnumero_aulas`;
/*!50001 DROP VIEW IF EXISTS `vnumero_aulas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_aulas` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vnumero_cursos`
--

DROP TABLE IF EXISTS `vnumero_cursos`;
/*!50001 DROP VIEW IF EXISTS `vnumero_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_cursos` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vnumero_dias`
--

DROP TABLE IF EXISTS `vnumero_dias`;
/*!50001 DROP VIEW IF EXISTS `vnumero_dias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_dias` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vnumero_materias`
--

DROP TABLE IF EXISTS `vnumero_materias`;
/*!50001 DROP VIEW IF EXISTS `vnumero_materias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_materias` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vnumero_periodos`
--

DROP TABLE IF EXISTS `vnumero_periodos`;
/*!50001 DROP VIEW IF EXISTS `vnumero_periodos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_periodos` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vnumero_profesores`
--

DROP TABLE IF EXISTS `vnumero_profesores`;
/*!50001 DROP VIEW IF EXISTS `vnumero_profesores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vnumero_profesores` AS SELECT 
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'colegio'
--

--
-- Dumping routines for database 'colegio'
--

--
-- Final view structure for view `vnumero_aulas`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_aulas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_aulas` AS select count(0) AS `count(*)` from `aula` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vnumero_cursos`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_cursos` AS select count(0) AS `count(*)` from `curso` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vnumero_dias`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_dias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_dias` AS select count(0) AS `count(*)` from `dia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vnumero_materias`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_materias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_materias` AS select count(0) AS `count(*)` from `materia` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vnumero_periodos`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_periodos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_periodos` AS select count(0) AS `count(*)` from `periodo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vnumero_profesores`
--

/*!50001 DROP VIEW IF EXISTS `vnumero_profesores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vnumero_profesores` AS select count(0) AS `count(*)` from `profesor` */;
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

-- Dump completed on 2023-12-11 18:18:28
