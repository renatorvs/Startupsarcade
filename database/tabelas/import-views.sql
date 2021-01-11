
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
candidato_solicitacoes

-- --------------------------------------------------------
--
-- Estrutura da tabela `escolaridade`
--
--
-- Estrutura para vista `blog_post_categoria`
--
DROP VIEW IF EXISTS `blog_post_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `blog_post_categoria`  AS  select `b`.`blog_id` AS `blog_id`,`b`.`blogdestaque_id` AS `blogdestaque_id`,`b`.`blog_text` AS `blog_text`,`b`.`blog_date` AS `blog_date`,`b`.`blog_img` AS `blog_img`,`b`.`blog_categoria_id` AS `blog_categoria_id`,`b`.`blogpost_id` AS `blogpost_id`,`cat`.`blogcat_id` AS `blogcat_id`,`cat`.`blogcat_nome` AS `blogcat_nome`,`bd`.`blogdest_id` AS `blogdest_id`,`bd`.`blogdest_nome` AS `blogdest_nome` from ((`blog` `b` join `blog_categoria` `cat` on(`b`.`blog_categoria_id` = `cat`.`blogcat_id`)) join `blog_destaque` `bd` on(`b`.`blogdestaque_id` = `bd`.`blogdest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_conta`
--
DROP VIEW IF EXISTS `candidato_conta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_conta`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`cont`.`cont_id` AS `cont_id`,`cont`.`cont_agencia` AS `cont_agencia`,`cont`.`cont_conta` AS `cont_conta`,`cont`.`cont_titular` AS `cont_titular`,`cont`.`cont_digito` AS `cont_digito`,`cont`.`cont_user_id` AS `cont_user_id`,`cont`.`cont_bank_id` AS `cont_bank_id`,`cb`.`bank_id` AS `bank_id`,`cb`.`bank_nome` AS `bank_nome` from (((`candidato` `cand` join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `conta_bancaria` `cont` on(`cont`.`cont_user_id` = `user`.`user_id`)) join `conta_bancos` `cb` on(`cb`.`bank_id` = `cont`.`cont_bank_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_dados`
--
DROP VIEW IF EXISTS `candidato_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_dados`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id`,`fe`.`fic_id` AS `fic_id`,`fe`.`fic_empresa` AS `fic_empresa`,`fe`.`fic_cargo` AS `fic_cargo`,`fe`.`fic_carteiraregistro` AS `fic_carteiraregistro`,`fe`.`fic_salario` AS `fic_salario`,`fe`.`fic_dataentrada` AS `fic_dataentrada`,`fe`.`fic_datasaida` AS `fic_datasaida`,`fe`.`fic_motivoSaida` AS `fic_motivoSaida`,`fe`.`candidato_id` AS `candidato_id` from ((((`usuario` `u` join `candidato` `c` on(`c`.`canduser_id` = `u`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `u`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) left join `fichaexperiecia` `fe` on(`c`.`cand_id` = `fe`.`candidato_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_detalhe_vaga`
--
DROP VIEW IF EXISTS `candidato_detalhe_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_detalhe_vaga`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`us`.`user_id` AS `user_id`,`us`.`user_status` AS `user_status`,`us`.`user_nome` AS `user_nome`,`us`.`user_email` AS `user_email`,`us`.`user_img` AS `user_img`,`us`.`user_senha` AS `user_senha`,`us`.`user_dataCadastro` AS `user_dataCadastro`,`us`.`tiuser_id` AS `tiuser_id`,`us`.`user_ender_id` AS `user_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id` from ((((((((`vaga` `v` join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `usuario` `us` on(`p`.`userpost_id` = `us`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) join `empresa` `emp` on(`emp`.`empuser_id` = `us`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_estadocivil`
--
DROP VIEW IF EXISTS `candidato_estadocivil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_estadocivil`  AS  select `candc`.`cand_id` AS `cand_id`,`candc`.`cand_nome` AS `cand_nome`,`candc`.`cand_img` AS `cand_img`,`candc`.`cand_dataDenasci` AS `cand_dataDenasci`,`candc`.`cand_cpf` AS `cand_cpf`,`candc`.`cand_contato` AS `cand_contato`,`candc`.`canduser_id` AS `canduser_id`,`candc`.`candestc_id` AS `candestc_id`,`estc`.`estc_id` AS `estc_id`,`estc`.`estc_nome` AS `estc_nome` from (`candidato` `candc` join `estado_civil` `estc` on(`candc`.`candestc_id` = `estc`.`estc_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_explore`
--
DROP VIEW IF EXISTS `candidato_explore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_explore`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`us`.`user_id` AS `user_id`,`us`.`user_status` AS `user_status`,`us`.`user_nome` AS `user_nome`,`us`.`user_email` AS `user_email`,`us`.`user_img` AS `user_img`,`us`.`user_senha` AS `user_senha`,`us`.`user_dataCadastro` AS `user_dataCadastro`,`us`.`tiuser_id` AS `tiuser_id`,`us`.`user_ender_id` AS `user_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from (((((((`vaga` `v` join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `usuario` `us` on(`p`.`userpost_id` = `us`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_pedidos`
--
DROP VIEW IF EXISTS `candidato_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_pedidos`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`pedi`.`pedi_id` AS `pedi_id`,`pedi`.`pedi_registro` AS `pedi_registro`,`pedi`.`status_number_id` AS `status_number_id`,`pedi`.`pedi_valortotal` AS `pedi_valortotal`,`pedi`.`pedi_description` AS `pedi_description`,`pedi`.`statuspe_id` AS `statuspe_id`,`pedi`.`pedi_serv_id` AS `pedi_serv_id`,`pedi`.`cliente_user_id` AS `cliente_user_id`,`pedi`.`status_pay_id` AS `status_pay_id`,`pedi`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from (((((`candidato` `cand` join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `pedido` `pedi` on(`pedi`.`cliente_user_id` = `user`.`user_id`)) join `servico` `serv` on(`pedi`.`pedi_serv_id` = `serv`.`serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pedi`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_prova_resposta`
--
DROP VIEW IF EXISTS `candidato_prova_resposta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_prova_resposta`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pr`.`pro_id` AS `pro_id`,`pr`.`pro_nome` AS `pro_nome`,`pr`.`tipro_id` AS `tipro_id`,`pr`.`proemp_id` AS `proemp_id`,`q`.`quest_id` AS `quest_id`,`q`.`quest_pergunta` AS `quest_pergunta`,`q`.`quest_a` AS `quest_a`,`q`.`quest_b` AS `quest_b`,`q`.`quest_c` AS `quest_c`,`q`.`quest_d` AS `quest_d`,`q`.`quest_e` AS `quest_e`,`q`.`questpro_id` AS `questpro_id`,`q`.`quest_official` AS `quest_official`,`resp`.`resp_id` AS `resp_id`,`resp`.`resp_candidado` AS `resp_candidado`,`resp`.`respquest_id` AS `respquest_id`,`resp`.`respcand_id` AS `respcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id` from (((((`vaga` `v` join `vaga_prova_link` `vpl` on(`v`.`vag_id` = `vpl`.`linkvag_id`)) join `prova` `pr` on(`vpl`.`linkpro_id` = `pr`.`pro_id`)) join `questionario` `q` on(`pr`.`pro_id` = `q`.`questpro_id`)) left join `resposta` `resp` on(`q`.`quest_id` = `resp`.`respquest_id`)) left join `candidato` `cand` on(`cand`.`cand_id` = `resp`.`respcand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_quiz_resposta`
--
DROP VIEW IF EXISTS `candidato_quiz_resposta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_quiz_resposta`  AS  select `v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pr`.`pro_id` AS `pro_id`,`pr`.`pro_nome` AS `pro_nome`,`pr`.`tipro_id` AS `tipro_id`,`pr`.`proemp_id` AS `proemp_id`,`q`.`quiz_id` AS `quiz_id`,`q`.`quiz_pergunta` AS `quiz_pergunta`,`q`.`quizpro_id` AS `quizpro_id`,`q`.`quizuser_id` AS `quizuser_id`,`respquiz`.`requiz_id` AS `requiz_id`,`respquiz`.`requiz_candidado` AS `requiz_candidado`,`respquiz`.`requizcand_id` AS `requizcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id` from (((((`vaga` `v` join `vaga_prova_link` `vpl` on(`v`.`vag_id` = `vpl`.`linkvag_id`)) join `prova` `pr` on(`vpl`.`linkpro_id` = `pr`.`pro_id`)) join `quiz` `q` on(`pr`.`pro_id` = `q`.`quizpro_id`)) left join `resposta_quiz` `respquiz` on(`q`.`quiz_id` = `respquiz`.`requiz_id`)) left join `candidato` `cand` on(`cand`.`cand_id` = `respquiz`.`requizcand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `candidato_servico`
--
DROP VIEW IF EXISTS `candidato_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `candidato_servico`  AS  select `c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from (((((((`candidato` `c` join `usuario` `u` on(`c`.`canduser_id` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencias_categorias`
--
DROP VIEW IF EXISTS `competencias_categorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `competencias_categorias`  AS  select `c`.`comp_id` AS `comp_id`,`c`.`comp_nome` AS `comp_nome`,`c`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (`competencias` `c` join `competencia_categoria` `cc` on(`c`.`compcate_id` = `cc`.`compcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencia_candidato`
--
DROP VIEW IF EXISTS `competencia_candidato`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `competencia_candidato`  AS  select `cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`ccl`.`compelinkcand_id` AS `compelinkcand_id`,`ccl`.`compecand_id` AS `compecand_id`,`ccl`.`candcompe_id` AS `candcompe_id`,`comp`.`comp_id` AS `comp_id`,`comp`.`comp_nome` AS `comp_nome`,`comp`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (((`candidato` `cand` join `competencia_candidato_link` `ccl` on(`cand`.`cand_id` = `ccl`.`compecand_id`)) join `competencias` `comp` on(`comp`.`comp_id` = `ccl`.`candcompe_id`)) join `competencia_categoria` `cc` on(`cc`.`compcat_id` = `comp`.`compcate_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `competencia_vagas`
--
DROP VIEW IF EXISTS `competencia_vagas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `competencia_vagas`  AS  select `vag`.`vag_id` AS `vag_id`,`vag`.`vag_preRequisitos` AS `vag_preRequisitos`,`vag`.`vag_beneficios` AS `vag_beneficios`,`vag`.`vag_salario` AS `vag_salario`,`vag`.`vag_quantidade` AS `vag_quantidade`,`vag`.`vagstatus_id` AS `vagstatus_id`,`vag`.`postvaga_id` AS `postvaga_id`,`vag`.`tivaga_id` AS `tivaga_id`,`vag`.`vagesco_id` AS `vagesco_id`,`cvl`.`complinkvag_id` AS `complinkvag_id`,`cvl`.`linkcomp_id` AS `linkcomp_id`,`cvl`.`linkvag_id` AS `linkvag_id`,`comp`.`comp_id` AS `comp_id`,`comp`.`comp_nome` AS `comp_nome`,`comp`.`compcate_id` AS `compcate_id`,`cc`.`compcat_id` AS `compcat_id`,`cc`.`compcat_nome` AS `compcat_nome` from (((`vaga` `vag` join `competencia_vaga_link` `cvl` on(`vag`.`vag_id` = `cvl`.`linkvag_id`)) join `competencias` `comp` on(`comp`.`comp_id` = `cvl`.`linkcomp_id`)) join `competencia_categoria` `cc` on(`cc`.`compcat_id` = `comp`.`compcate_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dados_usuario_post`
--
DROP VIEW IF EXISTS `dados_usuario_post`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `dados_usuario_post`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id` from (((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `usuario` `user` on(`p`.`userpost_id` = `user`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `dados_usuario_shere`
--
DROP VIEW IF EXISTS `dados_usuario_shere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `dados_usuario_shere`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id` from ((((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `shere` `sh` on(`sh`.`shere_post_id` = `p`.`post_id`)) join `usuario` `u` on(`u`.`user_id` = `sh`.`shere_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `duvidas_categorias_view`
--
DROP VIEW IF EXISTS `duvidas_categorias_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `duvidas_categorias_view`  AS  select `duv`.`duv_id` AS `duv_id`,`duv`.`duv_pergunta` AS `duv_pergunta`,`duv`.`duv_resposta` AS `duv_resposta`,`duv`.`duvcategoria_id` AS `duvcategoria_id`,`duv`.`tiuser_id` AS `tiuser_id`,`dv`.`duvcat_id` AS `duvcat_id`,`dv`.`duvcat_nome` AS `duvcat_nome`,`dv`.`duvcat_tipo_id` AS `duvcat_tipo_id` from (`duvidas` `duv` join `duvidas_categoria` `dv` on(`duv`.`duvcategoria_id` = `dv`.`duvcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_candidato_ficha`
--
DROP VIEW IF EXISTS `empresa_candidato_ficha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_candidato_ficha`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`fe`.`fic_id` AS `fic_id`,`fe`.`fic_empresa` AS `fic_empresa`,`fe`.`fic_cargo` AS `fic_cargo`,`fe`.`fic_carteiraregistro` AS `fic_carteiraregistro`,`fe`.`fic_salario` AS `fic_salario`,`fe`.`fic_dataentrada` AS `fic_dataentrada`,`fe`.`fic_datasaida` AS `fic_datasaida`,`fe`.`fic_motivoSaida` AS `fic_motivoSaida`,`fe`.`candidato_id` AS `candidato_id` from ((((`post` `p` join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `candidato_vaga_link` `cvl` on(`v`.`vag_id` = `cvl`.`cvlvag_id`)) join `candidato` `cand` on(`cand`.`cand_id` = `cvl`.`cvlcand_id`)) left join `fichaexperiecia` `fe` on(`fe`.`candidato_id` = `cand`.`cand_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_candidato_vaga`
--
DROP VIEW IF EXISTS `empresa_candidato_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_candidato_vaga`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvl_user_id` AS `cvl_user_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`cand`.`cand_id` AS `cand_id`,`cand`.`cand_nome` AS `cand_nome`,`cand`.`cand_img` AS `cand_img`,`cand`.`cand_dataDenasci` AS `cand_dataDenasci`,`cand`.`cand_cpf` AS `cand_cpf`,`cand`.`cand_contato` AS `cand_contato`,`cand`.`canduser_id` AS `canduser_id`,`cand`.`candestc_id` AS `candestc_id`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`post` `p` join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `candidato_vaga_link` `cvl` on(`v`.`vag_id` = `cvl`.`cvlvag_id`)) join `candidato` `cand` on(`cand`.`cand_id` = `cvl`.`cvlcand_id`)) join `usuario` `user` on(`cand`.`canduser_id` = `user`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `user`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_conta`
--
DROP VIEW IF EXISTS `empresa_conta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_conta`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`cont`.`cont_id` AS `cont_id`,`cont`.`cont_agencia` AS `cont_agencia`,`cont`.`cont_conta` AS `cont_conta`,`cont`.`cont_titular` AS `cont_titular`,`cont`.`cont_digito` AS `cont_digito`,`cont`.`cont_user_id` AS `cont_user_id`,`cont`.`cont_bank_id` AS `cont_bank_id`,`cb`.`bank_id` AS `bank_id`,`cb`.`bank_nome` AS `bank_nome` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `conta_bancaria` `cont` on(`cont`.`cont_user_id` = `u`.`user_id`)) join `conta_bancos` `cb` on(`cb`.`bank_id` = `cont`.`cont_bank_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_dados`
--
DROP VIEW IF EXISTS `empresa_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_dados`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `u`.`user_ender_id`)) join `estado` `est` on(`est`.`est_id` = `ender`.`enderest_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_dicas`
--
DROP VIEW IF EXISTS `empresa_dicas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_dicas`  AS  select `e`.`emp_razaosocial` AS `emp_razaosocial`,`e`.`emp_id` AS `emp_id`,`e`.`emp_cnpj` AS `emp_cnpj`,`e`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`e`.`emp_nomefantasia` AS `emp_nomefantasia`,`e`.`emp_descri` AS `emp_descri`,`e`.`emp_img` AS `emp_img`,`e`.`emp_contato` AS `emp_contato`,`e`.`emp_datafundacao` AS `emp_datafundacao`,`e`.`empuser_id` AS `empuser_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`d`.`dic_id` AS `dic_id`,`d`.`dic_text` AS `dic_text`,`d`.`postdic_id` AS `postdic_id` from ((((`empresa` `e` left join `usuario` `u` on(`e`.`empuser_id` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `dica` `d` on(`p`.`post_id` = `d`.`postdic_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_pedidos`
--
DROP VIEW IF EXISTS `empresa_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_pedidos`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedi`.`pedi_id` AS `pedi_id`,`pedi`.`pedi_registro` AS `pedi_registro`,`pedi`.`status_number_id` AS `status_number_id`,`pedi`.`pedi_valortotal` AS `pedi_valortotal`,`pedi`.`pedi_description` AS `pedi_description`,`pedi`.`statuspe_id` AS `statuspe_id`,`pedi`.`pedi_serv_id` AS `pedi_serv_id`,`pedi`.`cliente_user_id` AS `cliente_user_id`,`pedi`.`status_pay_id` AS `status_pay_id`,`pedi`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from ((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `pedido` `pedi` on(`pedi`.`cliente_user_id` = `u`.`user_id`)) join `servico` `serv` on(`pedi`.`pedi_serv_id` = `serv`.`serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pedi`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_pedido_plano`
--
DROP VIEW IF EXISTS `empresa_pedido_plano`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_pedido_plano`  AS  select `emp`.`emp_id` AS `emp_id`,`emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`emp`.`emp_plano_id` AS `emp_plano_id`,`pd`.`pd_id` AS `pd_id`,`pd`.`pd_plano_id` AS `pd_plano_id`,`pd`.`pd_inicio` AS `pd_inicio`,`pd`.`pd_termino` AS `pd_termino`,`pd`.`pd_payments_id` AS `pd_payments_id`,`pd`.`pd_emp_id` AS `pd_emp_id`,`st`.`statuspay_id` AS `statuspay_id`,`st`.`statuspay` AS `statuspay` from ((`empresa` `emp` left join `pedidoplano` `pd` on(`emp`.`emp_id` = `pd`.`pd_emp_id`)) join `status_payments` `st` on(`st`.`statuspay_id` = `pd`.`pd_payments_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prestador_pedidos`
--
DROP VIEW IF EXISTS `empresa_prestador_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prestador_pedidos`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`pedipre`.`pretador_pedidos_id` AS `pretador_pedidos_id`,`pedipre`.`prestador_pedi_id` AS `prestador_pedi_id`,`pedipre`.`prestador_user_id` AS `prestador_user_id`,`pedipre`.`prestador_acc_id` AS `prestador_acc_id`,`pedipre`.`prestador_date` AS `prestador_date`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id` from ((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `pedido_prestador` `pedipre` on(`u`.`user_id` = `pedipre`.`prestador_user_id`)) join `pedido` `pe` on(`pedipre`.`prestador_pedi_id` = `pe`.`pedi_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prova`
--
DROP VIEW IF EXISTS `empresa_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prova`  AS  select `e`.`emp_razaosocial` AS `emp_razaosocial`,`e`.`emp_id` AS `emp_id`,`e`.`emp_cnpj` AS `emp_cnpj`,`e`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`e`.`emp_nomefantasia` AS `emp_nomefantasia`,`e`.`emp_descri` AS `emp_descri`,`e`.`emp_img` AS `emp_img`,`e`.`emp_contato` AS `emp_contato`,`e`.`emp_datafundacao` AS `emp_datafundacao`,`e`.`empuser_id` AS `empuser_id`,`p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id` from (`empresa` `e` join `prova` `p` on(`e`.`emp_id` = `p`.`proemp_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_prova_pergunta`
--
DROP VIEW IF EXISTS `empresa_prova_pergunta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_prova_pergunta`  AS  select `p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id`,`q`.`quest_id` AS `quest_id`,`q`.`quest_pergunta` AS `quest_pergunta`,`q`.`quest_a` AS `quest_a`,`q`.`quest_b` AS `quest_b`,`q`.`quest_c` AS `quest_c`,`q`.`quest_d` AS `quest_d`,`q`.`quest_e` AS `quest_e`,`q`.`questpro_id` AS `questpro_id`,`q`.`quest_official` AS `quest_official` from (`prova` `p` join `questionario` `q` on(`p`.`pro_id` = `q`.`questpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_quiz_pergunta`
--
DROP VIEW IF EXISTS `empresa_quiz_pergunta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_quiz_pergunta`  AS  select `p`.`pro_id` AS `pro_id`,`p`.`pro_nome` AS `pro_nome`,`p`.`tipro_id` AS `tipro_id`,`p`.`proemp_id` AS `proemp_id`,`quiz`.`quiz_id` AS `quiz_id`,`quiz`.`quiz_pergunta` AS `quiz_pergunta`,`quiz`.`quizpro_id` AS `quizpro_id`,`quiz`.`quizuser_id` AS `quizuser_id` from (`prova` `p` join `quiz` on(`p`.`pro_id` = `quiz`.`quizpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_servico`
--
DROP VIEW IF EXISTS `empresa_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_servico`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_solicitacoes`
--
DROP VIEW IF EXISTS `empresa_solicitacoes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_solicitacoes`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`soli`.`soli_id` AS `soli_id`,`soli`.`soli_descricao` AS `soli_descricao`,`soli`.`soli_date` AS `soli_date`,`soli`.`soli_response` AS `soli_response`,`soli`.`solistatus_id` AS `solistatus_id`,`soli`.`soliusuario_id` AS `soliusuario_id`,`soli`.`solicategoria_id` AS `solicategoria_id`,`statussoli`.`status_soli_id` AS `status_soli_id`,`statussoli`.`status_soli` AS `status_soli`,`solicat`.`solicat_id` AS `solicat_id`,`solicat`.`soli_cat_nm` AS `soli_cat_nm` from (((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`emp`.`emp_id` = `uel`.`emp_id_link`)) join `usuario` `u` on(`u`.`user_id` = `uel`.`user_id_link`)) join `solicitacoes` `soli` on(`soli`.`soli_id` = `u`.`user_id`)) join `status_solicitacao` `statussoli` on(`statussoli`.`status_soli_id` = `soli`.`soli_id`)) join `solicitacao_categoria` `solicat` on(`solicat`.`solicat_id` = `soli`.`soli_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_vaga`
--
DROP VIEW IF EXISTS `empresa_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_vaga`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`esco`.`esco_id` AS `esco_id`,`esco`.`esco_nome` AS `esco_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((((`empresa` `emp` left join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) left join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) left join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) left join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) left join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) left join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) left join `escolaridade` `esco` on(`esco`.`esco_id` = `v`.`vagesco_id`)) left join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) left join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `empresa_vincula_prova`
--
DROP VIEW IF EXISTS `empresa_vincula_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `empresa_vincula_prova`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`link`.`linkvag_id` AS `linkvag_id`,`link`.`linkpro_id` AS `linkpro_id`,`pro`.`pro_id` AS `pro_id`,`pro`.`pro_nome` AS `pro_nome`,`pro`.`tipro_id` AS `tipro_id`,`pro`.`proemp_id` AS `proemp_id` from (((`post` `p` left join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) left join `vaga_prova_link` `link` on(`link`.`linkvag_id` = `v`.`vag_id`)) left join `prova` `pro` on(`pro`.`pro_id` = `link`.`linkpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `escolaridade_post_vaga`
--
DROP VIEW IF EXISTS `escolaridade_post_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `escolaridade_post_vaga`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`e`.`esco_id` AS `esco_id`,`e`.`esco_nome` AS `esco_nome` from ((`post` `p` join `vaga` `v` on(`v`.`postvaga_id` = `p`.`post_id`)) join `escolaridade` `e` on(`e`.`esco_id` = `v`.`vagesco_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `mysherepoint`
--
DROP VIEW IF EXISTS `mysherepoint`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `mysherepoint`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`tp`.`tipopost_id` AS `tipopost_id`,`tp`.`tipopost` AS `tipopost`,`endereco`.`ender_id` AS `ender_id`,`endereco`.`ender_numero` AS `ender_numero`,`endereco`.`ender_logradouro` AS `ender_logradouro`,`endereco`.`ender_bairro` AS `ender_bairro`,`endereco`.`ender_cidade` AS `ender_cidade`,`endereco`.`enderest_id` AS `enderest_id`,`endereco`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id`,`sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`user`.`user_id` AS `user_id`,`user`.`user_status` AS `user_status`,`user`.`user_nome` AS `user_nome`,`user`.`user_email` AS `user_email`,`user`.`user_img` AS `user_img`,`user`.`user_senha` AS `user_senha`,`user`.`user_dataCadastro` AS `user_dataCadastro`,`user`.`tiuser_id` AS `tiuser_id`,`user`.`user_ender_id` AS `user_ender_id` from ((((((`post` `p` join `categoria` `c` on(`p`.`postcat_id` = `c`.`cat_id`)) join `tipo_post` `tp` on(`tp`.`tipopost_id` = `p`.`tipo_post_id`)) join `endereco` on(`endereco`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`est`.`est_id` = `endereco`.`enderest_id`)) join `shere` `sh` on(`p`.`post_id` = `sh`.`shere_post_id`)) join `usuario` `user` on(`user`.`user_id` = `sh`.`shere_user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_candidatovaga`
--
DROP VIEW IF EXISTS `notifications_candidatovaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `notifications_candidatovaga`  AS  select `cvl`.`cvl_id` AS `cvl_id`,`cvl`.`cvlvag_id` AS `cvlvag_id`,`cvl`.`cvl_user_id` AS `cvl_user_id`,`cvl`.`cvlcandidato_nome` AS `cvlcandidato_nome`,`cvl`.`cvlemp_id` AS `cvlemp_id`,`cvl`.`cvlcand_id` AS `cvlcand_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome` from (((`candidato_vaga_link` `cvl` join `vaga` `v` on(`cvl`.`cvlvag_id` = `v`.`vag_id`)) join `post` `p` on(`v`.`postvaga_id` = `p`.`post_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_servicos`
--
DROP VIEW IF EXISTS `notifications_servicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `notifications_servicos`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id` from (`pedido` `p` join `usuario` `u` on(`p`.`cliente_user_id` = `u`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `notifications_shere`
--
DROP VIEW IF EXISTS `notifications_shere`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `notifications_shere`  AS  select `sh`.`shere_id` AS `shere_id`,`sh`.`shere_post_id` AS `shere_post_id`,`sh`.`shere_user_id` AS `shere_user_id`,`sh`.`shere_user_nome` AS `shere_user_nome`,`sh`.`shere_autor_user_id` AS `shere_autor_user_id`,`sh`.`shere_autor_nome` AS `shere_autor_nome`,`sh`.`shere_user_img` AS `shere_user_img`,`sh`.`shere_ti_post` AS `shere_ti_post`,`sh`.`shere_text` AS `shere_text`,`ti`.`tipopost_id` AS `tipopost_id`,`ti`.`tipopost` AS `tipopost`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome` from (((`shere` `sh` join `tipo_post` `ti` on(`ti`.`tipopost_id` = `sh`.`shere_ti_post`)) join `post` `p` on(`p`.`post_id` = `sh`.`shere_post_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedido_conversas`
--
DROP VIEW IF EXISTS `pedido_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `pedido_conversas`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`pml_pedi_id` AS `pml_pedi_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_date` AS `pml_date`,`pml`.`pml_pmdl_id` AS `pml_pmdl_id`,`pmdl`.`pmdl_cliente_foto` AS `pmdl_cliente_foto`,`pmdl`.`pmdl_cliente_nome` AS `pmdl_cliente_nome`,`pmdl`.`pmdl_prestador_foto` AS `pmdl_prestador_foto`,`pmdl`.`pmdl_prestador_nome` AS `pmdl_prestador_nome`,`pmdl`.`pmdl_id` AS `pmdl_id`,`m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`po`.`post_id` AS `post_id`,`po`.`post_titulo` AS `post_titulo`,`po`.`post_subtitulo` AS `post_subtitulo`,`po`.`post_description` AS `post_description`,`po`.`postcat_id` AS `postcat_id`,`po`.`tipo_post_id` AS `tipo_post_id`,`po`.`userpost_id` AS `userpost_id`,`po`.`post_ender_id` AS `post_ender_id` from (((((`pedido` `p` join `pedido_mensagem_link` `pml` on(`pml`.`pml_pedi_id` = `p`.`pedi_id`)) join `pedido_mensagem_dados_link` `pmdl` on(`pmdl`.`pmdl_id` = `pml`.`pml_pmdl_id`)) join `mensagem` `m` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) join `servico` `serv` on(`serv`.`serv_id` = `p`.`pedi_serv_id`)) join `post` `po` on(`po`.`post_id` = `serv`.`postserv_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `pedido_detalhes`
--
DROP VIEW IF EXISTS `pedido_detalhes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `pedido_detalhes`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`stpro`.`statusnumber_id` AS `statusnumber_id`,`stpro`.`statusnumber` AS `statusnumber`,`stpe`.`statuspedi_id` AS `statuspedi_id`,`stpe`.`statuspedi_nome` AS `statuspedi_nome`,`stpe`.`statuspedi_date` AS `statuspedi_date` from (((((`post` `p` join `endereco` `ender` on(`p`.`post_ender_id` = `ender`.`ender_id`)) join `servico` `serv` on(`p`.`post_id` = `serv`.`postserv_id`)) join `pedido` `pe` on(`pe`.`pedi_serv_id` = `serv`.`serv_id`)) join `status_progress` `stpro` on(`stpro`.`statusnumber_id` = `pe`.`status_number_id`)) join `status_pedido` `stpe` on(`stpe`.`statuspedi_id` = `pe`.`statuspe_id`)) ;

-- --------------------------------------------------------

--
--
-- Estrutura para vista `post_blog_categorias`
--
DROP VIEW IF EXISTS `post_blog_categorias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `post_blog_categorias`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`bl`.`blog_id` AS `blog_id`,`bl`.`blogdestaque_id` AS `blogdestaque_id`,`bl`.`blog_text` AS `blog_text`,`bl`.`blog_date` AS `blog_date`,`bl`.`blog_img` AS `blog_img`,`bl`.`blog_categoria_id` AS `blog_categoria_id`,`bl`.`blogpost_id` AS `blogpost_id`,`blc`.`blogcat_id` AS `blogcat_id`,`blc`.`blogcat_nome` AS `blogcat_nome`,`bld`.`blogdest_id` AS `blogdest_id`,`bld`.`blogdest_nome` AS `blogdest_nome` from (((`post` `p` join `blog` `bl` on(`p`.`post_id` = `bl`.`blogpost_id`)) join `blog_categoria` `blc` on(`bl`.`blog_categoria_id` = `blc`.`blogcat_id`)) join `blog_destaque` `bld` on(`bld`.`blogdest_id` = `bl`.`blogdestaque_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_dica`
--
DROP VIEW IF EXISTS `post_dica`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `post_dica`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`d`.`dic_id` AS `dic_id`,`d`.`dic_text` AS `dic_text`,`d`.`postdic_id` AS `postdic_id` from ((`post` `p` join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `dica` `d` on(`p`.`post_id` = `d`.`postdic_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_vaga`
--
DROP VIEW IF EXISTS `post_vaga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `post_vaga`  AS  select `emp`.`emp_razaosocial` AS `emp_razaosocial`,`emp`.`emp_id` AS `emp_id`,`emp`.`emp_cnpj` AS `emp_cnpj`,`emp`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`emp`.`emp_nomefantasia` AS `emp_nomefantasia`,`emp`.`emp_descri` AS `emp_descri`,`emp`.`emp_img` AS `emp_img`,`emp`.`emp_contato` AS `emp_contato`,`emp`.`emp_datafundacao` AS `emp_datafundacao`,`emp`.`empuser_id` AS `empuser_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`stavaga`.`statusvag_id` AS `statusvag_id`,`stavaga`.`statusvag_nome` AS `statusvag_nome`,`tivaga`.`tipovaga_id` AS `tipovaga_id`,`tivaga`.`tipovaga_nome` AS `tipovaga_nome`,`esco`.`esco_id` AS `esco_id`,`esco`.`esco_nome` AS `esco_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((((((`empresa` `emp` join `usuario_empresa_link` `uel` on(`uel`.`emp_id_link` = `emp`.`emp_id`)) join `usuario` `u` on(`uel`.`user_id_link` = `u`.`user_id`)) join `post` `p`) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `vaga` `v` on(`p`.`post_id` = `v`.`postvaga_id`)) join `status_vaga` `stavaga` on(`stavaga`.`statusvag_id` = `v`.`vagstatus_id`)) join `tipo_vaga` `tivaga` on(`tivaga`.`tipovaga_id` = `v`.`tivaga_id`)) join `escolaridade` `esco` on(`esco`.`esco_id` - `v`.`vagesco_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `post_vaga_prova`
--
DROP VIEW IF EXISTS `post_vaga_prova`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `post_vaga_prova`  AS  select `p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`vg`.`vag_id` AS `vag_id`,`vg`.`vag_preRequisitos` AS `vag_preRequisitos`,`vg`.`vag_beneficios` AS `vag_beneficios`,`vg`.`vag_salario` AS `vag_salario`,`vg`.`vag_quantidade` AS `vag_quantidade`,`vg`.`vagstatus_id` AS `vagstatus_id`,`vg`.`postvaga_id` AS `postvaga_id`,`vg`.`tivaga_id` AS `tivaga_id`,`vg`.`vagesco_id` AS `vagesco_id`,`vpl`.`vagprolink_id` AS `vagprolink_id`,`vpl`.`linkvag_id` AS `linkvag_id`,`vpl`.`linkpro_id` AS `linkpro_id`,`pv`.`pro_id` AS `pro_id`,`pv`.`pro_nome` AS `pro_nome`,`pv`.`tipro_id` AS `tipro_id`,`pv`.`proemp_id` AS `proemp_id` from (((`post` `p` join `vaga` `vg` on(`p`.`post_id` = `vg`.`postvaga_id`)) join `vaga_prova_link` `vpl` on(`vpl`.`linkvag_id` = `vg`.`vag_id`)) join `prova` `pv` on(`pv`.`pro_id` = `vpl`.`linkpro_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_explore_servico`
--
DROP VIEW IF EXISTS `usuario_explore_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `usuario_explore_servico`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`cat`.`cat_id` AS `cat_id`,`cat`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`usuario` `u` join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `cat` on(`cat`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_perfil`
--
DROP VIEW IF EXISTS `usuario_perfil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `usuario_perfil`  AS  select `c`.`cand_id` AS `cand_id`,`c`.`cand_nome` AS `cand_nome`,`c`.`cand_img` AS `cand_img`,`c`.`cand_dataDenasci` AS `cand_dataDenasci`,`c`.`cand_cpf` AS `cand_cpf`,`c`.`cand_contato` AS `cand_contato`,`c`.`canduser_id` AS `canduser_id`,`c`.`candestc_id` AS `candestc_id`,`u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`uel`.`user_id_link` AS `user_id_link`,`uel`.`emp_id_link` AS `emp_id_link`,`e`.`emp_razaosocial` AS `emp_razaosocial`,`e`.`emp_id` AS `emp_id`,`e`.`emp_cnpj` AS `emp_cnpj`,`e`.`emp_nomeresponsavel` AS `emp_nomeresponsavel`,`e`.`emp_nomefantasia` AS `emp_nomefantasia`,`e`.`emp_descri` AS `emp_descri`,`e`.`emp_img` AS `emp_img`,`e`.`emp_contato` AS `emp_contato`,`e`.`emp_datafundacao` AS `emp_datafundacao`,`e`.`empuser_id` AS `empuser_id` from (((`usuario` `u` left join `candidato` `c` on(`c`.`canduser_id` = `u`.`user_id`)) left join `usuario_empresa_link` `uel` on(`u`.`user_id` - `uel`.`user_id_link`)) left join `empresa` `e` on(`e`.`empuser_id` = `uel`.`user_id_link`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_post_servico`
--
DROP VIEW IF EXISTS `usuario_post_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `usuario_post_servico`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`staserv`.`statServ_id` AS `statServ_id`,`staserv`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`usuario` `u` join `post` `p` on(`u`.`user_id` = `p`.`userpost_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `servico` `s` on(`p`.`post_id` = `s`.`postserv_id`)) join `status_servico` `staserv` on(`staserv`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_preferencias`
--
DROP VIEW IF EXISTS `usuario_preferencias`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `usuario_preferencias`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`u`.`user_primary` AS `user_primary`,`u`.`user_preferences_id` AS `user_preferences_id`,`p`.`pref_id` AS `pref_id`,`p`.`pref_nome` AS `pref_nome` from (`usuario` `u` join `preferencias` `p` on(`u`.`user_preferences_id` = `p`.`pref_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `usuario_servico`
--
DROP VIEW IF EXISTS `usuario_servico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `usuario_servico`  AS  select `s`.`serv_id` AS `serv_id`,`s`.`serv_preRequisitos` AS `serv_preRequisitos`,`s`.`serv_beneficios` AS `serv_beneficios`,`s`.`serv_prazo` AS `serv_prazo`,`s`.`serv_valor` AS `serv_valor`,`s`.`serv_arquivo1` AS `serv_arquivo1`,`s`.`serv_arquivo2` AS `serv_arquivo2`,`s`.`serv_arquivo3` AS `serv_arquivo3`,`s`.`statusServ_id` AS `statusServ_id`,`s`.`postserv_id` AS `postserv_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`us`.`user_id` AS `user_id`,`us`.`user_status` AS `user_status`,`us`.`user_nome` AS `user_nome`,`us`.`user_email` AS `user_email`,`us`.`user_img` AS `user_img`,`us`.`user_senha` AS `user_senha`,`us`.`user_dataCadastro` AS `user_dataCadastro`,`us`.`tiuser_id` AS `tiuser_id`,`us`.`user_ender_id` AS `user_ender_id`,`c`.`cat_id` AS `cat_id`,`c`.`cat_nome` AS `cat_nome`,`stav`.`statServ_id` AS `statServ_id`,`stav`.`statusServ_nome` AS `statusServ_nome`,`ender`.`ender_id` AS `ender_id`,`ender`.`ender_numero` AS `ender_numero`,`ender`.`ender_logradouro` AS `ender_logradouro`,`ender`.`ender_bairro` AS `ender_bairro`,`ender`.`ender_cidade` AS `ender_cidade`,`ender`.`enderest_id` AS `enderest_id`,`ender`.`ender_comple` AS `ender_comple`,`est`.`est_id` AS `est_id`,`est`.`est_nome` AS `est_nome`,`est`.`pais_id` AS `pais_id` from ((((((`servico` `s` join `post` `p` on(`p`.`post_id` = `s`.`postserv_id`)) join `usuario` `us` on(`p`.`userpost_id` = `us`.`user_id`)) join `categoria` `c` on(`c`.`cat_id` = `p`.`postcat_id`)) join `status_servico` `stav` on(`stav`.`statServ_id` = `s`.`statusServ_id`)) join `endereco` `ender` on(`ender`.`ender_id` = `p`.`post_ender_id`)) join `estado` `est` on(`ender`.`enderest_id` = `est`.`est_id`)) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `vaga_conversas`
--
DROP VIEW IF EXISTS `vaga_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `vaga_conversas`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`vml`.`vml_id` AS `vml_id`,`vml`.`vml_user_remetente_id` AS `vml_user_remetente_id`,`vml`.`vml_user_destinatario_id` AS `vml_user_destinatario_id`,`vml`.`vml_vaga_id` AS `vml_vaga_id`,`vml`.`vml_msn_id` AS `vml_msn_id`,`vml`.`vml_view` AS `vml_view`,`vml`.`vml_date` AS `vml_date`,`vml`.`vmdl_id` AS `vmdl_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`vmdl`.`vmdl_idd` AS `vmdl_idd`,`vmdl`.`vmdl_empresa_img` AS `vmdl_empresa_img`,`vmdl`.`vmdl_empresa_nome` AS `vmdl_empresa_nome`,`vmdl`.`vmdl_cand_nome` AS `vmdl_cand_nome`,`vmdl`.`vmdl_cand_img` AS `vmdl_cand_img` from ((((`mensagem` `m` join `vaga_mensagem_link` `vml` on(`m`.`msn_id` = `vml`.`vml_msn_id`)) join `vaga` `v` on(`v`.`vag_id` = `vml`.`vml_vaga_id`)) join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `vaga_mensagem_dados_link` `vmdl` on(`vml`.`vmdl_id` = `vmdl`.`vmdl_idd`)) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
dROP VIEW IF EXISTS `vaga_conversas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `vaga_conversas`  AS  select `m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome`,`vml`.`vml_id` AS `vml_id`,`vml`.`vml_user_remetente_id` AS `vml_user_remetente_id`,`vml`.`vml_user_destinatario_id` AS `vml_user_destinatario_id`,`vml`.`vml_vaga_id` AS `vml_vaga_id`,`vml`.`vml_msn_id` AS `vml_msn_id`,`vml`.`vml_view` AS `vml_view`,`vml`.`vml_date` AS `vml_date`,`vml`.`vmdl_id` AS `vmdl_id`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id`,`vmdl`.`vmdl_idd` AS `vmdl_idd`,`vmdl`.`vmdl_empresa_img` AS `vmdl_empresa_img`,`vmdl`.`vmdl_empresa_nome` AS `vmdl_empresa_nome`,`vmdl`.`vmdl_cand_nome` AS `vmdl_cand_nome`,`vmdl`.`vmdl_cand_img` AS `vmdl_cand_img` from ((((`mensagem` `m` join `vaga_mensagem_link` `vml` on(`m`.`msn_id` = `vml`.`vml_msn_id`)) join `vaga` `v` on(`v`.`vag_id` = `vml`.`vml_vaga_id`)) join `post` `p` on(`p`.`post_id` = `v`.`postvaga_id`)) join `vaga_mensagem_dados_link` `vmdl` on(`vml`.`vmdl_id` = `vmdl`.`vmdl_idd`))

--
-- Estrutura para vista `pedidos_prestador_dados`
--
DROP VIEW IF EXISTS `pedidos_prestador_dados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `pedidos_prestador_dados`  AS  select `u`.`user_id` AS `user_id`,`u`.`user_status` AS `user_status`,`u`.`user_nome` AS `user_nome`,`u`.`user_email` AS `user_email`,`u`.`user_img` AS `user_img`,`u`.`user_senha` AS `user_senha`,`u`.`user_dataCadastro` AS `user_dataCadastro`,`u`.`tiuser_id` AS `tiuser_id`,`u`.`user_ender_id` AS `user_ender_id`,`pedipre`.`pretador_pedidos_id` AS `pretador_pedidos_id`,`pedipre`.`prestador_pedi_id` AS `prestador_pedi_id`,`pedipre`.`prestador_user_id` AS `prestador_user_id`,`pedipre`.`prestador_acc_id` AS `prestador_acc_id`,`pedipre`.`prestador_date` AS `prestador_date`,`pe`.`pedi_id` AS `pedi_id`,`pe`.`pedi_registro` AS `pedi_registro`,`pe`.`status_number_id` AS `status_number_id`,`pe`.`pedi_valortotal` AS `pedi_valortotal`,`pe`.`pedi_description` AS `pedi_description`,`pe`.`statuspe_id` AS `statuspe_id`,`pe`.`pedi_serv_id` AS `pedi_serv_id`,`pe`.`cliente_user_id` AS `cliente_user_id`,`pe`.`status_pay_id` AS `status_pay_id`,`pe`.`nome_cliente` AS `nome_cliente`,`pe`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`serv`.`serv_id` AS `serv_id`,`serv`.`serv_preRequisitos` AS `serv_preRequisitos`,`serv`.`serv_beneficios` AS `serv_beneficios`,`serv`.`serv_prazo` AS `serv_prazo`,`serv`.`serv_valor` AS `serv_valor`,`serv`.`serv_arquivo1` AS `serv_arquivo1`,`serv`.`serv_arquivo2` AS `serv_arquivo2`,`serv`.`serv_arquivo3` AS `serv_arquivo3`,`serv`.`statusServ_id` AS `statusServ_id`,`serv`.`postserv_id` AS `postserv_id` from (((`usuario` `u` join `pedido_prestador` `pedipre` on(`u`.`user_id` = `pedipre`.`prestador_user_id`)) join `pedido` `pe` on(`pedipre`.`prestador_pedi_id` = `pe`.`pedi_id`)) join `servico` `serv` on(`serv`.`serv_id` = `pe`.`pedi_prestador_user_id`)) ;

-- --------------------------------------------------------


--
-- Estrutura para vista `pedido_mensagems`
--
DROP VIEW IF EXISTS `pedido_mensagems`;

CREATE ALGORITHM=UNDEFINED DEFINER=`onclic96`@`localhost` SQL SECURITY DEFINER VIEW `pedido_mensagems`  AS  select `p`.`pedi_id` AS `pedi_id`,`p`.`pedi_registro` AS `pedi_registro`,`p`.`status_number_id` AS `status_number_id`,`p`.`pedi_valortotal` AS `pedi_valortotal`,`p`.`pedi_description` AS `pedi_description`,`p`.`statuspe_id` AS `statuspe_id`,`p`.`pedi_serv_id` AS `pedi_serv_id`,`p`.`cliente_user_id` AS `cliente_user_id`,`p`.`status_pay_id` AS `status_pay_id`,`p`.`pedi_prestador_user_id` AS `pedi_prestador_user_id`,`pml`.`pml_id` AS `pml_id`,`pml`.`pml_user_remetente_id` AS `pml_user_remetente_id`,`pml`.`pml_user_destinatario_id` AS `pml_user_destinatario_id`,`pml`.`pml_pedi_id` AS `pml_pedi_id`,`pml`.`pml_msn_id` AS `pml_msn_id`,`pml`.`pml_view` AS `pml_view`,`pml`.`pml_date` AS `pml_date`,`pml`.`cliente_foto` AS `cliente_foto`,`pml`.`prestador_foto` AS `prestador_foto`,`m`.`msn_id` AS `msn_id`,`m`.`msn_date` AS `msn_date`,`m`.`msn_nome` AS `msn_nome` from ((`pedido` `p` join `pedido_mensagem_link` `pml` on(`pml`.`pml_pedi_id` = `p`.`pedi_id`)) join `mensagem` `m` on(`m`.`msn_id` = `pml`.`pml_msn_id`)) ;

-- --------------------------------------------------------

--   