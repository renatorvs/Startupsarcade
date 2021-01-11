-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 23/08/2020 às 22:31
-- Versão do servidor: 5.7.23-23
-- Versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `onclic96_onclickup`
--

-- --------------------------------------------------------

--
-- Estrutura para view `pedido_conversas`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedido_conversas`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`pml_pedi_id` AS `pml_pedi_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_pmdl_id` AS `pml_pmdl_id`,`pmdl`.`pmdl_cliente_foto` AS `pmdl_cliente_foto`,`pmdl`.`pmdl_cliente_nome` AS `pmdl_cliente_nome`,`pmdl`.`pmdl_prestador_foto` AS `pmdl_prestador_foto`,`pmdl`.`pmdl_prestador_nome` AS `pmdl_prestador_nome`,`pmdl`.`pmdl_id` AS `pmdl_id`,`m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id` from (((((`pedido` `p` join `pedido_mensagem_link` `pml` on((`pml`.`pml_pedi_id` = `p`.`pedi_id`))) join `pedido_mensagem_dados_link` `pmdl` on((`pmdl`.`pmdl_id` = `pml`.`pml_pmdl_id`))) join `mensagem` `m` on((`m`.`msn_id` = `pml`.`pml_msn_id`))) join `servico` `serv` on((`serv`.`serv_id` = `p`.`pedi_serv_id`))) join `post` `po` on((`po`.`post_id` = `serv`.`postserv_id`))) ;

--
-- VIEW  `pedido_conversas`
-- Dados: Nenhum
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
