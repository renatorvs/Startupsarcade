CREATE VIEW usuariogrupos as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id inner join usuario u on gu.gu_user_id = u.us_id
CREATE VIew dadosGrupo as SELECT * from categoria_grupo cg inner join grupo g on cg.cg_id = g.grcat_id inner join grupo_usuario gu on g.gr_id = gu.gu_grupo_id 
CREATE VIEW grupocategorias   AS select * from categoria_grupo cg inner join grupo g on( cg.cg_id = g.grcat_id)
