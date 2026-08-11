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
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucao` (
  `id_devolucao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_emprestimo` int(10) unsigned NOT NULL,
  `id_funcionario` int(10) unsigned NOT NULL,
  `data_devolucao` datetime NOT NULL DEFAULT current_timestamp(),
  `estado_exemplar` enum('Bom','Danificado','Perdido') NOT NULL DEFAULT 'Bom',
  `atraso_dias` int(10) unsigned NOT NULL DEFAULT 0,
  `observacao` text DEFAULT NULL,
  PRIMARY KEY (`id_devolucao`),
  UNIQUE KEY `id_emprestimo` (`id_emprestimo`),
  KEY `fk_devolucao_funcionario` (`id_funcionario`),
  CONSTRAINT `fk_devolucao_emprestimo` FOREIGN KEY (`id_emprestimo`) REFERENCES `emprestimo` (`id_emprestimo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_devolucao_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `chk_devolucao_atraso` CHECK (`atraso_dias` >= 0)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
INSERT INTO `devolucao` VALUES (1,1,16,'2026-07-14 15:00:00','Bom',0,'Devolução dentro do prazo.'),(2,2,17,'2026-07-16 11:30:00','Bom',0,'Devolução normal.'),(3,3,18,'2026-07-19 14:30:00','Bom',0,'Devolução após renovação.'),(4,8,17,'2026-08-02 10:00:00','Bom',0,'Devolução normal.');
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_devolucao_processar
AFTER INSERT ON devolucao
FOR EACH ROW
BEGIN

    DECLARE v_exemplar INT;
    DECLARE v_estado VARCHAR(30);

    SELECT id_exemplar
    INTO v_exemplar

    FROM emprestimo

    WHERE id_emprestimo = NEW.id_emprestimo;


    -- Atualizar empréstimo
    UPDATE emprestimo

    SET status = 'Devolvido'

    WHERE id_emprestimo = NEW.id_emprestimo;


    -- Atualizar exemplar
    IF NEW.estado_exemplar = 'Bom' THEN

        SET v_estado = 'Disponivel';

    ELSEIF NEW.estado_exemplar = 'Danificado' THEN

        SET v_estado = 'Manutencao';

    ELSE

        SET v_estado = 'Inativo';

    END IF;


    UPDATE exemplar

    SET
        status = v_estado,
        estado_conservacao = NEW.estado_exemplar

    WHERE id_exemplar = v_exemplar;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_auditoria_devolucao_insert
AFTER INSERT ON devolucao
FOR EACH ROW
BEGIN

    INSERT INTO log_auditoria (
        tabela,
        operacao,
        id_registro,
        usuario_sistema,
        data_operacao,
        descricao
    )
    VALUES (
        'devolucao',
        'INSERT',
        NEW.id_devolucao,
        CURRENT_USER(),
        NOW(),
        CONCAT(
            'Devolução registrada para o empréstimo ',
            NEW.id_emprestimo,
            '.'
        )
    );

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

-- Dump completed on 2026-08-11 19:31:38
