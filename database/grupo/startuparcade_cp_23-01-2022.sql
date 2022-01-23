-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23-Jan-2022 às 03:48
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

INSERT INTO `adm` VALUES
(1, 'Renato Vieira', 'nato.re.vieira@gmail.com', '$2y$12$6LnTXgn3kZAaxmbK62b96OfhqSiiGWeag47TDYioBmL6OGfrTdjZ.', 1, 1);

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
  `blogpais_id` int(11) NOT NULL,
  PRIMARY KEY (`blogcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_categoria`
--

INSERT INTO `blog_categoria` VALUES
(1, 'Planejamento', 1),
(2, 'Administração', 1),
(3, 'Dicas & ferramentas', 1),
(4, 'Negocios', 1),
(5, 'Management', 2),
(6, 'Planning', 2),
(7, 'Good habits & tools', 2),
(8, 'Business', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog_destaque`
--

DROP TABLE IF EXISTS `blog_destaque`;
CREATE TABLE IF NOT EXISTS `blog_destaque` (
  `blogdest_id` int(11) NOT NULL AUTO_INCREMENT,
  `blogdest_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`blogdest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `blog_destaque`
--

INSERT INTO `blog_destaque` VALUES
(1, 'No page blog'),
(2, 'Em destaque blog '),
(3, 'blog no index'),
(4, 'No learning');

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `blog_post_categoria`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `blog_post_categoria`;
CREATE TABLE IF NOT EXISTS `blog_post_categoria` (
`post_id` int(11)
,`post_titulo` varchar(255)
,`post_subtitulo` varchar(255)
,`post_description` text
,`postcat_id` int(11)
,`tipo_post_id` int(11)
,`userpost_id` int(11)
,`post_paisid` int(11)
,`blog_id` int(11)
,`blogdestaque_id` int(11)
,`blog_text` text
,`blog_date` date
,`blog_img` varchar(255)
,`blog_categoria_id` int(11)
,`blogpost_id` int(11)
,`blogcat_id` int(11)
,`blogcat_nome` varchar(50)
,`blogpais_id` int(11)
,`blogdest_id` int(11)
,`blogdest_nome` varchar(50)
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

INSERT INTO `categoria_grupo` VALUES
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

INSERT INTO `categoria_publicidade` VALUES
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
-- Estrutura da tabela `conversaprivate`
--

DROP TABLE IF EXISTS `conversaprivate`;
CREATE TABLE IF NOT EXISTS `conversaprivate` (
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
,`pn_id` int(11)
,`pn_compreensao_de_mercado` varchar(255)
,`pn_acompanhamento` varchar(255)
,`pn_estrategias_de_venda` varchar(255)
,`pn_projecao_financeira` varchar(255)
,`pn_captacao_fundos_investimento` varchar(255)
,`pn_grupo_id` int(11)
,`pn_publico_alvo` varchar(255)
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

INSERT INTO `duvidas` VALUES
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

INSERT INTO `duvidas_categoria` VALUES
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

INSERT INTO `estado` VALUES
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

INSERT INTO `grupo` VALUES
(1, 'atartup user1 ', 'Descriçao do plano de negocio', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1),
(2, 'statup 2 user1', 'Descriçao ', 'cidade', 'SP', 'starstup-logo.PNG', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupoadmin`
--

DROP TABLE IF EXISTS `grupoadmin`;
CREATE TABLE IF NOT EXISTS `grupoadmin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_user_id` int(11) NOT NULL,
  `adm_sub_user_id` int(11) DEFAULT NULL,
  `adm_grupo_id` int(11) NOT NULL,
  `adm_flag` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupoadmin`
--

INSERT INTO `grupoadmin` VALUES
(1, 3, 3, 1, 1),
(2, 3, 3, 2, 1),
(3, 3, 2, 1, 0),
(4, 3, 1, 1, 0),
(5, 3, 2, 2, 0);

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
,`gr_pais` int(11)
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo_mensagem_link`
--

INSERT INTO `grupo_mensagem_link` VALUES
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

INSERT INTO `grupo_usuario` VALUES
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

INSERT INTO `mensagem` VALUES
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

INSERT INTO `mensagem_dados_link` VALUES
(1, 'usuario 1', 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano_de_negocios`
--

DROP TABLE IF EXISTS `plano_de_negocios`;
CREATE TABLE IF NOT EXISTS `plano_de_negocios` (
  `pn_id` int(11) NOT NULL AUTO_INCREMENT,
  `pn_compreensao_de_mercado` varchar(255) DEFAULT NULL,
  `pn_acompanhamento` varchar(255) DEFAULT NULL,
  `pn_estrategias_de_venda` varchar(255) DEFAULT NULL,
  `pn_projecao_financeira` varchar(255) DEFAULT NULL,
  `pn_captacao_fundos_investimento` varchar(255) DEFAULT NULL,
  `pn_grupo_id` int(11) NOT NULL,
  `pn_publico_alvo` varchar(255) NOT NULL,
  PRIMARY KEY (`pn_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `plano_de_negocios`
--

INSERT INTO `plano_de_negocios` VALUES
(1, 'sss', 'ssssssssssss', 'sssssssss', 'ssssssssss', 'ssssssssssss', 1, 'ssss');

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
  `postcat_id` int(11) DEFAULT NULL,
  `tipo_post_id` int(11) NOT NULL,
  `userpost_id` int(11) NOT NULL,
  `post_paisid` int(11) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

INSERT INTO `privado_mensagem_link` VALUES
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
,`gr_id` int(11)
,`gr_nome` varchar(50)
,`gr_descricao` varchar(255)
,`gr_cidade` varchar(50)
,`gr_estado` varchar(50)
,`gr_pais` int(11)
,`gr_foto` varchar(255)
,`grcat_id` int(11)
,`gr_private` int(11)
,`pn_id` int(11)
,`pn_compreensao_de_mercado` varchar(255)
,`pn_acompanhamento` varchar(255)
,`pn_estrategias_de_venda` varchar(255)
,`pn_projecao_financeira` varchar(255)
,`pn_captacao_fundos_investimento` varchar(255)
,`pn_grupo_id` int(11)
,`pn_publico_alvo` varchar(255)
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
  PRIMARY KEY (`pu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `publicidade`
--

INSERT INTO `publicidade` VALUES
(1, 'All In One Positivo Union C464A-21', 'https://www.amazon.com.br/dp/B07ZRXHT37?&linkCode=li2&tag=08261096-20&linkId=a17c42c50d41484ab1322a69fc933553&language=pt_BR&ref_=as_li_ss_il', 1, 1, 'Por: R$2.319,10', 'Em até 10x R$ 231,91 sem juros', '//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B07ZRXHT37&Format=_SL160_&ID=AsinImage&MarketPlace=BR&ServiceVersion=20070822&WS=1&tag=08261096-20&language=pt_BR');

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

INSERT INTO `termos` VALUES
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

INSERT INTO `usuario` VALUES
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `blog_post_categoria`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_paisid` AS `post_paisid`,`b`.`blog_id` AS `blog_id`,`b`.`blogdestaque_id` AS `blogdestaque_id`,`b`.`blog_text` AS `blog_text`,`b`.`blog_date` AS `blog_date`,`b`.`blog_img` AS `blog_img`,`b`.`blog_categoria_id` AS `blog_categoria_id`,`b`.`blogpost_id` AS `blogpost_id`,`cat`.`blogcat_id` AS `blogcat_id`,`cat`.`blogcat_nome` AS `blogcat_nome`,`cat`.`blogpais_id` AS `blogpais_id`,`bd`.`blogdest_id` AS `blogdest_id`,`bd`.`blogdest_nome` AS `blogdest_nome` from (((`post` `p` join `blog` `b` on(`p`.`post_id` = `b`.`blogpost_id`)) join `blog_categoria` `cat` on(`b`.`blog_categoria_id` = `cat`.`blogcat_id`)) join `blog_destaque` `bd` on(`b`.`blogdestaque_id` = `bd`.`blogdest_id`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dadosgrupo`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag`,`pn`.`pn_id` AS `pn_id`,`pn`.`pn_compreensao_de_mercado` AS `pn_compreensao_de_mercado`,`pn`.`pn_acompanhamento` AS `pn_acompanhamento`,`pn`.`pn_estrategias_de_venda` AS `pn_estrategias_de_venda`,`pn`.`pn_projecao_financeira` AS `pn_projecao_financeira`,`pn`.`pn_captacao_fundos_investimento` AS `pn_captacao_fundos_investimento`,`pn`.`pn_grupo_id` AS `pn_grupo_id`,`pn`.`pn_publico_alvo` AS `pn_publico_alvo` from (((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupoadmin` `ga` on(`ga`.`adm_grupo_id` = `g`.`gr_id`)) left join `plano_de_negocios` `pn` on(`pn`.`pn_grupo_id` = `g`.`gr_id`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `exploregrupos`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`gu`.`gu_id` AS `gu_id`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_admin_id` AS `gu_user_admin_id`,`gu`.`gu_subusers_admin_id` AS `gu_subusers_admin_id`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`gu`.`gu_date` AS `gu_date` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) left join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `grupocategorias`
--
DROP TABLE IF EXISTS `grupocategorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `grupocategorias`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private` from (`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `propostagrupo`
--
DROP TABLE IF EXISTS `propostagrupo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `propostagrupo`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_pais` AS `gr_pais`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`pn`.`pn_id` AS `pn_id`,`pn`.`pn_compreensao_de_mercado` AS `pn_compreensao_de_mercado`,`pn`.`pn_acompanhamento` AS `pn_acompanhamento`,`pn`.`pn_estrategias_de_venda` AS `pn_estrategias_de_venda`,`pn`.`pn_projecao_financeira` AS `pn_projecao_financeira`,`pn`.`pn_captacao_fundos_investimento` AS `pn_captacao_fundos_investimento`,`pn`.`pn_grupo_id` AS `pn_grupo_id`,`pn`.`pn_publico_alvo` AS `pn_publico_alvo` from ((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) left join `plano_de_negocios` `pn` on(`g`.`gr_id` = `pn`.`pn_grupo_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupos`
--
DROP TABLE IF EXISTS `usuariogrupos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupos`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`u`.`us_id` AS `us_id`,`u`.`us_email` AS `us_email`,`u`.`us_nome` AS `us_nome`,`u`.`us_tipo_pessoa` AS `us_tipo_pessoa`,`u`.`us_senha` AS `us_senha`,`u`.`us_foto` AS `us_foto`,`u`.`us_status_conta` AS `us_status_conta`,`u`.`us_data_compra` AS `us_data_compra`,`u`.`us_data_expiracao` AS `us_data_expiracao`,`u`.`us_cpf_cnpj` AS `us_cpf_cnpj`,`u`.`us_dataCadastro` AS `us_dataCadastro`,`u`.`us_pais_id` AS `us_pais_id`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag` from ((((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) join `usuario` `u` on(`gu`.`gu_user_id` = `u`.`us_id`)) left join `grupoadmin` `ga` on(`ga`.`adm_sub_user_id` = `u`.`us_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuariogrupospendentes`
--
DROP TABLE IF EXISTS `usuariogrupospendentes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuariogrupospendentes`  AS  select `cg`.`cg_id` AS `cg_id`,`cg`.`cg_nome` AS `cg_nome`,`cg`.`cg_pais_id` AS `cg_pais_id`,`g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gu`.`gu_accept` AS `gu_accept`,`gu`.`gu_user_id` AS `gu_user_id`,`gu`.`gu_grupo_id` AS `gu_grupo_id`,`u`.`us_id` AS `us_id`,`u`.`us_email` AS `us_email`,`u`.`us_nome` AS `us_nome`,`u`.`us_tipo_pessoa` AS `us_tipo_pessoa`,`u`.`us_senha` AS `us_senha`,`u`.`us_foto` AS `us_foto`,`u`.`us_status_conta` AS `us_status_conta`,`u`.`us_data_compra` AS `us_data_compra`,`u`.`us_data_expiracao` AS `us_data_expiracao`,`u`.`us_cpf_cnpj` AS `us_cpf_cnpj`,`u`.`us_dataCadastro` AS `us_dataCadastro`,`u`.`us_pais_id` AS `us_pais_id`,`ga`.`admin_id` AS `admin_id`,`ga`.`adm_user_id` AS `adm_user_id`,`ga`.`adm_sub_user_id` AS `adm_sub_user_id`,`ga`.`adm_grupo_id` AS `adm_grupo_id`,`ga`.`adm_flag` AS `adm_flag` from ((((`categoria_grupo` `cg` join `grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) join `grupo_usuario` `gu` on(`g`.`gr_id` = `gu`.`gu_grupo_id`)) join `usuario` `u` on(`gu`.`gu_user_id` = `u`.`us_id`)) left join `grupoadmin` `ga` on(`ga`.`adm_sub_user_id` = `u`.`us_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_notificantions_mensagem`
--
DROP TABLE IF EXISTS `usuario_notificantions_mensagem`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuario_notificantions_mensagem`  AS  select `g`.`gr_id` AS `gr_id`,`g`.`gr_nome` AS `gr_nome`,`g`.`gr_descricao` AS `gr_descricao`,`g`.`gr_cidade` AS `gr_cidade`,`g`.`gr_estado` AS `gr_estado`,`g`.`gr_foto` AS `gr_foto`,`g`.`grcat_id` AS `grcat_id`,`g`.`gr_private` AS `gr_private`,`g`.`gr_pais` AS `gr_pais`,`gml`.`gml_id` AS `gml_id`,`gml`.`gml_date` AS `gml_date`,`gml`.`gml_grupo_id` AS `gml_grupo_id`,`gml`.`gml_remetente_id` AS `gml_remetente_id`,`gml`.`gml_msn_id` AS `gml_msn_id`,`gml`.`gmdl_id` AS `gmdl_id`,`gml`.`gml_view` AS `gml_view`,`m`.`msn_id` AS `msn_id`,`m`.`msn_nome` AS `msn_nome`,`m`.`msn_date` AS `msn_date`,`m`.`msn_type` AS `msn_type` from ((`grupo` `g` join `grupo_mensagem_link` `gml` on(`g`.`gr_id` = `gml`.`gml_grupo_id`)) join `mensagem` `m` on(`gml`.`gml_msn_id` = `m`.`msn_id`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
