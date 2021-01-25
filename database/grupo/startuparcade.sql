-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 25-Jan-2021 às 03:19
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
-- Banco de dados: `startuparcade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `blog_text` varchar(10) DEFAULT NULL,
  `blog_id` varchar(10) DEFAULT NULL,
  `blog_categoria_id` varchar(10) DEFAULT NULL,
  `blogdestaque_id` varchar(10) DEFAULT NULL,
  `blog_img` varchar(10) DEFAULT NULL,
  `blog_date` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_categoria`
--

DROP TABLE IF EXISTS `blog_categoria`;
CREATE TABLE IF NOT EXISTS `blog_categoria` (
  `blogcat_id` varchar(10) DEFAULT NULL,
  `blogcat_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_deztaque`
--

DROP TABLE IF EXISTS `blog_deztaque`;
CREATE TABLE IF NOT EXISTS `blog_deztaque` (
  `blogdest_id` varchar(10) DEFAULT NULL,
  `blogdest_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_grupo`
--

DROP TABLE IF EXISTS `categoria_grupo`;
CREATE TABLE IF NOT EXISTS `categoria_grupo` (
  `cg_id` int(11) NOT NULL AUTO_INCREMENT,
  `cg_nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria_grupo`
--

INSERT INTO `categoria_grupo` (`cg_id`, `cg_nome`) VALUES
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
(32, 'Cultura, Lazer, Entretenimento '),
(33, 'Meio Ambiente, Ecologia'),
(34, 'Serviço Social e Comunitário'),
(35, 'blog');

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
,`pml_date` datetime
,`pml_grupo_id` int(10)
,`pml_user_remetente_id` int(11)
,`pml_msn_id` int(11)
,`pmld_id` int(11)
,`pml_view` int(11)
,`pml_user_destinatario_id` int(11)
,`mdl_id` int(11)
,`mdl_nome` varchar(50)
,`mdl_grupo_id` int(11)
,`mdl_user_id` int(11)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `dadosgrupo`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `dadosgrupo`;
CREATE TABLE IF NOT EXISTS `dadosgrupo` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_pais` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gu_id` int(11)
,`gu_accept` int(11)
,`gu_user_admin_id` int(11)
,`gu_subusers_admin_id` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`gu_date` timestamp
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas`
--

DROP TABLE IF EXISTS `duvidas`;
CREATE TABLE IF NOT EXISTS `duvidas` (
  `duv_id` varchar(10) DEFAULT NULL,
  `duv_nome` varchar(10) DEFAULT NULL,
  `duvcategoria_id` varchar(10) DEFAULT NULL,
  `duv_resposta` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas_categoria`
--

DROP TABLE IF EXISTS `duvidas_categoria`;
CREATE TABLE IF NOT EXISTS `duvidas_categoria` (
  `duvcat_id` varchar(10) DEFAULT NULL,
  `duvcat_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `gr_id` int(11) NOT NULL AUTO_INCREMENT,
  `gr_nome` varchar(50) NOT NULL,
  `gr_descricao` varchar(255) NOT NULL,
  `gr_cidade` varchar(50) NOT NULL,
  `gr_estado` varchar(50) NOT NULL,
  `gr_pais` varchar(50) NOT NULL,
  `gr_foto` varchar(255) NOT NULL,
  `grcat_id` int(11) NOT NULL,
  `gr_private` int(11) NOT NULL,
  PRIMARY KEY (`gr_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`gr_id`, `gr_nome`, `gr_descricao`, `gr_cidade`, `gr_estado`, `gr_pais`, `gr_foto`, `grcat_id`, `gr_private`) VALUES
(6, 'projeto 1', 'descricao', 'Mauá', 'SP', 'Brasil', 'logostartupsrcade.PNG1611542737', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `grupocategorias`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `grupocategorias`;
CREATE TABLE IF NOT EXISTS `grupocategorias` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_pais` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_mensagem_link`
--

INSERT INTO `grupo_mensagem_link` (`gml_id`, `gml_date`, `gml_grupo_id`, `gml_remetente_id`, `gml_msn_id`, `gmdl_id`, `gml_view`) VALUES
(1, '2021-01-25 01:05:12', 4, 3, 1, 1, 0),
(2, '2021-01-25 02:28:50', 4, 1, 2, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuario`
--

DROP TABLE IF EXISTS `grupo_usuario`;
CREATE TABLE IF NOT EXISTS `grupo_usuario` (
  `gu_id` int(11) NOT NULL AUTO_INCREMENT,
  `gu_accept` int(11) NOT NULL,
  `gu_user_admin_id` int(11) DEFAULT NULL,
  `gu_subusers_admin_id` int(11) DEFAULT NULL,
  `gu_user_id` int(11) NOT NULL,
  `gu_grupo_id` int(11) NOT NULL,
  `gu_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`gu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_usuario`
--

INSERT INTO `grupo_usuario` (`gu_id`, `gu_accept`, `gu_user_admin_id`, `gu_subusers_admin_id`, `gu_user_id`, `gu_grupo_id`, `gu_date`) VALUES
(21, 2, 1, NULL, 1, 6, '2021-01-25 02:45:37');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`msn_id`, `msn_nome`, `msn_date`, `msn_type`) VALUES
(1, 'ssssssss', '2021-01-25 01:06:00', 1),
(2, 'oi meu email é renato Vieira', '2021-01-25 02:28:50', 1);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `mensagem_dados_link`
--

INSERT INTO `mensagem_dados_link` (`mdl_id`, `mdl_nome`, `mdl_grupo_id`, `mdl_user_id`) VALUES
(1, 'renato d', 4, 3),
(2, 'Renato Vieira', 4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `privado_mensagem_link`
--

DROP TABLE IF EXISTS `privado_mensagem_link`;
CREATE TABLE IF NOT EXISTS `privado_mensagem_link` (
  `pml_id` int(11) NOT NULL AUTO_INCREMENT,
  `pml_date` datetime NOT NULL,
  `pml_grupo_id` int(10) NOT NULL,
  `pml_user_remetente_id` int(11) NOT NULL,
  `pml_msn_id` int(11) NOT NULL,
  `pmld_id` int(11) NOT NULL,
  `pml_view` int(11) NOT NULL DEFAULT 0,
  `pml_user_destinatario_id` int(11) NOT NULL,
  PRIMARY KEY (`pml_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `solicitaao_categoria`
--

DROP TABLE IF EXISTS `solicitaao_categoria`;
CREATE TABLE IF NOT EXISTS `solicitaao_categoria` (
  `solicat_id` varchar(10) DEFAULT NULL,
  `soli_cat_nome` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `us_id` int(11) NOT NULL AUTO_INCREMENT,
  `us_email` varchar(255) DEFAULT NULL,
  `us_nome` varchar(100) DEFAULT NULL,
  `us_tipo_pessoa` int(11) NOT NULL,
  `us_senha` varchar(255) DEFAULT NULL,
  `us_foto` varchar(255) DEFAULT NULL,
  `us_status_conta` int(11) DEFAULT NULL,
  `us_data_compra` date DEFAULT NULL,
  `us_data_expiracao` date DEFAULT NULL,
  `us_cpf_cnpj` varchar(50) DEFAULT NULL,
  `us_dataCadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`us_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`us_id`, `us_email`, `us_nome`, `us_tipo_pessoa`, `us_senha`, `us_foto`, `us_status_conta`, `us_data_compra`, `us_data_expiracao`, `us_cpf_cnpj`, `us_dataCadastro`) VALUES
(1, 'nato.re.vieira@gmail.com', 'Renato Vieira', 1, '$2y$12$9TqWhIl5WB9Myu49prKJMu8citiESSwH5vOaNyg9oMunnkmqDmIO.', 'padrao.jpg1610218373', 1, NULL, NULL, NULL, '2021-01-09 18:52:53'),
(2, 'usuario@gmail.com', 'renato vieira', 1, '$2y$12$HJMNnHcJt3Rbi5ZLgLQ5O.sT9ay9MjEWw5vtHVavKuZPQrzxu90EC', '84357151_2495486947341131_2662674308119134208_n.jpg1610849843', 1, NULL, NULL, NULL, '2021-01-17 02:17:23'),
(3, 'usuario1@gmail.com', 'renato d', 1, '$2y$12$ndDHsfny0Byjsi.tf7oJA.ZxIt5W31ycgGlpALEExPpmXE6S3RMU.', 'Lamborghini_2018_Urus_Yellow_Metallic_561785_1280x854.jpg1610904835', 1, NULL, NULL, NULL, '2021-01-17 17:33:55');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `usuariogrupos`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `usuariogrupos`;
CREATE TABLE IF NOT EXISTS `usuariogrupos` (
`cg_id` int(11)
,`cg_nome` varchar(100)
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_pais` varchar(50)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`gu_id` int(11)
,`gu_accept` int(11)
,`gu_user_admin_id` int(11)
,`gu_subusers_admin_id` int(11)
,`gu_user_id` int(11)
,`gu_grupo_id` int(11)
,`gu_date` timestamp
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
);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `chatprivadomensagem`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_nome` AS `msn_nome`,`m`.`msn_date` AS `msn_date`,`m`.`msn_type` AS `msn_type`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_grupo_id` AS `pml_grupo_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pmld_id` AS `pmld_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`mdl`.`mdl_id` AS `mdl_id`,`mdl`.`mdl_nome` AS `mdl_nome`,`mdl`.`mdl_grupo_id` AS `mdl_grupo_id`,`mdl`.`mdl_user_id` AS `mdl_user_id` from ((`mensagem` `m` left join `privado_mensagem_link` `pml` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) left join `mensagem_dados_link` `mdl` on(`pml`.`pmld_id` = `mdl`.`mdl_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dadosgrupo`
--
DROP TABLE IF EXISTS `dadosgrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dadosgrupo`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`gu`.`gu_id` AS `gu_id`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_admin_id` AS `gu_user_admin_id`,`gu`.`gu_subusers_admin_id` AS `gu_subusers_admin_id`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`gu`.`gu_date` AS `gu_date` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `grupocategorias`
--
DROP TABLE IF EXISTS `grupocategorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grupocategorias`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private` from (`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupos`
--
DROP TABLE IF EXISTS `usuariogrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupos`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`gu`.`gu_id` AS `gu_id`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_admin_id` AS `gu_user_admin_id`,`gu`.`gu_subusers_admin_id` AS `gu_subusers_admin_id`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`gu`.`gu_date` AS `gu_date`,`u`.`us_id` AS `us_id`,`u`.`us_email` AS `us_email`,`u`.`us_nome` AS `us_nome`,`u`.`us_tipo_pessoa` AS `us_tipo_pessoa`,`u`.`us_senha` AS `us_senha`,`u`.`us_foto` AS `us_foto`,`u`.`us_status_conta` AS `us_status_conta`,`u`.`us_data_compra` AS `us_data_compra`,`u`.`us_data_expiracao` AS `us_data_expiracao`,`u`.`us_cpf_cnpj` AS `us_cpf_cnpj`,`u`.`us_dataCadastro` AS `us_dataCadastro` from (((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) join `usuario` `u` on(`gu`.`gu_user_id` = `u`.`us_id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
