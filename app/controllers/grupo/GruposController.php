<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
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

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$this->view([
			'title' => 'SA | Categoria startup',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
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

		$getdadosGrupocategoria = Grupo::getdadosGrupocategoria($grcat_id->parameter, Session::get('USUARIO_ID'));
		if ($getdadosGrupocategoria[0] == null) {
			$getdadosGrupocategoria = Grupo::getGrupoCategoriaId($grcat_id->parameter);

		}

		//	debug($getdadosGrupocategoria);
		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'getdadosGrupocategoria' => $getdadosGrupocategoria,
			'catgr_id' => $grcat_id->parameter,
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

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

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
		$grupo->setGr_pais("Brasil");
		$gr_foto = Imagem::uploadImage($_FILES['gr_foto']);
		$grupo->setGr_foto($gr_foto);
		$grupo->setGrcat_id($v->grcat_id);
		$grupo->setGr_private($v->gu_private);

		$grupo->addGrupo();
		$getLastGrupo = $grupo->getLastGrupo();

		$grupo->setGu_user_admin_id(Session::get('USUARIO_ID'));
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($getLastGrupo[0]['gr_id']);
		$grupo->setGu_accept(1);

		$grupo->addgrupo_usuario();

		redirecionar("/grupos/grupo/$v->grcat_id");

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
		]);

		if ($v->gu_accept == 3) {
			Grupo::cancelaPedidoGrupo(Session::get('USUARIO_ID'), $v->gu_grupo_id);
			redirecionar("/grupos/grupo/$v->catgr_id");

		} else {

			$grupo->setGr_private($v->gr_private);
			$grupo->setGu_user_id(Session::get('USUARIO_ID'));
			$grupo->setGu_grupo_id($v->gu_grupo_id);
			$grupo->setGu_accept($v->gu_accept);
			$grupo->addgrupoMembro();
			redirecionar("/grupos/grupo/$v->catgr_id");

		}

	}

}
