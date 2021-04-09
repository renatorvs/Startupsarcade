<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
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
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));
		$meusGrupos = Grupo::meusGrupos(Session::get('USUARIO_ID'));
		$this->view([
			'title' => 'SA | Grupos startup',
			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.meusGrupos');
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

		redirecionar('\meusGrupos\grupos');

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

		redirecionar('\meusGrupos\grupos');

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

		$dadosgrupo = Usuario::getUsuariosgrupos($gr_id->parameter);
		$gruponome = Usuario::getUsuariosgrupo($gr_id->parameter);
		$hadadosgrupo = true;
		if ($dadosgrupo[0] == null) {
			$hadadosgrupo = false;
		}
		//debug($dadosgrupo);
		$grupo = new Grupo();
		$this->view([

			'gruponome' => $gruponome,
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'meusGrupos' => $dadosgrupo,
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

		$dadosgrupo = Usuario::getUsuariosgrupos($gr_id->parameter);
		$gruponome = Usuario::getUsuariosgrupo($gr_id->parameter);
		$hadadosgrupo = true;
		if ($dadosgrupo[0] == null) {
			$hadadosgrupo = false;
		}
		//	debug($dadosgrupo);
		$grupo = new Grupo();
		$this->view([

			'gruponome' => $gruponome,
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'meusGrupos' => $dadosgrupo,
			'grupo_id' => $gr_id->parameter,
			'usuario_id' => Session::get('USUARIO_ID'),
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

		redirecionar("/meusGrupos/informacoes/$v->pn_grupo_id");

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

		redirecionar("/meusGrupos/informacoes/$v->pn_grupo_id");

	}

	public function gruposconvites($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		//$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$meusGruposConvites = Grupo::meusGruposConvites(Session::get('USUARIO_ID'));

		// :debug($meusGruposConvites);
		$this->view([
			'title' => 'SA | Grupos startup',
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

		///debug($v);
		if ($v->admin == 1) {
			Grupo::deletegrupoadmin($v->admin_id, $v->adm_user_id, $v->adm_sub_user_id, $v->gu_grupo_id);
		} else if ($v->admin == 0) {
			Grupo::addusuarioadmin($v->adm_user_id, $v->adm_sub_user_id, $v->gu_grupo_id);

		}

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