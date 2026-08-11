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
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_multa` int(10) unsigned NOT NULL,
  `id_funcionario` int(10) unsigned NOT NULL,
  `data_pagamento` datetime NOT NULL DEFAULT current_timestamp(),
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('Dinheiro','Cartao','Transferencia') NOT NULL,
  `observacao` text DEFAULT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `idx_pagamento_multa` (`id_multa`),
  KEY `idx_pagamento_funcionario` (`id_funcionario`),
  KEY `idx_pagamento_data` (`data_pagamento`),
  KEY `idx_pagamento_multa_data` (`id_multa`,`data_pagamento`),
  CONSTRAINT `fk_pagamento_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `fk_pagamento_multa` FOREIGN KEY (`id_multa`) REFERENCES `multa` (`id_multa`) ON UPDATE CASCADE,
  CONSTRAINT `chk_pagamento_valor` CHECK (`valor` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,3,16,'2026-07-14 15:20:00',2000.00,'Dinheiro','Pagamento efetuado no balcão.');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_pagamento_multa
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN

    DECLARE v_total_multa DECIMAL(10,2);
    DECLARE v_total_pago DECIMAL(10,2);

    SELECT valor
    INTO v_total_multa

    FROM multa

    WHERE id_multa = NEW.id_multa;


    SELECT COALESCE(SUM(valor), 0)
    INTO v_total_pago

    FROM pagamento

    WHERE id_multa = NEW.id_multa;


    IF v_total_pago >= v_total_multa THEN

        UPDATE multa

        SET status = 'Paga'

        WHERE id_multa = NEW.id_multa;

    ELSE

        UPDATE multa

        SET status = 'Pendente'

        WHERE id_multa = NEW.id_multa;

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-11 19:31:42
