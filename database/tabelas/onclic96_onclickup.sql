-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 22/08/2020 às 23:35
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
-- Estrutura para view `candidato_estadocivil`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_estadocivil`  AS  select `candc`.`cand_id` AS `cand_id`,`candc`.`cand_nome` AS `cand_nome`,`candc`.`cand_img` AS `cand_img`,`candc`.`cand_dataDenasci` AS `cand_dataDenasci`,`candc`.`cand_cpf` AS `cand_cpf`,`candc`.`cand_contato` AS `cand_contato`,`candc`.`canduser_id` AS `canduser_id`,`candc`.`candestc_id` AS `candestc_id`,`estc`.`estc_id` AS `estc_id`,`estc`.`estc_nome` AS `estc_nome` from (`candidato` `candc` join `estado_civil` `estc` on((`candc`.`candestc_id` = `estc`.`estc_id`))) ;

--
-- VIEW  `candidato_estadocivil`
-- Dados: Nenhum
--

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
