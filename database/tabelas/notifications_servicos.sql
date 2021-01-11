-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 24/08/2020 às 21:10
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
-- Estrutura para view `notifications_servicos`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `notifications_servicos`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id` from (`pedido` `p` join `usuario` `u` on((`p`.`cliente_user_id` = `u`.`user_id`))) ;

--
-- VIEW  `notifications_servicos`
-- Dados: Nenhum
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
