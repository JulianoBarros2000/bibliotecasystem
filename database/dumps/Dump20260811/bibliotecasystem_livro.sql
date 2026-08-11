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
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `id_livro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `ano_publicacao` year(4) DEFAULT NULL,
  `editora` varchar(150) DEFAULT NULL,
  `idioma` varchar(50) DEFAULT 'Português',
  `descricao` text DEFAULT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_livro`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `idx_livro_titulo` (`titulo`),
  KEY `idx_livro_isbn` (`isbn`),
  KEY `idx_livro_categoria` (`id_categoria`),
  KEY `idx_livro_categoria_status` (`id_categoria`,`status`),
  CONSTRAINT `fk_livro_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Clean Code','9780132350884',2008,'Prentice Hall','Português','Boas práticas para desenvolvimento de software.',5,'2026-08-11 18:18:03',1),(2,'Refactoring','9780134757599',2018,'Addison-Wesley','Inglês','Técnicas de refatoração de código.',5,'2026-08-11 18:18:03',1),(3,'Introduction to Algorithms','9780262046305',2022,'MIT Press','Inglês','Introdução aos principais algoritmos.',2,'2026-08-11 18:18:03',1),(4,'Computer Networks','9780132126953',2010,'Pearson','Inglês','Fundamentos de redes de computadores.',4,'2026-08-11 18:18:03',1),(5,'Database System Concepts','9780078022159',2019,'McGraw-Hill','Inglês','Conceitos fundamentais de bases de dados.',3,'2026-08-11 18:18:03',1),(6,'Sistemas de Banco de Dados','9788535211078',2005,'Pearson','Português','Fundamentos de sistemas de bases de dados.',3,'2026-08-11 18:18:03',1),(7,'Algoritmos e Programação','9789727228124',2015,'FCA','Português','Fundamentos de algoritmos e programação.',2,'2026-08-11 18:18:03',1),(8,'Engenharia de Software','9788543002127',2015,'Pearson','Português','Princípios de engenharia de software.',5,'2026-08-11 18:18:03',1),(9,'1984','9780451524935',1949,'Secker & Warburg','Português','Romance distópico clássico.',6,'2026-08-11 18:18:03',1),(10,'Dom Casmurro','9788520923655',0000,'Nova Fronteira','Português','Clássico da literatura brasileira.',6,'2026-08-11 18:18:03',1),(11,'Sapiens','9780062316097',2011,'Harper','Português','Uma breve história da humanidade.',7,'2026-08-11 18:18:03',1),(12,'Uma Breve História do Tempo','9780553380163',1988,'Bantam','Português','Introdução à cosmologia moderna.',9,'2026-08-11 18:18:03',1),(13,'Hábitos Atômicos','9780735211292',2018,'Avery','Português','Estratégias para criação de bons hábitos.',10,'2026-08-11 18:18:03',1),(14,'Inteligência Emocional','9780553383713',1995,'Bantam','Português','Conceitos de inteligência emocional.',10,'2026-08-11 18:18:03',1),(15,'Matemática Fundamental','9788521634239',2018,'Atual','Português','Fundamentos de matemática.',8,'2026-08-11 18:18:03',1);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 19:31:41
