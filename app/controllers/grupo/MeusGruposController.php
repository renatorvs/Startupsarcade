<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\models\grupo\PlanoDeNegocios;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;
use app\classes\Uri;

class MeusgruposController extends ContainerController {
	public function grupos() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$lin = Linguagem::getMeusGrupos();

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));
		$meusGrupos = Grupo::meusGrupos(Session::get('USUARIO_ID'));
			$meusGruposUrl = Uri::encodeUrlFactorylink($meusGrupos, "grupo");


		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => $lin->title,
			'titulo_h4' => $lin->titulo_h4,
			'atencao_h5' => $lin->atencao_h5,
			'projeto_statup' => $lin->projeto_statup,
			'projeto_statup_requered' => $lin->projeto_statup_requered,
			'plano_de_negocio' => $lin->plano_de_negocio,
			'plano_de_negocio_requered' => $lin->plano_de_negocio_requered,
			'label' => $lin->label,
			'label_cidade' => $lin->label_cidade,
			'label_cidade_requered' => $lin->label_cidade_requered,
			'label_estado' => $lin->label_estado,
			'label_grupo_foto' => $lin->label_grupo_foto,
			'label_grupo_privado' => $lin->label_grupo_privado,
			'option_privado_s' => $lin->option_privado_s,
			'option_privado_n' => $lin->option_privado_n,
			'label_grupo_starstup_categoria' => $lin->label_grupo_starstup_categoria,
			'grupo_model_deseja_excluir' => $lin->grupo_model_deseja_excluir,
			'grupo_privado' => $lin->grupo_privado,
			'grupo_membros' => $lin->grupo_membros,
			'grupo_info' => $lin->grupo_info,
			'btn_grupo_visitar' => $lin->btn_grupo_visitar,
			'btn_grupo_editar' => $lin->btn_grupo_editar,
			'btn_grupo_excluir_sair' => $lin->btn_grupo_excluir_sair,
			'btn_grupo_excluir' => $lin->btn_grupo_excluir,
			'btn_grupo_sair' => $lin->btn_grupo_sair,
			'btn_salvar' => $lin->btn_salvar,
			'btn_grupo_criar' => $lin->btn_grupo_criar,
			'meusGrupos' => $meusGruposUrl,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.meusgrupos');
	}

	public function grupoUsuarioUpdate() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));

		$grupo = new Grupo();

		$v = Validate::validate([
			'gr_id' => 'integer',
			'gr_nome' => 'string',
			'gr_descricao' => 'string',
			'gr_cidade' => 'string',
			'gr_estado' => 'string',
			'gr_private' => 'integer',
			'grcat_id' => 'integer',
			'grcat_id' => 'integer',
			'gr_old_foto' => 'string',
		]);

		//	debug($v);

		$grupo->setGr_id($v->gr_id);
		$grupo->setGr_nome($v->gr_nome);
		$grupo->setGr_descricao($v->gr_descricao);
		$grupo->setGr_cidade($v->gr_cidade);
		$grupo->setGr_estado($v->gr_estado);

		if ($_FILES['gr_foto']['name'] == null or $_FILES['gr_foto']['name'] == NULL) {
			$grupo->setGr_foto($v->gr_old_foto);
		} else {

			$gr_foto = Imagem::uploadImage($_FILES['gr_foto']);
			$grupo->setGr_foto($gr_foto);
		}
		$grupo->setGrcat_id($v->grcat_id);

		$grupo->setGu_grupo_id($v->gr_id);
		$grupo->setGr_private($v->gr_private);
		//debug($grupo->getGr_private());

		$grupo->grupoUpdate();

		redirecionar('\meusgrupos\grupos');

	}

	public function grupodelete($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();
		$decodegrid =  Uri::decodeUrlFactorylink($gr_id->parameter);

		Grupo::grupoDelete($decodegrid);
		Grupo::grupoUsuarioDelete($decodegrid);

		redirecionar('\meusGrupos\grupos');

	}
	public function grupoDeleteUsuario($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();

		$decodegrid =  Uri::decodeUrlFactorylink($gr_id->parameter);
		Grupo::grupoUsuarioSair($decodegrid, Session::get('USUARIO_ID'));

		redirecionar('\meusgrupos\grupos');

	}
	public function grupoDeleteUsuarioSair($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'gu_grupo_id' => 'integer',
			'us_id' => 'integer',

		]);

		$grupo = new Grupo();

		Grupo::grupoUsuarioSair($v->gu_grupo_id, $v->us_id);

		redirecionar("/meusgrupos/grupousuariosadmin/$v->gu_grupo_id");

	}

	public function informacoes($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$dadosgrupo = PlanoDeNegocios::getpropostaGrupo($gr_id->parameter);

		$planoDeNegocios = PlanoDeNegocios::getPlanoDeNegocios($gr_id->parameter);
		$haplanoDeNegocios = true;
		//debug($dadosgrupo);

		$lin = Linguagem::getMeuGrupoInformacoes();

		if ($planoDeNegocios[0] == null) {
			$haplanoDeNegocios = false;
		}

		$grupo = new Grupo();

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'html_lang' => $lin->html_lang,
			'title' => $lin->title,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,

			'plano_text_h4_info' => $lin->plano_text_h4_info,
			'plano_text_h6_info' => $lin->plano_text_h6_info,
			'plano_text_h4' => $lin->plano_text_h4,
			'plano_text_h5' => $lin->plano_text_h5,

			'cv_proposta_valor_text' => $lin->cv_proposta_valor_text,
			'cv_segmentacao_text' => $lin->cv_segmentacao_text,
			'cv_canais_text' => $lin->cv_canais_text,
			'cv_relacionamento_text' => $lin->cv_relacionamento_text,
			'cv_atividades_text' => $lin->cv_atividades_text,
			'cv_parcerias_text' => $lin->cv_parcerias_text,
			'cv_recursos_text' => $lin->cv_recursos_text,
			'cv_receitas_text' => $lin->cv_receitas_text,
			'cv_estrutura_de_custos_text' => $lin->cv_estrutura_de_custos_text,

			'proposta_para_grupo' => $lin->proposta_para_grupo,
			'categoria' => $lin->categoria,
			'editar_h5' => $lin->editar_h5,
			'plano_negocios_h4' => $lin->plano_negocios_h4,
			'btn_usuarios' => $lin->btn_usuarios,
			'info' => $lin->info,
			'cv_proposta_valor' => $lin->cv_proposta_valor,
			'cv_segmentacao' => $lin->cv_segmentacao,
			'cv_canais' => $lin->cv_canais,
			'cv_relacionamento' => $lin->cv_relacionamento,
			'cv_receitas' => $lin->cv_receitas,
			'cv_recursos' => $lin->cv_recursos,
			'cv_atividades' => $lin->cv_atividades,
			'cv_parcerias' => $lin->cv_parcerias,
			'cv_estrutura_de_custos' => $lin->cv_estrutura_de_custos,

			'pn_cv_proposta_valor_required' => $lin->pn_cv_proposta_valor_required,
			'pn_cv_segmentacao_required' => $lin->pn_cv_segmentacao_required,
			'pn_cv_canais_required' => $lin->pn_cv_canais_required,
			'pn_cv_relacionamento_required' => $lin->pn_cv_relacionamento_required,
			'pn_cv_receitas_required' => $lin->pn_cv_receitas_required,
			'pn_cv_recursos_required' => $lin->pn_cv_recursos_required,
			'pn_cv_atividades_required' => $lin->pn_cv_atividades_required,
			'pn_cv_parcerias_required' => $lin->pn_cv_parcerias_required,
			'pn_cv_estrutura_de_custos_required' => $lin->pn_cv_estrutura_de_custos_required,

			'publico_alvo' => $lin->publico_alvo,
			'btn_criar_proposta' => $lin->btn_criar_proposta,
			'btn_editar_proposta' => $lin->btn_editar_proposta,

			'session_id' => Session::get('USUARIO_ID'),
			'cg_nome' => $dadosgrupo[0]['cg_nome'],
			'grupo_nome' => $dadosgrupo[0]['gr_nome'],
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'haplanoDeNegocios' => $haplanoDeNegocios,
			'pn_id' => $planoDeNegocios[0]['pn_id'],
			'pn_cv_proposta_valor' => $planoDeNegocios[0]['pn_cv_proposta_valor'],
			'pn_cv_segmentacao' => $planoDeNegocios[0]['pn_cv_segmentacao'],
			'pn_cv_canais' => $planoDeNegocios[0]['pn_cv_canais'],
			'pn_cv_relacionamento' => $planoDeNegocios[0]['pn_cv_relacionamento'],
			'pn_cv_receitas' => $planoDeNegocios[0]['pn_cv_receitas'],
			'pn_cv_recursos' => $planoDeNegocios[0]['pn_cv_recursos'],
			'pn_cv_atividades' => $planoDeNegocios[0]['pn_cv_atividades'],
			'pn_cv_parcerias' => $planoDeNegocios[0]['pn_cv_parcerias'],
			'pn_cv_estrutura_de_custos' => $planoDeNegocios[0]['pn_cv_estrutura_de_custos'],
			'grupo_id' => $gr_id->parameter,
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.meugrupoinformacoes');

	}

	public function grupousuarios($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$lin = Linguagem::getgrupousuarios();
		$decodegrid =  Uri::decodeUrlFactorylink($gr_id->parameter);

		$dadosgrupo = Usuario::getUsuariosgrupos($decodegrid);
		$gruponome = Usuario::getUsuariosgrupo($decodegrid);
		$hadadosgrupo = true;
		if ($dadosgrupo[0] == null) {
			$hadadosgrupo = false;
		}
		//debug($dadosgrupo);
		$grupo = new Grupo();
		$this->view([
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'meus_grupos' => $lin->meus_grupos,
			'btn_admin' => $lin->btn_admin,
			'cod_grupo' => $lin->cod_grupo,
			'btn_enviar' => $lin->btn_enviar,
			'strong_danger' => $lin->strong_danger,
			'adm_user' => $lin->adm_user,
			'cod_usuario' => $lin->cod_usuario,
			'gruponome' => $gruponome,
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'meusgrupos' => $dadosgrupo,
			'grupo_id' => $gr_id->parameter,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupousuarios');

	}

	public function grupousuariosadmin($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$lin = Linguagem::getgrupousuariosadmin();

		$decodegrid =  Uri::decodeUrlFactorylink($gr_id->parameter);

		$getAdmingrupos = Usuario::getAdmingrupos($decodegrid, Session::get('USUARIO_ID'));

		if ($getAdmingrupos[0] == null) {
			flash(['naoadmin' => "Você não é administrador desse grupo"]);
			redirecionar("/meusgrupos/grupousuarios/$gr_id->parameter");

		}

		$dadosgrupo = Usuario::getUsuariosgrupos($decodegrid);
		$gruponome = Usuario::getUsuariosgrupo($decodegrid);
		$hadadosgrupo = true;
		if ($dadosgrupo[0] == null) {
			$hadadosgrupo = false;
		}
		//	debug($dadosgrupo);
		$grupo = new Grupo();
		$this->view([

			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'meus_grupos' => $lin->meus_grupos,
			'btn_admin' => $lin->btn_admin,
			'cod_grupo' => $lin->cod_grupo,
			'btn_enviar' => $lin->btn_enviar,
			'strong_danger' => $lin->strong_danger,
			'adm_user' => $lin->adm_user,
			'cod_usuario' => $lin->cod_usuario,
			'btn_excluir' => $lin->btn_excluir,
			'btn_bloquear' => $lin->btn_bloquear,
			'btn_desbloquear' => $lin->btn_desbloquear,
			'btn_perfil' => $lin->btn_perfil,
			'btn_admin' => $lin->btn_admin,

			'gruponome' => $gruponome,
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'meusgrupos' => $dadosgrupo,
			'grupo_id' => $gr_id->parameter,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get('PAIS_ID'),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupousuariosadmin');

	}

	public function meusgruposinfostore() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'pn_id' => 'integer',
			'pn_grupo_id' => 'integer',
			'pn_cv_proposta_valor' => 'string',
			'pn_cv_segmentacao' => 'string',
			'pn_cv_canais' => 'string',
			'pn_cv_relacionamento' => 'string',
			'pn_cv_receitas' => 'string',
			'pn_cv_recursos' => 'string',
			'pn_cv_atividades' => 'string',
			'pn_cv_parcerias' => 'string',
			'pn_cv_estrutura_de_custos' => 'string',

		]);

		$grupo = new Grupo();
		$pn = new PlanoDeNegocios();

		$pn->getPn_grupo_id($v->pn_grupo_id);
		$pn->getPn_id($v->pn_id);
		$pn->getPn_cv_proposta_valor($v->pn_cv_proposta_valor);
		$pn->getPn_cv_segmentacao($v->pn_cv_segmentacao);
		$pn->getPn_cv_canais($v->pn_cv_canais);
		$pn->getPn_cv_relacionamento($v->pn_cv_relacionamento);
		$pn->getPn_cv_receitas($v->pn_cv_receitas);
		$pn->getPn_cv_recursos($v->pn_cv_recursos);
		$pn->getPn_cv_atividades($v->pn_cv_atividades);
		$pn->getPn_cv_parcerias($v->pn_cv_parcerias);
		$pn->getPn_cv_estrutura_de_custos($v->pn_cv_estrutura_de_custos);

		$pn->addPlanoDeNegocios();

		redirecionar("/meusgrupos/informacoes/$v->pn_grupo_id");

	}

	public function meusgruposinfoupdate($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'pn_id' => 'integer',
			'pn_grupo_id' => 'integer',
			'pn_cv_proposta_valor' => 'string',
			'pn_cv_segmentacao' => 'string',
			'pn_cv_canais' => 'string',
			'pn_cv_relacionamento' => 'string',
			'pn_cv_receitas' => 'string',
			'pn_cv_recursos' => 'string',
			'pn_cv_atividades' => 'string',
			'pn_cv_parcerias' => 'string',
			'pn_cv_estrutura_de_custos' => 'string',

		]);

		$grupo = new Grupo();
		$pn = new PlanoDeNegocios();
		$pn->getPn_grupo_id($v->pn_grupo_id);
		$pn->getPn_id($v->pn_id);
		$pn->getPn_cv_proposta_valor($v->pn_cv_proposta_valor);
		$pn->getPn_cv_segmentacao($v->pn_cv_segmentacao);
		$pn->getPn_cv_canais($v->pn_cv_canais);
		$pn->getPn_cv_relacionamento($v->pn_cv_relacionamento);
		$pn->getPn_cv_receitas($v->pn_cv_receitas);
		$pn->getPn_cv_recursos($v->pn_cv_recursos);
		$pn->getPn_cv_atividades($v->pn_cv_atividades);
		$pn->getPn_cv_parcerias($v->pn_cv_parcerias);
		$pn->getPn_cv_estrutura_de_custos($v->pn_cv_estrutura_de_custos);

		$pn->updateplanoDeNegocios();

		redirecionar("/meusgrupos/informacoes/" . $v->pn_grupo_id);

	}

	public function gruposconvites($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		//$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$lin = Linguagem::getgrupoconvites();

		$meusgruposConvites = Grupo::meusGruposConvites(Session::get('USUARIO_ID'));

		// :debug($meusGruposConvites);
		$this->view([
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'convite_convites_h4' => $lin->convite_convites_h4,
			'convite_grupo_h4' => $lin->convite_grupo_h4,
			'convite_categoria_h5' => $lin->convite_categoria_h5,
			'nao_ha_convite_h3' => $lin->nao_ha_convite_h3,
			'btn_cancelar' => $lin->btn_cancelar,
			'btn_aceitar' => $lin->btn_aceitar,

			'meusGruposConvite' => $meusGruposConvites,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $meusGruposConvites,
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.gruposconvites');

	}

	public function admin($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'gu_grupo_id' => 'integer',
			'adm_sub_user_id' => 'integer',
			'adm_user_id' => 'integer',
			'admin' => 'integer',
			'admin_id' => 'integer',

		]);

		if ($v->adm_sub_user_id == $v->adm_user_id) {
			flash(['admin' => "ADMIN VITALICO "]);
			redirecionar("/meusgrupos/grupousuariosadmin/$v->gu_grupo_id");
		}

		Grupo::updateAdmin($v->admin, $v->adm_sub_user_id, $v->gu_grupo_id);
		redirecionar("/meusgrupos/grupousuarios/$v->gu_grupo_id");

		redirecionar("/meusgrupos/grupousuariosadmin/$v->gu_grupo_id");

	}

	public function bloquear($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'gu_grupo_id' => 'integer',
			'adm_sub_user_id' => 'integer',

		]);

		Grupo::bloquear($v->adm_sub_user_id, $v->gu_grupo_id);
		redirecionar("/meusgrupos/grupousuariosadmin/$v->gu_grupo_id");

	}

	public function desbloquear($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$v = Validate::validate([
			'gu_grupo_id' => 'integer',
			'adm_sub_user_id' => 'integer',

		]);
		Grupo::desbloquear($v->adm_sub_user_id, $v->gu_grupo_id);
		redirecionar("/meusgrupos/grupousuariosadmin/$v->gu_grupo_id");

	}

}