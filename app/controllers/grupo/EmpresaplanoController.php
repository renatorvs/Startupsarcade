<?php
namespace app\controllers\empresa;

use app\controllers\ContainerController;
use app\session\Session;

class EmpresaplanoController extends ContainerController {

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$this->view([
			'title' => 'Planos',
			'session' => Session::get('EMPRESA_SESSION'),
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresaplanos');
	}

	public function store() {

	}

}
