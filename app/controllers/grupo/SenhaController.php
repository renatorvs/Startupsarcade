<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\session\Session;

class SenhaController extends ContainerController {

	public function create() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$this->view([
			'title' => 'SA | Grupos startup',
			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.senha');

	}
}