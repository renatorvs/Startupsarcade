<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class MeusGruposController extends ContainerController {
	public function grupos() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$meusGrupos = Grupo::meusGrupos();

		$this->view([
			'title' => 'SA | Categoria startup',
			'session' => Session::get('EMPRESA_SESSION'),
			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.meusGrupos');
	}

	public function grupo() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$this->view([
			'title' => 'Planos',
			'session' => Session::get('EMPRESA_SESSION'),
			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
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
		]);

		$grupo->setGr_nome($v->gr_nome);
		$grupo->setGr_descricao($v->gr_descricao);
		$grupo->setGr_cidade($v->gr_cidade);
		$grupo->setGr_estado($v->gr_estado);
		$grupo->setGr_pais("Brasil");
		$gr_foto = Imagem::uploadImage($_FILES['gr_foto']);
		$grupo->setGr_foto($gr_foto);

		$grupo->addGrupo();
		$getLastGrupo = $grupo->getLastGrupo();

		$grupo->setGu_private($v->gu_private);
		$grupo->setGu_user_admin_id(Session::get('USUARIO_ID'));
		$grupo->setGu_user_id(Session::get('USUARIO_ID'));
		$grupo->setGu_grupo_id($getLastGrupo[0]['gr_id']);
		$grupo->setGu_accept(1);

		$grupo->addgrupo_usuario();

		$this->view([
			'title' => 'Planos',
			'session' => Session::get('EMPRESA_SESSION'),
			'pref' => Session::get("USER_PREFERENCIAS"),
			'grupoAll' => $grupoAll,
			// 'NotsSe	$grupo->guir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.grupo');
	}

}