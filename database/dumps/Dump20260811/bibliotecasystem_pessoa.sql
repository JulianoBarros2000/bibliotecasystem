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
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `id_pessoa` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `bi` varchar(20) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_pessoa`),
  UNIQUE KEY `cpf_bi` (`bi`),
  UNIQUE KEY `bi` (`bi`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `chk_pessoa_genero` CHECK (`genero` is null or `genero` in ('M','F','O'))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'João Manuel António','1998-05-12','M','BI001234567LA045','923000001','joao.antonio@gmail.com','Luanda, Talatona','2026-08-11 18:18:02',1),(2,'Maria José Francisco','2001-08-21','F','BI001234568LA046','923000002','maria.francisco@gmail.com','Luanda, Viana','2026-08-11 18:18:02',1),(3,'Carlos Alberto Pedro','1995-02-10','M','BI001234569LA047','923000003','carlos.pedro@gmail.com','Luanda, Kilamba','2026-08-11 18:18:02',1),(4,'Ana Paula Joaquim','2003-11-03','F','BI001234570LA048','923000004','ana.joaquim@gmail.com','Luanda, Maianga','2026-08-11 18:18:02',1),(5,'Pedro Domingos Silva','1988-07-15','M','BI001234571LA049','923000005','pedro.silva@gmail.com','Luanda, Benfica','2026-08-11 18:18:02',1),(6,'Teresa Maria Lopes','1999-01-25','F','BI001234572LA050','923000006','teresa.lopes@gmail.com','Luanda, Ingombota','2026-08-11 18:18:02',1),(7,'Miguel António José','2005-06-17','M','BI001234573LA051','923000007','miguel.jose@gmail.com','Luanda, Cazenga','2026-08-11 18:18:02',1),(8,'Sofia Isabel Manuel','2000-09-09','F','BI001234574LA052','923000008','sofia.manuel@gmail.com','Luanda, Rangel','2026-08-11 18:18:02',1),(9,'Daniel Francisco Gomes','1992-03-28','M','BI001234575LA053','923000009','daniel.gomes@gmail.com','Luanda, Samba','2026-08-11 18:18:02',1),(10,'Helena Maria Costa','1978-12-19','F','BI001234576LA054','923000010','helena.costa@gmail.com','Luanda, Maculusso','2026-08-11 18:18:02',1),(11,'António Sebastião Manuel','1985-04-11','M','BI001234577LA055','923000011','antonio.manuel@gmail.com','Luanda, Benfica','2026-08-11 18:18:02',1),(12,'Beatriz Alice Paulo','1997-10-30','F','BI001234578LA056','923000012','beatriz.paulo@gmail.com','Luanda, Camama','2026-08-11 18:18:02',1),(13,'Ricardo José António','1990-05-16','M','BI001234579LA057','923000013','ricardo.antonio@gmail.com','Luanda, Viana','2026-08-11 18:18:02',1),(14,'Laura Cristina Mendes','2002-02-14','F','BI001234580LA058','923000014','laura.mendes@gmail.com','Luanda, Kilamba','2026-08-11 18:18:02',1),(15,'Fernando Manuel Dias','1982-08-05','M','BI001234581LA059','923000015','fernando.dias@gmail.com','Luanda, Maianga','2026-08-11 18:18:02',1),(16,'Paulo André Joaquim','1996-06-22','M','BI001234582LA060','923000016','paulo.joaquim@gmail.com','Luanda, Viana','2026-08-11 18:18:02',1),(17,'Cláudia Sofia Pedro','2004-03-18','F','BI001234583LA061','923000017','claudia.pedro@gmail.com','Luanda, Talatona','2026-08-11 18:18:02',1),(18,'Manuel António Silva','1975-07-07','M','BI001234584LA062','923000018','manuel.silva@gmail.com','Luanda, Rangel','2026-08-11 18:18:02',1),(19,'Isabel Maria Gomes','1968-09-27','F','BI001234585LA063','923000019','isabel.gomes@gmail.com','Luanda, Ingombota','2026-08-11 18:18:02',1),(20,'José Carlos Fernandes','1989-01-13','M','BI001234586LA064','923000020','jose.fernandes@gmail.com','Luanda, Cazenga','2026-08-11 18:18:02',1),(21,'Francisco António','2000-04-15','M','BI999999999','923999999','francisco@gmail.com','Luanda, Viana','2026-08-11 18:42:03',1);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
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
