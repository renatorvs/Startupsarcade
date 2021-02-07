


drop view usuariogrupos;
CREATE VIEW usuariogrupos as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id inner join usuario u on gu.gu_user_id = u.us_id left join  grupoadmin  ga on u.us_id = ga.adm_user_id;

drop view dadosGrupo;
CREATE VIew dadosGrupo as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id

drop VIEW grupocategorias;
CREATE VIEW grupocategorias   AS select * from categoria_grupo cg inner join grupo g on( cg.cg_id = g.grcat_id);

drop VIEW chatgrupomensagem;
create view chatgrupomensagem as  select * from mensagem m left join grupo_mensagem_link gml on m.msn_id = gml.gml_msn_id left join mensagem_dados_link mdl on gml.gmdl_id = mdl.mdl_id;

drop VIEW chatprivadomensagem;
create view chatprivadomensagem as  select * from mensagem m left join privado_mensagem_link pml on m.msn_id = pml.pml_msn_id left join mensagem_dados_link mdl on pml.pmld_id = mdl.mdl_id;


SELECT * FROM grupo g inner join usuariogrupos u on g.gr_id = u.gr_id inner join usuario us on u.gu_user_id = us.us_id
SELECT * FROM grupo g right join usuariogrupos u on g.gr_id = u.gr_id 

SELECT * FROM grupo g left join usuariogrupos u on g.gr_id = u.gr_id right join usuario us on u.gu_user_id = us.us_id apeans user/ não cadastra nada

1
nato.re.vieira@gmail.com

2
usuario@gmail.com

3
usuario1@gmail.com