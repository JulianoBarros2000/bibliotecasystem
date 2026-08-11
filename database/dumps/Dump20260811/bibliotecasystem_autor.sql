CREATE DATABASE  IF NOT EXISTS `bibliotecasystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `bibliotecasystem`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bibliotecasystem
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `nacionalidade` varchar(100) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `biografia` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Robert C. Martin','Americana','1952-12-05','Autor e especialista em engenharia de software.',1),(2,'Martin Fowler','Britânica','1963-12-18','Autor e consultor na área de desenvolvimento de software.',1),(3,'Thomas H. Cormen','Americana','1956-06-22','Professor e investigador na área de algoritmos.',1),(4,'Andrew S. Tanenbaum','Americana','1944-03-16','Professor e autor na área de sistemas computacionais.',1),(5,'Abraham Silberschatz','Americana','1952-05-15','Autor de referência em sistemas operacionais e bases de dados.',1),(6,'Henry F. Korth','Americana','1956-01-01','Investigador e autor na área de bases de dados.',1),(7,'Elmasri Ramez','Egípcia','1951-01-01','Especialista em sistemas de bases de dados.',1),(8,'Carlos Alberto Heuser','Brasileira','1953-01-01','Autor brasileiro na área de bases de dados.',1),(9,'José Carlos Ramalho','Portuguesa','1960-01-01','Autor e professor na área de programação.',1),(10,'George Orwell','Britânica','1903-06-25','Escritor e jornalista britânico.',1),(11,'Machado de Assis','Brasileira','1839-06-21','Escritor brasileiro e um dos maiores nomes da literatura.',1),(12,'Yuval Noah Harari','Israelita','1976-02-24','Historiador e escritor.',1),(13,'Stephen Hawking','Britânica','1942-01-08','Físico teórico e autor de divulgação científica.',1),(14,'James Clear','Americana','1986-01-01','Autor conhecido por trabalhos sobre hábitos.',1),(15,'Daniel Goleman','Americana','1946-03-07','Autor e psicólogo especializado em inteligência emocional.',1);
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 19:31:40
