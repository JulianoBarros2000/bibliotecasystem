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
-- Temporary view structure for view `vw_emprestimos_ativos`
--

DROP TABLE IF EXISTS `vw_emprestimos_ativos`;
/*!50001 DROP VIEW IF EXISTS `vw_emprestimos_ativos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_emprestimos_ativos` AS SELECT 
 1 AS `id_emprestimo`,
 1 AS `usuario`,
 1 AS `telefone`,
 1 AS `email`,
 1 AS `titulo`,
 1 AS `codigo_exemplar`,
 1 AS `data_emprestimo`,
 1 AS `data_prevista_devolucao`,
 1 AS `dias_restantes`,
 1 AS `funcionario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_historico_emprestimos`
--

DROP TABLE IF EXISTS `vw_historico_emprestimos`;
/*!50001 DROP VIEW IF EXISTS `vw_historico_emprestimos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_historico_emprestimos` AS SELECT 
 1 AS `id_emprestimo`,
 1 AS `usuario`,
 1 AS `titulo`,
 1 AS `codigo_exemplar`,
 1 AS `data_emprestimo`,
 1 AS `data_prevista_devolucao`,
 1 AS `data_devolucao`,
 1 AS `atraso_dias`,
 1 AS `status`,
 1 AS `funcionario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dashboard_biblioteca`
--

DROP TABLE IF EXISTS `vw_dashboard_biblioteca`;
/*!50001 DROP VIEW IF EXISTS `vw_dashboard_biblioteca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dashboard_biblioteca` AS SELECT 
 1 AS `total_livros`,
 1 AS `exemplares_disponiveis`,
 1 AS `exemplares_emprestados`,
 1 AS `total_usuarios`,
 1 AS `emprestimos_ativos`,
 1 AS `emprestimos_atrasados`,
 1 AS `multas_pendentes`,
 1 AS `valor_pendente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_multas_pendentes`
--

DROP TABLE IF EXISTS `vw_multas_pendentes`;
/*!50001 DROP VIEW IF EXISTS `vw_multas_pendentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_multas_pendentes` AS SELECT 
 1 AS `id_multa`,
 1 AS `usuario`,
 1 AS `telefone`,
 1 AS `email`,
 1 AS `titulo`,
 1 AS `valor`,
 1 AS `motivo`,
 1 AS `data_geracao`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_livros_acervo`
--

DROP TABLE IF EXISTS `vw_livros_acervo`;
/*!50001 DROP VIEW IF EXISTS `vw_livros_acervo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_livros_acervo` AS SELECT 
 1 AS `id_livro`,
 1 AS `titulo`,
 1 AS `isbn`,
 1 AS `ano_publicacao`,
 1 AS `editora`,
 1 AS `idioma`,
 1 AS `categoria`,
 1 AS `total_exemplares`,
 1 AS `exemplares_disponiveis`,
 1 AS `exemplares_emprestados`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_emprestimos_atrasados`
--

DROP TABLE IF EXISTS `vw_emprestimos_atrasados`;
/*!50001 DROP VIEW IF EXISTS `vw_emprestimos_atrasados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_emprestimos_atrasados` AS SELECT 
 1 AS `id_emprestimo`,
 1 AS `usuario`,
 1 AS `telefone`,
 1 AS `email`,
 1 AS `titulo`,
 1 AS `codigo_exemplar`,
 1 AS `data_emprestimo`,
 1 AS `data_prevista_devolucao`,
 1 AS `dias_atraso`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_situacao_financeira_usuario`
--

DROP TABLE IF EXISTS `vw_situacao_financeira_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_situacao_financeira_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_situacao_financeira_usuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nome`,
 1 AS `total_multas`,
 1 AS `total_pago`,
 1 AS `total_pendente`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_emprestimos_ativos`
--

/*!50001 DROP VIEW IF EXISTS `vw_emprestimos_ativos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_emprestimos_ativos` AS select `e`.`id_emprestimo` AS `id_emprestimo`,`p`.`nome` AS `usuario`,`p`.`telefone` AS `telefone`,`p`.`email` AS `email`,`l`.`titulo` AS `titulo`,`ex`.`codigo_exemplar` AS `codigo_exemplar`,`e`.`data_emprestimo` AS `data_emprestimo`,`e`.`data_prevista_devolucao` AS `data_prevista_devolucao`,to_days(`e`.`data_prevista_devolucao`) - to_days(curdate()) AS `dias_restantes`,`f`.`nome` AS `funcionario` from ((((((`emprestimo` `e` join `usuario` `u` on(`u`.`id_pessoa` = `e`.`id_usuario`)) join `pessoa` `p` on(`p`.`id_pessoa` = `u`.`id_pessoa`)) join `exemplar` `ex` on(`ex`.`id_exemplar` = `e`.`id_exemplar`)) join `livro` `l` on(`l`.`id_livro` = `ex`.`id_livro`)) join `funcionario` `fu` on(`fu`.`id_pessoa` = `e`.`id_funcionario`)) join `pessoa` `f` on(`f`.`id_pessoa` = `fu`.`id_pessoa`)) where `e`.`status` = 'Ativo' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_historico_emprestimos`
--

/*!50001 DROP VIEW IF EXISTS `vw_historico_emprestimos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_historico_emprestimos` AS select `e`.`id_emprestimo` AS `id_emprestimo`,`p`.`nome` AS `usuario`,`l`.`titulo` AS `titulo`,`ex`.`codigo_exemplar` AS `codigo_exemplar`,`e`.`data_emprestimo` AS `data_emprestimo`,`e`.`data_prevista_devolucao` AS `data_prevista_devolucao`,`d`.`data_devolucao` AS `data_devolucao`,`d`.`atraso_dias` AS `atraso_dias`,`e`.`status` AS `status`,`f`.`nome` AS `funcionario` from (((((((`emprestimo` `e` join `usuario` `u` on(`u`.`id_pessoa` = `e`.`id_usuario`)) join `pessoa` `p` on(`p`.`id_pessoa` = `u`.`id_pessoa`)) join `exemplar` `ex` on(`ex`.`id_exemplar` = `e`.`id_exemplar`)) join `livro` `l` on(`l`.`id_livro` = `ex`.`id_livro`)) join `funcionario` `fu` on(`fu`.`id_pessoa` = `e`.`id_funcionario`)) join `pessoa` `f` on(`f`.`id_pessoa` = `fu`.`id_pessoa`)) left join `devolucao` `d` on(`d`.`id_emprestimo` = `e`.`id_emprestimo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dashboard_biblioteca`
--

/*!50001 DROP VIEW IF EXISTS `vw_dashboard_biblioteca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dashboard_biblioteca` AS select (select count(0) from `livro` where `livro`.`status` = 1) AS `total_livros`,(select count(0) from `exemplar` where `exemplar`.`status` = 'Disponivel') AS `exemplares_disponiveis`,(select count(0) from `exemplar` where `exemplar`.`status` = 'Emprestado') AS `exemplares_emprestados`,(select count(0) from (`usuario` join `pessoa` on(`pessoa`.`id_pessoa` = `usuario`.`id_pessoa`)) where `pessoa`.`status` = 1) AS `total_usuarios`,(select count(0) from `emprestimo` where `emprestimo`.`status` = 'Ativo') AS `emprestimos_ativos`,(select count(0) from `emprestimo` where `emprestimo`.`status` = 'Atrasado') AS `emprestimos_atrasados`,(select count(0) from `multa` where `multa`.`status` = 'Pendente') AS `multas_pendentes`,(select coalesce(sum(`multa`.`valor`),0) from `multa` where `multa`.`status` = 'Pendente') AS `valor_pendente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_multas_pendentes`
--

/*!50001 DROP VIEW IF EXISTS `vw_multas_pendentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_multas_pendentes` AS select `m`.`id_multa` AS `id_multa`,`p`.`nome` AS `usuario`,`p`.`telefone` AS `telefone`,`p`.`email` AS `email`,`l`.`titulo` AS `titulo`,`m`.`valor` AS `valor`,`m`.`motivo` AS `motivo`,`m`.`data_geracao` AS `data_geracao`,`m`.`status` AS `status` from (((((`multa` `m` join `emprestimo` `e` on(`e`.`id_emprestimo` = `m`.`id_emprestimo`)) join `usuario` `u` on(`u`.`id_pessoa` = `e`.`id_usuario`)) join `pessoa` `p` on(`p`.`id_pessoa` = `u`.`id_pessoa`)) join `exemplar` `ex` on(`ex`.`id_exemplar` = `e`.`id_exemplar`)) join `livro` `l` on(`l`.`id_livro` = `ex`.`id_livro`)) where `m`.`status` = 'Pendente' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_livros_acervo`
--

/*!50001 DROP VIEW IF EXISTS `vw_livros_acervo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_livros_acervo` AS select `l`.`id_livro` AS `id_livro`,`l`.`titulo` AS `titulo`,`l`.`isbn` AS `isbn`,`l`.`ano_publicacao` AS `ano_publicacao`,`l`.`editora` AS `editora`,`l`.`idioma` AS `idioma`,`c`.`nome` AS `categoria`,count(`e`.`id_exemplar`) AS `total_exemplares`,sum(case when `e`.`status` = 'Disponivel' then 1 else 0 end) AS `exemplares_disponiveis`,sum(case when `e`.`status` = 'Emprestado' then 1 else 0 end) AS `exemplares_emprestados` from ((`livro` `l` join `categoria` `c` on(`c`.`id_categoria` = `l`.`id_categoria`)) left join `exemplar` `e` on(`e`.`id_livro` = `l`.`id_livro`)) group by `l`.`id_livro`,`l`.`titulo`,`l`.`isbn`,`l`.`ano_publicacao`,`l`.`editora`,`l`.`idioma`,`c`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_emprestimos_atrasados`
--

/*!50001 DROP VIEW IF EXISTS `vw_emprestimos_atrasados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_emprestimos_atrasados` AS select `e`.`id_emprestimo` AS `id_emprestimo`,`p`.`nome` AS `usuario`,`p`.`telefone` AS `telefone`,`p`.`email` AS `email`,`l`.`titulo` AS `titulo`,`ex`.`codigo_exemplar` AS `codigo_exemplar`,`e`.`data_emprestimo` AS `data_emprestimo`,`e`.`data_prevista_devolucao` AS `data_prevista_devolucao`,to_days(curdate()) - to_days(`e`.`data_prevista_devolucao`) AS `dias_atraso` from ((((`emprestimo` `e` join `usuario` `u` on(`u`.`id_pessoa` = `e`.`id_usuario`)) join `pessoa` `p` on(`p`.`id_pessoa` = `u`.`id_pessoa`)) join `exemplar` `ex` on(`ex`.`id_exemplar` = `e`.`id_exemplar`)) join `livro` `l` on(`l`.`id_livro` = `ex`.`id_livro`)) where `e`.`status` in ('Ativo','Atrasado') and `e`.`data_prevista_devolucao` < curdate() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_situacao_financeira_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_situacao_financeira_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_situacao_financeira_usuario` AS select `p`.`id_pessoa` AS `id_usuario`,`p`.`nome` AS `nome`,coalesce(sum(`m`.`valor`),0) AS `total_multas`,coalesce(sum(case when `m`.`status` = 'Paga' then `m`.`valor` else 0 end),0) AS `total_pago`,coalesce(sum(case when `m`.`status` = 'Pendente' then `m`.`valor` else 0 end),0) AS `total_pendente` from (((`pessoa` `p` join `usuario` `u` on(`u`.`id_pessoa` = `p`.`id_pessoa`)) left join `emprestimo` `e` on(`e`.`id_usuario` = `u`.`id_pessoa`)) left join `multa` `m` on(`m`.`id_emprestimo` = `e`.`id_emprestimo`)) group by `p`.`id_pessoa`,`p`.`nome` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'bibliotecasystem'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `evt_atualizar_emprestimos_atrasados` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `evt_atualizar_emprestimos_atrasados` ON SCHEDULE EVERY 1 DAY STARTS '2026-08-11 17:40:45' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    UPDATE emprestimo

    SET status = 'Atrasado'

    WHERE status = 'Ativo'

    AND data_prevista_devolucao < CURRENT_DATE();

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `ev_atualizar_emprestimos_atrasados` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `ev_atualizar_emprestimos_atrasados` ON SCHEDULE EVERY 1 DAY STARTS '2026-08-12 18:49:34' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    UPDATE emprestimo
    SET status = 'Atrasado'
    WHERE status = 'Ativo'
      AND data_prevista_devolucao < CURDATE();

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `ev_gerar_multas_atrasadas` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `ev_gerar_multas_atrasadas` ON SCHEDULE EVERY 1 DAY STARTS '2026-08-12 18:50:16' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN

    INSERT INTO multa (
        id_emprestimo,
        valor,
        motivo,
        data_geracao,
        status
    )
    SELECT
        e.id_emprestimo,
        fn_calcular_multa(
            DATEDIFF(CURDATE(), e.data_prevista_devolucao)
        ),
        'Atraso na devolução',
        NOW(),
        'Pendente'
    FROM emprestimo e
    WHERE e.status = 'Atrasado'
      AND e.data_prevista_devolucao < CURDATE()
      AND NOT EXISTS (
          SELECT 1
          FROM multa m
          WHERE m.id_emprestimo = e.id_emprestimo
      );

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'bibliotecasystem'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_atraso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_atraso`(p_data_prevista DATE,
    p_data_devolucao DATE
) RETURNS int(11)
    DETERMINISTIC
BEGIN
    DECLARE v_atraso INT;

    IF p_data_devolucao IS NULL THEN

        SET v_atraso = GREATEST(
            DATEDIFF(CURDATE(), p_data_prevista),
            0
        );

    ELSE

        SET v_atraso = GREATEST(
            DATEDIFF(p_data_devolucao, p_data_prevista),
            0
        );

    END IF;

    RETURN v_atraso;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_calcular_multa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calcular_multa`(p_atraso_dias INT
) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN

    IF p_atraso_dias <= 0 THEN
        RETURN 0.00;
    END IF;

    RETURN p_atraso_dias * 500.00;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_dias_atraso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_dias_atraso`(data_prevista DATE
) RETURNS int(11)
    DETERMINISTIC
BEGIN

    IF CURRENT_DATE() <= data_prevista THEN
        RETURN 0;
    END IF;

    RETURN DATEDIFF(
        CURRENT_DATE(),
        data_prevista
    );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_limite_disponivel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_limite_disponivel`(p_id_usuario INT
) RETURNS int(11)
    READS SQL DATA
BEGIN

    DECLARE v_limite INT DEFAULT 0;
    DECLARE v_ativos INT DEFAULT 0;

    SELECT limite_emprestimos
    INTO v_limite
    FROM usuario
    WHERE id_pessoa = p_id_usuario;

    SELECT COUNT(*)
    INTO v_ativos
    FROM emprestimo
    WHERE id_usuario = p_id_usuario
      AND status IN ('Ativo', 'Atrasado');

    RETURN GREATEST(v_limite - v_ativos, 0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cadastrar_exemplar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastrar_exemplar`(
    IN p_codigo VARCHAR(30),
    IN p_localizacao VARCHAR(100),
    IN p_estado VARCHAR(30),
    IN p_data_aquisicao DATE,
    IN p_id_livro INT
)
BEGIN

    INSERT INTO exemplar (
        codigo_exemplar,
        localizacao,
        estado_conservacao,
        status,
        data_aquisicao,
        id_livro
    )
    VALUES (
        p_codigo,
        p_localizacao,
        p_estado,
        'Disponivel',
        p_data_aquisicao,
        p_id_livro
    );

    SELECT
        LAST_INSERT_ID() AS id_exemplar,
        'Exemplar cadastrado com sucesso.' AS mensagem;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cadastrar_livro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastrar_livro`(
    IN p_titulo VARCHAR(200),
    IN p_isbn VARCHAR(20),
    IN p_ano_publicacao YEAR,
    IN p_editora VARCHAR(150),
    IN p_idioma VARCHAR(50),
    IN p_descricao TEXT,
    IN p_id_categoria INT
)
BEGIN

    INSERT INTO livro (
        titulo,
        isbn,
        ano_publicacao,
        editora,
        idioma,
        descricao,
        id_categoria,
        data_cadastro,
        status
    )
    VALUES (
        p_titulo,
        p_isbn,
        p_ano_publicacao,
        p_editora,
        p_idioma,
        p_descricao,
        p_id_categoria,
        NOW(),
        1
    );

    SELECT
        LAST_INSERT_ID() AS id_livro,
        'Livro cadastrado com sucesso.' AS mensagem;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_cadastrar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastrar_usuario`(
    IN p_nome VARCHAR(150),
    IN p_data_nascimento DATE,
    IN p_genero CHAR(1),
    IN p_bi VARCHAR(20),
    IN p_telefone VARCHAR(20),
    IN p_email VARCHAR(150),
    IN p_endereco VARCHAR(255),
    IN p_tipo_usuario ENUM('Crianca','Adulto','Idoso')
)
BEGIN

    DECLARE v_id_pessoa INT;

    INSERT INTO pessoa (
        nome,
        data_nascimento,
        genero,
        bi,
        telefone,
        email,
        endereco,
        data_cadastro,
        status
    )
    VALUES (
        p_nome,
        p_data_nascimento,
        p_genero,
        p_bi,
        p_telefone,
        p_email,
        p_endereco,
        NOW(),
        1
    );

    SET v_id_pessoa = LAST_INSERT_ID();

    INSERT INTO usuario (
        id_pessoa,
        tipo_usuario,
        data_cadastro,
        limite_emprestimos
    )
    VALUES (
        v_id_pessoa,
        p_tipo_usuario,
        NOW(),
        CASE p_tipo_usuario
            WHEN 'Crianca' THEN 3
            WHEN 'Adulto' THEN 5
            WHEN 'Idoso' THEN 3
        END
    );

    SELECT
        v_id_pessoa AS id_usuario,
        'Usuário cadastrado com sucesso.' AS mensagem;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_finalizar_backup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_finalizar_backup`(
    IN p_id_backup INT,
    IN p_status VARCHAR(20),
    IN p_observacao TEXT
)
BEGIN

    UPDATE backup
    SET
        status = p_status,
        data_conclusao = NOW(),
        observacao = p_observacao
    WHERE id_backup = p_id_backup;

    SELECT
        id_backup,
        status,
        data_conclusao,
        observacao
    FROM backup
    WHERE id_backup = p_id_backup;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_gerar_multa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_gerar_multa`(
    IN p_id_emprestimo INT
)
BEGIN

    DECLARE v_atraso INT;
    DECLARE v_valor DECIMAL(10,2);

    SELECT
        GREATEST(
            DATEDIFF(CURDATE(), data_prevista_devolucao),
            0
        )
    INTO v_atraso
    FROM emprestimo
    WHERE id_emprestimo = p_id_emprestimo;

    IF v_atraso <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O empréstimo não possui atraso.';

    ELSE

        SET v_valor = fn_calcular_multa(v_atraso);

        INSERT INTO multa (
            id_emprestimo,
            valor,
            motivo,
            data_geracao,
            status
        )
        VALUES (
            p_id_emprestimo,
            v_valor,
            'Atraso na devolução',
            NOW(),
            'Pendente'
        );

        SELECT
            LAST_INSERT_ID() AS id_multa,
            v_valor AS valor,
            'Multa gerada com sucesso.' AS mensagem;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_realizar_emprestimo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_realizar_emprestimo`(
    IN p_id_usuario INT,
    IN p_id_exemplar INT,
    IN p_id_funcionario INT,
    IN p_dias_prazo INT,
    IN p_observacao TEXT
)
BEGIN

    DECLARE v_data_prevista DATE;

    SET v_data_prevista =
        DATE_ADD(CURDATE(), INTERVAL p_dias_prazo DAY);

    INSERT INTO emprestimo (
        id_usuario,
        id_exemplar,
        id_funcionario,
        data_emprestimo,
        data_prevista_devolucao,
        data_renovacao,
        status,
        observacao
    )
    VALUES (
        p_id_usuario,
        p_id_exemplar,
        p_id_funcionario,
        NOW(),
        v_data_prevista,
        NULL,
        'Ativo',
        p_observacao
    );

    SELECT
        LAST_INSERT_ID() AS id_emprestimo,
        'Empréstimo realizado com sucesso.' AS mensagem;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registar_devolucao` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registar_devolucao`(
    IN p_id_emprestimo INT,
    IN p_id_funcionario INT,
    IN p_estado_exemplar VARCHAR(30),
    IN p_observacao TEXT
)
BEGIN

    DECLARE v_data_prevista DATE;
    DECLARE v_atraso INT;

    SELECT data_prevista_devolucao
    INTO v_data_prevista
    FROM emprestimo
    WHERE id_emprestimo = p_id_emprestimo;

    IF v_data_prevista IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Empréstimo não encontrado.';

    ELSE

        SET v_atraso =
            GREATEST(
                DATEDIFF(CURDATE(), v_data_prevista),
                0
            );

        INSERT INTO devolucao (
            id_emprestimo,
            id_funcionario,
            data_devolucao,
            estado_exemplar,
            atraso_dias,
            observacao
        )
        VALUES (
            p_id_emprestimo,
            p_id_funcionario,
            NOW(),
            p_estado_exemplar,
            v_atraso,
            p_observacao
        );

        SELECT
            LAST_INSERT_ID() AS id_devolucao,
            v_atraso AS atraso_dias,
            'Devolução registrada com sucesso.' AS mensagem;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registar_pagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registar_pagamento`(
    IN p_id_multa INT,
    IN p_id_funcionario INT,
    IN p_valor DECIMAL(10,2),
    IN p_forma_pagamento VARCHAR(30),
    IN p_observacao TEXT
)
BEGIN

    DECLARE v_valor_multa DECIMAL(10,2);
    DECLARE v_total_pago DECIMAL(10,2);

    SELECT valor
    INTO v_valor_multa
    FROM multa
    WHERE id_multa = p_id_multa;

    SELECT COALESCE(SUM(valor), 0)
    INTO v_total_pago
    FROM pagamento
    WHERE id_multa = p_id_multa;

    IF v_valor_multa IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Multa não encontrada.';

    ELSEIF p_valor <= 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O valor do pagamento deve ser maior que zero.';

    ELSEIF v_total_pago + p_valor > v_valor_multa THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O pagamento excede o valor da multa.';

    ELSE

        INSERT INTO pagamento (
            id_multa,
            id_funcionario,
            data_pagamento,
            valor,
            forma_pagamento,
            observacao
        )
        VALUES (
            p_id_multa,
            p_id_funcionario,
            NOW(),
            p_valor,
            p_forma_pagamento,
            p_observacao
        );

        SELECT
            LAST_INSERT_ID() AS id_pagamento,
            'Pagamento registrado com sucesso.' AS mensagem;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_renovar_emprestimo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_renovar_emprestimo`(
    IN p_id_emprestimo INT,
    IN p_dias INT
)
BEGIN

    DECLARE v_status VARCHAR(30);

    SELECT status
    INTO v_status
    FROM emprestimo
    WHERE id_emprestimo = p_id_emprestimo;

    IF v_status IS NULL THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Empréstimo não encontrado.';

    ELSEIF v_status <> 'Ativo' THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Somente empréstimos ativos podem ser renovados.';

    ELSE

        UPDATE emprestimo
        SET
            data_prevista_devolucao =
                DATE_ADD(data_prevista_devolucao,
                         INTERVAL p_dias DAY),
            data_renovacao = CURDATE()
        WHERE id_emprestimo = p_id_emprestimo;

        SELECT
            'Empréstimo renovado com sucesso.' AS mensagem;

    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_solicitar_backup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_solicitar_backup`(
    IN p_nome_arquivo VARCHAR(255),
    IN p_usuario_sistema VARCHAR(150)
)
BEGIN

    INSERT INTO backup (
        nome_arquivo,
        tipo,
        data_solicitacao,
        status,
        usuario_sistema
    )
    VALUES (
        p_nome_arquivo,
        'Manual',
        NOW(),
        'Solicitado',
        p_usuario_sistema
    );

    SELECT
        LAST_INSERT_ID() AS id_backup,
        p_nome_arquivo AS nome_arquivo,
        'Solicitado' AS status,
        'Solicitação de backup criada com sucesso.' AS mensagem;

END ;;
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

-- Dump completed on 2026-08-11 19:31:43
