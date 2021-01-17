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
		$getGrupoCategoria = Grupo::getGrupoCategoriaId($grcat_id->parameter);
		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'getGrupoCategoria' => $getGrupoCategoria,
			'listEstados' => Estado::listEstados(),
			'session' => Session::get('USUARIO_ID'),
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

		$grupo->addGrupo();
		$getLastGrupo = $grupo->getLastGrupo();

		$grupo->setGu_private($v->gu_private);
		$grupo->setGu_user_admin_id(Session::get('USUARIO_ID'));
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($getLastGrupo[0]['gr_id']);
		$grupo->setGu_accept(1);

		$grupo->addgrupo_usuario();

	}

	public function aderirgrupo() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$grupo = new Grupo();

		$v = Validate::validate([
			'gu_accept' => 'integer',
			'gu_private' => 'integer',
			'gu_grupo_id' => 'integer',
			'gu_user_id' => 'integer',
			'gr_id' => 'integer',
		]);

		$grupo->setGu_private($v->gu_private);
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($v->gr_id);
		$grupo->setGu_accept($v->gu_accept);

		$grupo->addgrupo_usuario();

		$this->view([
			'title' => 'Planos',

			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
			// 'NotsSe	$grupo->guir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.grupo');
	}

}
