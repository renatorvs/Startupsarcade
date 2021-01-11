<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\session\Session;

class ErrorController extends ContainerController {

	public function naoencontrado() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else {
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$empresa_session = FALSE;
		}
		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.error');
	}

	public function perfiluser() {
		if (Session::get('EMPRESA_SESSION_ID')) {

			redirecionar("/empresaperfil/show");

		} else {
			Session::get('CANDIDATO_SESSION_ID');

			redirecionar("/candidatoperfil/show");
		}
	}

}