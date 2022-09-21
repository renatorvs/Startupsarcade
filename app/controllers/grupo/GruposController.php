<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Publicidade;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\models\grupo\PlanoDeNegocios;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class GruposController extends ContainerController {
	public function categorias() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$haNotsMessagem = false;
		$lin = Linguagem::grupoCategorias();

		//debug(Session::get('PAIS_ID'));
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));

		$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

		if ($notsMessagem[0]) {
			$haNotsMessagem = true;
		}

		$this->view([

			'description' => $lin->description,
			'admin_id' => Session::get("ADMIN_SESSION"),
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'explore_h4' => $lin->explore_h4,
			'btn_a_ver_grupo' => $lin->btn_a_ver_grupo,
			'grupos' => $lin->grupos,
			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),
			'haNotsMessagem' => $haNotsMessagem,
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupocategorias');
	}

	public function grupo($grcat_id) {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

		if ($notsMessagem[0]) {
			$haNotsMessagem = true;
		}

		$getGruposAll = Grupo::getGruposAll($grcat_id->parameter, Session::get('PAIS_ID'));
		$getPublicidadeAll = Publicidade::getPublicidade($grcat_id->parameter, Session::get('PAIS_ID'));

		$lin = Linguagem::getGrupo();
		//debug($lin);
		$idioma = Linguagem::getIdiomaSession();
		//	debug($idioma);
		$this->view([
			'title' => 'Planos',

			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'explore_h4' => $lin->explore_h4,
			'btn_a_ver_grupo' => $lin->btn_a_ver_grupo,
			'grupos' => $lin->grupos,
			'h5_grupo' => $lin->h5_grupo,
			'grupo_membro' => $lin->grupo_membro,
			'grupo_info' => $lin->grupo_info,
			'grupo_btn_aderir' => $lin->grupo_btn_aderir,
			'grupo_span' => $lin->grupo_span,
			'grupo' => $lin->grupo,
			'grupo_privado' => $lin->grupo_privado,

			'checkgrupo' => $lin->checkgrupo,
			'conviteenviado' => $lin->conviteenviado,
			'checkbloqueado' => $lin->checkbloqueado,
			'Pedidoaceito' => $lin->Pedidoaceito,

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getGruposAll,
			'catgr_id' => $grcat_id->parameter,
			'hacheckgrupos' => $hacheckgrupos,
			'checkgrupos' => $checkgrupos,
			'USUARIO_ID' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'getPublicidadeAll' => $getPublicidadeAll,

			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupo');
	}

	public function grupostore() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));

		$grupo = new Grupo();

		$v = Validate::validate([
			'gr_nome' => 'string',
			'gr_descricao' => 'string',
			'gr_cidade' => 'string',
			'gr_estado' => 'string',
			'gr_private' => 'integer',
			'grcat_id' => 'integer',
		]);

		$grupo->setGr_nome($v->gr_nome);
		$grupo->setGr_descricao($v->gr_descricao);
		$grupo->setGr_cidade($v->gr_cidade);
		$grupo->setGr_estado($v->gr_estado);
		$grupo->setGr_pais(Session::get('PAIS_ID'));

		if ($_FILES['us_foto']['name'] != null) {
			$us_foto = Imagem::uploadImage($_FILES['us_foto']);
			$grupo->setGr_foto($us_foto);
		} else {
			$us_foto = "starstup-logo.PNG";

			$grupo->setGr_foto($us_foto);

		}

		$grupo->setGrcat_id($v->grcat_id);
		$grupo->setGr_private($v->gr_private);

		$grupo->addGrupo();
		$getLastGrupo = $grupo->getLastGrupo();

		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($getLastGrupo[0]['gr_id']);
		$grupo->setGu_accept(2);

		$grupo->grupoadmin(Session::get('USUARIO_ID'), Session::get('USUARIO_ID'), $getLastGrupo[0]['gr_id'], 1);
		$grupo->addgrupo_usuario();

		redirecionar("/meusgrupos/informacoes/" . $getLastGrupo[0]['gr_id']);

	}

	public function aderirgrupo() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();

		$v = Validate::validate([
			'gu_accept' => 'integer',
			'gu_private' => 'integer',
			'gu_grupo_id' => 'integer',
			'catgr_id' => 'integer',
			'redirect' => 'integer',
			'adm_user_id' => 'integer',
		]);

		$checkuser = Grupo::checkgrupos(Session::get('USUARIO_ID'), $v->gu_grupo_id);

		$grupo->setGr_private($v->gr_private);
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($v->gu_grupo_id);
		$grupo->setGu_accept($v->gu_accept);

		$lin = Linguagem::getGrupo();

		if ($checkuser[0]['gu_accept'] == 3) {
			flash(['checkbloqueado' => $lin->checkbloqueado]);
			redirecionar("/grupos/grupo/$v->catgr_id");
		} else if ($v->gu_accept == 2) {
			flash(['pedidoaceito' => $lin->pedidoaceito]);
			$grupo->grupoadmin($v->adm_user_id, Session::get('USUARIO_ID'), $v->gu_grupo_id, 0);

			$grupo->addgrupoMembro();
		} else if ($checkuser[0] == 1) {
			flash(['checkgrupo' => $lin->checkgrupo]);
		} else {
			$grupo->addgrupoMembro();
			flash(['conviteenviado' => $lin->conviteenviado]);

		}

		redirecionar("/grupos/grupo/$v->catgr_id");

	}

	public function informacoes($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

		if ($notsMessagem[0]) {
			$haNotsMessagem = true;
		}

		$lin = Linguagem::getGrupoInformacoes();

		$grupo = new Grupo();
		$getGruposAll = Grupo::getGruposPlanosAll($gr_id->parameter, Session::get('PAIS_ID'));

		//debug($getGruposAll);
		$dadosgrupo = PlanoDeNegocios::getpropostaGrupo($gr_id->parameter);
		$planoDeNegocios = PlanoDeNegocios::getPlanoDeNegocios($gr_id->parameter);
		$haplanoDeNegocios = true;
		if ($planoDeNegocios[0] == null) {
			$haplanoDeNegocios = false;
		}

		$grupo = new Grupo();

		$this->view([
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'session_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get('PAIS_ID'),
			'title' => $dadosgrupo['gr_nome'],
			'html_lang' => $lin->html_lang,
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
			'pn_cv_proposta_valor' => $$lin->pn_cv_proposta_valor,
			'pn_cv_segmentacao' => $$lin->pn_cv_segmentacao,
			'pn_cv_canais' => $lin->pn_cv_canais,
			'pn_cv_relacionamento' => $lin->pn_cv_relacionamento,
			'pn_cv_receitas' => $lin->pn_cv_receitas,
			'pn_cv_recursos' => $lin->pn_cv_recursos,
			'pn_cv_atividades' => $lin->pn_cv_atividades,
			'pn_cv_parcerias' => $lin->pn_cv_parcerias,
			'pn_cv_estrutura_de_custos' => $lin->pn_cv_estrutura_de_custos,

			'pn_cv_proposta_valor_required' => $$lin->pn_cv_proposta_valor_required,
			'pn_cv_segmentacao_required' => $$lin->pn_cv_segmentacao_required,
			'pn_cv_canais_required' => $lin->pn_cv_canais_required,
			'pn_cv_relacionamento_required' => $lin->pn_cv_relacionamento_required,
			'pn_cv_receitas_required' => $lin->pn_cv_receitas_required,
			'pn_cv_recursos_required' => $lin->pn_cv_recursos_required,
			'pn_cv_atividades_required' => $lin->pn_cv_atividades_required,
			'pn_cv_parcerias_required' => $lin->pn_cv_parcerias_required,
			'pn_cv_estrutura_de_custos_required' => $lin->pn_cv_estrutura_de_custos_required,

			'btn_criar_proposta' => $lin->btn_criar_proposta,
			'btn_editar_proposta' => $lin->btn_editar_proposta,
			'cg_nome' => $dadosgrupo[0]['cg_nome'],
			'grupo_nome' => $dadosgrupo[0]['gr_nome'],
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'haplanoDeNegocios' => $haplanoDeNegocios,
			'pn_grupo_id' => $planoDeNegocios[0]['pn_grupo_id'],
			'grupo_id' => $gr_id->parameter,
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

			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupoinformacoes');

	}

	public function usuarios($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

		if ($notsMessagem[0]) {
			$haNotsMessagem = true;
		}

		$lin = Linguagem::getGrupoInformacoes();

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
			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.grupousuarios');

	}
	public function grupospendentes($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

		if ($notsMessagem[0]) {
			$haNotsMessagem = true;
		}

		$lin = Linguagem::getgrupospendentes();

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));
		$meusGrupos = Grupo::meusGruposPendentes(Session::get('USUARIO_ID'));

		$this->view([
			'html_lang' => $lin->html_lang,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'title' => $lin->title,
			'meta_charset' => $lin->meta_charset,
			'h5_pendencia' => $lin->h5_pendencia,
			'h5_n_pendencia' => $lin->h5_n_pendencia,
			'btn_cancelar_pedido' => $lin->btn_cancelar_pedido,
			'btn_grupo' => $lin->btn_grupo,

			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.grupospendentes');

	}

	public function perfil($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$meusGrupos = Grupo::meusGruposPendentes(Session::get('USUARIO_ID'));

		$this->view([
			'title' => 'SA | Grupos startup',
			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.perfil');

	}

}
