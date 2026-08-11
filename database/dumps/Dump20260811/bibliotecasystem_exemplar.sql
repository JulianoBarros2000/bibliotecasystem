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
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplar` (
  `id_exemplar` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_exemplar` varchar(30) NOT NULL,
  `localizacao` varchar(100) DEFAULT NULL,
  `estado_conservacao` enum('Bom','Regular','Danificado','Perdido') NOT NULL DEFAULT 'Bom',
  `status` enum('Disponivel','Emprestado','Manutencao','Inativo') NOT NULL DEFAULT 'Disponivel',
  `data_aquisicao` date DEFAULT NULL,
  `id_livro` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_exemplar`),
  UNIQUE KEY `codigo_exemplar` (`codigo_exemplar`),
  KEY `idx_exemplar_codigo` (`codigo_exemplar`),
  KEY `idx_exemplar_livro` (`id_livro`),
  KEY `idx_exemplar_status` (`status`),
  KEY `idx_exemplar_livro_status` (`id_livro`,`status`),
  CONSTRAINT `fk_exemplar_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

LOCK TABLES `exemplar` WRITE;
/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
INSERT INTO `exemplar` VALUES (1,'EX001','Estante A01','Bom','Emprestado','2025-01-10',1),(2,'EX002','Estante A01','Bom','Disponivel','2025-01-10',1),(3,'EX003','Estante A02','Bom','Disponivel','2025-01-15',2),(4,'EX004','Estante A03','Bom','Disponivel','2025-02-01',3),(5,'EX005','Estante A03','Bom','Disponivel','2025-02-01',3),(6,'EX006','Estante B01','Bom','Emprestado','2025-02-05',4),(7,'EX007','Estante B02','Bom','Emprestado','2025-02-10',5),(8,'EX008','Estante B02','Regular','Disponivel','2025-02-10',5),(9,'EX009','Estante B03','Bom','Emprestado','2025-02-15',6),(10,'EX010','Estante C01','Bom','Emprestado','2025-03-01',7),(11,'EX011','Estante C01','Bom','Disponivel','2025-03-01',8),(12,'EX012','Estante C02','Bom','Emprestado','2025-03-05',9),(13,'EX013','Estante C03','Regular','Emprestado','2025-03-05',10),(14,'EX014','Estante D01','Bom','Disponivel','2025-03-10',11),(15,'EX015','Estante D01','Bom','Disponivel','2025-03-10',12),(16,'EX016','Estante D02','Bom','Disponivel','2025-03-15',13),(17,'EX017','Estante D02','Bom','Disponivel','2025-03-15',14),(18,'EX018','Estante D03','Regular','Disponivel','2025-03-20',15),(19,'EX019','Estante A04','Bom','Disponivel','2025-04-01',4),(20,'EX020','Estante B04','Bom','Disponivel','2025-04-01',8);
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 19:31:39
