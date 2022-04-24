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
		$this->view([
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
			'meusGrupos' => $meusGrupos,
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

	public function grupoDelete($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();

		Grupo::grupoDelete($gr_id->parameter);
		Grupo::grupoUsuarioDelete($gr_id->parameter);

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

		Grupo::grupoUsuarioSair($gr_id->parameter, Session::get('USUARIO_ID'));

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

		$lin = Linguagem::getmeugrupoinformacoes();

		if ($planoDeNegocios[0] == null) {
			$haplanoDeNegocios = false;
		}

		$planoDeNegocios[0]['pn_id'];
		$planoDeNegocios[0]['pn_compreensao_de_mercado'];
		$planoDeNegocios[0]['pn_acompanhamento'];
		$planoDeNegocios[0]['pn_estrategias_de_venda'];
		$planoDeNegocios[0]['pn_projecao_financeira'];
		$planoDeNegocios[0]['pn_captacao_fundos_investimento'];
		$planoDeNegocios[0]['pn_grupo_id'];
		$planoDeNegocios[0]['pn_publico_alvo'];

		$grupo = new Grupo();

		$this->view([
			'html_lang' => $lin->html_lang,
			'title' => $lin->title,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'plano_text_h4' => $lin->plano_text_h4,
			'compreensao_de_mercado_text' => $lin->compreensao_de_mercado_text,
			'acompanhamento_text' => $lin->acompanhamento_text,
			'estrategias_text' => $lin->estrategias_text,
			'projecao_financeira_text' => $lin->projecao_financeira_text,
			'captacao_fundos_text' => $lin->captacao_fundos_text,
			'Publico_alvo_text' => $lin->Publico_alvo_text,
			'proposta_para_grupo' => $lin->proposta_para_grupo,
			'categoria' => $lin->categoria,
			'editar_h5' => $lin->editar_h5,
			'plano_negocios_h4' => $lin->plano_negocios_h4,
			'btn_usuarios' => $lin->btn_usuarios,
			'info' => $lin->info,
			'compreensao_de_mercado_required' => $lin->compreensao_de_mercado_required,
			'acompanhamento_required' => $lin->acompanhamento_required,
			'estrategias_required' => $lin->estrategias_required,
			'projecao_financeira_required' => $lin->projecao_financeira_required,
			'captacao_fundo_requireds' => $lin->captacao_fundo_requireds,
			'publico_alvo_required' => $lin->Publico_alvo_required,
			'compreensao_de_mercado' => $lin->compreensao_de_mercado,
			'acompanhamento' => $lin->acompanhamento,
			'estrategias' => $lin->estrategias,
			'projecao_financeira' => $lin->projecao_financeira,
			'captacao_fundos' => $lin->captacao_fundos,
			'publico_alvo' => $lin->publico_alvo,
			'btn_criar_proposta' => $lin->btn_criar_proposta,
			'btn_editar_proposta' => $lin->btn_editar_proposta,

			'session_id' => Session::get('USUARIO_ID'),
			'title' => $dadosgrupo['gr_nome'],
			'cg_nome' => $dadosgrupo[0]['cg_nome'],
			'grupo_nome' => $dadosgrupo[0]['gr_nome'],
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'haplanoDeNegocios' => $haplanoDeNegocios,
			'pn_id' => $planoDeNegocios[0]['pn_id'],
			'pn_compreensao_de_mercado' => $planoDeNegocios[0]['pn_compreensao_de_mercado'],
			'pn_acompanhamento' => $planoDeNegocios[0]['pn_acompanhamento'],
			'pn_estrategias_de_venda' => $planoDeNegocios[0]['pn_estrategias_de_venda'],
			'pn_projecao_financeira' => $planoDeNegocios[0]['pn_projecao_financeira'],
			'pn_captacao_fundos_investimento' => $planoDeNegocios[0]['pn_captacao_fundos_investimento'],
			'pn_grupo_id' => $planoDeNegocios[0]['pn_grupo_id'],
			'pn_publico_alvo' => $planoDeNegocios[0]['pn_publico_alvo'],
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

		$dadosgrupo = Usuario::getUsuariosgrupos($gr_id->parameter);
		$gruponome = Usuario::getUsuariosgrupo($gr_id->parameter);
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

		$getAdmingrupos = Usuario::getAdmingrupos($gr_id->parameter, Session::get('USUARIO_ID'));

		if ($getAdmingrupos[0] == null) {
			flash(['naoadmin' => "Você não é administrador desse grupo"]);
			redirecionar("/meusgrupos/grupousuarios/$gr_id->parameter");

		}

		$dadosgrupo = Usuario::getUsuariosgrupos($gr_id->parameter);
		$gruponome = Usuario::getUsuariosgrupo($gr_id->parameter);
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
			'pn_compreensao_de_mercado' => 'string',
			'pn_acompanhamento' => 'string',
			'pn_estrategias_de_venda' => 'string',
			'pn_projecao_financeira' => 'string',
			'pn_captacao_fundos_investimento' => 'string',
			'pn_grupo_id' => 'integer',
			'pn_publico_alvo' => 'string',

		]);

		$grupo = new Grupo();
		$pn = new PlanoDeNegocios();
		$pn->setPn_compreensao_de_mercado($v->pn_compreensao_de_mercado);
		$pn->setPn_estrategias_de_venda($v->pn_estrategias_de_venda);
		$pn->setPn_captacao_fundos_investimento($v->pn_captacao_fundos_investimento);
		$pn->setPn_acompanhamento($v->pn_acompanhamento);
		$pn->setPn_projecao_financeira($v->pn_projecao_financeira);
		$pn->setPn_publico_alvo($v->pn_publico_alvo);
		$pn->setPn_grupo_id($v->pn_grupo_id);
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
			'pn_compreensao_de_mercado' => 'string',
			'pn_acompanhamento' => 'string',
			'pn_estrategias_de_venda' => 'string',
			'pn_projecao_financeira' => 'string',
			'pn_captacao_fundos_investimento' => 'string',
			'pn_grupo_id' => 'integer',
			'pn_publico_alvo' => 'string',

		]);

		$grupo = new Grupo();
		$pn = new PlanoDeNegocios();
		$pn->setPn_compreensao_de_mercado($v->pn_compreensao_de_mercado);
		$pn->setPn_estrategias_de_venda($v->pn_estrategias_de_venda);
		$pn->setPn_captacao_fundos_investimento($v->pn_captacao_fundos_investimento);
		$pn->setPn_acompanhamento($v->pn_acompanhamento);
		$pn->setPn_projecao_financeira($v->pn_projecao_financeira);
		$pn->setPn_publico_alvo($v->pn_publico_alvo);
		$pn->setPn_grupo_id($v->pn_grupo_id);
		$pn->setPn_id($v->pn_id);
		$pn->updateplanoDeNegocios();

		redirecionar("/meusgrupos/informacoes/$v->pn_grupo_id");

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