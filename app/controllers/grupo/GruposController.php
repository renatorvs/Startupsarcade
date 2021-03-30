<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\admin\Publicidade;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
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

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));

		$this->view([
			'title' => 'SA | Categoria startup',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.grupocategorias');
	}

	public function grupo($grcat_id) {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$getGruposAll = Grupo::getGruposAll($grcat_id->parameter, Session::get('PAIS_ID'));
		$getPublicidadeAll = Publicidade::getPublicidade();

		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getGruposAll,
			'catgr_id' => $grcat_id->parameter,
			'hacheckgrupos' => $hacheckgrupos,
			'checkgrupos' => $checkgrupos,
			's' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'getPublicidadeAll' => $getPublicidadeAll,

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

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
			'gu_private' => 'integer',
			'grcat_id' => 'integer',
		]);

		$grupo->setGr_nome($v->gr_nome);
		$grupo->setGr_descricao($v->gr_descricao);
		$grupo->setGr_cidade($v->gr_cidade);
		$grupo->setGr_estado($v->gr_estado);
		$grupo->setGr_pais(Session::get('PAIS_ID'));
		$gr_foto = Imagem::uploadImage($_FILES['gr_foto']);
		$grupo->setGr_foto($gr_foto);
		$grupo->setGrcat_id($v->grcat_id);
		$grupo->setGr_private($v->gu_private);

		$grupo->addGrupo();
		$getLastGrupo = $grupo->getLastGrupo();

		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($getLastGrupo[0]['gr_id']);
		$grupo->setGu_accept(2);
		$grupo->grupoadmin(Session::get('USUARIO_ID'), $getLastGrupo[0]['gr_id']);
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
		]);

		$checkuser = Grupo::checkgrupos(Session::get('USUARIO_ID'), $v->gu_grupo_id);

		$grupo->setGr_private($v->gr_private);
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($v->gu_grupo_id);
		$grupo->setGu_accept($v->gu_accept);

		if ($checkuser[0]['gu_accept'] == 3) {
			flash(['checkbloqueado' => "Você esta bloquado nesse grupo"]);
			redirecionar("/grupos/grupo/$v->catgr_id");
		} else if ($checkuser[0] != null) {
			flash(['checkgrupo' => "Você já mandou convite para esse grupo"]);

		} else {
			$grupo->addgrupoMembro();
			flash(['conviteenviado' => "Pedido enviado "]);

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

		$grupo = new Grupo();

		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'pais_id' => Session::get("PAIS_ID"),

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.grupoinformacoes');

	}

	public function usuarios($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();

		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
			'pais_id' => Session::get("PAIS_ID"),

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.grupousuarios');

	}
	public function grupospendentes($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll(Session::get('PAIS_ID'));

		$meusGrupos = Grupo::meusGruposPendentes(Session::get('USUARIO_ID'));

		$this->view([
			'title' => 'SA | Grupos startup',
			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

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

			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.perfil');

	}

}
