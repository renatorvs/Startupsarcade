CREATE VIEW usuariogrupos as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id inner join usuario u on gu.gu_user_id = u.us_id
CREATE VIew dadosGrupo as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id 

drop VIEW grupocategorias;
CREATE VIEW grupocategorias   AS select * from categoria_grupo cg inner join grupo g on( cg.cg_id = g.grcat_id)

drop VIEW chatgrupomensagem;
create view chatgrupomensagem as  select * from mensagem m left join grupo_mensagem_link gml on m.msn_id = gml.gml_msn_id left join mensagem_dados_link mdl on gml.gmdl_id = mdl.mdl_id

drop VIEW chatprivadomensagem;
create view chatprivadomensagem as  select * from mensagem m left join privado_mensagem_link pml on m.msn_id = pml.pml_msn_id left join mensagem_dados_link mdl on pml.pmld_id = mdl.mdl_id
