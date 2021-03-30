


drop view usuariogrupos;
CREATE VIEW usuariogrupos as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id  inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id inner join usuario u on gu.gu_user_id = u.us_id inner join grupoadmin  ga on gu.gu_grupo_id = ga.adm_grupo_id;

drop view dadosGrupo;
CREATE VIew dadosGrupo as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id

drop VIEW grupocategorias;
CREATE VIEW grupocategorias   AS select * from categoria_grupo cg inner join grupo g on( cg.cg_id = g.grcat_id);

drop VIEW chatgrupomensagem;
create view chatgrupomensagem as  select * from mensagem m left join grupo_mensagem_link gml on m.msn_id = gml.gml_msn_id left join mensagem_dados_link mdl on gml.gmdl_id = mdl.mdl_id;

drop VIEW chatprivadomensagem;
create view chatprivadomensagem as  select * from mensagem m left join privado_mensagem_link pml on m.msn_id = pml.pml_msn_id right join mensagem_dados_link mdl on pml.pmld_id = mdl.mdl_id;

DROP VIEW propostagrupo; 

CREATE VIEW propostagrupo AS select * from ((`startuparcade`.`categoria_grupo` `cg` join `startuparcade`.`grupo` `g` on(`cg`.`cg_id` = `g`.`grcat_id`)) left join `startuparcade`.`plano_de_negocios` `pn` on(`g`.`gr_id` = `pn`.`pn_grupo_id`))
CREATE VIEW blog_post_categoria AS SELECT* FROM post p inner join blog b on p.post_id = b.blogpost_id INNER JOIN blog_categoria cat on b.blog_categoria_id = cat.blogcat_id INNER JOIN blog_destaque bd on b.blogdestaque_id = bd.blogdest_id

1
nato.re.vieira@gmail.com

2
usuario@gmail.com

3
usuario1@gmail.com