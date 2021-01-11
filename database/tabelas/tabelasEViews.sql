-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 23-Ago-2020 às 02:21
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
-- Banco de dados: `onclickup`
--

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
-- Estrutura da tabela `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `cand_id` int(11) NOT NULL AUTO_INCREMENT,
  `cand_nome` varchar(30) NOT NULL,
  `cand_img` int(11) NOT NULL,
  `cand_dataDenasci` datetime DEFAULT NULL,
  `cand_cpf` int(15) NOT NULL,
  `cand_contato` int(15) NOT NULL,
  `canduser_id` int(11) NOT NULL,
  `candestc_id` int(11) NOT NULL,
  PRIMARY KEY (`cand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`cand_id`, `cand_nome`, `cand_img`, `cand_dataDenasci`, `cand_cpf`, `cand_contato`, `canduser_id`, `candestc_id`) VALUES
(1, 'Renato Santos', 0, '0000-00-00 00:00:00', 2147483647, 2147483647, 5, 1);

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
-- Estrutura da tabela `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_razaosocial` varchar(50) DEFAULT NULL,
  `emp_cnpj` varchar(50) NOT NULL,
  `emp_nomeresponsavel` varchar(50) DEFAULT NULL,
  `emp_nomefantasia` varchar(50) DEFAULT NULL,
  `emp_descri` varchar(20) DEFAULT NULL,
  `emp_img` int(11) DEFAULT NULL,
  `emp_contato` varchar(50) DEFAULT NULL,
  `emp_datafundacao` datetime DEFAULT NULL,
  `empuser_id` int(11) NOT NULL,
  `emp_plano_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`emp_id`, `emp_razaosocial`, `emp_cnpj`, `emp_nomeresponsavel`, `emp_nomefantasia`, `emp_descri`, `emp_img`, `emp_contato`, `emp_datafundacao`, `empuser_id`, `emp_plano_id`) VALUES
(1, 'intermediação de negocios', '00378257000181', 'Renato Santos', 'renato empresa', NULL, NULL, NULL, '2020-10-10 00:00:00', 1, 0),
(2, 'intermediação de negocios', '00378257000182', 'Mark zunke', 'Facebook', NULL, NULL, NULL, '2004-10-10 00:00:00', 2, 0),
(3, 'intermediação de negocios', '00378257000183', 'bill gates', 'microsoft', NULL, NULL, NULL, '1978-10-10 00:00:00', 3, 0),
(4, 'intermediação de negocios', '00378257000184', 'Jeff bezons', 'Amazon', NULL, NULL, NULL, '2000-10-10 00:00:00', 4, 0);

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
  `ender_cep` int(11) NOT NULL,
  PRIMARY KEY (`ender_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`ender_id`, `ender_numero`, `ender_logradouro`, `ender_bairro`, `ender_cidade`, `enderest_id`, `ender_comple`, `ender_cep`) VALUES
(1, 'null', 'null', 'null', 'São paulo', 26, '', 0),
(2, 'null', 'palo alto', 'palo alto', 'los angeles', 1, '', 0),
(3, 'null', 'av paulista', 'Jardins', 'São paulo', 18, '', 0),
(4, 'null', 'av paulista', 'Jardins', 'São paulo', 22, '', 0),
(5, 'null', 'av paulista', 'Jardins', 'São paulo', 20, '', 0),
(6, '134', 'Rua Kitaro Ywasa 108 casa 1', 'Jardins', 'Mauá', 13, 'casa 1', 0),
(7, 'null', 'av paulista', 'Jardins', 'São paulo', 19, '', 0),
(8, '108', 'Rua kitaro ywasa', 'Vila nova maua', 'Mauá', 5, 'casa 1', 0),
(9, 'null', '', '', '', 1, NULL, 0),
(10, 'null', 'AV paulista', 'jardins', 'São paulo', 26, NULL, 0),
(11, 'null', '', '', 'Vila nova maua', 26, NULL, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

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
(52, NULL, 'Meu nome é renato vieira');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`pedi_id`, `pedi_registro`, `status_number_id`, `pedi_valortotal`, `pedi_description`, `statuspe_id`, `pedi_serv_id`, `cliente_user_id`, `status_pay_id`, `pedi_prestador_user_id`) VALUES
(1, '2025-05-20', 1, '305.00', 'yyyyyyyyyyyyyyyyyyyyy\r\n\r\n                                  ', 2, 1, 4, 2, 3),
(2, '2006-06-20', 1, '20.00', '\r\npedido feito pelo candidato Renato será feito por uma empresa\r\n                                  ', 2, 3, 5, 2, 4),
(3, '2007-06-20', 1, '305.00', '\r\nServico contratado por um candidato Renato \r\n                                  ', 2, 1, 5, 2, 3);

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
-- Estrutura da tabela `pedido_mensagem_dados_link`
--

DROP TABLE IF EXISTS `pedido_mensagem_dados_link`;
CREATE TABLE IF NOT EXISTS `pedido_mensagem_dados_link` (
  `pmdl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pmdl_cliente_foto` varchar(200) NOT NULL,
  `pmdl_cliente_nome` varchar(50) NOT NULL,
  `pmdl_prestador_foto` varchar(200) NOT NULL,
  `pmdl_prestador_nome` varchar(50) NOT NULL,
  PRIMARY KEY (`pmdl_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_mensagem_dados_link`
--

INSERT INTO `pedido_mensagem_dados_link` (`pmdl_id`, `pmdl_cliente_foto`, `pmdl_cliente_nome`, `pmdl_prestador_foto`, `pmdl_prestador_nome`) VALUES
(1, '', 'Amazon', '', 'microsoft'),
(2, '', 'Amazon', '', 'microsoft'),
(3, '', 'Renato santos', '', 'Amazon'),
(12, '', 'Renato santos', '', 'microsoft');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido_mensagem_link`
--

INSERT INTO `pedido_mensagem_link` (`pml_id`, `pml_user_remetente_id`, `pml_user_destinatario_id`, `pml_pedi_id`, `pml_msn_id`, `pml_view`, `pml_date`, `pml_pmdl_id`) VALUES
(1, 4, 3, 1, 22, 0, '2020-05-25 18:51:52', 2),
(2, 5, 4, 2, 3, 0, '2020-06-06 20:25:12', 3),
(3, 1, 4, 2, 4, 0, '2020-06-06 20:25:25', 4),
(9, 5, 4, 2, 10, 0, '2020-06-06 20:50:55', 10),
(10, 5, 4, 2, 11, 0, '2020-06-06 20:55:02', 11),
(11, 5, 3, 3, 12, 0, '2020-06-06 21:16:18', 12),
(12, 5, 3, 3, 27, 0, '2020-06-14 18:54:37', 12),
(13, 5, 3, 3, 27, 0, '2020-06-14 19:06:13', 12),
(14, 5, 3, 3, 27, 0, '2020-06-14 19:07:28', 12),
(15, 5, 3, 3, 16, 0, '2020-06-14 19:12:30', 12),
(16, 5, 3, 3, 16, 0, '2020-06-14 19:12:42', 12),
(17, 5, 3, 3, 16, 0, '2020-06-14 19:13:31', 12),
(18, 5, 3, 3, 28, 0, '2020-06-14 19:14:55', 12),
(19, 5, 3, 3, 29, 0, '2020-06-14 19:14:59', 12),
(20, 5, 3, 3, 30, 0, '2020-06-14 19:15:04', 12),
(21, 3, 5, 3, 31, 0, '2020-06-14 19:47:27', 12),
(22, 3, 5, 3, 32, 0, '2020-06-14 20:02:34', 12),
(23, 5, 3, 3, 33, 0, '2020-06-14 20:03:28', 12);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido_prestador`
--

INSERT INTO `pedido_prestador` (`pretador_pedidos_id`, `prestador_pedi_id`, `prestador_user_id`, `prestador_acc_id`, `prestador_date`) VALUES
(1, 1, 3, 2, '2025-05-20'),
(2, 1, 3, 2, '2025-05-20'),
(3, 2, 4, 2, '2006-06-20'),
(4, 3, 3, 2, '2007-06-20');

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
(2, 'PLANO PREMIUM SEMESTRAL'),
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`post_id`, `post_titulo`, `post_subtitulo`, `post_description`, `postcat_id`, `tipo_post_id`, `userpost_id`, `post_ender_id`) VALUES
(1, 'Pacote Office ', 'word, excel, power point e acess', 'pacote de microsoft azure incluso e office', 18, 2, 3, 4),
(2, 'Publicidade', 'Adsense em nossa rede social ', 'adsense em nossa rde', 13, 2, 2, 5),
(3, 'Entrega via amazon', 'Entrega para qualquer lugar do brasil ', 'entrega para qualquer lugar', 10, 2, 4, 7),
(5, 'atendente', 'Atividades', 'des cricão da vagddddddddddddddddd', 1, 1, 3, 10),
(6, 'Atendente Callcenter', 'Atividades vaga', 'beneficio e vantagem do funcionario', 19, 1, 4, 11);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `prova`
--

INSERT INTO `prova` (`pro_id`, `pro_nome`, `tipro_id`, `proemp_id`) VALUES
(1, 'Matemtica', 1, 4);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`serv_id`, `serv_preRequisitos`, `serv_beneficios`, `serv_prazo`, `serv_valor`, `serv_arquivo1`, `serv_arquivo2`, `serv_arquivo3`, `statusServ_id`, `postserv_id`) VALUES
(1, 'ser windons', 'microsoft organização ', 2, '305', '1586720024', '1586720024', '1586720024', 1, 1),
(2, 'banner pronto p ou vide o pronto', 'alavanque suas vendas', 500, '50 ', '1586720667', '1586720667', '1586720667', 1, 2),
(3, 'ter o pacote já embalado e o dinheiro em mãos', 'enrtega rapidae simplificada', 5, '20', '1586721035', '1586721035', '1586721035', 1, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`user_id`, `user_status`, `user_nome`, `user_email`, `user_img`, `user_senha`, `user_dataCadastro`, `tiuser_id`, `user_ender_id`, `user_primary`, `user_preferences_id`) VALUES
(1, '1', 'onclickup', 'onclickup@gmail.com', '', '$2y$12$xsVfdhKV3CkPzyO4ltsi7ePJ8wY/yB5WBsAYWLxpERf1zsw6dZ/cO', '2012-04-20 00:00:00', 2, 1, 0, 1),
(2, '1', 'Facebook', 'facebook@gmail.com', '', '$2y$12$vCT2Hi8oIOefnvv1qlZlueXWMoajkaJtmEiC0a/dCyh6gBw4kKKPi', '2012-04-20 00:00:00', 2, 2, 0, 1),
(3, '1', 'microsoft', 'microsoft@gmail.com', '', '$2y$12$0K.vyXpgyuezWe5sBoz.gOKBT1R9ZmT4JCC42JPHq6I1N..M0T1C2', '2012-04-20 00:00:00', 2, 3, 0, 1),
(4, '1', 'Amazon', 'amazon@gmail.com', '', '$2y$12$/ufhK.BwYc/WqfMBucfQxOBgtaX26FIT/Y2RbTyiq409QtGuXIgPG', '2012-04-20 00:00:00', 2, 6, 0, 1),
(5, '1', 'Renato santos', 'nato.re.vieira@gmail.com', 'null', '$2y$12$OVwiRKEpQpsKvOGVA0/MruML0N28XCx/vTU00vhQoHzRga2WEjseW', '2013-04-20 00:00:00', 1, 8, 0, 1),
(10, '1', 'amazon2', 'amazon2@gmail.com', NULL, '$2y$12$vtseeau5gienvP6HoCYzjOEz083C0/uev3jOZL8lWpHhm0qLaEHhq', '2025-06-20 00:00:00', 5, 6, 4, 2);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `usuarios_seguidores`
--

INSERT INTO `usuarios_seguidores` (`us_id`, `us_usuario_id`, `us_usuario_nome`, `us_seguindo_id_usuario`, `us_data_registro`) VALUES
(2, 2, 'Facebook', 1, '2020-04-12 16:14:55'),
(3, 3, 'microsoft', 1, '2020-04-12 16:32:08'),
(4, 4, 'Amazon', 1, '2020-04-12 16:49:02'),
(5, 4, 'Amazon', 3, '2020-04-12 20:26:44'),
(6, 4, 'Amazon', 2, '2020-04-13 00:15:43'),
(7, 3, 'microsoft', 2, '2020-04-13 00:24:32'),
(8, 5, 'Renato Santos', 1, '2020-04-13 01:30:56'),
(9, 5, 'Renato Santos', 3, '2020-04-13 01:35:06'),
(10, 4, 'Amazon', 5, '2020-06-06 19:20:31'),
(11, 5, 'Renato Santos', 4, '2020-06-06 19:50:24'),
(12, 10, 'Amazon', 1, '2020-06-25 01:57:36'),
(13, 11, 'Amazon', 1, '2020-06-26 21:30:04'),
(14, 12, 'Amazon', 1, '2020-06-26 21:30:35'),
(15, 10, 'Amazon', 1, '2020-06-26 21:42:23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_empresa_link`
--

DROP TABLE IF EXISTS `usuario_empresa_link`;
CREATE TABLE IF NOT EXISTS `usuario_empresa_link` (
  `user_id_link` int(11) NOT NULL,
  `emp_id_link` int(11) NOT NULL,
  `user_conta` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario_empresa_link`
--

INSERT INTO `usuario_empresa_link` (`user_id_link`, `emp_id_link`, `user_conta`) VALUES
(1, 1, '0'),
(2, 2, '0'),
(3, 3, '0'),
(4, 4, '0'),
(5, 5, '0'),
(4, 6, '0'),
(4, 7, '0'),
(4, 8, '0'),
(4, 9, '0'),
(10, 4, '0'),
(11, 4, '0'),
(12, 4, '0'),
(10, 4, '0');

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
(1, '		pre requisitos						 ', 'beneficiosn', '15161', 5, 1, 5, 2, 3),
(2, 'pre requsiitos da vaga								 ', 'beneficos', '1500', 4, 1, 6, 2, 8);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vaga_contactar_candidato`
--

INSERT INTO `vaga_contactar_candidato` (`vcc_id`, `vcc_vaga_id`, `vcc_cand_usuario_id`, `vcc_emp_nome`, `vcc_emp_msn`, `vcc_emp_usuario_id`) VALUES
(1, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(2, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(3, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(4, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(5, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(6, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(7, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(8, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(9, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(10, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4),
(11, 2, 5, 'Amazon', '                                    \r\n                     sssssssssssss           ', 4);

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vaga_mensagem_dados_link`
--

INSERT INTO `vaga_mensagem_dados_link` (`vmdl_idd`, `vmdl_empresa_img`, `vmdl_empresa_nome`, `vmdl_cand_nome`, `vmdl_cand_img`) VALUES
(1, '', 'Amazon', 'Renato santos', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vaga_mensagem_link`
--

INSERT INTO `vaga_mensagem_link` (`vml_id`, `vml_user_remetente_id`, `vml_user_destinatario_id`, `vml_vaga_id`, `vml_msn_id`, `vml_view`, `vml_date`, `vmdl_id`) VALUES
(1, 4, 5, 2, 2, 0, '2020-06-07 15:43:50', 1),
(2, 4, 5, 2, 38, 0, '2020-06-14 22:42:30', 1),
(3, 4, 5, 2, 39, 0, '2020-06-14 22:57:42', 1),
(4, 4, 5, 2, 40, 0, '2020-06-14 22:57:49', 1),
(5, 4, 5, 2, 41, 0, '2020-06-14 22:57:52', 1),
(6, 4, 5, 2, 42, 0, '2020-06-14 22:58:10', 1),
(7, 4, 5, 2, 43, 0, '2020-06-14 22:58:23', 1),
(8, 5, 4, 2, 49, 0, '2020-06-14 23:06:13', 1),
(9, 5, 4, 2, 50, 0, '2020-06-14 23:06:23', 1),
(10, 5, 4, 2, 51, 0, '2020-06-14 23:06:42', 1);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
