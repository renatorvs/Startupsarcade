
DROP PROCEDURE IF EXISTS `sp_cidade_delete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_delete` (INOUT `cid_id` INT)  BEGIN
DELETE FROM cidade WHERE cid_id = cid_id;

END$$

DROP PROCEDURE IF EXISTS `sp_cidade_insere`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_insere` (INOUT `cid_nome` VARCHAR(50), INOUT `est_id` INT)  BEGIN
insert into cidade(cid_nome, est_id) values(cid_nome, est_id );

END$$

DROP PROCEDURE IF EXISTS `sp_cidade_update`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_update` (INOUT `cid_id` INT, INOUT `cid_nome` VARCHAR(50))  BEGIN
UPDATE cidade SET cid_nome = cid_nome WHERE cid_id = cid_id ;

END$$

Query :para pegar conversas de duas pessoas 
                                SELECT msn_nome FROM messages INNER JOIN user_msn ON messages.msn_id = user_msn.msn_id where user_id = 2 AND id_user_destinatario = 1 OR id_user_destinatario = 2 AND user_id =1

CREATE PROCEDURE sp_servico_insere(IN serv_valor VARCHAR(20), in serv_preRequisito VARCHAR(150),in serv_beneficios VARCHAR(150), 
	IN serv_prazo INT, IN con_salario INT, IN serv_imgProjeto_01 Blob,  IN serv_imgProjeto_02 Blob,  IN serv_imgProjeto_03 Blob,
	 IN statusServ_id INT, IN post_id INT)


INSERT INTO vaga(serv_id, serv_valor, serv_preRequisito, serv_beneficios, serv_prazo, serv_imgProjeto_01, serv_imgProjeto_02, serv_imgProjeto_03,	
statusServ_id,	post_id)

 VALUES (serv_id, serv_valor, serv_preRequisito, serv_beneficios, serv_prazo, serv_imgProjeto_01, serv_imgProjeto_02, serv_imgProjeto_03,	
statusServ_id,	post_id);


//////////////// update servico 


CREATE PROCEDURE sp_servico_update(IN serv_id INT, IN serv_preRequisito VARCHAR(150), in serv_beneficios VARCHAR(150), 
	IN serv_prazo INT, in serv_imgProjeto_01 Blob, in serv_imgProjeto_02 Blob, in serv_imgProjeto_03 Blob, IN statusServ_id INT)
 
UPDATE VAGA SET serv_valor = serv_valor, serv_preRequisito = serv_preRequisito,
serv_beneficios = serv_beneficios, serv_prazo = serv_prazo, serv_imgProjeto_01 = serv_imgProjeto_01, serv_imgProjeto_02 = serv_imgProjeto_02,
 serv_imgProjeto_03 = serv_imgProjeto_03 statusServ_id = statusServ_id  WHERE serv_id = serv_id;

---------------------------------------------------------------------------------------------------


CREATE PROCEDURE sp_concurso_insere(IN con_preRequesitos VARCHAR(150), in con_beneficios VARCHAR(150), 
	IN con_quantidade INT, IN con_salario INT, IN con_site VARCHAR(50), IN statuscon_id INT, IN post_id INT)

INSERT INTO vaga(con_preRequesitos,	con_beneficios,	con_quantidade,	con_salario, con_site, statuscon_id, post_id )
 VALUES (con_preRequesitos,	con_beneficios,	con_quantidade,	con_salario, con_site, statuscon_id, post_id );


//////////////// update concurso 


CREATE PROCEDURE sp_concurso_update(IN con_id INT, IN con_preRequesitos VARCHAR(150), in con_beneficios VARCHAR(150), 
	IN con_quantidade INT, IN con_salario INT, IN con_site VARCHAR(60), IN statuscon_id INT)

UPDATE VAGA SET con_preRequesitos = con_preRequesitos, con_beneficios = con_beneficios,
con_quantidade = con_quantidade, con_salario = con_salario, con_site = con_site, statuscon_id = statuscon_id WHERE con_id = con_id;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
con_id	con_preRequesitos	con_beneficios	con_quantidade	con_salario	con_site	statuscon_id	escolaridade_id	post_id
/////INSERT vaga


CREATE PROCEDURE sp_vaga_insere(IN vag_preRequisitos VARCHAR(150), in vag_quantidade INT, 
	IN vag_salario VARCHAR(20), IN escolaridade_id INT, IN statusvag_id INT, IN post_id INT)
INSERT INTO vaga(vag_preRequisitos,	vag_quantidade,	vag_beneficios,	vag_salario,	escolaridade_id, statusvag_id,	post_id )
 VALUES (vag_preRequisitos,	vag_quantidade,	vag_beneficios,	vag_salario, escolaridade_id, statusvag_id,	post_id);


UPDATE vaga
			CREATE PROCEDURE sp_vaga_update(IN vag_id INT, vag_preRequisitos VARCHAR(150), in vag_quantidade INT, 
	IN vag_salario VARCHAR(20), IN escolaridade_id INT, IN statusvag_id INT, IN post_id INT)

UPDATE VAGA SET vag_preRequisitos = vag_preRequisitos, vag_quantidade = vag_quantidade,
vag_salario = vag_salario, escolaridade_id = escolaridade_id, statusvag_id = statusvag_id WHERE vag_id = vag_id;



dic_id	dic_text	post_id
CREATE PROCEDURE sp_dica_insere( in dic_text VARCHAR(200), IN post_id INT)

INSERT into dica (dic_text, post_id) VALUES (dic_text, post_id) 

CREATE PROCEDURE sp_dica_update(IN dic_id INT, in dic_text VARCHAR(200))

			
UPDATE dica SET dic_text = dic_text  WHERE dic_id = dic_id;
-

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adm_delete` (INOUT `adm_id` INT)  BEGIN
DELETE FROM adm WHERE adm_id = adm_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adm_insere` (INOUT `adm_nome` VARCHAR(50), INOUT `adm_senha` VARCHAR(50), INOUT `car_id` INT, INOUT `adm_email` VARCHAR(50))  BEGIN
insert into adm(adm_nome, adm_email, adm_senha, car_id) values(adm_nome, adm_email, adm_senha, car_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_adm_update` (INOUT `adm_id` INT, INOUT `adm_nome` VARCHAR(50), INOUT `adm_email` VARCHAR(50), INOUT `adm_senha` VARCHAR(50), INOUT `car_id` INT)  BEGIN
UPDATE adm SET adm_nome = adm_nome, adm_email = adm_email, adm_senha = adm_senha, car_id = car_id WHERE adm_id = adm_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastro_vaga_delete` (INOUT `post_id` INT, INOUT `user_id` INT)  BEGIN
DELETE FROM cadastro_vaga WHERE post_id = post_id AND user_id = user_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cadastro_vaga_insere` (INOUT `post_id` INT, INOUT `user_id` INT)  BEGIN
insert into cadastro_vaga(post_id, user_id) values(post_id, user_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_candidato_cadastro_insere` (IN `cand_nome` VARCHAR(50), IN `cand_img` INT, IN `cand_dataDenasci` DATE, IN `user_id` INT)  NO SQL
insert into candidato(cand_nome, cand_img, cand_dataDenasci, user_id) values(cand_nome, cand_img, cand_dataDenasci, user_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_candidato_delete` (INOUT `cand_id` INT)  BEGIN
DELETE FROM candidato WHERE cand_id = cand_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cargo_delete` (INOUT `car_id` INT)  BEGIN
DELETE FROM cargo WHERE car_id = car_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cargo_insere` (INOUT `car_nome` VARCHAR(50))  BEGIN

insert into cargo(car_nome) values(car_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cargo_update` (INOUT `car_id` INT, INOUT `car_nome` VARCHAR(50))  BEGIN
UPDATE cargo SET car_nome = car_nome  WHERE car_id = car_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_delete` (INOUT `cat_id` INT)  BEGIN
DELETE FROM categoria WHERE cat_id =   cat_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_insere` (INOUT `cat_id` VARCHAR(50))  BEGIN
insert into categoria(cat_id) values(cat_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_categoria_update` (INOUT `cat_id` INT, INOUT `cat_nome` VARCHAR(50))  BEGIN
UPDATE categoria SET cat_nome = cat_nome WHERE cat_id = cat_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_delete` (INOUT `cid_id` INT)  BEGIN
DELETE FROM cidade WHERE cid_id = cid_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_insere` (IN `cid_nome` VARCHAR(50), IN `est_id` INT)  BEGIN
insert into cidade(cid_nome, est_id) values(cid_nome, est_id );

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cidade_update` (INOUT `cid_id` INT, INOUT `cid_nome` VARCHAR(50))  BEGIN
UPDATE cidade SET cid_nome = cid_nome WHERE cid_id = cid_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_compatilhado_delete` (INOUT `compart_id` INT)  BEGIN
DELETE FROM compatilhado WHERE compart_id = compart_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_compatilhado_insere` (INOUT `post_id` INT, INOUT `user_id` INT)  BEGIN
insert into compatilhado(post_id, user_id) values(post_id, user_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concurso_insere` (IN `con_preRequesitos` VARCHAR(150), IN `con_beneficios` VARCHAR(150), IN `con_quantidade` INT, IN `con_salario` INT, IN `con_site` VARCHAR(50), IN `statuscon_id` INT, IN `post_id` INT)  INSERT INTO concurso(con_preRequesitos,	con_beneficios,	con_quantidade,	con_salario, con_site, statuscon_id, post_id )
 VALUES (con_preRequesitos,	con_beneficios,	con_quantidade,	con_salario, con_site, statuscon_id, post_id )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_concurso_update` (IN `con_id` INT, IN `con_preRequesitos` VARCHAR(150), IN `con_beneficios` VARCHAR(150), IN `con_quantidade` INT, IN `con_salario` INT, IN `con_site` VARCHAR(60), IN `statuscon_id` INT)  UPDATE concurso SET con_preRequesitos = con_preRequesitos, con_beneficios = con_beneficios,
con_quantidade = con_quantidade, con_salario = con_salario, con_site = con_site, statuscon_id = statuscon_id WHERE con_id = con_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dica_insere` (IN `dic_text` VARCHAR(200), IN `post_id` INT)  INSERT into dica (dic_text, post_id) VALUES (dic_text, post_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_dica_update` (IN `dic_id` INT, IN `dic_text` VARCHAR(200))  UPDATE dica SET dic_text = dic_text  WHERE dic_id = dic_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_empresa_delete` (INOUT `emp_id` INT)  BEGIN
DELETE FROM empresa WHERE emp_id = emp_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_empresa_insere` (IN `emp_cnpj` VARCHAR(50), IN `emp_razaosocial` VARCHAR(50), IN `emp_nomeresponsavel` VARCHAR(50), IN `emp_descri` VARCHAR(50), IN `emp_nomefantasia` VARCHAR(50), IN `emp_img` INT, IN `emp_contato` VARCHAR(50), IN `emp_datafundacao` DATE, IN `empuser_id` INT)  BEGIN
insert into empresa(emp_cnpj, emp_razaosocial, emp_nomeresponsavel, emp_descri, emp_nomefantasia, emp_img, emp_contato, emp_datafundacao,  empuser_id) values(emp_cnpj, emp_razaosocial, emp_nomeresponsavel, emp_descri, emp_nomefantasia, emp_img,  emp_contato,  emp_datafundacao, empuser_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_empresa_update` (INOUT `emp_cnpj` INT, INOUT `emp_razaosocial` VARCHAR(50), INOUT `emp_nomeresponsavel` VARCHAR(50), INOUT `emp_descri` VARCHAR(50), INOUT `emp_nomefantasia` VARCHAR(50), INOUT `emp_contato` VARCHAR(50), INOUT `emp_status` VARCHAR(50), INOUT `emp_data_fundacao` DATE, INOUT `logra_id` INT)  BEGIN
UPDATE empresa SET  emp_razaosocial = emp_razaosocial, emp_nomeresponsavel = emp_nomeresponsavel, emp_descri = emp_descri, emp_nomefantasia = emp_nomefantasia, emp_contato = emp_contato, 	emp_status = 	emp_status, emp_data_fundacao = emp_data_fundacao, logra_id = logra_id WHERE emp_cnpj = emp_cnpj ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_endereco_insert` (IN `ender_numero` VARCHAR(10), IN `ender_logradouro` VARCHAR(60), IN `ender_bairro` VARCHAR(60), IN `ender_cidade` VARCHAR(60), IN `enderest_id` INT)  NO SQL
insert into endereco(ender_numero, ender_logradouro, ender_bairro, ender_cidade, enderest_id) values (ender_numero, ender_logradouro, ender_bairro, ender_cidade, enderest_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_escolaridade_delete` (INOUT `esco_id` INT)  BEGIN
DELETE FROM escolaridade WHERE esco_id = esco_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_escolaridade_insere` (INOUT `esco_nome` TEXT)  BEGIN
insert into escolaridade(esco_nome) values(esco_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_escolaridade_update` (INOUT `esco_id` INT, INOUT `esco_nome` VARCHAR(50))  BEGIN
UPDATE escolaridade SET esco_nome = esco_nome WHERE esco_id = esco_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estado_delete` (INOUT `est_id` INT)  BEGIN
DELETE FROM estado WHERE est_id = est_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estado_insere` (INOUT `est_nome` VARCHAR(50), INOUT `pais_id` INT)  BEGIN
insert into estado(est_nome, pais_id) values(est_nome, pais_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_estado_update` (INOUT `est_id` INT, INOUT `est_nome` VARCHAR(50), INOUT `pais_id` INT)  BEGIN
UPDATE estado SET est_nome = est_nome, pais_id = pais_id WHERE est_id = est_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fichaexperiecia_delete` (IN `fic_id` INT)  BEGIN
DELETE FROM fichaexperiecia WHERE fic_id = fic_id limit 1;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fichaexperiecia_insere` (IN `fic_empresa` VARCHAR(50), IN `fic_cargo` VARCHAR(50), IN `fic_carteiraregistro` VARCHAR(10), IN `fic_salario` DECIMAL, IN `fic_dataentrada` DATE, IN `fic_datasaida` DATE, IN `fic_motivoSaida` VARCHAR(50), IN `candidato_id` INT)  BEGIN
insert into fichaexperiecia(fic_empresa, fic_cargo, fic_carteiraregistro, fic_salario, fic_dataentrada, fic_datasaida, fic_motivoSaida, candidato_id) values(fic_empresa, fic_cargo, fic_carteiraregistro, fic_salario, fic_dataentrada, fic_datasaida, fic_motivoSaida, candidato_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_fichaexperiecia_update` (IN `fic_id` INT, IN `fic_empresa` VARCHAR(50), IN `fic_cargo` VARCHAR(50), IN `fic_carteiraregistro` VARCHAR(50), IN `fic_salario` DECIMAL, IN `fic_dataentrada` DATE, IN `fic_datasaida` DATE, IN `fic_motivoSaida` VARCHAR(50))  BEGIN
UPDATE fichaexperiecia  SET fic_empresa = fic_empresa, fic_cargo = fic_cargo, fic_carteiraregistro = fic_carteiraregistro, fic_salario = fic_salario, fic_dataentrada = fic_dataentrada, fic_motivoSaida = fic_motivoSaida  WHERE fic_id = fic_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_idioma_delete` (INOUT `idio_id` INT)  BEGIN
DELETE FROM idioma WHERE idio_id = idio_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_idioma_insere` (INOUT `idio_nome` VARCHAR(50))  BEGIN
insert into idioma(idio_nome) values(idio_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_idioma_post_delete` (INOUT `idio_id` INT, INOUT `post_id` INT)  BEGIN
DELETE FROM idioma_post WHERE idio_id = idio_id and post_id = post_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_idioma_post_insere` (INOUT `post_id` INT, INOUT `idio_id` INT)  BEGIN
insert into idioma_post(post_id, idio_id) values(post_id, idio_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_idioma_update` (INOUT `idio_id` INT, INOUT `idio_nome` VARCHAR(50))  BEGIN
UPDATE idioma SET idio_nome = idio_nome WHERE idio_id = idio_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mensagem_delete` (INOUT `msn_id` INT)  BEGIN
DELETE FROM mensagem WHERE msn_id = msn_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mensagem_insere` (INOUT `msn_date` DATE, INOUT `msn_body` VARCHAR(50), INOUT `msn_user_remetente` INT, INOUT `msn_user_destinatario` INT)  BEGIN
insert into mensagem(msn_date, msn_body, msn_user_remetente, msn_user_destinatario) values(msn_date, msn_body, msn_user_remetente, msn_user_destinatario);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_mensagem_update` (INOUT `msn_id` INT, INOUT `msn_date` DATE, INOUT `msn_body` VARCHAR(50), INOUT `msn_user_remetente` INT, INOUT `msn_user_destinatario` INT)  BEGIN
UPDATE mensagem SET msn_date = msn_date, msn_body = msn_body, msn_user_remetente = msn_user_remetente, msn_user_destinatario = msn_user_destinatario WHERE msn_id = msn_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nivel_delete` (INOUT `nive_id` INT)  BEGIN
DELETE FROM nivel WHERE nive_id = nive_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nivel_idio_delete` (INOUT `nivel_id` INT, INOUT `idio_id` INT)  BEGIN
DELETE FROM nivel_idio WHERE nivel_id = nivel_id and idio_id = idio_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nivel_idio_insere` (INOUT `nive_id` INT, INOUT `idio_id` INT)  BEGIN
insert into nivel_idio(nive_id, idio_id) values(nive_id, idio_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nivel_insere` (INOUT `nive_nome` VARCHAR(50))  BEGIN
insert into nivel(nive_nome) values(nive_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nivel_update` (INOUT `nive_id` INT, INOUT `nive_nome` VARCHAR(50))  BEGIN
UPDATE nivel SET  nive_nome = nive_nome WHERE nive_id = nive_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nota_delete` (INOUT `not_id` INT)  BEGIN
DELETE FROM nota WHERE not_id = not_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nota_insere` (INOUT `not_nome` VARCHAR(50), INOUT `resp_id` INT)  BEGIN
insert into nota(not_nome ,resp_id) values(not_nome, resp_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nota_update` (INOUT `not_id` INT, INOUT `not_nome` VARCHAR(50))  BEGIN
UPDATE nota SET not_nome = not_nome, resp_id = resp_id WHERE not_id = not_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pais_delete` (INOUT `pais_id` INT)  BEGIN
DELETE FROM pais WHERE pais_id = pais_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pais_insere` (INOUT `pais_nome` TEXT)  BEGIN
insert into pais(pais_nome) values(pais_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pais_update` (INOUT `pais_id` INT, INOUT `pais_nome` VARCHAR(50))  BEGIN
UPDATE pais SET pais_nome = pais_nome  WHERE pais_id = pais_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payments_delete` (INOUT `pay_id` INT)  BEGIN
DELETE FROM payments WHERE pay_id = pay_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payments_update` (INOUT `pay_id` INT, INOUT `pay_nome` VARCHAR(50))  BEGIN
UPDATE payments SET pay_nome = pay_nome WHERE pay_id = pay_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_payment_insere` (INOUT `pay_nome` TEXT)  BEGIN
insert into payments(pay_nome) values(pay_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_delete` (INOUT `pedi_id` INT)  BEGIN
DELETE FROM pedido WHERE pedi_id = pedi_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_insere` (INOUT `pedi_status` TEXT, INOUT `pedi_registro` DATE, INOUT `pedi_valortotal` DECIMAL, INOUT `post_id` INT, INOUT `pay_id` INT, INOUT `statuspe_id ` INT, INOUT `tiped_id` INT)  BEGIN 
insert into pedido(pedi_status, pedi_registro, pedi_valortotal, pay_id, statuspe_id, tiped_id) values(pedi_status, pedi_registro, pedi_valortotal, pay_id, statuspe_id, tiped_id); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_pedido_update` (INOUT `pedi_id` INT, INOUT `pedi_status` VARCHAR(50), INOUT `pedi_registro` DATE, INOUT `pedi_valortotal` DECIMAL, INOUT `post_id` INT, INOUT `pay_id` INT, IN `tiped_id` INT, IN `statuspe_id` INT)  BEGIN
UPDATE pedido SET pedi_status = pedi_status, pedi_registro = pedi_registro, pedi_valortotal = pedi_valortotal, post_id = post_id, pay_id = pay_id, tiped_id = tiped_id, statuspe_id = statuspe_id  WHERE pedi_id = pedi_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_plano_delete` (INOUT `plan_id` INT)  BEGIN
DELETE FROM plano WHERE plan_id = plan_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_plano_insere` (INOUT `plan_nome` TEXT)  BEGIN
insert into plano(plan_nome) values(plan_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_plano_update` (INOUT `plan_id` INT, INOUT `plan_nome` TEXT)  BEGIN
UPDATE plano SET plan_nome = plan_nome WHERE plan_id = plan_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_post_delete` (INOUT `post_id` INT)  BEGIN
DELETE FROM post WHERE post_id = post_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_post_insere` (IN `post_titulo` VARCHAR(50), IN `post_subtitulo` VARCHAR(50), IN `post_description` VARCHAR(50), IN `cat_id` INT, IN `user_id` INT)  BEGIN
insert into post(post_titulo, post_subtitulo, post_description, cat_id, user_id) values(post_titulo, post_subtitulo, post_description, cat_id, user_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_post_prova_delete` (INOUT `pro_id` INT, INOUT `post_id` INT)  BEGIN
DELETE FROM post_prova WHERE post_id = post_id AND pro_id = pro_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_post_prova_insere` (INOUT `post_id` INT, INOUT `pro_id` INT)  BEGIN
insert into post_prova(post_id, pro_id) values(post_id, pro_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_post_update` (IN `post_id` INT, IN `post_titulo` VARCHAR(50), IN `post_subtitulo` VARCHAR(50), IN `post_description` VARCHAR(150), IN `cat_id` INT)  BEGIN			
UPDATE post SET post_titulo = post_titulo, post_subtitulo = post_subtitulo,
post_description = post_description, cat_id = cat_id WHERE post_id = post_id;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prova_delete` (INOUT `pro_id` INT)  BEGIN
DELETE FROM prova WHERE pro_id = pro_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prova_insere` (INOUT `pro_nome` VARCHAR(50))  BEGIN
insert into prova(pro_nome) values(pro_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_prova_update` (INOUT `pro_id` INT, INOUT `pro_nome` VARCHAR(50))  BEGIN
UPDATE prova SET pro_nome = pro_nome WHERE pro_id = pro_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_questionario_delete` (INOUT `quest_id` INT)  BEGIN
DELETE FROM questionario WHERE quest_id = quest_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_questionario_insere` (INOUT `quest_pergunta` VARCHAR(50), INOUT `quest_a` VARCHAR(50), INOUT `quest_b` VARCHAR(50), INOUT `quest_c` VARCHAR(50), INOUT `quest_d` VARCHAR(50), INOUT `quest_e` VARCHAR(50), INOUT `pro_id` INT, INOUT `resp_id` INT)  BEGIN
insert into questionario(quest_pergunta, quest_a, quest_b, quest_c, quest_d, quest_e, pro_id, resp_id) values(quest_pergunta, quest_a, quest_b, quest_c, quest_d, quest_e, pro_id, resp_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_questionario_update` (INOUT `quest_id` INT, INOUT `quest_pergunta` VARCHAR(50), INOUT `quest_a` VARCHAR(50), INOUT `quest_b` VARCHAR(50), INOUT `quest_c` VARCHAR(50), INOUT `quest_d` VARCHAR(50), INOUT `quest_e` VARCHAR(50), INOUT `pro_id` INT, INOUT `resp_id` INT)  BEGIN
UPDATE questionario SET quest_pergunta = quest_pergunta, quest_a = quest_a, quest_b = quest_b, quest_c = quest_c, quest_d = quest_d, quest_e = quest_e, quest_a = quest_a WHERE quest_id = quest_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_resposta_delete` (INOUT `resp_id` INT)  BEGIN
DELETE FROM resposta WHERE resp_id = resp_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_resposta_insere` (INOUT `resp_official` VARCHAR(50), INOUT `resp_user` VARCHAR(50), INOUT `user_id` INT)  BEGIN
insert into resposta(resp_official, resp_user, user_id) values(resp_official, resp_user, user_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_resposta_update` (INOUT `resp_id` INT, INOUT `resp_official` VARCHAR(50), INOUT `resp_user` VARCHAR(50), INOUT `user_id` INT)  BEGIN
UPDATE resposta SET resp_official = resp_official, resp_user = resp_user, user_id = user_id   WHERE resp_id = resp_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_servico_insere` (IN `serv_preRequisitos` VARCHAR(150), IN `serv_beneficios` VARCHAR(150), IN `serv_prazo` INT, IN `serv_valor` VARCHAR(20), IN `serv_arquivo1` VARCHAR(220), IN `serv_arquivo2` VARCHAR(220), IN `serv_arquivo3` VARCHAR(220), IN `statusServ_id` INT, IN `postserv_id` INT)  INSERT INTO servico(serv_preRequisitos, serv_beneficios, serv_prazo, serv_valor, serv_arquivo1, serv_arquivo2, serv_arquivo3,	
statusServ_id,	postserv_id)

 VALUES (serv_preRequisitos, serv_beneficios, serv_prazo, serv_valor, serv_arquivo1, serv_arquivo2, serv_arquivo3,	
statusServ_id,	postserv_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_servico_update` (IN `serv_id` INT, IN `serv_preRequisito` VARCHAR(150), IN `serv_beneficios` VARCHAR(150), IN `serv_prazo` INT, IN `serv_imgProjeto_01` BLOB, IN `serv_imgProjeto_02` BLOB, IN `serv_imgProjeto_03` BLOB, IN `statusServ_id` INT)  UPDATE servico SET serv_valor = serv_valor, serv_preRequisito = serv_preRequisito,
serv_beneficios = serv_beneficios, serv_prazo = serv_prazo, serv_imgProjeto_01 = serv_imgProjeto_01, serv_imgProjeto_02 = serv_imgProjeto_02,
 serv_imgProjeto_03 = serv_imgProjeto_03, statusServ_id = statusServ_id  WHERE serv_id = serv_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_pedido_delete` (INOUT `statuspe_id` INT)  BEGIN
DELETE FROM status_pedido WHERE statuspe_id = statuspe_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_pedido_insere` (INOUT `statuspe_nome` VARCHAR(50), INOUT `statuspe_date` DATE)  BEGIN
insert into status_pedido(statuspe_nome, statuspe_date) values(statuspe_nome, statuspe_date);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_status_pedido_update` (INOUT `statuspe_id` INT, INOUT `statuspe_nome` VARCHAR(50), INOUT `statuspe_date` DATE)  BEGIN
UPDATE status_pedido SET statuspe_nome = statuspe_nome, statuspe_date = statuspe_date WHERE statuspe_id = statuspe_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_pedido_delete` (INOUT `tiped_id` INT)  BEGIN
DELETE FROM tipo_pedido WHERE tiped_id = tiped_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_pedido_insere` (INOUT `tiped_nome` VARCHAR(50))  BEGIN
insert into tipo_pedido(tiped_nome) values(tiped_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_pedido_update` (INOUT `tiped_id` INT, INOUT `tiped_nome` VARCHAR(50))  BEGIN
UPDATE tipo_pedido SET tiped_nome = tiped_nome WHERE tiped_id = tiped_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_post_insere` (INOUT `tipost_nome` VARCHAR(50))  BEGIN
insert into tipo_post(tipost_nome) values(tipost_nome);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_tipo_post_update` (INOUT `tipost_id` INT, INOUT `tipost__nome` VARCHAR(50))  BEGIN
UPDATE tipo_post SET tipost_nome = tipost_nome WHERE tipost_id = tipost_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_seguidor_delete` (INOUT `user_seguidor_id` INT)  BEGIN
DELETE FROM user_seguidor WHERE user_seguidor_id = user_seguidor_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_delete` (INOUT `usuario_id` INT)  BEGIN
DELETE FROM usuario WHERE usuario_id = usuario_id;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_insere` (IN `user_status` INT(50), IN `user_nome` VARCHAR(50), IN `user_email` VARCHAR(50), IN `user_senha` VARCHAR(100), IN `user_dataCadastro` DATE, IN `tiuser_id` INT, IN `user_ender_id` INT)  BEGIN
insert into usuario(user_status, user_nome,  user_email, user_senha, user_dataCadastro, tiuser_id, user_ender_id) values(user_status, user_nome, user_email, user_senha, user_dataCadastro, tiuser_id, user_ender_id);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario_update` (INOUT `usuario_id` INT, INOUT `user_nome` VARCHAR(50), INOUT `user_email` VARCHAR(50), INOUT `user_senha` VARCHAR(50))  BEGIN
UPDATE usuario SET   user_nome = user_nome, usuario_id = usuario_id, user_senha = user_senha WHERE usuario_id = usuario_id;
 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vaga_insere` (IN `vag_preRequisitos` VARCHAR(150), IN `vag_quantidade` INT, IN `vag_salario` VARCHAR(20), IN `escolaridade_id` INT, IN `statusvag_id` INT, IN `post_id` INT, IN `vag_beneficios` VARCHAR(150))  INSERT INTO vaga(vag_preRequisitos, vag_beneficios,	vag_quantidade,	vag_beneficios,	vag_salario,	escolaridade_id, statusvag_id,	post_id )
 VALUES (vag_preRequisitos,	vag_quantidade,	vag_beneficios,	vag_salario, escolaridade_id, statusvag_id,	post_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_vaga_update` (IN `vag_id` INT, IN `vag_preRequisitos` VARCHAR(150), IN `vag_quantidade` INT, IN `vag_salario` VARCHAR(20), IN `escolaridade_id` INT, IN `statusvag_id` INT, IN `vag_beneficios` VARCHAR(150))  UPDATE vaga SET vag_preRequisitos = vag_preRequisitos, vag_beneficios = vag_beneficios, vag_quantidade = vag_quantidade,
vag_salario = vag_salario, escolaridade_id = escolaridade_id, statusvag_id = statusvag_id WHERE vag_id = vag_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `accept