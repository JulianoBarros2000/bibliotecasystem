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
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `id_exemplar` int(10) unsigned NOT NULL,
  `id_funcionario` int(10) unsigned NOT NULL,
  `data_emprestimo` datetime NOT NULL DEFAULT current_timestamp(),
  `data_prevista_devolucao` date NOT NULL,
  `data_renovacao` date DEFAULT NULL,
  `status` enum('Ativo','Devolvido','Atrasado','Cancelado') NOT NULL DEFAULT 'Ativo',
  `observacao` text DEFAULT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `idx_emprestimo_usuario` (`id_usuario`),
  KEY `idx_emprestimo_exemplar` (`id_exemplar`),
  KEY `idx_emprestimo_funcionario` (`id_funcionario`),
  KEY `idx_emprestimo_status` (`status`),
  KEY `idx_emprestimo_data` (`data_emprestimo`),
  KEY `idx_emprestimo_prevista` (`data_prevista_devolucao`),
  KEY `idx_emprestimo_usuario_status` (`id_usuario`,`status`),
  KEY `idx_emprestimo_status_data` (`status`,`data_emprestimo`),
  KEY `idx_emprestimo_devolucao` (`data_prevista_devolucao`),
  CONSTRAINT `fk_emprestimo_exemplar` FOREIGN KEY (`id_exemplar`) REFERENCES `exemplar` (`id_exemplar`) ON UPDATE CASCADE,
  CONSTRAINT `fk_emprestimo_funcionario` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id_pessoa`) ON UPDATE CASCADE,
  CONSTRAINT `fk_emprestimo_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_pessoa`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,1,16,'2026-07-01 09:00:00','2026-07-15',NULL,'Devolvido','Devolução realizada normalmente.'),(2,2,3,17,'2026-07-03 10:30:00','2026-07-17',NULL,'Devolvido','Livro devolvido em bom estado.'),(3,3,4,18,'2026-07-05 14:00:00','2026-07-19','2026-07-18','Devolvido','Empréstimo renovado uma vez.'),(4,4,6,16,'2026-07-10 11:00:00','2026-07-20',NULL,'Atrasado','Usuário ultrapassou a data prevista.'),(5,5,7,17,'2026-07-12 15:00:00','2026-07-26',NULL,'Ativo','Empréstimo em andamento.'),(6,6,9,18,'2026-07-15 09:30:00','2026-07-29',NULL,'Ativo','Empréstimo em andamento.'),(7,7,10,16,'2026-07-18 13:00:00','2026-08-01',NULL,'Ativo','Empréstimo em andamento.'),(8,8,11,17,'2026-07-20 10:00:00','2026-08-03',NULL,'Devolvido','Devolução realizada.'),(9,9,12,18,'2026-07-22 16:00:00','2026-08-05',NULL,'Atrasado','Aguardando devolução.'),(10,10,13,16,'2026-07-25 09:00:00','2026-08-08',NULL,'Ativo','Empréstimo em andamento.'),(11,1,1,16,'2026-08-11 18:45:01','2026-08-25',NULL,'Ativo','Empréstimo normal.');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_emprestimo_validar
BEFORE INSERT ON emprestimo
FOR EACH ROW
BEGIN

    DECLARE v_status_exemplar VARCHAR(30);
    DECLARE v_status_usuario TINYINT;
    DECLARE v_emprestimos_ativos INT;
    DECLARE v_limite INT;

    -- Verificar exemplar
    SELECT status
    INTO v_status_exemplar
    FROM exemplar
    WHERE id_exemplar = NEW.id_exemplar;

    IF v_status_exemplar <> 'Disponivel' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'O exemplar selecionado não está disponível.';

    END IF;


    -- Verificar usuário
    SELECT
        p.status,
        u.limite_emprestimos

    INTO
        v_status_usuario,
        v_limite

    FROM usuario u

    INNER JOIN pessoa p
        ON p.id_pessoa = u.id_pessoa

    WHERE u.id_pessoa = NEW.id_usuario;


    IF v_status_usuario <> 1 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'O usuário está inativo.';

    END IF;


    -- Verificar limite
    SELECT COUNT(*)
    INTO v_emprestimos_ativos

    FROM emprestimo

    WHERE id_usuario = NEW.id_usuario
    AND status IN ('Ativo', 'Atrasado');


    IF v_emprestimos_ativos >= v_limite THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'O usuário atingiu o limite de empréstimos.';

    END IF;

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_emprestimo_exemplar
AFTER INSERT ON emprestimo
FOR EACH ROW
BEGIN

    UPDATE exemplar

    SET status = 'Emprestado'

    WHERE id_exemplar = NEW.id_exemplar;

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_auditoria_emprestimo_insert
AFTER INSERT ON emprestimo
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
        'emprestimo',
        'INSERT',
        NEW.id_emprestimo,
        CURRENT_USER(),
        NOW(),
        CONCAT(
            'Novo empréstimo criado para o usuário ',
            NEW.id_usuario,
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

-- Dump completed on 2026-08-11 19:31:42
