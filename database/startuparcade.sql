-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 03-Out-2022 às 23:40
-- Versão do servidor: 10.4.10-MariaDB
-- versão do PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cpses_onyfdxx4c9`
--
CREATE DATABASE IF NOT EXISTS `cpses_onyfdxx4c9` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cpses_onyfdxx4c9`;
--
-- Banco de dados: `fastbook`
--
CREATE DATABASE IF NOT EXISTS `fastbook` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fastbook`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `markers`
--

DROP TABLE IF EXISTS `markers`;
CREATE TABLE IF NOT EXISTS `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Falcon', '108 Rua kitaro ywasa, SÃ£o paulo', -23.652260, -46.464008, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `email` varchar(220) NOT NULL,
  `usuario` varchar(220) NOT NULL,
  `senha` varchar(220) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Banco de dados: `onclickup`
--
CREATE DATABASE IF NOT EXISTS `onclickup` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `onclickup`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accept_status`
--

DROP TABLE IF EXISTS `accept_status`;
CREATE TABLE IF NOT EXISTS `accept_status` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `accept_status`
--

INSERT INTO `accept_status` (`acc_id`, `acc_nome`) VALUES
(1, 'aceito'),
(2, 'pendente'),
(3, 'negado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm`
--

DROP TABLE IF EXISTS `adm`;
CREATE TABLE IF NOT EXISTS `adm` (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_nome` varchar(60) NOT NULL,
  `adm_email` varchar(60) NOT NULL,
  `adm_senha` varchar(255) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `admuser_id` int(11) NOT NULL,
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm`
--

INSERT INTO `adm` (`adm_id`, `adm_nome`, `adm_email`, `adm_senha`, `car_id`, `admuser_id`) VALUES
(1, 'Renato Vieira', 'onclickup_admin@gmail.com', '$2y$12$3tht8uM3Op2LDKiGYZz9Xe5K6bQ7d7MirESsyxUWcX3QnRxUhWVvG', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogdestaque_id` int(11) NOT NULL,
  `blog_text` text NOT NULL,
  `blog_date` date NOT NULL,
  `blog_img` varchar(255) NOT NULL,
  `blog_categoria_id` int(11) NOT NULL,
  `blogpost_id` int(11) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_categoria`
--

DROP TABLE IF EXISTS `blog_categoria`;
CREATE TABLE IF NOT EXISTS `blog_categoria` (
  `blogcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogcat_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`blogcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_categoria`
--

INSERT INTO `blog_categoria` (`blogcat_id`, `blogcat_nome`) VALUES
(1, 'Mundo'),
(2, 'BR'),
(3, 'Tecnologia'),
(4, 'Design'),
(5, 'Cultura'),
(6, 'Para Empresa'),
(7, 'boas praticas'),
(8, 'Empreendedorismo'),
(9, 'Politicas'),
(10, 'Negocios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_destaque`
--

DROP TABLE IF EXISTS `blog_destaque`;
CREATE TABLE IF NOT EXISTS `blog_destaque` (
  `blogdest_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogdest_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`blogdest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_destaque`
--

INSERT INTO `blog_destaque` (`blogdest_id`, `blogdest_nome`) VALUES
(1, 'No page blog'),
(2, 'Em destaque blog '),
(3, 'blog no index');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `blog_post_categoria`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `blog_post_categoria`;
CREATE TABLE IF NOT EXISTS `blog_post_categoria` (
`blog_id` int(11)
,`blogdestaque_id` int(11)
,`blog_text` text
,`blog_date` date
,`blog_img` varchar(255)
,`blog_categoria_id` int(11)
,`blogpost_id` int(11)
,`blogcat_id` int(11)
,`blogcat_nome` varchar(50)
,`blogdest_id` int(11)
,`blogdest_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `cand_id` int(11) NOT NULL AUTO_INCREMENT,
  `cand_nome` varchar(30) NOT NULL,
  `cand_img` int(11) DEFAULT NULL,
  `cand_dataDenasci` datetime DEFAULT NULL,
  `cand_cpf` varchar(50) NOT NULL,
  `cand_contato` varchar(50) NOT NULL,
  `canduser_id` int(11) NOT NULL,
  `candestc_id` int(11) DEFAULT 1,
  PRIMARY KEY (`cand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`cand_id`, `cand_nome`, `cand_img`, `cand_dataDenasci`, `cand_cpf`, `cand_contato`, `canduser_id`, `candestc_id`) VALUES
(1, 'candidato teste 1', NULL, '1011-10-10 00:00:00', '4247983333', '1188888888888', 17, 1),
(3, 'candidato teste 3', NULL, '0001-01-01 00:00:00', '7897979987', '486486486', 19, 1),
(4, 'candidato teste  4', NULL, '0001-01-01 00:00:00', '147286589', '486486486', 20, 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_conta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_conta`;
CREATE TABLE IF NOT EXISTS `candidato_conta` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`cont_id` int(11)
,`cont_agencia` varchar(20)
,`cont_conta` varchar(50)
,`cont_titular` varchar(50)
,`cont_digito` varchar(11)
,`cont_user_id` int(11)
,`cont_bank_id` int(11)
,`bank_id` int(11)
,`bank_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_dados`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_dados`;
CREATE TABLE IF NOT EXISTS `candidato_dados` (
`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
,`fic_id` int(11)
,`fic_empresa` varchar(50)
,`fic_cargo` varchar(50)
,`fic_carteiraregistro` varchar(50)
,`fic_salario` decimal(10,2)
,`fic_dataentrada` datetime
,`fic_datasaida` datetime
,`fic_motivoSaida` varchar(50)
,`candidato_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_estadocivil`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_estadocivil`;
CREATE TABLE IF NOT EXISTS `candidato_estadocivil` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`estc_id` int(11)
,`estc_nome` varchar(20)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_explore`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_explore`;
CREATE TABLE IF NOT EXISTS `candidato_explore` (
`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`statusvag_id` int(11)
,`statusvag_nome` varchar(50)
,`tipovaga_id` int(11)
,`tipovaga_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_pedidos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_pedidos`;
CREATE TABLE IF NOT EXISTS `candidato_pedidos` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`statuspedi_id` int(11)
,`statuspedi_nome` varchar(50)
,`statuspedi_date` datetime
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_prestador_pedidos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_prestador_pedidos`;
CREATE TABLE IF NOT EXISTS `candidato_prestador_pedidos` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pretador_pedidos_id` int(11)
,`prestador_pedi_id` int(11)
,`prestador_user_id` int(11)
,`prestador_acc_id` int(11)
,`prestador_date` date
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_prova_resposta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_prova_resposta`;
CREATE TABLE IF NOT EXISTS `candidato_prova_resposta` (
`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`vagprolink_id` int(11)
,`linkvag_id` int(11)
,`linkpro_id` int(11)
,`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
,`quest_id` int(11)
,`quest_pergunta` varchar(50)
,`quest_a` varchar(50)
,`quest_b` varchar(50)
,`quest_c` varchar(50)
,`quest_d` varchar(50)
,`quest_e` varchar(50)
,`questpro_id` int(11)
,`quest_official` varchar(11)
,`resp_id` int(11)
,`resp_candidado` varchar(50)
,`respquest_id` int(11)
,`respcand_id` int(11)
,`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_quiz_resposta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_quiz_resposta`;
CREATE TABLE IF NOT EXISTS `candidato_quiz_resposta` (
`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`vagprolink_id` int(11)
,`linkvag_id` int(11)
,`linkpro_id` int(11)
,`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
,`quiz_id` int(11)
,`quiz_pergunta` varchar(50)
,`quizpro_id` int(11)
,`quizuser_id` int(11)
,`requiz_id` int(11)
,`requiz_candidado` varchar(220)
,`requizcand_id` int(11)
,`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_servico`;
CREATE TABLE IF NOT EXISTS `candidato_servico` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`statServ_id` int(11)
,`statusServ_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `candidato_solicitacoes`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `candidato_solicitacoes`;
CREATE TABLE IF NOT EXISTS `candidato_solicitacoes` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`soli_id` int(11)
,`soli_descricao` varchar(255)
,`soli_date` date
,`soli_response` varchar(255)
,`solistatus_id` int(11)
,`soliusuario_id` int(11)
,`solicategoria_id` int(11)
,`status_soli_id` int(11)
,`status_soli` varchar(15)
,`solicat_id` int(11)
,`soli_cat_nm` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato_vaga_link`
--

DROP TABLE IF EXISTS `candidato_vaga_link`;
CREATE TABLE IF NOT EXISTS `candidato_vaga_link` (
  `cvl_id` int(11) NOT NULL AUTO_INCREMENT,
  `cvlvag_id` int(11) DEFAULT NULL,
  `cvl_user_id` int(11) DEFAULT NULL,
  `cvlcandidato_nome` varchar(30) NOT NULL,
  `cvlemp_id` int(11) NOT NULL,
  `cvlcand_id` int(11) NOT NULL,
  PRIMARY KEY (`cvl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `candidato_vaga_link`
--

INSERT INTO `candidato_vaga_link` (`cvl_id`, `cvlvag_id`, `cvl_user_id`, `cvlcandidato_nome`, `cvlemp_id`, `cvlcand_id`) VALUES
(1, 2, 5, 'Renato Santos', 4, 1),
(2, 1, 5, 'Renato Santos', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`car_id`, `car_nome`) VALUES
(1, 'Gestor'),
(2, 'Colaborador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
CREATE TABLE IF NOT EXISTS `cartaocredito` (
  `cc_id` int(11) NOT NULL,
  `cc_userid` int(11) NOT NULL,
  `cc_bandeira` varchar(100) NOT NULL,
  `cc_digitos` varchar(100) NOT NULL,
  `cc_card_hash` varchar(100) NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`cat_id`, `cat_nome`) VALUES
(1, 'Comercial, Vendas'),
(2, 'Telemarketing'),
(3, 'Administração '),
(4, 'Informática, TI, Telecomunicações '),
(5, 'Alimentação / Gastronomia'),
(6, 'Construção, Manutenção '),
(7, 'Logística '),
(8, 'industrial, Produção, Fábrica '),
(9, 'Contábil, Finanças, Economia '),
(10, 'Transportes'),
(11, 'Serviços Gerais'),
(12, 'Saúde'),
(13, 'Marketing'),
(14, 'Recursos Humanos'),
(15, 'Educação, Ensino, Idiomas'),
(16, 'Engenharia '),
(17, 'Segurança '),
(18, 'Compras '),
(19, 'Jurídica'),
(20, 'Qualidade'),
(21, 'Estética '),
(22, 'Hotelaria, Turismo '),
(23, 'Comunicação, TV, Cinema '),
(24, 'Moda'),
(25, 'Arquitetura, Decoração, Design'),
(26, 'Artes'),
(27, 'Agricultura, Pecuária, Veterinária'),
(28, 'Comércio Exterior, Importação, Exportação '),
(29, 'Auditoria '),
(30, 'Química, Petroquímica'),
(31, 'Ciências, Pesquisa'),
(32, 'ultura, Lazer, Entretenimento '),
(33, 'Meio Ambiente, Ecologia'),
(34, 'Serviço Social e Comunitário'),
(35, 'blog');

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencias`
--

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE IF NOT EXISTS `competencias` (
  `comp_id` int(11) NOT NULL AUTO_INCREMENT,
  `comp_nome` varchar(25) NOT NULL,
  `compcate_id` int(11) NOT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `competencias`
--

INSERT INTO `competencias` (`comp_id`, `comp_nome`, `compcate_id`) VALUES
(1, 'HTML5', 2),
(2, 'CSS3', 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `competencias_categorias`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `competencias_categorias`;
CREATE TABLE IF NOT EXISTS `competencias_categorias` (
`comp_id` int(11)
,`comp_nome` varchar(25)
,`compcate_id` int(11)
,`compcat_id` int(11)
,`compcat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `competencia_candidato`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `competencia_candidato`;
CREATE TABLE IF NOT EXISTS `competencia_candidato` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`compelinkcand_id` int(11)
,`compecand_id` int(11)
,`candcompe_id` int(11)
,`comp_id` int(11)
,`comp_nome` varchar(25)
,`compcate_id` int(11)
,`compcat_id` int(11)
,`compcat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencia_candidato_link`
--

DROP TABLE IF EXISTS `competencia_candidato_link`;
CREATE TABLE IF NOT EXISTS `competencia_candidato_link` (
  `compelinkcand_id` int(11) NOT NULL AUTO_INCREMENT,
  `compecand_id` int(11) NOT NULL,
  `candcompe_id` int(11) NOT NULL,
  PRIMARY KEY (`compelinkcand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencia_categoria`
--

DROP TABLE IF EXISTS `competencia_categoria`;
CREATE TABLE IF NOT EXISTS `competencia_categoria` (
  `compcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `compcat_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`compcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `competencia_vagas`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `competencia_vagas`;
CREATE TABLE IF NOT EXISTS `competencia_vagas` (
`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`complinkvag_id` int(11)
,`linkcomp_id` int(11)
,`linkvag_id` int(11)
,`comp_id` int(11)
,`comp_nome` varchar(25)
,`compcate_id` int(11)
,`compcat_id` int(11)
,`compcat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencia_vaga_link`
--

DROP TABLE IF EXISTS `competencia_vaga_link`;
CREATE TABLE IF NOT EXISTS `competencia_vaga_link` (
  `complinkvag_id` int(11) NOT NULL AUTO_INCREMENT,
  `linkcomp_id` int(11) NOT NULL,
  `linkvag_id` int(11) NOT NULL,
  PRIMARY KEY (`complinkvag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `concurso`
--

DROP TABLE IF EXISTS `concurso`;
CREATE TABLE IF NOT EXISTS `concurso` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_preRequesitos` int(150) NOT NULL,
  `con_beneficios` varchar(100) NOT NULL,
  `con_quantidade` int(11) NOT NULL,
  `con_salario` varchar(20) NOT NULL,
  `con_site` varchar(50) NOT NULL,
  `statuscon_id` int(11) NOT NULL,
  `escolaridade_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_bancaria`
--

DROP TABLE IF EXISTS `conta_bancaria`;
CREATE TABLE IF NOT EXISTS `conta_bancaria` (
  `cont_id` int(11) NOT NULL AUTO_INCREMENT,
  `cont_agencia` varchar(20) NOT NULL,
  `cont_conta` varchar(50) NOT NULL,
  `cont_titular` varchar(50) NOT NULL,
  `cont_digito` varchar(11) NOT NULL,
  `cont_user_id` int(11) NOT NULL,
  `cont_bank_id` int(11) NOT NULL,
  PRIMARY KEY (`cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_bancos`
--

DROP TABLE IF EXISTS `conta_bancos`;
CREATE TABLE IF NOT EXISTS `conta_bancos` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `conta_bancos`
--

INSERT INTO `conta_bancos` (`bank_id`, `bank_nome`) VALUES
(1, '001 – Banco do Brasil S.A.'),
(2, '341 – Banco Itaú S.A.'),
(3, '033 – Banco Santander'),
(4, '104 – Caixa Econômica Federal'),
(5, '001 – Banco do Brasil S.A.'),
(6, '422 – Banco Safra S.A.'),
(7, '745 – Banco Citibank S.A.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `cur_id` int(11) NOT NULL AUTO_INCREMENT,
  `cur_nome` varchar(50) DEFAULT NULL,
  `cur_horas` varchar(20) NOT NULL,
  `cur_instuicao` varchar(50) NOT NULL,
  PRIMARY KEY (`cur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso_candidato_link`
--

DROP TABLE IF EXISTS `curso_candidato_link`;
CREATE TABLE IF NOT EXISTS `curso_candidato_link` (
  `cur_id` int(11) DEFAULT NULL,
  `cand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso_nivel_link`
--

DROP TABLE IF EXISTS `curso_nivel_link`;
CREATE TABLE IF NOT EXISTS `curso_nivel_link` (
  `cur_id` int(11) DEFAULT NULL,
  `nive_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `dados_usuario_post`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `dados_usuario_post`;
CREATE TABLE IF NOT EXISTS `dados_usuario_post` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`tipopost_id` int(11)
,`tipopost` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `dados_usuario_shere`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `dados_usuario_shere`;
CREATE TABLE IF NOT EXISTS `dados_usuario_shere` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`tipopost_id` int(11)
,`tipopost` varchar(50)
,`shere_id` int(11)
,`shere_post_id` int(11)
,`shere_user_id` int(11)
,`shere_user_nome` varchar(25)
,`shere_autor_user_id` int(11)
,`shere_autor_nome` varchar(50)
,`shere_user_img` varchar(200)
,`shere_ti_post` int(11)
,`shere_text` text
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dica`
--

DROP TABLE IF EXISTS `dica`;
CREATE TABLE IF NOT EXISTS `dica` (
  `dic_id` int(11) NOT NULL AUTO_INCREMENT,
  `dic_text` varchar(200) NOT NULL,
  `postdic_id` int(11) NOT NULL,
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas`
--

DROP TABLE IF EXISTS `duvidas`;
CREATE TABLE IF NOT EXISTS `duvidas` (
  `duv_id` int(11) NOT NULL AUTO_INCREMENT,
  `duv_pergunta` text NOT NULL,
  `duv_resposta` text NOT NULL,
  `duvcategoria_id` int(11) NOT NULL,
  `tiuser_id` int(11) NOT NULL,
  PRIMARY KEY (`duv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas_categoria`
--

DROP TABLE IF EXISTS `duvidas_categoria`;
CREATE TABLE IF NOT EXISTS `duvidas_categoria` (
  `duvcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `duvcat_nome` varchar(50) NOT NULL,
  `duvcat_tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`duvcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `duvidas_categorias_view`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `duvidas_categorias_view`;
CREATE TABLE IF NOT EXISTS `duvidas_categorias_view` (
`duv_id` int(11)
,`duv_pergunta` text
,`duv_resposta` text
,`duvcategoria_id` int(11)
,`tiuser_id` int(11)
,`duvcat_id` int(11)
,`duvcat_nome` varchar(50)
,`duvcat_tipo_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_razaosocial` varchar(50) DEFAULT NULL,
  `emp_cnpj` varchar(50) NOT NULL,
  `emp_nomeresponsavel` varchar(50) DEFAULT NULL,
  `emp_nomefantasia` varchar(50) DEFAULT NULL,
  `emp_descri` varchar(60) DEFAULT NULL,
  `emp_img` varchar(250) DEFAULT NULL,
  `emp_datafundacao` datetime DEFAULT NULL,
  `emp_plano_id` int(11) DEFAULT 1,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`emp_id`, `emp_razaosocial`, `emp_cnpj`, `emp_nomeresponsavel`, `emp_nomefantasia`, `emp_descri`, `emp_img`, `emp_datafundacao`, `emp_plano_id`) VALUES
(1, 'Onclickup intermediação de negocias', '12154894181198115', 'Rento vieira', 'Onclikcup', 'zzzzzzzz', NULL, '2020-10-10 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_candidato_ficha`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_candidato_ficha`;
CREATE TABLE IF NOT EXISTS `empresa_candidato_ficha` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`cvl_id` int(11)
,`cvlvag_id` int(11)
,`cvlcand_id` int(11)
,`cvlcandidato_nome` varchar(30)
,`cvlemp_id` int(11)
,`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`fic_id` int(11)
,`fic_empresa` varchar(50)
,`fic_cargo` varchar(50)
,`fic_carteiraregistro` varchar(50)
,`fic_salario` decimal(10,2)
,`fic_dataentrada` datetime
,`fic_datasaida` datetime
,`fic_motivoSaida` varchar(50)
,`candidato_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_candidato_vaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_candidato_vaga`;
CREATE TABLE IF NOT EXISTS `empresa_candidato_vaga` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`cvl_id` int(11)
,`cvlvag_id` int(11)
,`cvl_user_id` int(11)
,`cvlcandidato_nome` varchar(30)
,`cvlemp_id` int(11)
,`cvlcand_id` int(11)
,`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_conta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_conta`;
CREATE TABLE IF NOT EXISTS `empresa_conta` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`cont_id` int(11)
,`cont_agencia` varchar(20)
,`cont_conta` varchar(50)
,`cont_titular` varchar(50)
,`cont_digito` varchar(11)
,`cont_user_id` int(11)
,`cont_bank_id` int(11)
,`bank_id` int(11)
,`bank_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_dados`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_dados`;
CREATE TABLE IF NOT EXISTS `empresa_dados` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_dica`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_dica`;
CREATE TABLE IF NOT EXISTS `empresa_dica` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`dic_id` int(11)
,`dic_text` varchar(200)
,`postdic_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_pedidos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_pedidos`;
CREATE TABLE IF NOT EXISTS `empresa_pedidos` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`statuspedi_id` int(11)
,`statuspedi_nome` varchar(50)
,`statuspedi_date` datetime
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_prestador_pedidos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_prestador_pedidos`;
CREATE TABLE IF NOT EXISTS `empresa_prestador_pedidos` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pretador_pedidos_id` int(11)
,`prestador_pedi_id` int(11)
,`prestador_user_id` int(11)
,`prestador_acc_id` int(11)
,`prestador_date` date
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_prova`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_prova`;
CREATE TABLE IF NOT EXISTS `empresa_prova` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_prova_pergunta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_prova_pergunta`;
CREATE TABLE IF NOT EXISTS `empresa_prova_pergunta` (
`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
,`quest_id` int(11)
,`quest_pergunta` varchar(50)
,`quest_a` varchar(50)
,`quest_b` varchar(50)
,`quest_c` varchar(50)
,`quest_d` varchar(50)
,`quest_e` varchar(50)
,`questpro_id` int(11)
,`quest_official` varchar(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_quiz_pergunta`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_quiz_pergunta`;
CREATE TABLE IF NOT EXISTS `empresa_quiz_pergunta` (
`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
,`quiz_id` int(11)
,`quiz_pergunta` varchar(50)
,`quizpro_id` int(11)
,`quizuser_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_servico`;
CREATE TABLE IF NOT EXISTS `empresa_servico` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`statServ_id` int(11)
,`statusServ_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_solicitacoes`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_solicitacoes`;
CREATE TABLE IF NOT EXISTS `empresa_solicitacoes` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`soli_id` int(11)
,`soli_descricao` varchar(255)
,`soli_date` date
,`soli_response` varchar(255)
,`solistatus_id` int(11)
,`soliusuario_id` int(11)
,`solicategoria_id` int(11)
,`status_soli_id` int(11)
,`status_soli` varchar(15)
,`solicat_id` int(11)
,`soli_cat_nm` varchar(100)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_vaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_vaga`;
CREATE TABLE IF NOT EXISTS `empresa_vaga` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`statusvag_id` int(11)
,`statusvag_nome` varchar(50)
,`tipovaga_id` int(11)
,`tipovaga_nome` varchar(50)
,`esco_id` int(11)
,`esco_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `empresa_vincula_prova`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `empresa_vincula_prova`;
CREATE TABLE IF NOT EXISTS `empresa_vincula_prova` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`vagprolink_id` int(11)
,`linkvag_id` int(11)
,`linkpro_id` int(11)
,`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `ender_id` int(11) NOT NULL AUTO_INCREMENT,
  `ender_numero` varchar(10) DEFAULT NULL,
  `ender_logradouro` varchar(60) DEFAULT NULL,
  `ender_bairro` varchar(50) DEFAULT NULL,
  `ender_cidade` varchar(50) NOT NULL,
  `enderest_id` int(11) NOT NULL,
  `ender_comple` varchar(25) DEFAULT NULL,
  `ender_cep` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`ender_id`, `ender_numero`, `ender_logradouro`, `ender_bairro`, `ender_cidade`, `enderest_id`, `ender_comple`, `ender_cep`) VALUES
(1, 'null', 'null', 'null', 'São paulo', 26, '', '0'),
(2, 'null', 'palo alto', 'palo alto', 'los angeles', 1, '', '0'),
(3, 'null', 'av paulista', 'Jardins', 'São paulo', 18, '', '0'),
(4, 'null', 'av paulista', 'Jardins', 'São paulo', 22, '', '0'),
(5, 'null', 'av paulista', 'Jardins', 'São paulo', 20, '', '0'),
(6, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(7, 'null', 'av paulista', 'Jardins', 'São paulo', 19, '', '0'),
(8, '108', 'Rua kitaro ywasa', 'Vila nova Mauá', 'Mauá', 26, 'casa 1', '9390670'),
(10, 'null', 'AV paulista', 'jardins', 'São paulo', 26, NULL, '0'),
(11, 'null', 'Rua Kitaro Ywasa 108 casa 1', '', 'Vila nova maua', 26, NULL, '0'),
(12, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(13, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(14, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(15, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '939067058'),
(16, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(17, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(18, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 26, 'casa 1', '0939067058'),
(19, NULL, 'Rua Kitaro Ywasa ', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(20, NULL, 'Rua Kitaro Ywasa ', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(21, NULL, 'Rua Kitaro Ywasa ', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(22, NULL, 'Rua Kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(23, NULL, 'Rua Kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(24, NULL, 'Rua Kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '0939067058'),
(25, NULL, 'Leão XI', 'Jardins', 'São paulo', 26, NULL, '0939067058'),
(26, NULL, 'Leão XI', 'Jardins', 'São paulo', 26, NULL, '0939067058'),
(27, NULL, 'Rua kitaro Ywasa', 'Vila nova mauá', 'Mauá', 26, NULL, '9390670'),
(28, NULL, 'Rua kitaro Ywasa', 'Vila nova mauá', 'Mauá', 26, NULL, '9390670'),
(29, NULL, 'Kitaro ywasa', 'Vila nova maua', 'São paulo', 26, NULL, '9390670'),
(30, NULL, 'Kitaro ywasa', 'Vila nova maua', 'São paulo', 26, NULL, '9390670'),
(31, NULL, '00000', '00000', '0000', 1, NULL, '0'),
(32, NULL, '00000', '00000', '0000', 1, NULL, '0'),
(33, NULL, '00000', '00000', '0000', 1, NULL, '0'),
(34, NULL, 'Rua Kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '9390670'),
(35, NULL, 'Rua Kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '9390670'),
(36, NULL, 'Rua kitaro Ywasa', 'Vila nova Mauá', 'Mauá', 26, NULL, '9390670'),
(37, NULL, 'Leao', 'Jardins', 'São paulo', 26, NULL, '939067059'),
(38, NULL, 'Leão  XI', 'jardins', 'São paulo', 26, NULL, '93906701'),
(39, NULL, 'leao', 'jardins', 'São paulo', 26, NULL, '9390670'),
(40, NULL, 'Kitaro Ywasa', 'Vila nova maua', 'Mauá', 26, NULL, '9390670'),
(41, NULL, 'Kitaro Ywasa', 'Vila nova maua', 'Mauá', 26, NULL, '9390670'),
(42, NULL, 'Rua Kitaro ywasa', 'Vila nova Maua', 'Mauá', 26, NULL, '9390670'),
(43, NULL, 'Leao', 'jardins', 'São', 14, NULL, '0'),
(44, NULL, 'sssssssssss', 'ssssssssssssss', 'ssssssssssssssss', 1, NULL, '0'),
(45, NULL, '00000000', '0000000000000000', '000000000000000000', 1, NULL, '0'),
(46, NULL, '00000000000000000', '000000000000000', '0000000000000000000', 18, NULL, '0'),
(47, NULL, '00000000000000000', '000000000000000', '0000000000000000000', 18, NULL, '0'),
(48, NULL, '0000000000000', '00000000000000', '00000000000000', 18, NULL, '0'),
(49, NULL, '0000000000000', '00000000000000', '00000000000000', 18, NULL, '0'),
(50, NULL, 'sssssss', '0ssssssssssssssssssssss', 'sssssssssssssssssss', 1, NULL, '0'),
(51, NULL, '0000000000000000000', '000000000000000000', '0000000000000000000', 18, NULL, '0'),
(52, NULL, '0000000000000000000', '000000000000000000', '0000000000000000000', 18, NULL, '0'),
(53, NULL, '0000000000000000000', '000000000000000000', '0000000000000000000', 18, NULL, '0'),
(54, NULL, 'Rua kitaro ywasa ', 'Vila nova mauá', 'Mauá', 26, NULL, '9390670'),
(55, '108', 'Rua kitaro ywasa', 'Vila nova mauá', 'Mauá', 26, NULL, '9390670'),
(56, NULL, 'Av a', 'a', 'São a', 14, NULL, NULL),
(57, NULL, 'av paulista', 'jar', 'ssss', 1, NULL, NULL),
(58, NULL, 'Av paulista', 'Jarfdins', 'São paulo', 1, NULL, NULL),
(59, NULL, 'Av paulista', 'jardins', 'São paulo', 1, NULL, NULL),
(60, NULL, 'av paulista', 'jardins ', 'Mauá', 14, NULL, NULL),
(61, NULL, 'jhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhhhhhh', 'hhhhhhhh', 18, NULL, NULL),
(62, NULL, 'av apauçlisyta', 'jardins', 'São paulo', 1, NULL, NULL),
(63, NULL, 'Av paulista', 'Jardins', 'São paulo', 26, NULL, NULL),
(64, '108', 'Rua kitaro ywsa', 'Vila nova paulistana', 'São paulo', 1, NULL, '9390670'),
(65, '108', 'Rua kitaro ywsa', 'Vila nova paulistana', 'São paulo', 1, NULL, '9390670'),
(66, '108', 'Rua kitaro ywsa', 'Vila nova paulistana', 'São paulo', 1, NULL, '9390670'),
(67, '00', 'logradouro', 'jardins', 'Mauaá', 26, NULL, '9390670'),
(68, '00', 'logradouro', 'jardins', 'Mauaá', 26, NULL, '9390670'),
(69, '00', 'logradouro', 'hardins', 'Mauaá', 26, NULL, '9390670'),
(70, '00', 'Mauá', 'jardins', 'Mauá', 26, NULL, '9390670'),
(71, '00', 'Mauá', 'jardins', 'Mauá', 26, NULL, '9390670'),
(72, '00', 'Mauá', 'jardins', 'Mauá', 26, NULL, '9390670'),
(73, '00', 'Mauá', 'jardins', 'Mauá', 26, NULL, '9390670'),
(74, '00', 'Mauá', 'jardins', 'Mauá', 26, NULL, '9390670'),
(75, '00', 'Rua nova londrina', 'jardins', 'Mauá', 26, NULL, '9390670'),
(76, '00', 'Rua nova londrina', 'jardins', 'Mauá', 26, NULL, '9390670'),
(77, '00', 'Rua kitaro ywasa', 'eeeeeeeeeeee', 'Mauá', 26, NULL, '9390670'),
(78, '00', 'Rua kitaro ywasa', 'eeeeeeeeeeee', 'Mauá', 26, NULL, '9390670'),
(79, '00', 'Rua kitaro ywasa', 'eeeeeeeeeeee', 'Mauá', 26, NULL, '9390670'),
(80, '00', 'Rua kitaro ywasa', 'eeeeeeeeeeee', 'Mauá', 26, NULL, '9390670'),
(81, '48484', 'Logradouro', 'bairro', 'Cidade', 26, NULL, '48'),
(82, '00', 'Rua kitaro ywasa', 'eeeeeeeeeeee', 'Mauá', 26, NULL, '9390670'),
(83, '00', 'Logradouro', 'bairro', 'Mauá', 26, NULL, '93907'),
(84, '00', 'Logradouro', 'bairro', 'Mauá', 26, NULL, '93907'),
(85, '111', 'aaaaaaaaaaaaaaaaaa', '444', 'ggggggggggggggggggggggg', 1, NULL, '454577'),
(86, '111', 'aaaaaaaaaaaaaaaaaa', '444', 'ggggggggggggggggggggggg', 1, NULL, '454577'),
(87, '', 'sssssss', 'jardins', 'Mauá', 14, NULL, '0'),
(88, '00', 'sssssss', 'jardins', 'Mauá', 14, NULL, '0'),
(89, '00', 'fisica', 'fisica', 'fisica', 18, NULL, '9390670'),
(90, '22', 'Logradouro', 'bairro', 'cidade', 8, NULL, '12458'),
(91, '22', 'Logradouro', 'bairro', 'cidade', 8, NULL, '12458'),
(92, '22', 'Logradouro', 'bairro', 'cidade', 8, NULL, '12458'),
(93, NULL, 'Av portugal', 'Vila barra', 'Mauá', 26, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `escolaridade`
--

DROP TABLE IF EXISTS `escolaridade`;
CREATE TABLE IF NOT EXISTS `escolaridade` (
  `esco_id` int(11) NOT NULL AUTO_INCREMENT,
  `esco_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`esco_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `escolaridade`
--

INSERT INTO `escolaridade` (`esco_id`, `esco_nome`) VALUES
(1, 'fundamental - Incompleto'),
(2, 'Fundamental - Completo'),
(3, 'Médio - Incompleto'),
(4, 'Médio - Cursando'),
(5, 'Médio - Completo'),
(6, 'Superior - Incompleto'),
(7, 'Superior - Cursando'),
(8, 'Superior - Cursando'),
(9, 'Superior - Completo'),
(10, 'Pós-graduação (Lato senso) - Incompleto'),
(11, 'Pós-graduação (Lato senso) - Cursando'),
(12, 'Pós-graduação (Lato senso) - Completo');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `escolaridade_post_vaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `escolaridade_post_vaga`;
CREATE TABLE IF NOT EXISTS `escolaridade_post_vaga` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`esco_id` int(11)
,`esco_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_nome` varchar(50) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`est_id`, `est_nome`, `pais_id`) VALUES
(1, 'Acre', 1),
(2, 'AL', 1),
(3, 'AM', 1),
(4, 'AP', 1),
(5, 'BA', 1),
(6, 'CE', 1),
(7, 'DF', 1),
(8, 'ES', 1),
(9, 'GO', 1),
(10, 'MA', 1),
(11, 'MG', 1),
(12, 'MS', 1),
(13, 'MT', 1),
(14, 'PA', 1),
(15, 'PB', 1),
(16, 'PE', 1),
(17, 'PI', 1),
(18, 'PR', 1),
(19, 'RJ', 1),
(20, 'RN', 1),
(21, 'RO', 1),
(22, 'RR', 1),
(23, 'RS', 1),
(24, 'SC', 1),
(25, 'SE', 1),
(26, 'SP', 1),
(27, 'TO', 1),
(28, 'default', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
CREATE TABLE IF NOT EXISTS `estado_civil` (
  `estc_id` int(11) NOT NULL AUTO_INCREMENT,
  `estc_nome` varchar(20) NOT NULL,
  PRIMARY KEY (`estc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estado_civil`
--

INSERT INTO `estado_civil` (`estc_id`, `estc_nome`) VALUES
(1, 'Solteiro(a)'),
(2, 'Casado(a'),
(3, 'Divorciado(a)'),
(4, 'Viúvo(a)'),
(5, 'Separado(a)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fichaexperiecia`
--

DROP TABLE IF EXISTS `fichaexperiecia`;
CREATE TABLE IF NOT EXISTS `fichaexperiecia` (
  `fic_id` int(11) NOT NULL AUTO_INCREMENT,
  `fic_empresa` varchar(50) DEFAULT NULL,
  `fic_cargo` varchar(50) DEFAULT NULL,
  `fic_carteiraregistro` varchar(50) DEFAULT NULL,
  `fic_salario` decimal(10,2) DEFAULT NULL,
  `fic_dataentrada` datetime DEFAULT NULL,
  `fic_datasaida` datetime DEFAULT NULL,
  `fic_motivoSaida` varchar(50) DEFAULT NULL,
  `candidato_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fichaexperiecia`
--

INSERT INTO `fichaexperiecia` (`fic_id`, `fic_empresa`, `fic_cargo`, `fic_carteiraregistro`, `fic_salario`, `fic_dataentrada`, `fic_datasaida`, `fic_motivoSaida`, `candidato_id`) VALUES
(1, 'empresa', 'cargo', 'sim', '1500.00', '2001-02-20 00:00:00', '2002-02-20 00:00:00', 'sssssss', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacaoacademia`
--

DROP TABLE IF EXISTS `formacaoacademia`;
CREATE TABLE IF NOT EXISTS `formacaoacademia` (
  `forma_id` int(11) NOT NULL,
  `forma_nome` varchar(50) DEFAULT NULL,
  `cand_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formacao_inst_link`
--

DROP TABLE IF EXISTS `formacao_inst_link`;
CREATE TABLE IF NOT EXISTS `formacao_inst_link` (
  `forma_id` int(11) DEFAULT NULL,
  `inst_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instensino_escolaridade_link`
--

DROP TABLE IF EXISTS `instensino_escolaridade_link`;
CREATE TABLE IF NOT EXISTS `instensino_escolaridade_link` (
  `inst_id` int(11) NOT NULL,
  `esco_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicaoensino`
--

DROP TABLE IF EXISTS `instituicaoensino`;
CREATE TABLE IF NOT EXISTS `instituicaoensino` (
  `inst_id` int(11) NOT NULL AUTO_INCREMENT,
  `inst_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`inst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `makers`
--

DROP TABLE IF EXISTS `makers`;
CREATE TABLE IF NOT EXISTS `makers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `msn_id` int(11) NOT NULL AUTO_INCREMENT,
  `msn_date` datetime DEFAULT NULL,
  `msn_nome` longtext DEFAULT NULL,
  PRIMARY KEY (`msn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`msn_id`, `msn_date`, `msn_nome`) VALUES
(1, '2020-05-20 05:00:00', '\r\n\r\nmensagem do pedido descrição feita'),
(2, NULL, 'yyyyyyyyyyyyyyyyyyyyy\r\n\r\n                                  '),
(3, NULL, '\r\npedido feito pelo candidato Renato será feito por uma empresa\r\n                                  '),
(10, NULL, '\r\npedido feito pelo candidato Renato será feito por uma empresa\r\n                                  '),
(11, NULL, '\r\npedido feito pelo candidato Renato será feito por uma empresa\r\n                                  '),
(12, NULL, '\r\nServico contratado por um candidato Renato \r\n                                  '),
(16, NULL, '        aaaaaaaaaaaaa                           \r\n                                '),
(28, NULL, 'ewee'),
(29, NULL, 'eeee'),
(30, NULL, 'teste'),
(31, NULL, 'rerer'),
(32, NULL, 'EEE'),
(33, NULL, 'EEEEEE'),
(34, NULL, 'sss'),
(35, NULL, 'teste'),
(36, NULL, 'teste'),
(37, NULL, 'teste'),
(38, NULL, 'teste'),
(39, NULL, 'teste'),
(40, NULL, 'teste'),
(41, NULL, 'rwarw'),
(42, NULL, 'aaa'),
(43, NULL, 'oi meu nome é rento'),
(44, NULL, 'Oi meu nome é renato'),
(45, NULL, 'eeee'),
(46, NULL, 'ddd'),
(47, NULL, 'ddd'),
(48, NULL, 'teste'),
(49, NULL, 'test'),
(50, NULL, 'teste'),
(51, NULL, 'Oi meu nome é renato vieira'),
(52, NULL, 'Meu nome é renato vieira'),
(53, NULL, '                                    oujm\r\n                                '),
(54, NULL, 'poppo'),
(55, NULL, '\r\n\r\n                                  '),
(56, NULL, '\r\ntttttttttttttt\r\n                                  '),
(57, NULL, '\r\ntttttttttttttt\r\n                                  '),
(58, NULL, '\r\ntttttttttttttt\r\n                                  ');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `mysherepoint`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `mysherepoint`;
CREATE TABLE IF NOT EXISTS `mysherepoint` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`tipopost_id` int(11)
,`tipopost` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
,`shere_id` int(11)
,`shere_post_id` int(11)
,`shere_user_id` int(11)
,`shere_user_nome` varchar(25)
,`shere_autor_user_id` int(11)
,`shere_autor_nome` varchar(50)
,`shere_user_img` varchar(200)
,`shere_ti_post` int(11)
,`shere_text` text
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `notifications_candidatovaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `notifications_candidatovaga`;
CREATE TABLE IF NOT EXISTS `notifications_candidatovaga` (
`cvl_id` int(11)
,`cvlvag_id` int(11)
,`cvl_user_id` int(11)
,`cvlcandidato_nome` varchar(30)
,`cvlemp_id` int(11)
,`cvlcand_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `notifications_mensagem_vaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `notifications_mensagem_vaga`;
CREATE TABLE IF NOT EXISTS `notifications_mensagem_vaga` (
`vml_id` int(11)
,`vml_user_remetente_id` int(11)
,`vml_user_destinatario_id` int(11)
,`vml_vaga_id` int(11)
,`vml_msn_id` int(11)
,`vml_view` int(11)
,`vml_date` datetime
,`vmdl_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `notifications_servicos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `notifications_servicos`;
CREATE TABLE IF NOT EXISTS `notifications_servicos` (
`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `notifications_shere`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `notifications_shere`;
CREATE TABLE IF NOT EXISTS `notifications_shere` (
`shere_id` int(11)
,`shere_post_id` int(11)
,`shere_user_id` int(11)
,`shere_user_nome` varchar(25)
,`shere_autor_user_id` int(11)
,`shere_autor_nome` varchar(50)
,`shere_user_img` varchar(200)
,`shere_ti_post` int(11)
,`shere_text` text
,`tipopost_id` int(11)
,`tipopost` varchar(50)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `notificatis_candidatovaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `notificatis_candidatovaga`;
CREATE TABLE IF NOT EXISTS `notificatis_candidatovaga` (
`cvl_id` int(11)
,`cvlvag_id` int(11)
,`cvl_user_id` int(11)
,`cvlcandidato_nome` varchar(30)
,`cvlemp_id` int(11)
,`cvlcand_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE IF NOT EXISTS `pedido` (
  `pedi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pedi_registro` date NOT NULL,
  `status_number_id` int(10) DEFAULT NULL,
  `pedi_valortotal` decimal(10,2) DEFAULT NULL,
  `pedi_description` longtext NOT NULL,
  `statuspe_id` int(11) NOT NULL,
  `pedi_serv_id` int(11) DEFAULT NULL,
  `cliente_user_id` int(11) NOT NULL,
  `status_pay_id` int(11) NOT NULL,
  `pedi_prestador_user_id` int(11) NOT NULL,
  PRIMARY KEY (`pedi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`pedi_id`, `pedi_registro`, `status_number_id`, `pedi_valortotal`, `pedi_description`, `statuspe_id`, `pedi_serv_id`, `cliente_user_id`, `status_pay_id`, `pedi_prestador_user_id`) VALUES
(1, '2025-05-20', 1, '305.00', 'yyyyyyyyyyyyyyyyyyyyy\r\n\r\n                                  ', 2, 1, 4, 2, 3),
(2, '2006-06-20', 1, '20.00', '\r\npedido feito pelo candidato Renato será feito por uma empresa\r\n                                  ', 2, 3, 5, 2, 4),
(3, '2007-06-20', 1, '305.00', '\r\nServico contratado por um candidato Renato \r\n                                  ', 2, 1, 5, 2, 3),
(4, '2012-10-20', 5, '10.00', '\r\n\r\n                                  ', 3, 2, 17, 2, 1),
(5, '2012-10-20', 1, '10.00', '\r\ntttttttttttttt\r\n                                  ', 2, 2, 17, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoplano`
--

DROP TABLE IF EXISTS `pedidoplano`;
CREATE TABLE IF NOT EXISTS `pedidoplano` (
  `pd_id` int(11) NOT NULL,
  `pd_plano_id` int(11) NOT NULL,
  `pd_inicio` date NOT NULL,
  `pd_termino` date NOT NULL,
  `pd_payments_id` int(11) NOT NULL,
  `pd_emp_id` int(11) NOT NULL,
  `pd_valortotal` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pedidos_prestador_dados`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `pedidos_prestador_dados`;
CREATE TABLE IF NOT EXISTS `pedidos_prestador_dados` (
`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pretador_pedidos_id` int(11)
,`prestador_pedi_id` int(11)
,`prestador_user_id` int(11)
,`prestador_acc_id` int(11)
,`prestador_date` date
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pedido_conversas`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `pedido_conversas`;
CREATE TABLE IF NOT EXISTS `pedido_conversas` (
`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`pml_id` int(11)
,`pml_user_remetente_id` int(11)
,`pml_user_destinatario_id` int(11)
,`pml_pedi_id` int(11)
,`pml_msn_id` int(11)
,`pml_view` int(11)
,`pml_date` datetime
,`pml_pmdl_id` int(11)
,`msn_id` int(11)
,`msn_date` datetime
,`msn_nome` longtext
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pedido_detalhes`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `pedido_detalhes`;
CREATE TABLE IF NOT EXISTS `pedido_detalhes` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`statusnumber_id` int(11)
,`statusnumber` varchar(20)
,`statuspedi_id` int(11)
,`statuspedi_nome` varchar(50)
,`statuspedi_date` datetime
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `pedido_mensagems`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `pedido_mensagems`;
CREATE TABLE IF NOT EXISTS `pedido_mensagems` (
`pedi_id` int(11)
,`pedi_registro` date
,`status_number_id` int(10)
,`pedi_valortotal` decimal(10,2)
,`pedi_description` longtext
,`statuspe_id` int(11)
,`pedi_serv_id` int(11)
,`cliente_user_id` int(11)
,`status_pay_id` int(11)
,`pedi_prestador_user_id` int(11)
,`pml_id` int(11)
,`pml_user_remetente_id` int(11)
,`pml_user_destinatario_id` int(11)
,`pml_pedi_id` int(11)
,`pml_msn_id` int(11)
,`pml_view` int(11)
,`pml_date` datetime
,`pml_pmdl_id` int(11)
,`msn_id` int(11)
,`msn_date` datetime
,`msn_nome` longtext
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_mensagem_dados_link`
--

DROP TABLE IF EXISTS `pedido_mensagem_dados_link`;
CREATE TABLE IF NOT EXISTS `pedido_mensagem_dados_link` (
  `pmdl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pmdl_cliente_foto` varchar(200) DEFAULT NULL,
  `pmdl_cliente_nome` varchar(50) NOT NULL,
  `pmdl_prestador_foto` varchar(200) DEFAULT NULL,
  `pmdl_prestador_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`pmdl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_mensagem_dados_link`
--

INSERT INTO `pedido_mensagem_dados_link` (`pmdl_id`, `pmdl_cliente_foto`, `pmdl_cliente_nome`, `pmdl_prestador_foto`, `pmdl_prestador_nome`) VALUES
(1, '', 'Amazon', '', 'microsoft'),
(2, '', 'Amazon', '', 'microsoft'),
(3, '', 'Renato santos', '', 'Amazon'),
(12, '', 'Renato santos', '', 'microsoft'),
(13, NULL, 'candidato teste 1', NULL, 'Renato Onclickup '),
(14, NULL, 'candidato teste 1', NULL, 'Renato Onclickup ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_mensagem_link`
--

DROP TABLE IF EXISTS `pedido_mensagem_link`;
CREATE TABLE IF NOT EXISTS `pedido_mensagem_link` (
  `pml_id` int(11) NOT NULL AUTO_INCREMENT,
  `pml_user_remetente_id` int(11) NOT NULL,
  `pml_user_destinatario_id` int(11) NOT NULL,
  `pml_pedi_id` int(11) NOT NULL,
  `pml_msn_id` int(11) NOT NULL,
  `pml_view` int(11) NOT NULL DEFAULT 0,
  `pml_date` datetime DEFAULT current_timestamp(),
  `pml_pmdl_id` int(11) NOT NULL,
  PRIMARY KEY (`pml_id`),
  KEY `pedido_mesagem_2` (`pml_pedi_id`),
  KEY `pedido_mesagem_1` (`pml_msn_id`),
  KEY `pml_pmdl_id` (`pml_pmdl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_mensagem_link`
--

INSERT INTO `pedido_mensagem_link` (`pml_id`, `pml_user_remetente_id`, `pml_user_destinatario_id`, `pml_pedi_id`, `pml_msn_id`, `pml_view`, `pml_date`, `pml_pmdl_id`) VALUES
(1, 17, 1, 5, 57, 0, '2020-10-12 16:04:56', 13),
(2, 17, 1, 5, 58, 0, '2020-10-12 16:09:55', 14);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_prestador`
--

DROP TABLE IF EXISTS `pedido_prestador`;
CREATE TABLE IF NOT EXISTS `pedido_prestador` (
  `pretador_pedidos_id` int(11) NOT NULL AUTO_INCREMENT,
  `prestador_pedi_id` int(11) NOT NULL,
  `prestador_user_id` int(11) NOT NULL,
  `prestador_acc_id` int(11) NOT NULL,
  `prestador_date` date NOT NULL,
  PRIMARY KEY (`pretador_pedidos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido_prestador`
--

INSERT INTO `pedido_prestador` (`pretador_pedidos_id`, `prestador_pedi_id`, `prestador_user_id`, `prestador_acc_id`, `prestador_date`) VALUES
(1, 2, 3, 4, '2020-10-11'),
(2, 4, 1, 1, '2012-10-20'),
(3, 5, 1, 3, '2012-10-20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

DROP TABLE IF EXISTS `plano`;
CREATE TABLE IF NOT EXISTS `plano` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano`
--

INSERT INTO `plano` (`plan_id`, `plan_nome`) VALUES
(1, 'GRATUITO'),
(2, 'PLANO PREMIUM ANUAL'),
(3, 'PLANO PREMIUN PLUS ANUAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_titulo` varchar(50) DEFAULT NULL,
  `post_subtitulo` varchar(50) DEFAULT NULL,
  `post_description` varchar(150) DEFAULT NULL,
  `postcat_id` int(11) DEFAULT NULL,
  `tipo_post_id` int(11) NOT NULL,
  `userpost_id` int(11) NOT NULL,
  `post_ender_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `post_dica`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `post_dica`;
CREATE TABLE IF NOT EXISTS `post_dica` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`dic_id` int(11)
,`dic_text` varchar(200)
,`postdic_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `post_vaga`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `post_vaga`;
CREATE TABLE IF NOT EXISTS `post_vaga` (
`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`statusvag_id` int(11)
,`statusvag_nome` varchar(50)
,`tipovaga_id` int(11)
,`tipovaga_nome` varchar(50)
,`esco_id` int(11)
,`esco_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `post_vaga_prova`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `post_vaga_prova`;
CREATE TABLE IF NOT EXISTS `post_vaga_prova` (
`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`vagprolink_id` int(11)
,`linkvag_id` int(11)
,`linkpro_id` int(11)
,`pro_id` int(11)
,`pro_nome` varchar(50)
,`tipro_id` int(11)
,`proemp_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
CREATE TABLE IF NOT EXISTS `preferencias` (
  `pref_id` int(11) NOT NULL AUTO_INCREMENT,
  `pref_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`pref_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `preferencias`
--

INSERT INTO `preferencias` (`pref_id`, `pref_nome`) VALUES
(1, 'Gestor'),
(2, 'Servico'),
(3, 'Vaga');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prova`
--

DROP TABLE IF EXISTS `prova`;
CREATE TABLE IF NOT EXISTS `prova` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nome` varchar(50) DEFAULT NULL,
  `tipro_id` int(11) NOT NULL,
  `proemp_id` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prova`
--

INSERT INTO `prova` (`pro_id`, `pro_nome`, `tipro_id`, `proemp_id`) VALUES
(1, 'Matemtica', 1, 4),
(2, 'Logica de programação', 2, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `questionario`
--

DROP TABLE IF EXISTS `questionario`;
CREATE TABLE IF NOT EXISTS `questionario` (
  `quest_id` int(11) NOT NULL AUTO_INCREMENT,
  `quest_pergunta` varchar(50) DEFAULT NULL,
  `quest_a` varchar(50) DEFAULT NULL,
  `quest_b` varchar(50) DEFAULT NULL,
  `quest_c` varchar(50) DEFAULT NULL,
  `quest_d` varchar(50) DEFAULT NULL,
  `quest_e` varchar(50) DEFAULT NULL,
  `questpro_id` int(11) DEFAULT NULL,
  `quest_official` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`quest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `questionario`
--

INSERT INTO `questionario` (`quest_id`, `quest_pergunta`, `quest_a`, `quest_b`, `quest_c`, `quest_d`, `quest_e`, `questpro_id`, `quest_official`) VALUES
(1, 'Qual é a area do tricangilo', 'lado X lado', 'lado ao quadrado', 'altura ao quadrado', 'lado X altura', 'nenhum das anteriores', 1, 'D');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE IF NOT EXISTS `quiz` (
  `quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `quiz_pergunta` varchar(50) NOT NULL,
  `quizpro_id` int(11) NOT NULL,
  `quizuser_id` int(11) NOT NULL,
  PRIMARY KEY (`quiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta`
--

DROP TABLE IF EXISTS `resposta`;
CREATE TABLE IF NOT EXISTS `resposta` (
  `resp_id` int(11) NOT NULL AUTO_INCREMENT,
  `resp_candidado` varchar(50) DEFAULT NULL,
  `respquest_id` int(11) NOT NULL,
  `respcand_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`resp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `resposta_quiz`
--

DROP TABLE IF EXISTS `resposta_quiz`;
CREATE TABLE IF NOT EXISTS `resposta_quiz` (
  `requiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `requiz_candidado` varchar(220) NOT NULL,
  `requizcand_id` int(11) NOT NULL,
  PRIMARY KEY (`requiz_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `serv_id` int(11) NOT NULL AUTO_INCREMENT,
  `serv_preRequisitos` varchar(150) NOT NULL,
  `serv_beneficios` varchar(150) NOT NULL,
  `serv_prazo` int(11) NOT NULL,
  `serv_valor` varchar(25) NOT NULL,
  `serv_arquivo1` varchar(220) DEFAULT NULL,
  `serv_arquivo2` varchar(220) DEFAULT NULL,
  `serv_arquivo3` varchar(220) DEFAULT NULL,
  `statusServ_id` int(11) NOT NULL,
  `postserv_id` int(11) NOT NULL,
  PRIMARY KEY (`serv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`serv_id`, `serv_preRequisitos`, `serv_beneficios`, `serv_prazo`, `serv_valor`, `serv_arquivo1`, `serv_arquivo2`, `serv_arquivo3`, `statusServ_id`, `postserv_id`) VALUES
(2, 'Requisitos necessarios', 'Descreva o beneficios do serviço prestado', 2, '10', '1602525275', '1602525275', '1602525275', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `shere`
--

DROP TABLE IF EXISTS `shere`;
CREATE TABLE IF NOT EXISTS `shere` (
  `shere_id` int(11) NOT NULL AUTO_INCREMENT,
  `shere_post_id` int(11) DEFAULT NULL,
  `shere_user_id` int(11) DEFAULT NULL,
  `shere_user_nome` varchar(25) NOT NULL,
  `shere_autor_user_id` int(11) NOT NULL,
  `shere_autor_nome` varchar(50) NOT NULL,
  `shere_user_img` varchar(200) NOT NULL,
  `shere_ti_post` int(11) NOT NULL,
  `shere_text` text NOT NULL,
  PRIMARY KEY (`shere_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao_categoria`
--

DROP TABLE IF EXISTS `solicitacao_categoria`;
CREATE TABLE IF NOT EXISTS `solicitacao_categoria` (
  `solicat_id` int(11) NOT NULL AUTO_INCREMENT,
  `soli_cat_nm` varchar(100) NOT NULL,
  PRIMARY KEY (`solicat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `solicitacao_categoria`
--

INSERT INTO `solicitacao_categoria` (`solicat_id`, `soli_cat_nm`) VALUES
(1, 'Revisão de valores (serviços)'),
(2, 'Revisão de valores (pedido)'),
(3, 'reembolso (pedido)'),
(4, 'reembolso (serviço)'),
(5, 'Duvida'),
(6, 'Parcerias'),
(7, 'Mudança de plano'),
(8, 'Cancelamento de  plano');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacoes`
--

DROP TABLE IF EXISTS `solicitacoes`;
CREATE TABLE IF NOT EXISTS `solicitacoes` (
  `soli_id` int(11) NOT NULL AUTO_INCREMENT,
  `soli_descricao` varchar(255) NOT NULL,
  `soli_date` date NOT NULL,
  `soli_response` varchar(255) NOT NULL,
  `solistatus_id` int(11) NOT NULL,
  `soliusuario_id` int(11) NOT NULL,
  `solicategoria_id` int(11) NOT NULL,
  PRIMARY KEY (`soli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `solicitacoes`
--

INSERT INTO `solicitacoes` (`soli_id`, `soli_descricao`, `soli_date`, `soli_response`, `solistatus_id`, `soliusuario_id`, `solicategoria_id`) VALUES
(1, 'pedido 15919', '2024-02-20', '', 1, 1, 2),
(2, '', '2016-03-20', '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_concurso`
--

DROP TABLE IF EXISTS `status_concurso`;
CREATE TABLE IF NOT EXISTS `status_concurso` (
  `statuscon_id` int(11) NOT NULL AUTO_INCREMENT,
  `statuscon_nome` varchar(25) NOT NULL,
  PRIMARY KEY (`statuscon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_payments`
--

DROP TABLE IF EXISTS `status_payments`;
CREATE TABLE IF NOT EXISTS `status_payments` (
  `statuspay_id` int(11) NOT NULL AUTO_INCREMENT,
  `statuspay` varchar(50) NOT NULL,
  PRIMARY KEY (`statuspay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `status_payments`
--

INSERT INTO `status_payments` (`statuspay_id`, `statuspay`) VALUES
(1, 'Pagamento aprovado'),
(2, 'Pagamento pendente'),
(3, 'Recusado por erro geral.'),
(4, 'Recusado com validação para autorizar.'),
(5, 'Recusado por quantia insuficiente'),
(6, 'Recusado por código de segurança inválido'),
(7, ' Recusado por problema com a data de vencimento'),
(8, 'Recusado por erro no formulário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_pedido`
--

DROP TABLE IF EXISTS `status_pedido`;
CREATE TABLE IF NOT EXISTS `status_pedido` (
  `statuspedi_id` int(11) NOT NULL AUTO_INCREMENT,
  `statuspedi_nome` varchar(50) DEFAULT NULL,
  `statuspedi_date` datetime DEFAULT NULL,
  PRIMARY KEY (`statuspedi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status_pedido`
--

INSERT INTO `status_pedido` (`statuspedi_id`, `statuspedi_nome`, `statuspedi_date`) VALUES
(1, 'Parado', '2020-02-27 23:13:21'),
(2, 'Pendente', '2020-02-27 23:13:21'),
(3, 'Em negociação', '2020-02-27 23:13:21'),
(4, 'Entregue', '2020-02-27 23:13:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_progress`
--

DROP TABLE IF EXISTS `status_progress`;
CREATE TABLE IF NOT EXISTS `status_progress` (
  `statusnumber_id` int(11) NOT NULL,
  `statusnumber` varchar(20) NOT NULL,
  PRIMARY KEY (`statusnumber_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `status_progress`
--

INSERT INTO `status_progress` (`statusnumber_id`, `statusnumber`) VALUES
(1, '0%'),
(2, '5%'),
(3, '10%'),
(4, '15%'),
(5, '20%'),
(6, '25%'),
(7, '30%'),
(8, '35%'),
(9, '40%'),
(10, '45%'),
(11, '50%'),
(12, '55%'),
(13, '60%'),
(14, '65%'),
(15, '70%'),
(16, '75%'),
(17, '80%'),
(18, '85%'),
(19, '90%'),
(20, '95%'),
(21, '100%');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_servico`
--

DROP TABLE IF EXISTS `status_servico`;
CREATE TABLE IF NOT EXISTS `status_servico` (
  `statServ_id` int(11) NOT NULL,
  `statusServ_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status_servico`
--

INSERT INTO `status_servico` (`statServ_id`, `statusServ_nome`) VALUES
(1, 'desativado'),
(2, 'ativado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_solicitacao`
--

DROP TABLE IF EXISTS `status_solicitacao`;
CREATE TABLE IF NOT EXISTS `status_solicitacao` (
  `status_soli_id` int(11) NOT NULL,
  `status_soli` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `status_solicitacao`
--

INSERT INTO `status_solicitacao` (`status_soli_id`, `status_soli`) VALUES
(1, 'Em aberto'),
(2, 'Pendente'),
(3, 'Concluido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_vaga`
--

DROP TABLE IF EXISTS `status_vaga`;
CREATE TABLE IF NOT EXISTS `status_vaga` (
  `statusvag_id` int(11) NOT NULL,
  `statusvag_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status_vaga`
--

INSERT INTO `status_vaga` (`statusvag_id`, `statusvag_nome`) VALUES
(1, 'Aberto'),
(2, 'Fechado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pedido`
--

DROP TABLE IF EXISTS `tipo_pedido`;
CREATE TABLE IF NOT EXISTS `tipo_pedido` (
  `tiped_id` int(11) NOT NULL,
  `tiped_nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_pedido`
--

INSERT INTO `tipo_pedido` (`tiped_id`, `tiped_nome`) VALUES
(1, 'plano'),
(2, 'servico'),
(1, 'plano'),
(2, 'servico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_post`
--

DROP TABLE IF EXISTS `tipo_post`;
CREATE TABLE IF NOT EXISTS `tipo_post` (
  `tipopost_id` int(11) NOT NULL,
  `tipopost` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_post`
--

INSERT INTO `tipo_post` (`tipopost_id`, `tipopost`) VALUES
(1, 'Vaga'),
(2, 'Servico'),
(3, 'Dicas'),
(4, 'Concurso'),
(5, 'Artigo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_prova`
--

DROP TABLE IF EXISTS `tipo_prova`;
CREATE TABLE IF NOT EXISTS `tipo_prova` (
  `tiprov_id` int(11) NOT NULL,
  `tiprov_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_prova`
--

INSERT INTO `tipo_prova` (`tiprov_id`, `tiprov_nome`) VALUES
(1, 'avaliacao'),
(2, 'quiz');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_user`
--

DROP TABLE IF EXISTS `tipo_user`;
CREATE TABLE IF NOT EXISTS `tipo_user` (
  `tiuser_id` int(11) NOT NULL,
  `tiuser_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_user`
--

INSERT INTO `tipo_user` (`tiuser_id`, `tiuser_nome`) VALUES
(1, 'Candidato (Fisica)'),
(2, 'Empresa (juridica)'),
(3, 'Governo'),
(4, 'Admin'),
(5, 'subUsuario');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_vaga`
--

DROP TABLE IF EXISTS `tipo_vaga`;
CREATE TABLE IF NOT EXISTS `tipo_vaga` (
  `tipovaga_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipovaga_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`tipovaga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tipo_vaga`
--

INSERT INTO `tipo_vaga` (`tipovaga_id`, `tipovaga_nome`) VALUES
(1, ' Efetivo/CLT'),
(2, ' Tempo Integral'),
(3, ' Temporário'),
(4, ' Estágio'),
(5, 'Aprendiz'),
(6, ' Comissionado'),
(7, ' Autônomo'),
(8, ' Meio Período'),
(9, ' Trainee');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_status` varchar(50) DEFAULT NULL,
  `user_nome` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `user_img` varchar(255) DEFAULT NULL,
  `user_senha` text DEFAULT NULL,
  `user_dataCadastro` datetime DEFAULT NULL,
  `tiuser_id` int(11) DEFAULT NULL,
  `user_ender_id` int(11) DEFAULT NULL,
  `user_primary` int(11) NOT NULL DEFAULT 0,
  `user_preferences_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`user_id`, `user_status`, `user_nome`, `user_email`, `user_img`, `user_senha`, `user_dataCadastro`, `tiuser_id`, `user_ender_id`, `user_primary`, `user_preferences_id`) VALUES
(1, '1', 'Renato Onclickup ', 'gestor@onclickup.com', NULL, '$2y$12$oG7rExtR8u0fpMPvy.nCau9K.18CX.UWqut0sT9E9u9aNvAKoHNx6', '2029-09-20 00:00:00', 2, 55, 0, 1),
(17, '1', 'candidato teste 1', 'teste1@gmail.com', NULL, '$2y$12$Gczzw1HMJairWG9AsFUAPOI8L7lYFG1Hcx8vVKo/Z4D3/QcbhIg7W', '2001-10-20 00:00:00', 1, 88, 0, 1),
(20, '1', 'candidato teste 2', 'test3@gmail.com', NULL, '$2y$12$bb9cSDvzJaq4LeUZomQ8se0VgOQXhg7eaNVFc5Ls56hzCJrJ0YLxy', '2001-10-20 00:00:00', 1, 92, 0, 1),
(19, '1', 'candidato teste 2', 'teste2@gmail.com', NULL, '$2y$12$JSWiByr0T0AzI6Olak68oeCZk1C.Z3vlKGUzlXlUqr37T4sRn0Pbe', '2001-10-20 00:00:00', 1, 91, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_seguidores`
--

DROP TABLE IF EXISTS `usuarios_seguidores`;
CREATE TABLE IF NOT EXISTS `usuarios_seguidores` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_usuario_id` int(11) NOT NULL,
  `us_usuario_nome` varchar(25) NOT NULL,
  `us_seguindo_id_usuario` int(11) NOT NULL,
  `us_data_registro` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios_seguidores`
--

INSERT INTO `usuarios_seguidores` (`us_id`, `us_usuario_id`, `us_usuario_nome`, `us_seguindo_id_usuario`, `us_data_registro`) VALUES
(1, 1, 'Onclikcup', 1, '2020-09-28 21:06:29'),
(2, 17, 'aaaaaaaaaaaaaaa', 1, '2020-09-30 23:10:57'),
(3, 18, 'fisica', 1, '2020-09-30 23:19:30'),
(4, 19, 'aaaaaaaaaa', 1, '2020-09-30 23:23:50'),
(5, 20, 'aaaaaaaaaa', 1, '2020-09-30 23:34:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_empresa_link`
--

DROP TABLE IF EXISTS `usuario_empresa_link`;
CREATE TABLE IF NOT EXISTS `usuario_empresa_link` (
  `user_id_link` int(11) NOT NULL,
  `emp_id_link` int(11) NOT NULL,
  `user_conta` varchar(50) NOT NULL DEFAULT '0',
  `uel_id` int(11) NOT NULL AUTO_INCREMENT,
  `uel_emp_contato` varchar(50) NOT NULL,
  PRIMARY KEY (`uel_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario_empresa_link`
--

INSERT INTO `usuario_empresa_link` (`user_id_link`, `emp_id_link`, `user_conta`, `uel_id`, `uel_emp_contato`) VALUES
(1, 1, '0', 1, '11976238147');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_explore_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_explore_servico`;
CREATE TABLE IF NOT EXISTS `usuario_explore_servico` (
`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`statServ_id` int(11)
,`statusServ_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_perfil`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_perfil`;
CREATE TABLE IF NOT EXISTS `usuario_perfil` (
`cand_id` int(11)
,`cand_nome` varchar(30)
,`cand_img` int(11)
,`cand_dataDenasci` datetime
,`cand_cpf` varchar(50)
,`cand_contato` varchar(50)
,`canduser_id` int(11)
,`candestc_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`user_id_link` int(11)
,`emp_id_link` int(11)
,`user_conta` varchar(50)
,`uel_id` int(11)
,`uel_emp_contato` varchar(50)
,`emp_id` int(11)
,`emp_razaosocial` varchar(50)
,`emp_cnpj` varchar(50)
,`emp_nomeresponsavel` varchar(50)
,`emp_nomefantasia` varchar(50)
,`emp_descri` varchar(60)
,`emp_img` varchar(250)
,`emp_datafundacao` datetime
,`emp_plano_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_post_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_post_servico`;
CREATE TABLE IF NOT EXISTS `usuario_post_servico` (
`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`statServ_id` int(11)
,`statusServ_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_preferencias`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_preferencias`;
CREATE TABLE IF NOT EXISTS `usuario_preferencias` (
`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`pref_id` int(11)
,`pref_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_servico`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_servico`;
CREATE TABLE IF NOT EXISTS `usuario_servico` (
`serv_id` int(11)
,`serv_preRequisitos` varchar(150)
,`serv_beneficios` varchar(150)
,`serv_prazo` int(11)
,`serv_valor` varchar(25)
,`serv_arquivo1` varchar(220)
,`serv_arquivo2` varchar(220)
,`serv_arquivo3` varchar(220)
,`statusServ_id` int(11)
,`postserv_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`user_id` int(11)
,`user_status` varchar(50)
,`user_nome` varchar(50)
,`user_email` varchar(50)
,`user_img` varchar(255)
,`user_senha` text
,`user_dataCadastro` datetime
,`tiuser_id` int(11)
,`user_ender_id` int(11)
,`user_primary` int(11)
,`user_preferences_id` int(11)
,`cat_id` int(11)
,`cat_nome` varchar(50)
,`statServ_id` int(11)
,`statusServ_nome` varchar(50)
,`ender_id` int(11)
,`ender_numero` varchar(10)
,`ender_logradouro` varchar(60)
,`ender_bairro` varchar(50)
,`ender_cidade` varchar(50)
,`enderest_id` int(11)
,`ender_comple` varchar(25)
,`ender_cep` varchar(200)
,`est_id` int(11)
,`est_nome` varchar(50)
,`pais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga`
--

DROP TABLE IF EXISTS `vaga`;
CREATE TABLE IF NOT EXISTS `vaga` (
  `vag_id` int(11) NOT NULL AUTO_INCREMENT,
  `vag_preRequisitos` varchar(150) NOT NULL,
  `vag_beneficios` varchar(150) NOT NULL,
  `vag_salario` varchar(20) NOT NULL,
  `vag_quantidade` int(11) NOT NULL,
  `vagstatus_id` int(11) NOT NULL,
  `postvaga_id` int(11) NOT NULL,
  `tivaga_id` int(11) NOT NULL,
  `vagesco_id` int(11) NOT NULL,
  PRIMARY KEY (`vag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vaga`
--

INSERT INTO `vaga` (`vag_id`, `vag_preRequisitos`, `vag_beneficios`, `vag_salario`, `vag_quantidade`, `vagstatus_id`, `postvaga_id`, `tivaga_id`, `vagesco_id`) VALUES
(2, 'Pre requisitos								 ', 'beneficios', '1500', 2, 1, 2, 1, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga_contactar_candidato`
--

DROP TABLE IF EXISTS `vaga_contactar_candidato`;
CREATE TABLE IF NOT EXISTS `vaga_contactar_candidato` (
  `vcc_id` int(11) NOT NULL AUTO_INCREMENT,
  `vcc_vaga_id` int(11) NOT NULL,
  `vcc_cand_usuario_id` int(11) NOT NULL,
  `vcc_emp_nome` varchar(50) NOT NULL,
  `vcc_emp_msn` text NOT NULL,
  `vcc_emp_usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`vcc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `vaga_conversas`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `vaga_conversas`;
CREATE TABLE IF NOT EXISTS `vaga_conversas` (
`msn_id` int(11)
,`msn_date` datetime
,`msn_nome` longtext
,`vml_id` int(11)
,`vml_user_remetente_id` int(11)
,`vml_user_destinatario_id` int(11)
,`vml_vaga_id` int(11)
,`vml_msn_id` int(11)
,`vml_view` int(11)
,`vml_date` datetime
,`vmdl_id` int(11)
,`vag_id` int(11)
,`vag_preRequisitos` varchar(150)
,`vag_beneficios` varchar(150)
,`vag_salario` varchar(20)
,`vag_quantidade` int(11)
,`vagstatus_id` int(11)
,`postvaga_id` int(11)
,`tivaga_id` int(11)
,`vagesco_id` int(11)
,`post_id` int(11)
,`post_titulo` varchar(50)
,`post_subtitulo` varchar(50)
,`post_description` varchar(150)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_ender_id` int(11)
,`vmdl_idd` int(11)
,`vmdl_empresa_img` varchar(55)
,`vmdl_empresa_nome` varchar(55)
,`vmdl_cand_nome` varchar(55)
,`vmdl_cand_img` varchar(55)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga_mensagem_dados_link`
--

DROP TABLE IF EXISTS `vaga_mensagem_dados_link`;
CREATE TABLE IF NOT EXISTS `vaga_mensagem_dados_link` (
  `vmdl_idd` int(11) NOT NULL AUTO_INCREMENT,
  `vmdl_empresa_img` varchar(55) NOT NULL,
  `vmdl_empresa_nome` varchar(55) NOT NULL,
  `vmdl_cand_nome` varchar(55) NOT NULL,
  `vmdl_cand_img` varchar(55) NOT NULL,
  PRIMARY KEY (`vmdl_idd`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga_mensagem_link`
--

DROP TABLE IF EXISTS `vaga_mensagem_link`;
CREATE TABLE IF NOT EXISTS `vaga_mensagem_link` (
  `vml_id` int(11) NOT NULL AUTO_INCREMENT,
  `vml_user_remetente_id` int(11) NOT NULL,
  `vml_user_destinatario_id` int(11) NOT NULL,
  `vml_vaga_id` int(11) NOT NULL,
  `vml_msn_id` int(11) NOT NULL,
  `vml_view` int(11) NOT NULL DEFAULT 0,
  `vml_date` datetime DEFAULT current_timestamp(),
  `vmdl_id` int(11) NOT NULL,
  PRIMARY KEY (`vml_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vaga_prova_link`
--

DROP TABLE IF EXISTS `vaga_prova_link`;
CREATE TABLE IF NOT EXISTS `vaga_prova_link` (
  `vagprolink_id` int(11) NOT NULL,
  `linkvag_id` int(11) DEFAULT NULL,
  `linkpro_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para vista `blog_post_categoria`
--
DROP TABLE IF EXISTS `blog_post_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `blog_post_categoria`  AS  select `b`.`blog_id` AS `blog_id`,`b`.`blogdestaque_id` AS `blogdestaque_id`,`b`.`blog_text` AS `blog_text`,`b`.`blog_date` AS `blog_date`,`b`.`blog_img` AS `blog_img`,`b`.`blog_categoria_id` AS `blog_categoria_id`,`b`.`blogpost_id` AS `blogpost_id`,`cat`.`blogcat_id` AS `blogcat_id`,`cat`.`blogcat_nome` AS `blogcat_nome`,`bd`.`blogdest_id` AS `blogdest_id`,`bd`.`blogdest_nome` AS `blogdest_nome` from ((`blog` `b` join `blog_categoria` `cat` on(`b`.`blog_categoria_id` = `cat`.`blogcat_id`)) join `blog_destaque` `bd` on(`b`.`blogdestaque_id` = `bd`.`blogdest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_conta`
--
DROP TABLE IF EXISTS `candidato_conta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_conta`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`cont`.`cont_id` AS `cont_id`,`cont`.`cont_agencia` AS `cont_agencia`,`cont`.`cont_conta` AS `cont_conta`,`cont`.`cont_titular` AS `cont_titular`,`cont`.`cont_digito` AS `cont_digito`,`cont`.`cont_user_id` AS `cont_user_id`,`cont`.`cont_bank_id` AS `cont_bank_id`,`cb`.`bank_id` AS `bank_id`,`cb`.`bank_nome` AS `bank_nome` from (((`candidato` `cand` join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `conta_bancaria` `cont` on(`cont`.`cont_user_id` = `user`.`user_id`)) join `conta_bancos` `cb` on(`cb`.`bank_id` = `cont`.`cont_bank_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_dados`
--
DROP TABLE IF EXISTS `candidato_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `candidato_dados`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id`,`fe`.`fic_id` AS `fic_id`,`fe`.`fic_empresa` AS `fic_empresa`,`fe`.`fic_cargo` AS `fic_cargo`,`fe`.`fic_carteiraregistro` AS `fic_carteiraregistro`,`fe`.`fic_salario` AS `fic_salario`,`fe`.`fic_dataentrada` AS `fic_dataentrada`,`fe`.`fic_datasaida` AS `fic_datasaida`,`fe`.`fic_motivoSaida` AS `fic_motivoSaida`,`fe`.`candidato_id` AS `candidato_id` from ((((`usuario` `u` join `candidato` `c` on(`c`.`canduser_id` = `u`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `u`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) left join `fichaexperiecia` `fe` on(`c`.`cand_id` = `fe`.`candidato_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_estadocivil`
--
DROP TABLE IF EXISTS `candidato_estadocivil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_estadocivil`  AS  select `candc`.`cand_id` AS `cand_id`,`candc`.`cand_nome` AS `cand_nome`,`candc`.`cand_img` AS `cand_img`,`candc`.`cand_dataDenasci` AS `cand_dataDenasci`,`candc`.`cand_cpf` AS `cand_cpf`,`candc`.`cand_contato` AS `cand_contato`,`candc`.`canduser_id` AS `canduser_id`,`candc`.`candestc_id` AS `candestc_id`,`estc`.`estc_id` AS `estc_id`,`estc`.`estc_nome` AS `estc_nome` from (`candidato` `candc` join `estado_civil` `estc` on(`candc`.`candestc_id` = `estc`.`estc_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_explore`
--
DROP TABLE IF EXISTS `candidato_explore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_explore`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`us`.`user_id` AS `user_id`,`us`.`user_status` AS `user_status`,`us`.`user_nome` AS `user_nome`,`us`.`user_email` AS `user_email`,`us`.`user_img` AS `user_img`,`us`.`user_senha` AS `user_senha`,`us`.`user_dataCadastro` AS `user_dataCadastro`,`us`.`tiuser_id` AS `tiuser_id`,`us`.`user_ender_id` AS `user_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from (((((((`vaga` `v` join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `usuario` `us` on(`p`.`userpost_id` = `us`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_pedidos`
--
DROP TABLE IF EXISTS `candidato_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `candidato_pedidos`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`user`.`user_primary` AS `user_primary`,`user`.`user_preferences_id` AS `user_preferences_id`,`pedi`.`pedi_id` AS `pedi_id`,`pedi`.`pedi_registro` AS `pedi_registro`,`pedi`.`status_number_id` AS `status_number_id`,`pedi`.`pedi_valortotal` AS `pedi_valortotal`,`pedi`.`pedi_description` AS `pedi_description`,`pedi`.`statuspe_id` AS `statuspe_id`,`pedi`.`pedi_serv_id` AS `pedi_serv_id`,`pedi`.`cliente_user_id` AS `cliente_user_id`,`pedi`.`status_pay_id` AS `status_pay_id`,`pedi`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from (((((`candidato` `cand` join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `pedido` `pedi` on(`pedi`.`cliente_user_id` = `user`.`user_id`)) join `servico` `serv` on(`pedi`.`pedi_serv_id` = `serv`.`serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pedi`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_prestador_pedidos`
--
DROP TABLE IF EXISTS `candidato_prestador_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `candidato_prestador_pedidos`  AS  select `ca`.`cand_id` AS `cand_id`,`ca`.`cand_nome` AS `cand_nome`,`ca`.`cand_img` AS `cand_img`,`ca`.`cand_dataDenasci` AS `cand_dataDenasci`,`ca`.`cand_cpf` AS `cand_cpf`,`ca`.`cand_contato` AS `cand_contato`,`ca`.`canduser_id` AS `canduser_id`,`ca`.`candestc_id` AS `candestc_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedipre`.`pretador_pedidos_id` AS `pretador_pedidos_id`,`pedipre`.`prestador_pedi_id` AS `prestador_pedi_id`,`pedipre`.`prestador_user_id` AS `prestador_user_id`,`pedipre`.`prestador_acc_id` AS `prestador_acc_id`,`pedipre`.`prestador_date` AS `prestador_date`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id` from (((`candidato` `ca` join `usuario` `u` on(`ca`.`canduser_id` = `u`.`user_id`)) join `pedido_prestador` `pedipre` on(`u`.`user_id` = `pedipre`.`prestador_user_id`)) join `pedido` `pe` on(`pedipre`.`prestador_pedi_id` = `pe`.`pedi_prestador_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_prova_resposta`
--
DROP TABLE IF EXISTS `candidato_prova_resposta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_prova_resposta`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pr`.`pro_id` AS `pro_id`,`pr`.`pro_nome` AS `pro_nome`,`pr`.`tipro_id` AS `tipro_id`,`pr`.`proemp_id` AS `proemp_id`,`q`.`quest_id` AS `quest_id`,`q`.`quest_pergunta` AS `quest_pergunta`,`q`.`quest_a` AS `quest_a`,`q`.`quest_b` AS `quest_b`,`q`.`quest_c` AS `quest_c`,`q`.`quest_d` AS `quest_d`,`q`.`quest_e` AS `quest_e`,`q`.`questpro_id` AS `questpro_id`,`q`.`quest_official` AS `quest_official`,`resp`.`resp_id` AS `resp_id`,`resp`.`resp_candidado` AS `resp_candidado`,`resp`.`respquest_id` AS `respquest_id`,`resp`.`respcand_id` AS `respcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id` from (((((`vaga` `v` join `vaga_prova_link` `vpl` on(`v`.`vag_id` = `vpl`.`linkvag_id`)) join `prova` `pr` on(`vpl`.`linkpro_id` = `pr`.`pro_id`)) join `questionario` `q` on(`pr`.`pro_id` = `q`.`questpro_id`)) left join `resposta` `resp` on(`q`.`quest_id` = `resp`.`respquest_id`)) left join `candidato` `cand` on(`cand`.`cand_id` = `resp`.`respcand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_quiz_resposta`
--
DROP TABLE IF EXISTS `candidato_quiz_resposta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_quiz_resposta`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pr`.`pro_id` AS `pro_id`,`pr`.`pro_nome` AS `pro_nome`,`pr`.`tipro_id` AS `tipro_id`,`pr`.`proemp_id` AS `proemp_id`,`q`.`quiz_id` AS `quiz_id`,`q`.`quiz_pergunta` AS `quiz_pergunta`,`q`.`quizpro_id` AS `quizpro_id`,`q`.`quizuser_id` AS `quizuser_id`,`respquiz`.`requiz_id` AS `requiz_id`,`respquiz`.`requiz_candidado` AS `requiz_candidado`,`respquiz`.`requizcand_id` AS `requizcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id` from (((((`vaga` `v` join `vaga_prova_link` `vpl` on(`v`.`vag_id` = `vpl`.`linkvag_id`)) join `prova` `pr` on(`vpl`.`linkpro_id` = `pr`.`pro_id`)) join `quiz` `q` on(`pr`.`pro_id` = `q`.`quizpro_id`)) left join `resposta_quiz` `respquiz` on(`q`.`quiz_id` = `respquiz`.`requiz_id`)) left join `candidato` `cand` on(`cand`.`cand_id` = `respquiz`.`requizcand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_servico`
--
DROP TABLE IF EXISTS `candidato_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `candidato_servico`  AS  select `c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from (((((((`candidato` `c` join `usuario` `u` on(`c`.`canduser_id` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_solicitacoes`
--
DROP TABLE IF EXISTS `candidato_solicitacoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `candidato_solicitacoes`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`user`.`user_primary` AS `user_primary`,`user`.`user_preferences_id` AS `user_preferences_id`,`soli`.`soli_id` AS `soli_id`,`soli`.`soli_descricao` AS `soli_descricao`,`soli`.`soli_date` AS `soli_date`,`soli`.`soli_response` AS `soli_response`,`soli`.`solistatus_id` AS `solistatus_id`,`soli`.`soliusuario_id` AS `soliusuario_id`,`soli`.`solicategoria_id` AS `solicategoria_id`,`statussoli`.`status_soli_id` AS `status_soli_id`,`statussoli`.`status_soli` AS `status_soli`,`solicat`.`solicat_id` AS `solicat_id`,`solicat`.`soli_cat_nm` AS `soli_cat_nm` from ((((`candidato` `cand` join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `solicitacoes` `soli` on(`soli`.`soli_id` = `user`.`user_id`)) join `status_solicitacao` `statussoli` on(`statussoli`.`status_soli_id` = `soli`.`soli_id`)) join `solicitacao_categoria` `solicat` on(`solicat`.`solicat_id` = `soli`.`soli_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencias_categorias`
--
DROP TABLE IF EXISTS `competencias_categorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `competencias_categorias`  AS  select `c`.`comp_id` AS `comp_id`,`c`.`comp_nome` AS `comp_nome`,`c`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (`competencias` `c` join `competencia_categoria` `cc` on(`c`.`compcate_id` = `cc`.`compcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencia_candidato`
--
DROP TABLE IF EXISTS `competencia_candidato`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `competencia_candidato`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`ccl`.`compelinkcand_id` AS `compelinkcand_id`,`ccl`.`compecand_id` AS `compecand_id`,`ccl`.`candcompe_id` AS `candcompe_id`,`comp`.`comp_id` AS `comp_id`,`comp`.`comp_nome` AS `comp_nome`,`comp`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (((`candidato` `cand` join `competencia_candidato_link` `ccl` on(`cand`.`cand_id` = `ccl`.`compecand_id`)) join `competencias` `comp` on(`comp`.`comp_id` = `ccl`.`candcompe_id`)) join `competencia_categoria` `cc` on(`cc`.`compcat_id` = `comp`.`compcate_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencia_vagas`
--
DROP TABLE IF EXISTS `competencia_vagas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `competencia_vagas`  AS  select `vag`.`vag_id` AS `vag_id`,`vag`.`vag_preRequisitos` AS `vag_preRequisitos`,`vag`.`vag_beneficios` AS `vag_beneficios`,`vag`.`vag_salario` AS `vag_salario`,`vag`.`vag_quantidade` AS `vag_quantidade`,`vag`.`vagstatus_id` AS `vagstatus_id`,`vag`.`postvaga_id` AS `postvaga_id`,`vag`.`tivaga_id` AS `tivaga_id`,`vag`.`vagesco_id` AS `vagesco_id`,`cvl`.`complinkvag_id` AS `complinkvag_id`,`cvl`.`linkcomp_id` AS `linkcomp_id`,`cvl`.`linkvag_id` AS `linkvag_id`,`comp`.`comp_id` AS `comp_id`,`comp`.`comp_nome` AS `comp_nome`,`comp`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (((`vaga` `vag` join `competencia_vaga_link` `cvl` on(`vag`.`vag_id` = `cvl`.`linkvag_id`)) join `competencias` `comp` on(`comp`.`comp_id` = `cvl`.`linkcomp_id`)) join `competencia_categoria` `cc` on(`cc`.`compcat_id` = `comp`.`compcate_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dados_usuario_post`
--
DROP TABLE IF EXISTS `dados_usuario_post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `dados_usuario_post`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id` from (((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `usuario` `user` on(`p`.`userpost_id` = `user`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dados_usuario_shere`
--
DROP TABLE IF EXISTS `dados_usuario_shere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `dados_usuario_shere`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id` from ((((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `shere` `sh` on(`sh`.`shere_post_id` = `p`.`post_id`)) join `usuario` `u` on(`u`.`user_id` = `sh`.`shere_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `duvidas_categorias_view`
--
DROP TABLE IF EXISTS `duvidas_categorias_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `duvidas_categorias_view`  AS  select `duv`.`duv_id` AS `duv_id`,`duv`.`duv_pergunta` AS `duv_pergunta`,`duv`.`duv_resposta` AS `duv_resposta`,`duv`.`duvcategoria_id` AS `duvcategoria_id`,`duv`.`tiuser_id` AS `tiuser_id`,`dv`.`duvcat_id` AS `duvcat_id`,`dv`.`duvcat_nome` AS `duvcat_nome`,`dv`.`duvcat_tipo_id` AS `duvcat_tipo_id` from (`duvidas` `duv` join `duvidas_categoria` `dv` on(`duv`.`duvcategoria_id` = `dv`.`duvcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_candidato_ficha`
--
DROP TABLE IF EXISTS `empresa_candidato_ficha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `empresa_candidato_ficha`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`fe`.`fic_id` AS `fic_id`,`fe`.`fic_empresa` AS `fic_empresa`,`fe`.`fic_cargo` AS `fic_cargo`,`fe`.`fic_carteiraregistro` AS `fic_carteiraregistro`,`fe`.`fic_salario` AS `fic_salario`,`fe`.`fic_dataentrada` AS `fic_dataentrada`,`fe`.`fic_datasaida` AS `fic_datasaida`,`fe`.`fic_motivoSaida` AS `fic_motivoSaida`,`fe`.`candidato_id` AS `candidato_id` from ((((`post` `p` join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `candidato_vaga_link` `cvl` on(`v`.`vag_id` = `cvl`.`cvlvag_id`)) join `candidato` `cand` on(`cand`.`cand_id` = `cvl`.`cvlcand_id`)) left join `fichaexperiecia` `fe` on(`fe`.`candidato_id` = `cand`.`cand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_candidato_vaga`
--
DROP TABLE IF EXISTS `empresa_candidato_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `empresa_candidato_vaga`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvl_user_id` AS `cvl_user_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`post` `p` join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `candidato_vaga_link` `cvl` on(`v`.`vag_id` = `cvl`.`cvlvag_id`)) join `candidato` `cand` on(`cand`.`cand_id` = `cvl`.`cvlcand_id`)) join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `user`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_conta`
--
DROP TABLE IF EXISTS `empresa_conta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_conta`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`c`.`cont_id` AS `cont_id`,`c`.`cont_agencia` AS `cont_agencia`,`c`.`cont_conta` AS `cont_conta`,`c`.`cont_titular` AS `cont_titular`,`c`.`cont_digito` AS `cont_digito`,`c`.`cont_user_id` AS `cont_user_id`,`c`.`cont_bank_id` AS `cont_bank_id`,`cb`.`bank_id` AS `bank_id`,`cb`.`bank_nome` AS `bank_nome` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `conta_bancaria` `c` on(`c`.`cont_user_id` = `u`.`user_id`)) join `conta_bancos` `cb` on(`cb`.`bank_id` = `c`.`cont_bank_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_dados`
--
DROP TABLE IF EXISTS `empresa_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_dados`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `u`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_dica`
--
DROP TABLE IF EXISTS `empresa_dica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_dica`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`d`.`dic_id` AS `dic_id`,`d`.`dic_text` AS `dic_text`,`d`.`postdic_id` AS `postdic_id` from (((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `dica` `d` on(`p`.`post_id` = `d`.`postdic_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_pedidos`
--
DROP TABLE IF EXISTS `empresa_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_pedidos`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedi`.`pedi_id` AS `pedi_id`,`pedi`.`pedi_registro` AS `pedi_registro`,`pedi`.`status_number_id` AS `status_number_id`,`pedi`.`pedi_valortotal` AS `pedi_valortotal`,`pedi`.`pedi_description` AS `pedi_description`,`pedi`.`statuspe_id` AS `statuspe_id`,`pedi`.`pedi_serv_id` AS `pedi_serv_id`,`pedi`.`cliente_user_id` AS `cliente_user_id`,`pedi`.`status_pay_id` AS `status_pay_id`,`pedi`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from ((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `pedido` `pedi` on(`pedi`.`cliente_user_id` = `u`.`user_id`)) join `servico` `serv` on(`pedi`.`pedi_serv_id` = `serv`.`serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pedi`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prestador_pedidos`
--
DROP TABLE IF EXISTS `empresa_prestador_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prestador_pedidos`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedipre`.`pretador_pedidos_id` AS `pretador_pedidos_id`,`pedipre`.`prestador_pedi_id` AS `prestador_pedi_id`,`pedipre`.`prestador_user_id` AS `prestador_user_id`,`pedipre`.`prestador_acc_id` AS `prestador_acc_id`,`pedipre`.`prestador_date` AS `prestador_date`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `pedido_prestador` `pedipre` on(`u`.`user_id` = `pedipre`.`prestador_user_id`)) join `pedido` `pe` on(`pedipre`.`prestador_pedi_id` = `pe`.`pedi_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prova`
--
DROP TABLE IF EXISTS `empresa_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prova`  AS  select `e`.`emp_id` AS `emp_id`,`e`.`emp_razaosocial` AS `emp_razaosocial`,`e`.`emp_cnpj` AS `emp_cnpj`,`e`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`e`.`emp_nomefantasia` AS `emp_nomefantasia`,`e`.`emp_descri` AS `emp_descri`,`e`.`emp_img` AS `emp_img`,`e`.`emp_datafundacao` AS `emp_datafundacao`,`e`.`emp_plano_id` AS `emp_plano_id`,`p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id` from (`empresa` `e` join `prova` `p` on(`e`.`emp_id` = `p`.`proemp_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prova_pergunta`
--
DROP TABLE IF EXISTS `empresa_prova_pergunta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prova_pergunta`  AS  select `p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id`,`q`.`quest_id` AS `quest_id`,`q`.`quest_pergunta` AS `quest_pergunta`,`q`.`quest_a` AS `quest_a`,`q`.`quest_b` AS `quest_b`,`q`.`quest_c` AS `quest_c`,`q`.`quest_d` AS `quest_d`,`q`.`quest_e` AS `quest_e`,`q`.`questpro_id` AS `questpro_id`,`q`.`quest_official` AS `quest_official` from (`prova` `p` join `questionario` `q` on(`p`.`pro_id` = `q`.`questpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_quiz_pergunta`
--
DROP TABLE IF EXISTS `empresa_quiz_pergunta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_quiz_pergunta`  AS  select `p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id`,`quiz`.`quiz_id` AS `quiz_id`,`quiz`.`quiz_pergunta` AS `quiz_pergunta`,`quiz`.`quizpro_id` AS `quizpro_id`,`quiz`.`quizuser_id` AS `quizuser_id` from (`prova` `p` join `quiz` on(`p`.`pro_id` = `quiz`.`quizpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_servico`
--
DROP TABLE IF EXISTS `empresa_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_servico`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_solicitacoes`
--
DROP TABLE IF EXISTS `empresa_solicitacoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_solicitacoes`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`soli`.`soli_id` AS `soli_id`,`soli`.`soli_descricao` AS `soli_descricao`,`soli`.`soli_date` AS `soli_date`,`soli`.`soli_response` AS `soli_response`,`soli`.`solistatus_id` AS `solistatus_id`,`soli`.`soliusuario_id` AS `soliusuario_id`,`soli`.`solicategoria_id` AS `solicategoria_id`,`statussoli`.`status_soli_id` AS `status_soli_id`,`statussoli`.`status_soli` AS `status_soli`,`solicat`.`solicat_id` AS `solicat_id`,`solicat`.`soli_cat_nm` AS `soli_cat_nm` from (((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`u`.`user_id` = `uel`.`user_id_link`)) join `solicitacoes` `soli` on(`soli`.`soli_id` = `u`.`user_id`)) join `status_solicitacao` `statussoli` on(`statussoli`.`status_soli_id` = `soli`.`soli_id`)) join `solicitacao_categoria` `solicat` on(`solicat`.`solicat_id` = `soli`.`soli_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_vaga`
--
DROP TABLE IF EXISTS `empresa_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_vaga`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`esco`.`esco_id` AS `esco_id`,`esco`.`esco_nome` AS `esco_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((((`empresa` `emp` left join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) left join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) left join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) left join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) left join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) left join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) left join `escolaridade` `esco` on(`esco`.`esco_id` = `v`.`vagesco_id`)) left join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) left join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_vincula_prova`
--
DROP TABLE IF EXISTS `empresa_vincula_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `empresa_vincula_prova`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`link`.`vagprolink_id` AS `vagprolink_id`,`link`.`linkvag_id` AS `linkvag_id`,`link`.`linkpro_id` AS `linkpro_id`,`pro`.`pro_id` AS `pro_id`,`pro`.`pro_nome` AS `pro_nome`,`pro`.`tipro_id` AS `tipro_id`,`pro`.`proemp_id` AS `proemp_id` from (((`post` `p` left join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) left join `vaga_prova_link` `link` on(`link`.`linkvag_id` = `v`.`vag_id`)) left join `prova` `pro` on(`pro`.`pro_id` = `link`.`linkpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `escolaridade_post_vaga`
--
DROP TABLE IF EXISTS `escolaridade_post_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `escolaridade_post_vaga`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`e`.`esco_id` AS `esco_id`,`e`.`esco_nome` AS `esco_nome` from ((`post` `p` join `vaga` `v` on(`v`.`postvaga_id` = `p`.`post_id`)) join `escolaridade` `e` on(`e`.`esco_id` = `v`.`vagesco_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `mysherepoint`
--
DROP TABLE IF EXISTS `mysherepoint`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `mysherepoint`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`endereco`.`ender_id` AS `ender_id`,`endereco`.`ender_numero` AS `ender_numero`,`endereco`.`ender_logradouro` AS `ender_logradouro`,`endereco`.`ender_bairro` AS `ender_bairro`,`endereco`.`ender_cidade` AS `ender_cidade`,`endereco`.`enderest_id` AS `enderest_id`,`endereco`.`ender_comple` AS `ender_comple`,`endereco`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id`,`sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`user`.`user_primary` AS `user_primary`,`user`.`user_preferences_id` AS `user_preferences_id` from ((((((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `endereco` on(`endereco`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`est`.`est_id` = `endereco`.`enderest_id`)) join `shere` `sh` on(`p`.`post_id` = `sh`.`shere_post_id`)) join `usuario` `user` on(`user`.`user_id` = `sh`.`shere_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_candidatovaga`
--
DROP TABLE IF EXISTS `notifications_candidatovaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notifications_candidatovaga`  AS  select `cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvl_user_id` AS `cvl_user_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome` from (((`candidato_vaga_link` `cvl` join `vaga` `v` on(`cvl`.`cvlvag_id` = `v`.`vag_id`)) join `post` `p` on(`v`.`postvaga_id` = `p`.`post_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_mensagem_vaga`
--
DROP TABLE IF EXISTS `notifications_mensagem_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notifications_mensagem_vaga`  AS  select `vml`.`vml_id` AS `vml_id`,`vml`.`vml_user_remetente_id` AS `vml_user_remetente_id`,`vml`.`vml_user_destinatario_id` AS `vml_user_destinatario_id`,`vml`.`vml_vaga_id` AS `vml_vaga_id`,`vml`.`vml_msn_id` AS `vml_msn_id`,`vml`.`vml_view` AS `vml_view`,`vml`.`vml_date` AS `vml_date`,`vml`.`vmdl_id` AS `vmdl_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id` from ((`vaga_mensagem_link` `vml` join `vaga` `v` on(`vml`.`vml_vaga_id` = `v`.`vag_id`)) join `post` `p` on(`v`.`postvaga_id` = `p`.`post_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_servicos`
--
DROP TABLE IF EXISTS `notifications_servicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notifications_servicos`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id` from (`pedido` `p` join `usuario` `u` on(`p`.`cliente_user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_shere`
--
DROP TABLE IF EXISTS `notifications_shere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notifications_shere`  AS  select `sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`ti`.`tipopost_id` AS `tipopost_id`,`ti`.`tipopost` AS `tipopost`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome` from (((`shere` `sh` join `tipo_post` `ti` on(`ti`.`tipopost_id` = `sh`.`shere_ti_post`)) join `post` `p` on(`p`.`post_id` = `sh`.`shere_post_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notificatis_candidatovaga`
--
DROP TABLE IF EXISTS `notificatis_candidatovaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `notificatis_candidatovaga`  AS  select `cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvl_user_id` AS `cvl_user_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome` from (((`candidato_vaga_link` `cvl` join `vaga` `v` on(`cvl`.`cvlvag_id` = `v`.`vag_id`)) join `post` `p` on(`v`.`postvaga_id` = `p`.`post_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedidos_prestador_dados`
--
DROP TABLE IF EXISTS `pedidos_prestador_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedidos_prestador_dados`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedipre`.`pretador_pedidos_id` AS `pretador_pedidos_id`,`pedipre`.`prestador_pedi_id` AS `prestador_pedi_id`,`pedipre`.`prestador_user_id` AS `prestador_user_id`,`pedipre`.`prestador_acc_id` AS `prestador_acc_id`,`pedipre`.`prestador_date` AS `prestador_date`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id` from (((`usuario` `u` join `pedido_prestador` `pedipre` on(`u`.`user_id` = `pedipre`.`prestador_user_id`)) join `pedido` `pe` on(`pedipre`.`prestador_pedi_id` = `pe`.`pedi_id`)) join `servico` `serv` on(`serv`.`serv_id` = `pe`.`pedi_prestador_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedido_conversas`
--
DROP TABLE IF EXISTS `pedido_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedido_conversas`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`pml_pedi_id` AS `pml_pedi_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_pmdl_id` AS `pml_pmdl_id`,`m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id` from (((((`pedido` `p` join `pedido_mensagem_link` `pml` on(`pml`.`pml_pedi_id` = `p`.`pedi_id`)) join `mensagem` `m` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) join `servico` `serv` on(`serv`.`serv_id` = `p`.`pedi_serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) join `usuario` `u` on(`u`.`user_id` = `p`.`cliente_user_id` or `p`.`pedi_prestador_user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedido_detalhes`
--
DROP TABLE IF EXISTS `pedido_detalhes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedido_detalhes`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`stpro`.`statusnumber_id` AS `statusnumber_id`,`stpro`.`statusnumber` AS `statusnumber`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from (((((`post` `p` join `endereco` `ender` on(`p`.`post_ender_id` = `ender`.`ender_id`)) join `servico` `serv` on(`p`.`post_id` = `serv`.`postserv_id`)) join `pedido` `pe` on(`pe`.`pedi_serv_id` = `serv`.`serv_id`)) join `status_progress` `stpro` on(`stpro`.`statusnumber_id` = `pe`.`status_number_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pe`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedido_mensagems`
--
DROP TABLE IF EXISTS `pedido_mensagems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedido_mensagems`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`pml_pedi_id` AS `pml_pedi_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_pmdl_id` AS `pml_pmdl_id`,`m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome` from ((`pedido` `p` join `pedido_mensagem_link` `pml` on(`pml`.`pml_pedi_id` = `p`.`pedi_id`)) join `mensagem` `m` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_dica`
--
DROP TABLE IF EXISTS `post_dica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_dica`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`d`.`dic_id` AS `dic_id`,`d`.`dic_text` AS `dic_text`,`d`.`postdic_id` AS `postdic_id` from ((`post` `p` join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `dica` `d` on(`p`.`post_id` = `d`.`postdic_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_vaga`
--
DROP TABLE IF EXISTS `post_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_vaga`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`emp_plano_id` AS `emp_plano_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`esco`.`esco_id` AS `esco_id`,`esco`.`esco_nome` AS `esco_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `post` `p` on(`p`.`userpost_id` = `u`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) left join `escolaridade` `esco` on(`esco`.`esco_id` - `v`.`vagesco_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_vaga_prova`
--
DROP TABLE IF EXISTS `post_vaga_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `post_vaga_prova`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`vg`.`vag_id` AS `vag_id`,`vg`.`vag_preRequisitos` AS `vag_preRequisitos`,`vg`.`vag_beneficios` AS `vag_beneficios`,`vg`.`vag_salario` AS `vag_salario`,`vg`.`vag_quantidade` AS `vag_quantidade`,`vg`.`vagstatus_id` AS `vagstatus_id`,`vg`.`postvaga_id` AS `postvaga_id`,`vg`.`tivaga_id` AS `tivaga_id`,`vg`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pv`.`pro_id` AS `pro_id`,`pv`.`pro_nome` AS `pro_nome`,`pv`.`tipro_id` AS `tipro_id`,`pv`.`proemp_id` AS `proemp_id` from (((`post` `p` join `vaga` `vg` on(`p`.`post_id` = `vg`.`postvaga_id`)) join `vaga_prova_link` `vpl` on(`vpl`.`linkvag_id` = `vg`.`vag_id`)) join `prova` `pv` on(`pv`.`pro_id` = `vpl`.`linkpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_explore_servico`
--
DROP TABLE IF EXISTS `usuario_explore_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_explore_servico`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`usuario` `u` join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_perfil`
--
DROP TABLE IF EXISTS `usuario_perfil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_perfil`  AS  select `c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`uel`.`user_conta` AS `user_conta`,`uel`.`uel_id` AS `uel_id`,`uel`.`uel_emp_contato` AS `uel_emp_contato`,`e`.`emp_id` AS `emp_id`,`e`.`emp_razaosocial` AS `emp_razaosocial`,`e`.`emp_cnpj` AS `emp_cnpj`,`e`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`e`.`emp_nomefantasia` AS `emp_nomefantasia`,`e`.`emp_descri` AS `emp_descri`,`e`.`emp_img` AS `emp_img`,`e`.`emp_datafundacao` AS `emp_datafundacao`,`e`.`emp_plano_id` AS `emp_plano_id` from (((`usuario` `u` left join `candidato` `c` on(`c`.`canduser_id` = `u`.`user_id`)) left join `usuario_empresa_link` `uel` on(`u`.`user_id` = `uel`.`user_id_link`)) left join `empresa` `e` on(`e`.`emp_id` = `uel`.`emp_id_link`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_post_servico`
--
DROP TABLE IF EXISTS `usuario_post_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_post_servico`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`usuario` `u` join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_preferencias`
--
DROP TABLE IF EXISTS `usuario_preferencias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_preferencias`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`pref_id` AS `pref_id`,`p`.`pref_nome` AS `pref_nome` from (`usuario` `u` join `preferencias` `p` on(`u`.`user_preferences_id` = `p`.`pref_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_servico`
--
DROP TABLE IF EXISTS `usuario_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_servico`  AS  select `s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`us`.`user_id` AS `user_id`,`us`.`user_status` AS `user_status`,`us`.`user_nome` AS `user_nome`,`us`.`user_email` AS `user_email`,`us`.`user_img` AS `user_img`,`us`.`user_senha` AS `user_senha`,`us`.`user_dataCadastro` AS `user_dataCadastro`,`us`.`tiuser_id` AS `tiuser_id`,`us`.`user_ender_id` AS `user_ender_id`,`us`.`user_primary` AS `user_primary`,`us`.`user_preferences_id` AS `user_preferences_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`stav`.`statServ_id` AS `statServ_id`,`stav`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`ender`.`ender_cep` AS `ender_cep`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`servico` `s` join `post` `p` on(`p`.`post_id` = `s`.`postserv_id`)) join `usuario` `us` on(`p`.`userpost_id` = `us`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `status_servico` `stav` on(`stav`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vaga_conversas`
--
DROP TABLE IF EXISTS `vaga_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vaga_conversas`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`vml`.`vml_id` AS `vml_id`,`vml`.`vml_user_remetente_id` AS `vml_user_remetente_id`,`vml`.`vml_user_destinatario_id` AS `vml_user_destinatario_id`,`vml`.`vml_vaga_id` AS `vml_vaga_id`,`vml`.`vml_msn_id` AS `vml_msn_id`,`vml`.`vml_view` AS `vml_view`,`vml`.`vml_date` AS `vml_date`,`vml`.`vmdl_id` AS `vmdl_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`vmdl`.`vmdl_idd` AS `vmdl_idd`,`vmdl`.`vmdl_empresa_img` AS `vmdl_empresa_img`,`vmdl`.`vmdl_empresa_nome` AS `vmdl_empresa_nome`,`vmdl`.`vmdl_cand_nome` AS `vmdl_cand_nome`,`vmdl`.`vmdl_cand_img` AS `vmdl_cand_img` from ((((`mensagem` `m` join `vaga_mensagem_link` `vml` on(`m`.`msn_id` = `vml`.`vml_msn_id`)) join `vaga` `v` on(`v`.`vag_id` = `vml`.`vml_vaga_id`)) join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `vaga_mensagem_dados_link` `vmdl` on(`vml`.`vmdl_id` = `vmdl`.`vmdl_idd`)) ;
--
-- Banco de dados: `startuparcade`
--
CREATE DATABASE IF NOT EXISTS `startuparcade` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `startuparcade`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accept`
--

DROP TABLE IF EXISTS `accept`;
CREATE TABLE IF NOT EXISTS `accept` (
  `acc_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_nome` varchar(40) NOT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm`
--

DROP TABLE IF EXISTS `adm`;
CREATE TABLE IF NOT EXISTS `adm` (
  `adm_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_nome` varchar(60) NOT NULL,
  `adm_email` varchar(60) NOT NULL,
  `adm_senha` varchar(255) NOT NULL,
  `car_id` int(11) DEFAULT NULL,
  `admuser_id` int(11) NOT NULL,
  PRIMARY KEY (`adm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm`
--

INSERT INTO `adm` (`adm_id`, `adm_nome`, `adm_email`, `adm_senha`, `car_id`, `admuser_id`) VALUES
(1, 'Renato Vieira', 'nato.re.vieira@gmail.com', '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_subtitulo` varchar(100) NOT NULL,
  `blog_text` text NOT NULL,
  `blog_date` date NOT NULL,
  `blog_img` varchar(255) NOT NULL,
  `blog_img_alt` varchar(255) NOT NULL,
  `blog_video_src` varchar(255) NOT NULL,
  `blog_autor` varchar(255) NOT NULL,
  `blogpost_id` int(11) NOT NULL,
  `blog_fonte` varchar(250) NOT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog`
--

INSERT INTO `blog` (`blog_id`, `blog_subtitulo`, `blog_text`, `blog_date`, `blog_img`, `blog_img_alt`, `blog_video_src`, `blog_autor`, `blogpost_id`, `blog_fonte`) VALUES
(1, 'theArtigo subtitulo blogddddddddddddddddddddddddddddddd', 'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', '2022-03-23', '', 'dd crdescição imagem', 'https://www.youtube-nocookie.com/embed/i4TG87O4K60', 'RENATO VIERIA AAAAA', 1, 'WWW.FONTE.COM.BR'),
(2, '0dddddddddddddd', 'Google Ads, formerly known as Google AdWords, the service uses the Cost per Click (CPC) and Cost per Thousand Impressions (CPM) advertising system, which consists of ads in the form of links found mainly in search engines related to the words -key that the Internet user is searching for. It is a way of acquiring highly targeted advertising regardless of the advertiser\'s budget, however, it does not offer as many features and policy facilities as BingAds, its biggest competitor. Ads ads are displayed alongside search results on Google, as well as on search and content sites, called the Display Network, of Google\'s growing ad network.\r\n\r\n#Classification of ads##\r\nThe position of the ad on the results page is defined by the formula:\r\n\r\nAd Rank = Max CPC X Quality Score\r\n\r\nQuality Score is determined by your performance history on Google: your clickthrough rate (CTR), ad text relevancy, keyword performance history, landing page quality, and other relevancy factors.\r\n\r\nIn short, Google values ​​ads whose content is more closely related to the search performed, and thus makes it difficult for companies to show ads in search results in sectors unrelated to their field of activity.\r\n\r\nCPM - Cost per thousand impressions\r\nIt consists of a system in which the advertiser pays an agreed amount for the number of times the ad is seen by the consumer, regardless of their subsequent action. This agreement, normally, is stipulated the value for each thousand impressions.\r\n\r\nCPC - Cost per Click\r\nIt consists of a system in which the advertiser pays an agreed amount for the number of times the ad is clicked and not just viewed, thus allowing the advertiser to pay a certain amount only when the user clicks on a certain thing. It is considered by many to be the fairest form of advertising since the user who carried out the search only clicks on the ad that he is already inclined to buy.\r\n\r\n#Display Network##\r\nAds are displayed on Google partner sites (such as Gmail itself), websites and blogs that have signed up for the Google affiliate program known as Adsense. Many blogs and even news portals provide Google ad units on their respective pages.[2]\r\n\r\nAccount and Campaign Structure in Google Ads\r\nAdwords account and campaign structure\r\n\r\n#Adwords account structure example##\r\n\r\nAccount: Any Google account, like Gmail for example.\r\nCampaigns: Consider creating a campaign for each product or service line on your website. Different campaigns for devices, between desktop and mobile. Practical example: if you work with sales of baby products, create a campaign for clothing and another for accessories.\r\nAd groups: Divide each product type and place in respective groups. Create a group for baby shoes, another for rompers, and so on.\r\nKeywords: Add the corresponding keywords for each ad group.\r\nAds: Set up titles, descriptions, and landing pages.\r\nTypes of Ads in Google Ads:\r\nAds on search engines (SEA/SEM)\r\nAds on the Google Search Network (Search Ads)\r\nAds on the Google Search Network Call (Call Only)\r\nAds on the Google Dynamic Search Network (Dynamic Search Ads – DSA)\r\nGoogle Search Ads for Mobile App Installs\r\nAds on the Google Search Network and Partner Network\r\nAds on the Display Network (GDN)\r\nText Ads on the Google Display Network\r\nDisplay Ads on the Google Display Network\r\nDynamic Ads on the Google Display Network\r\nGoogle Display Network Engagement Ads (Light Box)\r\nGoogle Display Network Engagement Ads (Rich Media)\r\nBanner Ads on the Application Display Network (Admob)\r\nGmail Ads Sponsored Promotions (GSP Ad Gallery)\r\nGmail Ads Sponsored Promotions (GSP HTML/Form)\r\nVideo Ads (Youtube Network)\r\nPreview Ads (Youtube In-Display)\r\nVideo Ads in Youtube Search (Youtube In-Search)\r\nOverlay Ads (Youtube Overlay)\r\nSkippable Video Ads (Youtube Trueview)\r\nNon-skippable Video Ads.\r\n\r\n\r\nPrevious names: Google AdWords\r\nGoogle Owner(s)\r\nRequire payment? Yea\r\nGenre Advertising program\r\nRelease October 23, 2000; 21 years ago\r\nads.google.com email address\r\nSource: wikipedia;', '2022-03-23', '', '', '', '', 2, '0'),
(3, 'dddddddddddd', 'Como a maioria dos serviços da Google, só pode acessá-lo quem tem uma conta no Google. Um endereço de email no Gmail é suficiente.\r\n\r\nDesenvolvedor	Google\r\nPlataforma	Web, Android, iOS\r\nGênero(s)	Agenda eletrônica\r\nLicença	Gratuita\r\nPágina oficial	calendar.google.com/calendar\r\nFonte: wikipedia;', '2022-03-23', '', '', '', '', 3, '0'),
(4, 'ffffffffffff', 'Like most Google services, only those who have a Google account can access it. An email address in Gmail is enough.\r\n\r\nGoogle developer\r\nWeb Platform, Android, iOS\r\nGenre(s) Electronic diary\r\nFree License\r\nOfficial page calendar.google.com/calendar\r\nSource: wikipedia;', '2022-03-23', '', '', '', '', 4, '0'),
(5, '0', ' Desenvolvedor	Google\r\nPlataforma	Web, Android, iOS\r\nGênero(s)	alarme eletrônico\r\nLicença	Gratuita\r\nPágina oficial	alarm.google.comalarm\r\n\r\nFonte: wikipedia;\r\n\r\n                    ', '2022-03-26', '', '', '', '', 5, '0'),
(6, '0', 'Google developer\r\nWeb Platform, Android, iOS\r\nGenre(s) electronic alarm\r\nFree License\r\nOfficial alarm.google.comalarm page\r\n\r\nSource: wikipedia; ', '2022-03-26', '', '', '', '', 6, '0'),
(7, '0', ' Recursos\r\nO Analytics é capaz de identificar além da tradicional taxa de exibição e hit de uma página, localização geográfica do visitante, forma com a qual chegou na página (através de links de outros sites, buscador, AdSense ou diretamente pelo endereço), sistema operacional, navegador, navegador e sistema operacional combinados e suas versões, resolução de tela, Java, reprodutor de flash instalado, entre outros, em períodos diários, semanais, mensais e anuais.\r\n\r\nEmbora muitas pessoas vejam o Google Analytics apenas como uma ferramenta de monitoramento de tráfego essa ferramenta na verdade funciona como uma poderosa ferramenta para tomada de decisões em negócios relacionados à Internet.\r\n\r\nTecnologia\r\nO Sistema conta com um breve código javascript em cada página do site que o visitante acessar. Este código envia os dados ao Analytics, que, por sua vez, os transmite ao dono. A cada novo site cadastrado no sistema, o Google Analytics varre o código-fonte em busca do código fornecido. Caso não encontre ele continua acessando a página periodicamente até encontrar a seqüencia de caracteres prevista. Caso não a encontre, o sistema não fornecerá dados ao cadastrante. Isto serve como uma forma de confirmar que somente o dono da página cadastre seus sites e somente ele tenha acesso aos dados.\r\n\r\n\r\nProprietário(s)	Google\r\nRequer pagamento ?	Não\r\nGênero	Estatística de visitas a sites e blogs\r\nCadastro	Obrigatório\r\nIdioma(s)	Diversos\r\nEndereço eletrônico\r\nPágina oficial	alarm.google.comalarm\r\n\r\nFonte: wikipedia;\r\n                    ', '2022-03-26', '', '', '', '', 7, '0'),
(8, '0', 'Resources\r\nAnalytics is able to identify, in addition to the traditional page view and hit rate, the visitor\'s geographic location, the way in which he arrived on the page (through links from other sites, search engine, AdSense or directly by address), operating system, browser, browser and operating system combined and their versions, screen resolution, Java, installed flash player, among others, in daily, weekly, monthly and yearly periods.\r\n\r\nWhile many people see Google Analytics as just a traffic monitoring tool, this tool actually works as a powerful decision-making tool in Internet-related business.\r\n\r\nTechnology\r\nThe System has a short javascript code on each page of the website that the visitor accesses. This code sends the data to Analytics, which in turn transmits it to the owner. With each new site registered in the system, Google Analytics scans the source code in search of the code provided. If it doesn\'t find it, it continues accessing the page periodically until it finds the predicted sequence of characters. If it does not find it, the system will not provide data to the registrant. This serves as a way to confirm that only the page owner registers their sites and only he has access to the data.\r\n\r\n\r\nGoogle Owner(s)\r\nRequire payment ? No\r\nGenre Statistics of visits to websites and blogs\r\nMandatory registration\r\nMiscellaneous Language(s)\r\nE-mail\r\nOfficial alarm.google.comalarm page\r\n\r\nSource: wikipedia;', '2022-03-26', '', '', '', '', 8, '0'),
(9, '0', 'Google Docs é um pacote de aplicativos do Google baseado em AJAX.[1] As ferramentas do Google Docs funcionam de forma síncrona e assíncrona, portanto, on-line para acessar dados em nuvens e off-line através de aplicativos de extensão instaladas diretamente do Google, onde há bancos de dados criados por essa extensão para posterior sincronização através de upload instantâneo ao acessá-los online, diretamente no browser de desktops ou aplicativos de dispositivos móveis do Android e Mec. Os aplicativos são compatíveis com o Apache OpenOffice, LibreOffice e Microsoft Office, e atualmente compõe-se de um processador de texto, um editor de apresentações, um editor de planilhas e um editor de formulários.\r\n\r\nOriginalmente, o processador de texto foi desenvolvido a parte, sob o nome Writely, e comprado pelo Google meses depois. Alguns dos recursos mais peculiares são a portabilidade de documentos, que permite a edição do mesmo documento por mais de um usuário e o recurso de publicação direta em blog. Os aplicativos permitem a compilação em PDF.\r\n\r\nEle permite aos usuários criar e editar documentos online ao mesmo tempo colaborando em tempo real com outros usuários. Google Docs combina as características de Writely e Spreadsheets com um programa de apresentação incorporando tecnologia projetada por Sistemas Tonic. Armazenamento de dados de arquivos de até 1 GB no total de tamanho foi introduzido em 13 de janeiro de 2011, os documentos criados no Google Docs não contam para este contingente.\r\n\r\n\r\nFormatos de arquivo\r\nO Google Docs suporta inúmeros formatos de arquivo:\r\nMicrosoft Word (.DOC e .DOCX)\r\nMicrosoft Excel (.XLS e .XLSX)\r\nMicrosoft PowerPoint (.PPT e .PPTX)\r\nOpenDocument Format (.ODT e .ODS)\r\nAdobe Portable Document Format (.PDF)\r\nPáginas Apple (.PAGES)\r\nAdobe Illustrator (.AI)\r\nAdobe Photoshop (.PSD)\r\nTagged Image File Format (.TIFF)\r\nAutodesk AutoCad (.DXF)\r\nScalable Vector Graphics (.SVG)\r\nPostScript (.EPS e .PS)\r\nTrueType (.TTF)\r\nXML Paper Specification (.XPS)\r\nTipos de arquivo (.ZIP e .RAR)\r\nArquivos de imagem (.JPG, .JPEG, .BMP, .PNG e .GIF)\r\n\r\nProprietário(s)	Google Inc.\r\nGênero	Editor de documentos On-line\r\nCadastro	Necessário (conta Google)\r\nPaís de origem	 Estados Unidos\r\nIdioma(s)	54\r\nLançamento	agosto de 2005\r\nDesenvolvedor	Writely Team (original)\r\nGoogle Inc.\r\nEndereço eletrônico\r\nFonte: wikipedia;\r\n                    ', '2022-03-26', '', '', '', '', 9, '0'),
(10, '0', 'Google Docs is an AJAX-based application package from Google. Google Docs tools work synchronously and asynchronously, therefore, online to access data in clouds and offline through extension applications installed directly from Google, where there are databases created by this extension for later synchronization through Instant upload when accessing them online, directly in the desktop browser or Android and Mec mobile apps. The applications are compatible with Apache OpenOffice, LibreOffice and Microsoft Office, and currently consist of a word processor, a presentation editor, a spreadsheet editor and a form editor.\r\n', '2022-03-26', '', '', '', '', 10, '0'),
(11, '0', 'Google Drive é um serviço de armazenamento e sincronização de arquivos que foi apresentado pela Google em 24 de abril de 2012. Google Drive abriga agora o Google Docs, um leque de aplicações de produtividade, que oferece a edição de documentos, folhas de cálculo, apresentações, e muito mais. O Google Drive é considerado uma \"evolução natural\" do Google Docs (uma vez ativado substitui a URL docs.google.com por drive.google.com). Rumores sobre o Google Drive começaram a circular no início de março de 2006. Com o lançamento do Google Drive, o Google aumentou o espaço de armazenamento do Gmail para 15 GB.\r\n\r\nO Google Drive baseia-se no conceito de computação em nuvem, pois o internauta poderá armazenar arquivos através deste serviço e acedê-los a partir de qualquer computador ou outros dispositivos compatíveis, desde que ligados à internet. Para além disso o Google Drive disponibiliza vários aplicativos via online, sem que esses programas estejam instalados no computador da pessoa que os utiliza.\r\n\r\nO Google Drive dá ao usuário 15 GB grátis de armazenamento no início. Um utilizador consegue espaço extra, que é compartilhado entre Picasa e Google Drive, que vai de 25 GB até 16TB pagando uma quantia mensal (2,49 dolares/mês ou menos de 2,00 euros/mês). Pode ser adquirido através da contratação de um plano de pagamento mensal.\r\nEm agosto de 2018, Google lançou o Google One para substituir planos não gratuitos do Google Drive.\r\n\r\nNo dia 6 de Outubro de 2020, com a remodelação do G Suíte para o Google Workspace, a logomarca do Google Drive, assim como a de alguns outros apps da Google, foram alteradas.\r\n\r\nEstes são alguns dos tipos de arquivos que são compatíveis com o Google Drive:\r\n\r\nArquivos compactados (.ZIP, .RAR, tar, gzip)\r\nFormatos de áudio (MP3, MPEG, WAV, .ogg)\r\nArquivos de imagem (.JPEG, .PNG, .GIF, .BMP)\r\nMarcação/código (.CSS, .HTML, .PHP, .C, .CPP, .H, .HPP, .JS)\r\nArquivos de texto (.TXT)\r\nArquivos de vídeo (WebM, .MPEG4, .3GPP, .MOV, .AVI, .MPEGPS, .WMV, .FLV, .ogg)\r\nArquivos Adobe\r\nAutodesk AutoCad (.DXF)\r\nllustrator (.AI)\r\nPhotoshop (.PSD)\r\nFormato de documento portátil (.PDF)\r\nPostScript (.EPS, .PS)\r\nElementos gráficos vetoriais escaláveis (.SVG)\r\nFormato de arquivo de imagem com tag (.TIFF)\r\nTrueType (.TTF)\r\nExcel (.XLS, .XLSX)\r\nPowerPoint (.PPT, .PPTX)\r\nWord (.DOC, .DOCX)\r\nXML Paper Specification (.XPS)\r\n\r\n\r\nProprietário(s)	Google\r\nRequer pagamento?	Não (paga-se comprando mais espaço)\r\nGênero	Serviço de hospedagem e backup de arquivos\r\nCadastro	Público\r\nPaís de origem	Múltiplos\r\nIdioma(s)	Múltiplos\r\nLançamento	24 de abril de 2012\r\nDesenvolvedor	Google\r\nEndereço eletrônico	https://www.google.com/intl/pt-PT/drive/\r\nFonte: wikipedia;', '2022-03-26', '', '', '', '', 11, '0'),
(12, '0', 'Google Drive is a file storage and synchronization service that was introduced by Google on April 24, 2012. Google Drive is now home to Google Docs, a range of productivity applications that offer editing documents, spreadsheets, presentations , and much more. Google Drive is considered a \"natural evolution\" of Google Docs (once activated it replaces the docs.google.com URL with drive.google.com). Rumors about Google Drive began to circulate in early March 2006. With the launch of Google Drive, Google increased Gmail\'s storage space to 15GB.\r\n\r\nGoogle Drive is based on the concept of cloud computing, as the internet user can store files through this service and access them from any computer or other compatible devices, as long as they are connected to the internet. In addition, Google Drive makes several applications available online, without these programs being installed on the computer of the person who uses them.\r\n\r\nGoogle Drive gives the user 15GB of free storage at the beginning. A user gets extra space, which is shared between Picasa and Google Drive, ranging from 25GB to 16TB for a monthly fee ($2.49/month or less than €2.00/month). It can be acquired by contracting a monthly payment plan.\r\nIn August 2018, Google launched Google One to replace non-free Google Drive plans.\r\n\r\nOn October 6, 2020, with the remodeling of the G Suite for Google Workspace, the Google Drive logo, as well as that of some other Google apps, were changed.\r\n\r\nThese are some of the file types that Google Drive supports:\r\n\r\nCompressed files (.ZIP, .RAR, tar, gzip)\r\nAudio formats (MP3, MPEG, WAV, .ogg)\r\nImage files (.JPEG, .PNG, .GIF, .BMP)\r\nMarkup/Code (.CSS, .HTML, .PHP, .C, .CPP, .H, .HPP, .JS)\r\nText files (.TXT)\r\nVideo files (WebM, .MPEG4, .3GPP, .MOV, .AVI, .MPEGPS, .WMV, .FLV, .ogg)\r\nAdobe files\r\nAutodesk AutoCad (.DXF)\r\nillustrator (.AI)\r\nPhotoshop (.PSD)\r\nPortable Document Format (.PDF)\r\nPostScript (.EPS, .PS)\r\nScalable vector graphics (.SVG)\r\nTagged image file format (.TIFF)\r\nTrueType (.TTF)\r\nExcel (.XLS, .XLSX)\r\nPowerPoint (.PPT, .PPTX)\r\nWord (.DOC, .DOCX)\r\nXML Paper Specification (.XPS)\r\n\r\n\r\nGoogle Owner(s)\r\nRequire payment? No (pays by buying more space)\r\nGenre File hosting and backup service\r\nPublic Registration\r\nMultiple country of origin\r\nMultiple Language(s)\r\nRelease April 24, 2012\r\nGoogle developer\r\nEmail address https://www.google.com/intl/pt-EN/drive/\r\nSource: wikipedia;', '2022-03-26', '', '', '', '', 12, '0'),
(13, '0', ' Texto para o artigo: whats app\r\n                    ', '2022-05-12', '', '', '', '', 13, '0'),
(14, '', 'FACEBOOK', '2022-10-02', '', '', '', 'Renato Vieira', 14, 'The wiki e facebook\r\n'),
(15, 'teste', 'INSTAGRAM', '2022-10-03', '', '', '', 'Renato', 15, 'fonte'),
(18, '0', ' \r\n    Por exemplo, nossa Política de Privacidade mostra quais dados são coletados sobre você e como isso afeta você. Ela também explica as medidas que tomamos para proteger sua privacidade, como desenvolver nossos Serviços de modo a não armazenarmos as mensagens entregues e dar controle para você decidir com quem se comunica nos nossos Serviços.\r\n                ', '2022-06-26', '', '', '', '', 18, '0');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `blog_post_categoria`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `blog_post_categoria`;
CREATE TABLE IF NOT EXISTS `blog_post_categoria` (
`blog_id` int(11)
,`blog_subtitulo` varchar(100)
,`blog_text` text
,`blog_date` date
,`blog_img` varchar(255)
,`blog_img_alt` varchar(255)
,`blog_video_src` varchar(255)
,`blog_autor` varchar(255)
,`blogpost_id` int(11)
,`blog_fonte` varchar(250)
,`post_id` int(11)
,`post_titulo` varchar(255)
,`post_subtitulo` varchar(255)
,`post_description` text
,`post_img` varchar(250)
,`post_img_alt` varchar(250)
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_paisid` int(11)
,`postdestaque_id` int(11)
,`postblogcat_id` int(11)
,`postblogcat_nome` varchar(50)
,`postblogpais_id` int(11)
,`postdest_id` int(11)
,`postdest_nome` varchar(50)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_grupo`
--

DROP TABLE IF EXISTS `categoria_grupo`;
CREATE TABLE IF NOT EXISTS `categoria_grupo` (
  `cg_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_nome` varchar(100) DEFAULT NULL,
  `cg_pais_id` int(11) NOT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria_grupo`
--

INSERT INTO `categoria_grupo` (`cg_id`, `cg_nome`, `cg_pais_id`) VALUES
(1, 'Comercial, Vendas', 1),
(2, 'Telecomunicações', 1),
(3, 'Administração ', 1),
(4, 'Informática, TI, Telecomunicações ', 1),
(5, 'Alimentação / Gastronomia', 1),
(6, 'Construção, Manutenção ', 1),
(7, 'Logística ', 1),
(8, 'industrial, Produção, Fábrica ', 1),
(9, 'Contábil, Finanças, Economia ', 1),
(10, 'Transportes', 1),
(11, 'Serviços Gerais', 1),
(12, 'Saúde', 1),
(13, 'Marketing', 1),
(14, 'Recursos Humanos', 1),
(15, 'Educação, Ensino, Idiomas', 1),
(16, 'Engenharia ', 1),
(17, 'Segurança ', 1),
(18, 'Compras ', 1),
(19, 'Jurídica', 1),
(20, 'Qualidade', 1),
(21, 'Estética ', 1),
(22, 'Hotelaria, Turismo ', 1),
(23, 'Comunicação, TV, Cinema ', 1),
(24, 'Moda', 1),
(25, 'Arquitetura, Decoração, Design', 1),
(26, 'Artes', 1),
(27, 'Agricultura, Pecuária, Veterinária', 1),
(28, 'Comércio Exterior, Importação, Exportação ', 1),
(29, 'Auditoria ', 1),
(30, 'Química, Petroquímica', 1),
(31, 'Ciências, Pesquisa', 1),
(32, 'Cultura, Lazer, Entretenimento ', 1),
(33, 'Meio Ambiente, Ecologia', 1),
(34, 'Serviço Social e Comunitário', 1),
(35, 'blog', 1),
(36, 'Design grafico', 1),
(37, 'Commercial, Sales', 2),
(38, 'Telemarketing', 2),
(39, 'Administration', 2),
(40, 'IT, Telecommunications', 2),
(41, 'Telecommunications', 2),
(42, 'Computing', 2),
(43, 'Food / Gastronomy', 2),
(44, 'Construction, Maintenance', 2),
(45, 'Logistics', 2),
(46, 'industrial, production, factory', 2),
(47, 'Accounting, Finance, Economy', 2),
(48, 'Transportation', 2),
(49, 'General Services', 2),
(50, 'Health', 2),
(51, 'Marketing', 2),
(52, 'Human Resources', 2),
(53, 'Education, Teaching, Languages', 2),
(54, 'engineering', 2),
(55, 'SafetyS', 2),
(56, 'hopping', 2),
(57, 'Legal', 2),
(58, 'Quality', 2),
(59, 'Aesthetics', 2),
(60, 'Communication, TV, Cinema', 2),
(61, 'Fashion', 2),
(62, 'Architecture, Decoration, Design', 2),
(63, 'Graphic design', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_publicidade`
--

DROP TABLE IF EXISTS `categoria_publicidade`;
CREATE TABLE IF NOT EXISTS `categoria_publicidade` (
  `catpu_id` int(11) NOT NULL AUTO_INCREMENT,
  `catpu_nome` varchar(100) NOT NULL,
  `catpu_commisao` varchar(100) NOT NULL,
  PRIMARY KEY (`catpu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria_publicidade`
--

INSERT INTO `categoria_publicidade` (`catpu_id`, `catpu_nome`, `catpu_commisao`) VALUES
(1, 'Beleza', '15%'),
(2, 'Dispositivos Amazon (Echo)', '14%'),
(3, 'Bebês', '13%'),
(4, 'Alimentos e Bebidas', '13%'),
(5, 'Cuidados Pessoais', '13%'),
(6, 'Pet Shop', '13%'),
(7, 'Bebida Alcoólicas', '13%'),
(8, 'Livros Digitais (eBooks)', '13%'),
(9, 'Roupas', '13%'),
(10, 'Dispositivos Amazon (Echo)', '14%'),
(11, 'Bebês', '13%'),
(12, 'Alimentos e Bebidas', '13%'),
(13, 'Cuidados Pessoais', '13%'),
(14, 'Pet Shop', '13%'),
(15, 'Bebida Alcoólicas', '13%'),
(16, 'Livros Digitais (eBooks)', '13%'),
(17, 'Roupas', '13%'),
(18, 'Calçados', '13%'),
(19, 'Relógios', '13%'),
(20, 'Bolsas, Malas e Mochilas', '13%'),
(21, 'Livros físicos', '10%'),
(22, 'Automotivo', '10%'),
(23, 'Dispositivos Amazon (Kindle e Fire TV)', '9,5%'),
(24, 'Brinquedos e Jogos', '9%'),
(25, 'Ferramentas e Construção', '9%'),
(26, 'Jardim e Piscina', '9%'),
(27, 'Casa', '9%'),
(28, 'Cozinha', '9%'),
(29, 'Câmeras e Fotos', '8,5%'),
(30, 'Eletrônicos', '8,5%'),
(31, 'TV e Áudio', '8,5%'),
(32, 'Papelaria e Escritório', '8,5%'),
(33, 'Computadores e Informática', '8,5%'),
(34, 'Instrumentos Musicais', '8,5%'),
(35, 'Eletrodomésticos', '8%'),
(36, 'Móveis', '8%'),
(37, 'CD e Vinil', '8%'),
(38, 'DVD e Blu-ray', '8%'),
(39, 'Aventura e Lazer', '8%'),
(40, 'Esportes', '8%'),
(41, 'Games e Consoles', '8%'),
(42, 'Outros', '8%'),
(43, 'Celulares e Comunicação', '7%');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `chatgrupomensagem`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `chatgrupomensagem`;
CREATE TABLE IF NOT EXISTS `chatgrupomensagem` (
`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
,`gml_id` int(11)
,`gml_date` timestamp
,`gml_grupo_id` int(11)
,`gml_remetente_id` int(11)
,`gml_msn_id` int(11)
,`gmdl_id` int(11)
,`gml_view` int(11)
,`mdl_id` int(11)
,`mdl_nome` varchar(50)
,`mdl_grupo_id` int(11)
,`mdl_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `chatprivadomensagem`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `chatprivadomensagem`;
CREATE TABLE IF NOT EXISTS `chatprivadomensagem` (
`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
,`pml_id` int(11)
,`pml_date` timestamp
,`pml_grupo_id` int(10)
,`pml_user_remetente_id` int(11)
,`pml_msn_id` int(11)
,`pmld_id` int(11)
,`pml_view` int(11)
,`pml_user_destinatario_id` int(11)
,`cp_id` int(11)
,`mdl_id` int(11)
,`mdl_nome` varchar(50)
,`mdl_grupo_id` int(11)
,`mdl_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `conversa_private`
--

DROP TABLE IF EXISTS `conversa_private`;
CREATE TABLE IF NOT EXISTS `conversa_private` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_remetente` int(11) NOT NULL,
  `cp_destinatario` int(11) NOT NULL,
  PRIMARY KEY (`cp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `dadosgrupo`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `dadosgrupo`;
CREATE TABLE IF NOT EXISTS `dadosgrupo` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas`
--

DROP TABLE IF EXISTS `duvidas`;
CREATE TABLE IF NOT EXISTS `duvidas` (
  `duv_id` int(11) NOT NULL AUTO_INCREMENT,
  `duv_pergunta` varchar(250) DEFAULT NULL,
  `duv_resposta` varchar(250) DEFAULT NULL,
  `duvcategoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`duv_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `duvidas`
--

INSERT INTO `duvidas` (`duv_id`, `duv_pergunta`, `duv_resposta`, `duvcategoria_id`) VALUES
(1, 'Quantos grupos posso criar ?', 'Quantos quiser', 1),
(2, 'O que os grupos ?', 'São grupos criando por alguem que tem um ideia de negocio e procura um socio para agregar', 1),
(3, 'Plano de negocios tem limite', 'Há campos que você tem que  preencher', 1),
(4, 'Há notificações de grupo ?', 'Sim', 1),
(5, 'Vou saber quando alguem entra no meu grupo ?', 'Sim, há notificação para isso.', 3),
(6, 'Vou pode bloquer alguem ?', 'Sim, usuarios indesejados', 3),
(7, 'How many groups can I create ?', 'As many as I want', 4),
(8, 'What are groups?', 'They are groups created by someone who has a business idea and is looking for a partner to add', 4),
(9, 'Business plan has a limit', 'There are fields you have to fill', 4),
(10, 'Are there group notifications?', 'Yes', 4),
(11, 'Will I know when someone joins my group?', 'Yes, there is notification for that.', 6),
(12, 'Will I block someone?', 'Yes, unwanted users', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas_categoria`
--

DROP TABLE IF EXISTS `duvidas_categoria`;
CREATE TABLE IF NOT EXISTS `duvidas_categoria` (
  `duvcat_id` int(10) NOT NULL AUTO_INCREMENT,
  `duvcat_nome` varchar(10) DEFAULT NULL,
  `duvpais_id` int(11) NOT NULL,
  PRIMARY KEY (`duvcat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `duvidas_categoria`
--

INSERT INTO `duvidas_categoria` (`duvcat_id`, `duvcat_nome`, `duvpais_id`) VALUES
(1, 'Grupos', 1),
(2, 'Ideias', 1),
(3, 'Pessoas', 1),
(4, 'groups', 2),
(5, 'ideas', 2),
(6, 'people', 2);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `duvidas_categorias_view`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `duvidas_categorias_view`;
CREATE TABLE IF NOT EXISTS `duvidas_categorias_view` (
`duv_id` int(11)
,`duv_pergunta` varchar(250)
,`duvcategoria_id` int(11)
,`duv_resposta` varchar(250)
,`duvcat_id` int(10)
,`duvcat_nome` varchar(10)
,`duvpais_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

DROP TABLE IF EXISTS `estado`;
CREATE TABLE IF NOT EXISTS `estado` (
  `est_id` int(11) NOT NULL AUTO_INCREMENT,
  `est_nome` varchar(50) DEFAULT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`est_id`, `est_nome`, `pais_id`) VALUES
(1, 'AC', 1),
(2, 'AL', 1),
(3, 'AM', 1),
(4, 'AP', 1),
(5, 'BA', 1),
(6, 'CE', 1),
(7, 'DF', 1),
(8, 'ES', 1),
(9, 'GO', 1),
(10, 'MA', 1),
(11, 'MG', 1),
(12, 'MS', 1),
(13, 'MT', 1),
(14, 'PA', 1),
(15, 'PB', 1),
(16, 'PE', 1),
(17, 'PI', 1),
(18, 'PR', 1),
(19, 'RJ', 1),
(20, 'RN', 1),
(21, 'RO', 1),
(22, 'RR', 1),
(23, 'RS', 1),
(24, 'SC', 1),
(25, 'SE', 1),
(26, 'SP', 1),
(27, 'TO', 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `exploregrupos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `exploregrupos`;
CREATE TABLE IF NOT EXISTS `exploregrupos` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `gr_id` int(11) NOT NULL AUTO_INCREMENT,
  `gr_nome` varchar(50) NOT NULL,
  `gr_descricao` varchar(255) NOT NULL,
  `gr_cidade` varchar(50) NOT NULL,
  `gr_estado` varchar(50) NOT NULL,
  `gr_foto` varchar(255) NOT NULL,
  `grcat_id` int(11) NOT NULL,
  `gr_private` int(11) NOT NULL,
  `gr_pais` int(11) NOT NULL,
  PRIMARY KEY (`gr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`gr_id`, `gr_nome`, `gr_descricao`, `gr_cidade`, `gr_estado`, `gr_foto`, `grcat_id`, `gr_private`, `gr_pais`) VALUES
(1, 'STARTUP E-LEARNING', 'Descriçao do plano de negocio', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1),
(2, 'statup 2 user1', 'Descriçao ', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `grupocategorias`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `grupocategorias`;
CREATE TABLE IF NOT EXISTS `grupocategorias` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_admin`
--

DROP TABLE IF EXISTS `grupo_admin`;
CREATE TABLE IF NOT EXISTS `grupo_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_user_id` int(11) NOT NULL,
  `adm_sub_user_id` int(11) DEFAULT NULL,
  `adm_grupo_id` int(11) NOT NULL,
  `adm_flag` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_admin`
--

INSERT INTO `grupo_admin` (`admin_id`, `adm_user_id`, `adm_sub_user_id`, `adm_grupo_id`, `adm_flag`) VALUES
(1, 3, 3, 1, 1),
(2, 3, 3, 2, 1),
(3, 3, 2, 1, 0),
(4, 3, 1, 1, 0),
(5, 3, 2, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_mensagem_link`
--

DROP TABLE IF EXISTS `grupo_mensagem_link`;
CREATE TABLE IF NOT EXISTS `grupo_mensagem_link` (
  `gml_id` int(11) NOT NULL AUTO_INCREMENT,
  `gml_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gml_grupo_id` int(11) NOT NULL,
  `gml_remetente_id` int(11) NOT NULL,
  `gml_msn_id` int(11) NOT NULL,
  `gmdl_id` int(11) NOT NULL,
  `gml_view` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gml_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_mensagem_link`
--

INSERT INTO `grupo_mensagem_link` (`gml_id`, `gml_date`, `gml_grupo_id`, `gml_remetente_id`, `gml_msn_id`, `gmdl_id`, `gml_view`) VALUES
(4, '2021-12-04 17:59:06', 1, 3, 4, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
CREATE TABLE IF NOT EXISTS `grupo_usuario` (
  `gu_accept` int(11) NOT NULL DEFAULT 1,
  `gu_user_id` int(11) DEFAULT NULL,
  `gu_grupo_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_usuario`
--

INSERT INTO `grupo_usuario` (`gu_accept`, `gu_user_id`, `gu_grupo_id`) VALUES
(2, 3, 1),
(2, 1, 1),
(2, 3, 2),
(2, 2, 1),
(2, 1, 1),
(2, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `msn_id` int(11) NOT NULL AUTO_INCREMENT,
  `msn_nome` varchar(255) DEFAULT NULL,
  `msn_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `msn_type` int(11) NOT NULL,
  PRIMARY KEY (`msn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`msn_id`, `msn_nome`, `msn_date`, `msn_type`) VALUES
(1, 'BOM DIA ', '2021-12-04 17:57:56', 1),
(2, 'BOM DIA ', '2021-12-04 17:57:56', 1),
(3, 'OI', '2021-12-04 17:58:06', 1),
(4, 'OI', '2021-12-04 17:59:06', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem_dados_link`
--

DROP TABLE IF EXISTS `mensagem_dados_link`;
CREATE TABLE IF NOT EXISTS `mensagem_dados_link` (
  `mdl_id` int(11) NOT NULL AUTO_INCREMENT,
  `mdl_nome` varchar(50) NOT NULL,
  `mdl_grupo_id` int(11) NOT NULL,
  `mdl_user_id` int(11) NOT NULL,
  PRIMARY KEY (`mdl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem_dados_link`
--

INSERT INTO `mensagem_dados_link` (`mdl_id`, `mdl_nome`, `mdl_grupo_id`, `mdl_user_id`) VALUES
(1, 'usuario 1', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `planodenegociosgrupo`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `planodenegociosgrupo`;
CREATE TABLE IF NOT EXISTS `planodenegociosgrupo` (
`pn_id` int(11)
,`pn_cv_proposta_valor` varchar(255)
,`pn_cv_segmentacao` varchar(255)
,`pn_cv_canais` varchar(255)
,`pn_cv_relacionamento` varchar(255)
,`pn_cv_receitas` varchar(255)
,`pn_cv_recursos` varchar(255)
,`pn_cv_atividades` varchar(255)
,`pn_cv_parcerias` varchar(255)
,`pn_cv_estrutura_de_custos` varchar(250)
,`pn_grupo_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_de_negocios`
--

DROP TABLE IF EXISTS `plano_de_negocios`;
CREATE TABLE IF NOT EXISTS `plano_de_negocios` (
  `pn_id` int(11) NOT NULL AUTO_INCREMENT,
  `pn_cv_proposta_valor` varchar(255) DEFAULT NULL,
  `pn_cv_segmentacao` varchar(255) DEFAULT NULL,
  `pn_cv_canais` varchar(255) DEFAULT NULL,
  `pn_cv_relacionamento` varchar(255) DEFAULT NULL,
  `pn_cv_receitas` varchar(255) DEFAULT NULL,
  `pn_cv_recursos` varchar(255) NOT NULL,
  `pn_cv_atividades` varchar(255) NOT NULL,
  `pn_cv_parcerias` varchar(255) NOT NULL,
  `pn_cv_estrutura_de_custos` varchar(250) NOT NULL,
  `pn_grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`pn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano_de_negocios`
--

INSERT INTO `plano_de_negocios` (`pn_id`, `pn_cv_proposta_valor`, `pn_cv_segmentacao`, `pn_cv_canais`, `pn_cv_relacionamento`, `pn_cv_receitas`, `pn_cv_recursos`, `pn_cv_atividades`, `pn_cv_parcerias`, `pn_cv_estrutura_de_custos`, `pn_grupo_id`) VALUES
(1, 'sss', 'ssssssssssss', 'sssssssss', 'ssssssssss', 'ssssssssssss', 'ssss', '', '', 'estrurua gaasto', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_titulo` varchar(255) DEFAULT NULL,
  `post_subtitulo` varchar(255) DEFAULT NULL,
  `post_description` text DEFAULT NULL,
  `post_img` varchar(250) DEFAULT NULL,
  `post_img_alt` varchar(250) NOT NULL,
  `postcat_id` int(11) DEFAULT NULL,
  `tipo_post_id` int(11) NOT NULL,
  `userpost_id` int(11) NOT NULL,
  `post_paisid` int(11) NOT NULL,
  `postdestaque_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`post_id`, `post_titulo`, `post_subtitulo`, `post_description`, `post_img`, `post_img_alt`, `postcat_id`, `tipo_post_id`, `userpost_id`, `post_paisid`, `postdestaque_id`) VALUES
(1, ' Google Ads ', 'Internet para leigos | Ferramenta Google Ads', '#Antes de falarmos de Google ads vale resaltar a diferença entre o Google AdSense e o Google Ads, A comparação entre os produtos de anunciantes e os de editores.##   #Google AdSense## É para editores. Se você possui ou gerencia sites, blogs ou fóruns e quer gerar receita com eles, o programa Google AdSense pode ser a opção certa.Os anúncios são exibidos na sua propriedade digital, e você pode gerar receita com base no número de pessoas que visualizam ou interagem com esses anúncios. Outras plataformas para editores incluem o Google Ad Manager e a AdMob. Saiba mais em Comparação entre o Ad Manager, o Google AdSense e a AdMob.  #Google Ads## É destinado a anunciantes. Se você quer anunciar produtos ou serviços em sites ou apps, com o objetivo de expandir seus negócios ou vendas, o Google Ads é a escolha ideal. Seus anúncios são exibidos nos resultados da pesquisa do Google e na nossa rede de sites de editores. Saiba mais sobre o Google Ads e comece a anunciar acessando www.ads.google.com.', '00001facebook.jpg', '', 3, 1, 1, 1, 1),
(2, ' Google Ads ', 'Internet for Dummies | Google Ads Tool', 'Before we talk about Google ads, it\'s worth mentioning the difference between Google AdSense and Google Ads, The comparison between advertisers\' and publishers\' products.## #Google AdSense## It\'s for publishers. If you own or manage websites, blogs or forums and want to monetize them, the Google AdSense program may be the right choice. Ads are displayed on your digital property, and you can monetize based on the number of people who view or interact with these ads. Other platforms for publishers include Google Ad Manager and AdMob. Learn more at Comparison of Ad Manager, Google AdSense and AdMob. #Google Ads## It is intended for advertisers. If you want to advertise products or services on websites or apps, with the aim of growing your business or sales, Google Ads is the ideal choice. Your ads appear in Google search results and on our network of publisher sites. Learn more about Google Ads and start advertising at www.ads.google.com.', '00001whatsapp.jpg', '', 7, 1, 1, 2, 1),
(3, 'Google Agenda ', 'Internet para leigos | Ferramenta Google Agenda', 'Google Agenda é um serviço de agenda e calendário on-line oferecido gratuitamente pela empresa Google. Disponível em uma interface web, é possível adicionar, controlar eventos, compromissos, compartilhar a programação com outras pessoas, agregar à sua agenda diversas agendas públicas, entre outras funcionalidades.', '0001Instagram.jpg', '', 3, 1, 1, 1, 1),
(4, 'Google Calendar ', 'Internet for Dummies | Google Calendar Tool', 'Google Calendar is an online calendar and calendar service offered for free by the Google company. Available in a web interface, it is possible to add, control events, appointments, share the schedule with other people, add several public calendars to your agenda, among other features.', NULL, '', 7, 1, 1, 2, 1),
(5, 'Google Alerts', 'Internet para leigos | Ferramenta Google Alerts', 'Google Alerts é um serviço do Google que retorna resultados de uma pesquisa à caixa de emails do usuário, sempre que for encontrada nova citação de um termo pré determinado.', NULL, '', 3, 1, 1, 1, 1),
(6, 'Google Alerts', 'Internet for Dummies | Google Alerts Tool', 'Google Alerts is a Google service that returns search results to the user\'s mailbox whenever a new citation of a predetermined term is found.\r\n', NULL, '', 7, 1, 1, 2, 1),
(7, 'Google Analytics', 'Internet para leigos | Ferramenta Google Analytics', 'Google Analytics é um serviço gratuito e é oferecido pela Google no qual, ao ativar-se o serviço por intermédio de uma conta do Google, e ao cadastrar-se um site recebe-se um código para ser inserido na página cadastrada e, a cada exibição, estatísticas de visitação são enviadas ao sistema e apresentadas ao dono do site. Foi criado principalmente como um auxilio aos webmasters para otimizar seus sites para campanhas de marketing e para o Google AdSense. É incorreto pensar que este serviço resolve os problemas de um site automaticamente sem um webmaster por trás, ele apenas demonstra as informações para que sejam corrigidas.  O sistema foi modelado com o sistema de estatísticas Urchin, da Urchin Software Corporation, adquirida pela Google em abril de 2005. Ainda hoje o sistema Urchin original para instalação em computadores é vendido pelo Google como um novo pacote.', NULL, '', 3, 1, 1, 1, 1),
(8, 'Google Analytics', 'Internet for Dummies | Google Analytics Tool', 'Google Analytics is a free service and is offered by Google in which, when activating the service through a Google account, and when registering a website, a code is received to be inserted in the registered page and, at each display, visitor statistics are sent to the system and presented to the website owner. It was created primarily as an aid to webmasters to optimize their websites for marketing campaigns and for Google AdSense. It is incorrect to think that this service solves a site\'s problems automatically without a webmaster behind it, it just demonstrates the information to be corrected. The system was modeled on the Urchin statistics system from Urchin Software Corporation, acquired by Google in April 2005. Even today the original Urchin system for computer installation is sold by Google as a new package.\r\n\r\n', NULL, '', 7, 1, 1, 2, 1),
(9, 'Google Docs', 'Internet para leigos | Ferramenta Google Docs', 'Google Docs é um pacote de aplicativos do Google baseado em AJAX.[1] As ferramentas do Google Docs funcionam de forma síncrona e assíncrona, portanto, on-line para acessar dados em nuvens e off-line através de aplicativos de extensão instaladas diretamente do Google, onde há bancos de dados criados por essa extensão para posterior sincronização através de upload instantâneo ao acessá-los online, diretamente no browser de desktops ou aplicativos de dispositivos móveis do Android e Mec. Os aplicativos são compatíveis com o Apache OpenOffice, LibreOffice e Microsoft Office, e atualmente compõe-se de um processador de texto, um editor de apresentações, um editor de planilhas e um editor de formulários...', NULL, '', 3, 1, 1, 1, 1),
(10, 'Google Docs', 'Internet for Dummies | Google Docs Tool', 'Google Docs is an AJAX-based application package from Google. Google Docs Ass works synchronously and asynchronously, therefore, online to access data in clouds and offline through extension applications installed directly from Google, where there are databases created by this extension for later synchronization through upload instant access when accessing them online, directly in the desktop browser or mobile apps from Android and Mec. The applications are compatible with Apache OpenOffice, LibreOffice and Microsoft Office, and currently consist of a word processor, a presentation editor, a spreadsheet editor and a form editor...\r\n', NULL, '', 7, 1, 1, 2, 1),
(11, 'Google Drive', 'Internet para leigos | Ferramenta Google Drive', 'Google Drive é um serviço de armazenamento e sincronização de arquivos que foi apresentado pela Google em 24 de abril de 2012. Google Drive abriga agora o Google Docs, um leque de aplicações de produtividade, que oferece a edição de documentos, folhas de cálculo, apresentações, e muito mais. O Google Drive é considerado uma \"evolução natural\" do Google Docs (uma vez ativado substitui a URL docs.google.com por drive.google.com). Rumores sobre o Google Drive começaram a circular no início de março de 2006. Com o lançamento do Google Drive, o Google aumentou o espaço de armazenamento do Gmail para 15 GB...\r\n', NULL, '', 3, 1, 1, 1, 1),
(12, 'Google Drive', 'Internet for Dummies | Google Drive Tool', 'Google Drive is a file storage and synchronization service that was introduced by Google on April 24, 2012. Google Drive is now home to Google Docs, a range of productivity applications that offer editing documents, spreadsheets, presentations , and much more. Google Drive is considered a \"natural evolution\" of Google Docs (once activated it replaces the docs.google.com URL with drive.google.com). Rumors about Google Drive started circulating in early March 2006. With the launch of Google Drive, Google increased Gmail\'s storage space to 15GB...\r\n', NULL, '', 7, 1, 1, 2, 1),
(13, 'Um pouco sobre: \"O Facebook\"', 'Para se inspirar | Ascenção de statups: \"The faceboook\"', 'Feed back Ericsson Gestão e Gerviços', '00001facebook.jpg', '', 1, 1, 1, 1, 2),
(14, 'Um pouco sobre:  \"Whats App\"', 'Para se inspirar | Ascenção de statups: \"what´s app\"', 'Feed back Ericsson Gestão e Gerviços', '00001whatsapp.jpg', 'ssssssssssss', 1, 1, 1, 1, 2),
(15, 'Um pouco sobre:  \"Instagram\"', 'Para se inspirar | Ascenção de statups: \"Instagram\"', 'sInstagram ssssssssssssssssssss ', '0001Instagram.jpg', '', 1, 1, 1, 1, 2),
(18, 'Política de Privacidade do startups arcade', 'Informações legais do startups arcade:', 'Se você não reside na Região Europeia, o startups arcade fornece nossos Serviços para você de acordo com estes Termos de Serviço e esta Política de Privacidade.', NULL, '', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `postblog_categoria`
--

DROP TABLE IF EXISTS `postblog_categoria`;
CREATE TABLE IF NOT EXISTS `postblog_categoria` (
  `postblogcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `postblogcat_nome` varchar(50) NOT NULL,
  `postblogpais_id` int(11) NOT NULL,
  PRIMARY KEY (`postblogcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `postblog_categoria`
--

INSERT INTO `postblog_categoria` (`postblogcat_id`, `postblogcat_nome`, `postblogpais_id`) VALUES
(1, 'Planejamento', 1),
(2, 'Administração', 1),
(3, 'Dicas & ferramentas', 1),
(4, 'Negocios', 1),
(5, 'Termos e serviços', 1),
(6, 'Management', 2),
(7, 'Planning', 2),
(8, 'Good habits & tools', 2),
(9, 'Business', 2),
(10, 'Terms and Services', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_destaque`
--

DROP TABLE IF EXISTS `post_destaque`;
CREATE TABLE IF NOT EXISTS `post_destaque` (
  `postdest_id` int(11) NOT NULL AUTO_INCREMENT,
  `postdest_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`postdest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `post_destaque`
--

INSERT INTO `post_destaque` (`postdest_id`, `postdest_nome`) VALUES
(1, '1 - Post no blog (padrão)'),
(2, ' 2 - Destaque (carrossel )');

-- --------------------------------------------------------

--
-- Estrutura da tabela `privado_mensagem_link`
--

DROP TABLE IF EXISTS `privado_mensagem_link`;
CREATE TABLE IF NOT EXISTS `privado_mensagem_link` (
  `pml_id` int(11) NOT NULL AUTO_INCREMENT,
  `pml_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `pml_grupo_id` int(10) NOT NULL,
  `pml_user_remetente_id` int(11) NOT NULL,
  `pml_msn_id` int(11) NOT NULL,
  `pmld_id` int(11) NOT NULL,
  `pml_view` int(11) NOT NULL DEFAULT 0,
  `pml_user_destinatario_id` int(11) NOT NULL,
  `cp_id` int(11) NOT NULL,
  PRIMARY KEY (`pml_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `privado_mensagem_link`
--

INSERT INTO `privado_mensagem_link` (`pml_id`, `pml_date`, `pml_grupo_id`, `pml_user_remetente_id`, `pml_msn_id`, `pmld_id`, `pml_view`, `pml_user_destinatario_id`, `cp_id`) VALUES
(1, '2021-03-24 21:27:29', 1, 3, 7, 1, 0, 1, 0),
(2, '2021-03-24 22:43:53', 1, 3, 8, 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proposta`
--

DROP TABLE IF EXISTS `proposta`;
CREATE TABLE IF NOT EXISTS `proposta` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_mvc` varchar(200) NOT NULL,
  PRIMARY KEY (`pr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `propostagrupo`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `propostagrupo`;
CREATE TABLE IF NOT EXISTS `propostagrupo` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`pn_id` int(11)
,`pn_cv_proposta_valor` varchar(255)
,`pn_cv_segmentacao` varchar(255)
,`pn_cv_canais` varchar(255)
,`pn_cv_relacionamento` varchar(255)
,`pn_cv_receitas` varchar(255)
,`pn_cv_recursos` varchar(255)
,`pn_cv_atividades` varchar(255)
,`pn_cv_parcerias` varchar(255)
,`pn_cv_estrutura_de_custos` varchar(250)
,`pn_grupo_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `publicidade`
--

DROP TABLE IF EXISTS `publicidade`;
CREATE TABLE IF NOT EXISTS `publicidade` (
  `pu_id` int(11) NOT NULL AUTO_INCREMENT,
  `pu_produto` varchar(250) NOT NULL,
  `pu_link` text NOT NULL,
  `pu_categoria_id` int(11) NOT NULL,
  `pu_pais` int(11) NOT NULL,
  `pu_preco` varchar(100) NOT NULL,
  `pu_parcela` varchar(100) NOT NULL,
  `pu_src` text NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`pu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao`
--

DROP TABLE IF EXISTS `solicitacao`;
CREATE TABLE IF NOT EXISTS `solicitacao` (
  `soli_id` varchar(10) NOT NULL,
  `solistatus_id` varchar(10) DEFAULT NULL,
  `soli_decricao` varchar(10) DEFAULT NULL,
  `soli_response` varchar(10) DEFAULT NULL,
  `soli_date` varchar(10) DEFAULT NULL,
  `soliusuario_id` varchar(10) DEFAULT NULL,
  `solicategoria_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`soli_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao_categoria`
--

DROP TABLE IF EXISTS `solicitacao_categoria`;
CREATE TABLE IF NOT EXISTS `solicitacao_categoria` (
  `solicat_id` varchar(10) DEFAULT NULL,
  `soli_cat_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `termos`
--

DROP TABLE IF EXISTS `termos`;
CREATE TABLE IF NOT EXISTS `termos` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_titulo` varchar(100) NOT NULL,
  `term_subtitulo` varchar(150) NOT NULL,
  `term_text` text NOT NULL,
  `term_date` datetime NOT NULL DEFAULT current_timestamp(),
  `term_pais_id` int(11) NOT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `termos`
--

INSERT INTO `termos` (`term_id`, `term_titulo`, `term_subtitulo`, `term_text`, `term_date`, `term_pais_id`) VALUES
(1, 'termo titulozddddddddddddddd', 'term subtitulozzzzzzzzzdddddddddddddddddddddzz', '                    termo titulddddddddddddddddddddddddddddddddddddddoz\r\n                  ', '2021-12-26 16:58:06', 1),
(3, 'dd', 'ddddddddddd', 'ddddddddddddd', '2021-12-26 21:49:27', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_email` varchar(255) DEFAULT NULL,
  `us_nome` varchar(100) DEFAULT NULL,
  `us_tipo_pessoa` int(11) NOT NULL,
  `us_senha` varchar(255) DEFAULT NULL,
  `us_foto` varchar(255) DEFAULT 'padraoperfil.svg',
  `us_status_conta` int(11) DEFAULT NULL,
  `us_data_compra` date DEFAULT NULL,
  `us_data_expiracao` date DEFAULT NULL,
  `us_cpf_cnpj` varchar(50) DEFAULT NULL,
  `us_dataCadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `us_pais_id` int(11) NOT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`us_id`, `us_email`, `us_nome`, `us_tipo_pessoa`, `us_senha`, `us_foto`, `us_status_conta`, `us_data_compra`, `us_data_expiracao`, `us_cpf_cnpj`, `us_dataCadastro`, `us_pais_id`) VALUES
(1, 'nato.re.vieira@gmail.com', 'nato re ', 1, '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-09 18:52:53', 1),
(2, 'usuario@gmail.com', 'usuario', 1, '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-17 02:17:23', 1),
(3, 'usuario1@gmail.com', 'usuario 1', 1, '$2y$12$M2cAdPhfMm05adJGmSJGGuubJ8k0VoMpXMzkxwiEdz7dDhVQiYYFG', 'padraoperfil.svg', 1, NULL, NULL, NULL, '2021-01-17 17:33:55', 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuariogrupos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuariogrupos`;
CREATE TABLE IF NOT EXISTS `usuariogrupos` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`us_id` int(11)
,`us_email` varchar(255)
,`us_nome` varchar(100)
,`us_tipo_pessoa` int(11)
,`us_senha` varchar(255)
,`us_foto` varchar(255)
,`us_status_conta` int(11)
,`us_data_compra` date
,`us_data_expiracao` date
,`us_cpf_cnpj` varchar(50)
,`us_dataCadastro` timestamp
,`us_pais_id` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuariogrupospendentes`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuariogrupospendentes`;
CREATE TABLE IF NOT EXISTS `usuariogrupospendentes` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`cg_pais_id` int(11)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gu_accept` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`us_id` int(11)
,`us_email` varchar(255)
,`us_nome` varchar(100)
,`us_tipo_pessoa` int(11)
,`us_senha` varchar(255)
,`us_foto` varchar(255)
,`us_status_conta` int(11)
,`us_data_compra` date
,`us_data_expiracao` date
,`us_cpf_cnpj` varchar(50)
,`us_dataCadastro` timestamp
,`us_pais_id` int(11)
,`admin_id` int(11)
,`adm_user_id` int(11)
,`adm_sub_user_id` int(11)
,`adm_grupo_id` int(11)
,`adm_flag` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuario_notificantions_mensagem`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuario_notificantions_mensagem`;
CREATE TABLE IF NOT EXISTS `usuario_notificantions_mensagem` (
`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gr_pais` int(11)
,`gml_id` int(11)
,`gml_date` timestamp
,`gml_grupo_id` int(11)
,`gml_remetente_id` int(11)
,`gml_msn_id` int(11)
,`gmdl_id` int(11)
,`gml_view` int(11)
,`msn_id` int(11)
,`msn_nome` varchar(255)
,`msn_date` timestamp
,`msn_type` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura para vista `blog_post_categoria`
--
DROP TABLE IF EXISTS `blog_post_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `blog_post_categoria`  AS  select `b`.`blog_id` AS `blog_id`,`b`.`blog_subtitulo` AS `blog_subtitulo`,`b`.`blog_text` AS `blog_text`,`b`.`blog_date` AS `blog_date`,`b`.`blog_img` AS `blog_img`,`b`.`blog_img_alt` AS `blog_img_alt`,`b`.`blog_video_src` AS `blog_video_src`,`b`.`blog_autor` AS `blog_autor`,`b`.`blogpost_id` AS `blogpost_id`,`b`.`blog_fonte` AS `blog_fonte`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`post_img` AS `post_img`,`p`.`post_img_alt` AS `post_img_alt`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_paisid` AS `post_paisid`,`p`.`postdestaque_id` AS `postdestaque_id`,`cat`.`postblogcat_id` AS `postblogcat_id`,`cat`.`postblogcat_nome` AS `postblogcat_nome`,`cat`.`postblogpais_id` AS `postblogpais_id`,`pd`.`postdest_id` AS `postdest_id`,`pd`.`postdest_nome` AS `postdest_nome` from (((`blog` `b` join `post` `p` on(`b`.`blogpost_id` = `p`.`post_id`)) join `postblog_categoria` `cat` on(`p`.`postcat_id` = `cat`.`postblogcat_id`)) join `post_destaque` `pd` on(`p`.`postdestaque_id` = `pd`.`postdest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `chatgrupomensagem`
--
DROP TABLE IF EXISTS `chatgrupomensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chatgrupomensagem`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_nome` AS `msn_nome`,`m`.`msn_date` AS `msn_date`,`m`.`msn_type` AS `msn_type`,`gml`.`gml_id` AS `gml_id`,`gml`.`gml_date` AS `gml_date`,`gml`.`gml_grupo_id` AS `gml_grupo_id`,`gml`.`gml_remetente_id` AS `gml_remetente_id`,`gml`.`gml_msn_id` AS `gml_msn_id`,`gml`.`gmdl_id` AS `gmdl_id`,`gml`.`gml_view` AS `gml_view`,`mdl`.`mdl_id` AS `mdl_id`,`mdl`.`mdl_nome` AS `mdl_nome`,`mdl`.`mdl_grupo_id` AS `mdl_grupo_id`,`mdl`.`mdl_user_id` AS `mdl_user_id` from ((`mensagem` `m` left join `grupo_mensagem_link` `gml` on(`m`.`msn_id` = `gml`.`gml_msn_id`)) left join `mensagem_dados_link` `mdl` on(`gml`.`gmdl_id` = `mdl`.`mdl_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `chatprivadomensagem`
--
DROP TABLE IF EXISTS `chatprivadomensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chatprivadomensagem`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_nome` AS `msn_nome`,`m`.`msn_date` AS `msn_date`,`m`.`msn_type` AS `msn_type`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_grupo_id` AS `pml_grupo_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pmld_id` AS `pmld_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`cp_id` AS `cp_id`,`mdl`.`mdl_id` AS `mdl_id`,`mdl`.`mdl_nome` AS `mdl_nome`,`mdl`.`mdl_grupo_id` AS `mdl_grupo_id`,`mdl`.`mdl_user_id` AS `mdl_user_id` from (`mensagem_dados_link` `mdl` left join (`mensagem` `m` left join `privado_mensagem_link` `pml` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) on(`pml`.`pmld_id` = `mdl`.`mdl_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dadosgrupo`
--
DROP TABLE IF EXISTS `dadosgrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dadosgrupo`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_admin` `ga` on(`ga`.`adm_grupo_id` = `g`.`gr_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `duvidas_categorias_view`
--
DROP TABLE IF EXISTS `duvidas_categorias_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `duvidas_categorias_view`  AS  select `duv`.`duv_id` AS `duv_id`,`duv`.`duv_pergunta` AS `duv_pergunta`,`duv`.`duvcategoria_id` AS `duvcategoria_id`,`duv`.`duv_resposta` AS `duv_resposta`,`dv`.`duvcat_id` AS `duvcat_id`,`dv`.`duvcat_nome` AS `duvcat_nome`,`dv`.`duvpais_id` AS `duvpais_id` from (`duvidas` `duv` join `duvidas_categoria` `dv` on(`duv`.`duvcategoria_id` = `dv`.`duvcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `exploregrupos`
--
DROP TABLE IF EXISTS `exploregrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exploregrupos`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) left join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `grupocategorias`
--
DROP TABLE IF EXISTS `grupocategorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grupocategorias`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais` from (`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `planodenegociosgrupo`
--
DROP TABLE IF EXISTS `planodenegociosgrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `planodenegociosgrupo`  AS  select `pn`.`pn_id` AS `pn_id`,`pn`.`pn_cv_proposta_valor` AS `pn_cv_proposta_valor`,`pn`.`pn_cv_segmentacao` AS `pn_cv_segmentacao`,`pn`.`pn_cv_canais` AS `pn_cv_canais`,`pn`.`pn_cv_relacionamento` AS `pn_cv_relacionamento`,`pn`.`pn_cv_receitas` AS `pn_cv_receitas`,`pn`.`pn_cv_recursos` AS `pn_cv_recursos`,`pn`.`pn_cv_atividades` AS `pn_cv_atividades`,`pn`.`pn_cv_parcerias` AS `pn_cv_parcerias`,`pn`.`pn_cv_estrutura_de_custos` AS `pn_cv_estrutura_de_custos`,`pn`.`pn_grupo_id` AS `pn_grupo_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais` from (`plano_de_negocios` `pn` join `grupo` `g` on(`pn`.`pn_grupo_id` = `g`.`gr_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `propostagrupo`
--
DROP TABLE IF EXISTS `propostagrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propostagrupo`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`pn`.`pn_id` AS `pn_id`,`pn`.`pn_cv_proposta_valor` AS `pn_cv_proposta_valor`,`pn`.`pn_cv_segmentacao` AS `pn_cv_segmentacao`,`pn`.`pn_cv_canais` AS `pn_cv_canais`,`pn`.`pn_cv_relacionamento` AS `pn_cv_relacionamento`,`pn`.`pn_cv_receitas` AS `pn_cv_receitas`,`pn`.`pn_cv_recursos` AS `pn_cv_recursos`,`pn`.`pn_cv_atividades` AS `pn_cv_atividades`,`pn`.`pn_cv_parcerias` AS `pn_cv_parcerias`,`pn`.`pn_cv_estrutura_de_custos` AS `pn_cv_estrutura_de_custos`,`pn`.`pn_grupo_id` AS `pn_grupo_id` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) left join `plano_de_negocios` `pn` on(`g`.`gr_id` = `pn`.`pn_grupo_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupos`
--
DROP TABLE IF EXISTS `usuariogrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupos`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`u`.`us_id` AS `us_id`,`u`.`us_email` AS `us_email`,`u`.`us_nome` AS `us_nome`,`u`.`us_tipo_pessoa` AS `us_tipo_pessoa`,`u`.`us_senha` AS `us_senha`,`u`.`us_foto` AS `us_foto`,`u`.`us_status_conta` AS `us_status_conta`,`u`.`us_data_compra` AS `us_data_compra`,`u`.`us_data_expiracao` AS `us_data_expiracao`,`u`.`us_cpf_cnpj` AS `us_cpf_cnpj`,`u`.`us_dataCadastro` AS `us_dataCadastro`,`u`.`us_pais_id` AS `us_pais_id`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag` from ((((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) join `usuario` `u` on(`gu`.`gu_user_id` = `u`.`us_id`)) left join `grupo_admin` `ga` on(`ga`.`adm_sub_user_id` = `u`.`us_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupospendentes`
--
DROP TABLE IF EXISTS `usuariogrupospendentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupospendentes`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`u`.`us_id` AS `us_id`,`u`.`us_email` AS `us_email`,`u`.`us_nome` AS `us_nome`,`u`.`us_tipo_pessoa` AS `us_tipo_pessoa`,`u`.`us_senha` AS `us_senha`,`u`.`us_foto` AS `us_foto`,`u`.`us_status_conta` AS `us_status_conta`,`u`.`us_data_compra` AS `us_data_compra`,`u`.`us_data_expiracao` AS `us_data_expiracao`,`u`.`us_cpf_cnpj` AS `us_cpf_cnpj`,`u`.`us_dataCadastro` AS `us_dataCadastro`,`u`.`us_pais_id` AS `us_pais_id`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag` from ((((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) join `usuario` `u` on(`gu`.`gu_user_id` = `u`.`us_id`)) left join `grupo_admin` `ga` on(`ga`.`adm_sub_user_id` = `u`.`us_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_notificantions_mensagem`
--
DROP TABLE IF EXISTS `usuario_notificantions_mensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_notificantions_mensagem`  AS  select `g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gml`.`gml_id` AS `gml_id`,`gml`.`gml_date` AS `gml_date`,`gml`.`gml_grupo_id` AS `gml_grupo_id`,`gml`.`gml_remetente_id` AS `gml_remetente_id`,`gml`.`gml_msn_id` AS `gml_msn_id`,`gml`.`gmdl_id` AS `gmdl_id`,`gml`.`gml_view` AS `gml_view`,`m`.`msn_id` AS `msn_id`,`m`.`msn_nome` AS `msn_nome`,`m`.`msn_date` AS `msn_date`,`m`.`msn_type` AS `msn_type` from ((`grupo` `g` join `grupo_mensagem_link` `gml` on(`g`.`gr_id` = `gml`.`gml_grupo_id`)) join `mensagem` `m` on(`gml`.`gml_msn_id` = `m`.`msn_id`)) ;
--
-- Banco de dados: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
