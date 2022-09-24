


drop view usuariogrupos;
CREATE VIEW usuariogrupos as SELECT * from categoria_grupo cg 
inner join grupo g on cg.cg_id = g.grcat_id 
inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id 
inner join usuario u on gu.gu_user_id = u.us_id 
left join grupo_admin ga on ga.adm_sub_user_id =u.us_id;


drop view usuariogrupospendentes;
CREATE VIEW usuariogrupospendentes as SELECT * from categoria_grupo cg 
inner join grupo g on cg.cg_id = g.grcat_id 
inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id 
inner join usuario u on gu.gu_user_id = u.us_id 
left join grupo_admin ga on ga.adm_sub_user_id =u.us_id;



drop view dadosGrupo;
CREATE VIew dadosGrupo as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_admin ga on ga.adm_grupo_id = g.gr_id;

drop VIEW grupocategorias;
CREATE VIEW grupocategorias   AS select * from categoria_grupo cg inner join grupo g on( cg.cg_id = g.grcat_id);

drop VIEW chatgrupomensagem;
create view chatgrupomensagem as  select * from mensagem m left join grupo_mensagem_link gml on m.msn_id = gml.gml_msn_id left join mensagem_dados_link mdl on gml.gmdl_id = mdl.mdl_id;

drop VIEW chatprivadomensagem;
create view chatprivadomensagem as  select * from mensagem m left join privado_mensagem_link pml on m.msn_id = pml.pml_msn_id right join mensagem_dados_link mdl on pml.pmld_id = mdl.mdl_id;

DROP VIEW propostagrupo; 
CREATE VIEW propostagrupo AS select * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id left join plano_de_negocios pn on g.gr_id = pn.pn_grupo_id;

DROP VIEW blog_categoria_post; 
CREATE VIEW blog_categoria_post AS SELECT * FROM blog_categoria bc inner join post p on bc.blogcat_id = p.postcat_id;

DROP VIEW blog_post_categoria; 
CREATE VIEW blog_post_categoria AS SELECT* FROM blog b inner join post p on b.blogpost_id = p.post_id INNER JOIN blog_categoria cat on p.postcat_id = cat.blogcat_id INNER JOIN blog_destaque bd on b.blogdestaque_id = bd.blogdest_id;

DROP VIEW usuario_notificantions_mensagem; 
CREATE VIEW usuario_notificantions_mensagem AS SELECT * FROM `grupo` g inner join grupo_mensagem_link gml on g.gr_id = gml.gml_grupo_id inner join mensagem m on gml.gml_msn_id = m.msn_id;

DROP VIEW exploregrupos; 
CREATE VIEW exploregrupos AS select * from categoria_grupo cg inner join grupo g  on cg.cg_id = g.grcat_id left join grupo_usuario gu on g.gr_id = gu.gu_grupo_id;


QUERY PARA NOTIFICAÇÃO 
	SELECT `us_id`, `us_nome`, `gr_id`,`gr_nome`,`gr_foto`,`gu_accept`,`gu_user_id`,`adm_flag` FROM usuariogrupospendentes
	 WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos` 
	 	WHERE gu_user_id = 3 and adm_flag = 1) and gu_accept = 1 GROUP BY us_id 
	 union all SELECT `us_id`, `us_nome`, `gr_id`,`gr_nome`,`gr_foto`,`gu_accept`,`gu_user_id`,`adm_flag` FROM usuariogrupospendentes 
	 WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos` 
	 	WHERE gu_user_id = 3 ) and `gu_accept` = 2 GROUP BY us_id ORDER by gu_user_id, us_id DESC

QUERY PARA NOTIFICAÇÃO  SERAPADA
	SELECT * FROM usuariogrupospendentes 
	WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos` 
		WHERE gu_user_id = 3 and adm_flag = 1) and gu_accept = 1;

	SELECT * FROM usuariogrupospendentes 
	WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos` 
		WHERE gu_user_id = 3 ) and `gu_accept` = 2 GROUP BY us_id ORDER by gu_user_id, us_id DESC


