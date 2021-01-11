
---------------------------------------------------------------------------
CREATE view  notification_mensagem_vaga AS select * from vaga_mensagem_link vml 
inner join vaga v on vml.vml_vaga_id = v.vag_id inner join post p on v.postvaga_id = p.post_id
---------------------------------------------------------------------------
CREATE VIEW notifications_servicos AS SELECT * FROM pedido p 
inner join usuario u on p.cliente_user_id = u.user_id
---------------------------------------------------------------------------
CREATE VIEW notifications_candidatoVaga AS SELECT * FROM candidato_vaga_link cvl 
inner join vaga v on cvl.cvlvag_id = v.vag_id inner join post p on v.postvaga_id = p.post_id
 inner join categoria cat on cat.cat_id = p.postcat_id
---------------------------------------------------------------------------
CREATE VIEW candidato_estadoCivil AS 
select * from candidato candc INNER JOIN estado_civil estc on candc.candestc_id = estc.estc_id
---------------------------------------------------------------------------
CREATE VIEW mysherepoint AS SELECT * FROM post p 
INNER JOIN categoria c ON p.postcat_id = c.cat_id
 INNER JOIN tipo_post tp on tp.tipopost_id = p.tipo_post_id 
 INNER JOIN endereco on endereco.ender_id = p.post_ender_id 
 inner join estado est on est.est_id = endereco.enderest_id 
 inner join shere sh ON p.post_id = sh.shere_post_id
  INNER JOIN usuario user ON user.user_id = sh.shere_user_id
-------------------------------------------------------------------------
drop view notifications_shere;
create view notifications_shere AS SELECT * FROM shere sh inner join
 tipo_post ti on ti.tipopost_id = sh.shere_ti_post inner join post p on
  p.post_id = sh.shere_post_id inner join categoria cat on cat.cat_id = p.postcat_id
----------------------------------------------------------------
CREATE VIEW dados_usuario_shere AS select * from post p 
inner join categoria c on p.postcat_id = c.cat_id
 inner join tipo_post tp on tp.tipopost_id = p.tipo_post_id 
 inner join shere sh on sh.shere_post_id = p.post_id
  inner join usuario u on u.user_id = sh.shere_user_id	
----------------------------------------------------------------
CREATE VIEW dados_usuario_post AS SELECT * from post p
 inner join categoria c on p.postcat_id = c.cat_id 
 inner join tipo_post tp on tp.tipopost_id = p.tipo_post_id 
 inner join usuario user on p.userpost_id = user.user_id
----------------------------------------------------------------
CREATE VIEW usuario_perfil AS select * from candidato c 
right join usuario u on c.canduser_id = u.user_id 
left join empresa e on e.empuser_id = u.user_id

----------------------------------------------------------------
DROP view empresa_candidato_vaga;
CREATE view empresa_candidato_vaga AS SELECT * FROM post p 
inner join vaga v on p.post_id = v.postvaga_id 
inner join candidato_vaga_link cvl on V.vag_id = cvl.cvlvag_id 
inner join candidato cand on cand.cand_id = cvl.cvlcand_id 
inner join usuario user on cand.canduser_id = user.user_id 
inner join endereco ender on ender.ender_id = u.user_ender_id 
	inner join estado est on est.est_id = ender.enderest_id 
----------------------------------------------------------------

CREATE view empresa_candidato_ficha AS SELECT * FROM post p 
inner join vaga v on p.post_id = v.postvaga_id 
inner join candidato_vaga_link cvl on V.vag_id = cvl.cvlvag_id 
inner join candidato cand on cand.cand_id = cvl.cvlcand_id 
left join fichaexperiecia fe on fe.candidato_id = cand.cand_id

----------------------------------------------------------------
CREATE VIEW candidato_quiz_resposta AS SELECT * FROM vaga v 
inner join vaga_prova_link vpl on v.vag_id = vpl.linkvag_id 
inner join prova pr on vpl.linkpro_id = pr.pro_id 
inner join quiz q on pr.pro_id = q.quizpro_id 
left join resposta_quiz respquiz on q.quiz_id = respquiz.respquiz_id 
 left join candidato cand on cand.cand_id = respquiz.requizcand_id
-------------------------------------------------------------------

CREATE VIEW candidato_prova_resposta AS SELECT * FROM vaga v 
inner join vaga_prova_link vpl on v.vag_id = vpl.linkvag_id 
inner join prova pr on vpl.linkpro_id = pr.pro_id 
inner join questionario q on pr.pro_id = q.questpro_id
 left join resposta resp on q.quest_id = resp.respquest_id
  LEFT join candidato cand on cand.cand_id = resp.respcand_id
-------------------------------------------------------------------

create view competencia_candidato AS select * FROM candidato cand
	inner join competencia_candidato_link ccl on cand.cand_id = ccl.compecand_id 
	inner join competencias comp on comp.comp_id = ccl.candcompe_id 
	inner JOIN competencia_categoria cc on cc.compcat_id = comp.compcate_id

-------------------------------------------------------------------
create view competencia_candidato AS select * FROM vaga vag 
	inner join competencia_vaga_link cvl on vag.vag_id =cvl.linkvag_id 
	inner join competencias comp on comp.comp_id = cvl.linkcomp_id 
	inner join competencia_categoria cc on cc.compcat_id = comp.compcate_id
---------------------------------------------------------------------------------
create view competencia_vagas AS select * FROM vaga vag 
	inner join competencia_vaga_link cvl on vag.vag_id =cvl.linkvag_id 
	inner join competencias comp on comp.comp_id = cvl.linkcomp_id 
	inner join competencia_categoria cc on cc.compcat_id = comp.compcate_id
---------------------------------------------------------------------------------
create view competencias_categorias AS select * from competencias c 
	inner join competencia_categoria cc on c.compcate_id = cc.compcat_id
------------------------------------------------------------------------------
create view candidato_check_prova_nota AS SELECT * FROM vaga v 
inner join vaga_prova_link vpl on v.vag_id = vpl.linkvag_id 
inner join prova pr on pr.pro_id = vpl.linkpro_id inner join nota n on pr.pro_id = n.notpro_id 
inner join candidato cand on n.notcand_id = cand.cand_id 
-------------------------------------------------------------------------------------

create view usuario_explore_servico AS 
select * from  usuario u 
inner join post p  on u.user_id  = p.userpost_id 
inner join categoria cat  on cat.cat_id = p.postcat_id 
inner join servico s  on p.post_id  =  s.postserv_id 
inner join  status_servico staserv  on staserv.statServ_id  = s.statusServ_id 
inner join endereco ender  on ender.ender_id = p.post_ender_id  
inner join  estado est on ender.enderest_id  =  est.est_id 
----------------------------------------------------------------------------------
drop view  candidato_servico;
create view candidato_servico AS 
select * from candidato c 
inner join usuario u  on c.canduser_id = u.user_id 
inner join post p  on u.user_id  = p.userpost_id 
inner join categoria cat  on cat.cat_id = p.postcat_id 
inner join servico s  on p.post_id  =  s.postserv_id 
inner join  status_servico staserv  on staserv.statServ_id  = s.statusServ_id 
inner join endereco ender  on ender.ender_id = p.post_ender_id  
inner join  estado est on ender.enderest_id  =  est.est_id 

--------------------------------------------------------

create view candidato_cadastro AS SELECT * from usuario u 
	inner join candidato c on c.canduser_id = u.user_id 
	inner join endereco ender on ender.ender_id = u.user_ender_id 
	inner join estado est on est.est_id = ender.enderest_id 
	left join fichaexperiecia fe on c.cand_id = fe.candidato_id

---------------------------------------------
create view empresa_cadastro AS SELECT * from empresa e 
inner join usuario u on e.empuser_id = u.user_id 
inner join endereco ender on ender.ender_id = u.user_ender_id 
inner join estado est on est.est_id = ender.enderest_id

------------------------------------------------------------------------------
create view empresa_quiz_pergunta AS select * from prova p 
	inner join quiz on p.pro_id = quiz.quizpro_id
-----------------------------------------------------
create view empresa_prova_pergunta AS 
select *  from prova p 
inner join  questionario q on p.pro_id = q.questpro_id
----------------------------------------------------------
create view post_vaga_prova AS select * FROM post p 
	inner join vaga vg on p.post_id = vg.postvaga_id 
	inner join vaga_prova_link vpl on vpl.linkvag_id = vg.vag_id 
	inner join prova pv on pv.pro_id = vpl.linkpro_id;    
----------------------------------------------------------
CREATE VIEW post_blog_categorias AS SELECT * FROM post p 
inner join blog bl on p.post_id = bl.blogpost_id 
inner join blog_categoria blc on bl.blog_categoria_id = blc.blogcat_id 
inner join blog_destaque bld on bld.blogdest_id = bl.blogdestaque_id

---------------------------------------------------------------

CREATE VIEW blog_post_categoria AS SELECT * from blog b 
inner join blog_categoria cat on b.blog_categoria_id = cat.blogcat_id 
inner join blog_destaque bd on b.blogdestaque_id = bd.blogdest_id
---------------------------------------------------------------
CREATE VIEW candidato_solicitacoes AS select * from candidato cand 
inner join usuario user on emp.empuser_id = user.user_id 
inner join solicitacoes soli on soli.soli_id = user.user_id 
inner join status_solicitacao statussoli on statussoli.status_soli_id = soli.soli_id 
inner join solicitacao_categoria solicat on solicat.solicat_id = soli.soli_id
---------------------------------------------------------------
CREATE VIEW empresa_solicitacoes AS select * from empresa emp 
inner join usuario user on emp.empuser_id = user.user_id 
inner join solicitacoes soli on soli.soli_id = user.user_id 
inner join status_solicitacao statussoli on statussoli.status_soli_id = soli.soli_id 
inner join solicitacao_categoria solicat on solicat.solicat_id = soli.soli_id
---------------------------------------------------------
CREATE VIEW pedidos_prestador_dados AS SELECT * FROM  usuario u 
inner join pedido_prestador pedipre ON u.user_id = pedipre.prestador_user_id 
inner join pedido pe on pedipre.prestador_pedi_id = pe.pedi_id inner join servico on.
---------------------------------------------------------------
CREATE VIEW candidato_prestador_pedidos AS SELECT * FROM candidato ca
 inner join usuario u on ca.canduser_id = u.user_id 
 inner join pedido_prestador pedipre ON u.user_id = pedipre.prestador_user_id
  inner join pedido pe on pedipre.prestador_pedi_id = pe.pedi_prestador_user_id
---------------------------------------------------------------
CREATE VIEW pedido_dados as select * from post p 
inner join endereco ender on p.post_ender_id = ender.ender_id 
inner join servico serv on p.post_id =serv.postserv_id 
inner join pedido pe on pe.pedi_serv_id = serv.serv_id 
-------------------------------------------------------------
CREATE VIEW empresa_dados
 AS SELECT * from empresa emp 
 inner join usuario u on emp.emp_id = u.user_id 
 inner join endereco ender on ender.ender_id =
  u.user_ender_id inner join estado est on 
  	 est.est_id =ender.enderest_id
-------------------------------------------------------------------
CREATE VIEW candidato_pedidos AS select * from candidato cand 
join usuario user on cand.canduser_id = user.user_id 
join pedido pedi on pedi.cliente_user_id = user.user_id
-------------------------------------------------------------------
CREATE VIEW pedido_detalhes AS select from  post   p  
inner join   endereco   ender   p.post_ender_id  =  ender.ender_id  
inner join   servico   serv   p.post_id  =  serv.postserv_id  
inner join   pedido   pe   pe.pedi_serv_id  =  serv.serv_id  
inner join   status_progress   stpro stpro.statusnumber_id  =  pe.status_number_id  
inner join   status_pedido   stpe stpe.statuspedi_id  =  pe.statuspe_id 

--------------------------------------------------------------------
CREATE VIEW candidato_prestador_pedidos AS SELECT * FROM candidato ca inner join usuario u on ca.canduser_id = u.user_id 
inner join pedido_prestador pedipre ON u.user_id = 
pedipre.prestador_user_id inner join pedido pe on pedipre.prestador_pedi_id = pe.pedi_prestador_user_id

--------------------------------------------------------------------
CREATE VIEW candidato_pedidos AS select * from candidato cand join usuario user on cand.canduser_id = user.user_id join pedido pedi on pedi.cliente_user_id = user.user_id

--------------------------------------------------------------------
CREATE VIEW empresa_pedidos AS select * from empresa emp 
inner join usuario user on emp.empuser_id = user.user_id 
inner join pedido pedi on pedi.cliente_user_id = user.user_id 
inner join servico serv on pedi.pedi_serv_id = serv.serv_id 
inner join post po on po.post_id = serv.postserv_id 
inner join status_pedido stpe on stpe.statuspedi_id = pedi.statuspe_id

-------------------------------------------------------------------
CREATE VIEW candidato_pedidos AS select * from candidato cand 
inner join usuario user on cand.canduser_id = user.user_id
 inner join pedido pedi on pedi.cliente_user_id = user.user_id 
 inner join servico serv on pedi.pedi_serv_id = serv.serv_id 
 inner join post po on po.post_id = serv.postserv_id 
 inner join status_pedido stpe on stpe.statuspedi_id = pedi.statuspe_id
-------------------------------------------------------------------
CREATE VIEW empresa_conta AS select * from empresa emp 
inner join usuario user on emp.empuser_id = user.user_id 
inner join conta_bancaria cont on cont.cont_user_id = user.user_id 
inner join conta_bancos cb on cb.bank_id = cont.cont_bank_id
----------------------------------------------------------------
CREATE VIEW candidato_conta AS select * from candidato cand 
inner join usuario user on cand.canduser_id = user.user_id 
inner join conta_bancaria cont on cont.cont_user_id = user.user_id 
inner join conta_bancos cb on cb.bank_id = cont.cont_bank_id
------------------------------------------
CREATE VIEW empresa_vaga AS select * from empresa e 
left join usuario u on e.empuser_id = u.user_id 
left join post p on u.user_id = p.userpost_id 
left join categoria c on c.cat_id = p.postcat_id left
 join VAGA v on p.post_id = v.postvaga_id  
 left join  status_vaga stavaga on stavaga.statusvag_id = v.vagstatus_id 
 join tipo_vaga tivaga on tivaga.tipovaga_id = v.tivaga_id 
 LEFT JOIN escolaridade esco on esco.esco_id = v.vagesco_id 
 left join endereco ender on ender.ender_id = p.post_ender_id 
 left join estado est on ender.enderest_id = est.est_id
 ------------------------------------------------------------
create view post_vaga  AS select * from empresa  emp left JOIN usuario_empresa_link uel on uel.emp_id_link = emp.emp_id left join usuario u on uel.user_id_link = u.user_id LEFT JOIN post p 
inner join categoria c on c.cat_id = p.postcat_id 
inner join vaga v on p.post_id = v.postvaga_id 
 inner join  status_vaga stavaga on stavaga.statusvag_id = v.vagstatus_id 
 inner join tipo_vaga tivaga on tivaga.tipovaga_id = v.tivaga_id 
 inner join escolaridade esco on esco.esco_id - v.vagesco_id 
 inner join endereco ender on ender.ender_id = p.post_ender_id 
 inner join estado est on ender.enderest_id = est.est_id
  
CREATE VIEW empresa_vaga AS SELECT* FROM empresa emp 
left JOIN usuario_empresa_link uel on uel.emp_id_link = emp.emp_id 
left join usuario u on uel.user_id_link = u.user_id LEFT JOIN post p on u.user_id = p.userpost_id 
LEFT JOIN categoria c on c.cat_id = p.postcat_id LEFT JOIN VAGA v on p.post_id = v.postvaga_id 
LEFT JOIN status_vaga stavaga on stavaga.statusvag_id = v.vagstatus_id JOIN tipo_vaga tivaga on tivaga.tipovaga_id = v.tivaga_id LEFT JOIN 
escolaridade esco on esco.esco_id = v.vagesco_id LEFT JOIN endereco ender on ender.ender_id = p.post_ender_id LEFT JOIN 
estado est on ender.enderest_id = est.est_id

CREATE VIEW post_vaga AS SELECT* FROM empresa emp INNER JOIN usuario_empresa_link uel   uel.emp_id_link = emp.emp_id inner join usuario u   uel.user_id_link = u.user_id INNER JOIN post p INNER JOIN categoria c   c.cat_id = p.postcat_id INNER JOIN vaga v   p.post_id = v.postvaga_id INNER JOIN status_vaga stavaga   stavaga.statusvag_id = v.vagstatus_id INNER JOIN tipo_vaga tivaga   tivaga.tipovaga_id = v.tivaga_id INNER JOIN escolaridade esco   esco.esco_id - v.vagesco_id INNER JOIN endereco ender   ender.ender_id = p.post_ender_id INNER JOIN estado est   ender.enderest_id = est.est_id

  ----------------------------------------------------------------
  create view empresa_servico AS select * from empresa e 
inner join usuario u  on e.empuser_id = u.user_id 
inner join post p  on u.user_id  = p.userpost_id 
inner join categoria c  on c.cat_id = p.postcat_id 
inner join servico s  on p.post_id  =  s.postserv_id 
inner join  status_servico staserv  on staserv.statServ_id  = s.statusServ_id 
inner join endereco ender  on ender.ender_id = p.post_ender_id  
inner join  estado est on ender.enderest_id  =  est.est_id 
----------------------------------------------------------------
  DROP view post_servico AS 
  create view usuario_post_servico AS select * from usuario u 
  	inner join post p on u.user_id = p.userpost_id 
  	inner join categoria c on c.cat_id = p.postcat_id 
  	inner join servico s on p.post_id = s.postserv_id 
  	inner join status_servico staserv on staserv.statServ_id = s.statusServ_id 
  	inner join endereco ender on ender.ender_id = p.post_ender_id 
  	inner join estado est on ender.enderest_id = est.est_id


