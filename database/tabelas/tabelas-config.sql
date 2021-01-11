

-- --------------------------------------------------------

--
-- Estrutura da tabela `competencia_categoria`
--

CREATE TABLE `competencia_categoria` (
  `compcat_id` int(11) NOT NULL,
  `compcat_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `status_payments` (
  `statuspay_id` int(11) NOT NULL,
  `statuspay` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `status_payments`
--

INSERT INTO `status_payments` (`statuspay_id`, `statuspay`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `status_pedido`
--

CREATE TABLE `status_pedido` (
  `statuspedi_id` int(11) NOT NULL AUTO_INCREMENT PRIMARY key,
  `statuspedi_nome` varchar(50) DEFAULT NULL,
  `statuspedi_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `status_progress` (
  `statusnumber_id` int(11) NOT NULL,
  `statusnumber` varchar(20) NOT NULL
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



CREATE TABLE `status_servico` (
  `statServ_id` int(11) NOT NULL,
  `statusServ_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
INSERT INTO `status_servico` (`statServ_id`, `statusServ_nome`) VALUES
(1, 'desativado'),
(2, 'ativado\r\n                                         ');

-- --

CREATE TABLE `status_solicitacao` (
  `status_soli_id` int(11) NOT NULL,
  `status_soli` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `status_solicitacao` (`status_soli_id`, `status_soli`) VALUES
(1, 'Em aberto'),
(2, 'Pendente'),
(3, 'Concluido');

CREATE TABLE `status_vaga` (
  `statusvag_id` int(11) NOT NULL,
  `statusvag_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `status_vaga` (`statusvag_id`, `statusvag_nome`) VALUES
(1, 'Aberto'),
(2, 'Fechado');


CREATE TABLE `tipo_pedido` (
  `tiped_id` int(11) NOT NULL,
  `tiped_nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `tipo_pedido` (`tiped_id`, `tiped_nome`) VALUES
(1, 'plano'),
(2, 'servico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_post`
--

CREATE TABLE `tipo_post` (
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

CREATE TABLE `tipo_prova` (
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

CREATE TABLE `tipo_user` (
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
(4, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_vaga`
--

CREATE TABLE `tipo_vaga` (
  `tipovaga_id` int(11) NOT NULL,
  `tipovaga_nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
