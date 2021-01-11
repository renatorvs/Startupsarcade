<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\VagaMensagemLink;
use app\session\Session;

class ConversavagasController extends ContainerController {

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$candidato_session = true;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$getVagaConversas = VagaMensagemLink::getVagaConversas($sessionUsuario_id);
		//	debug($getVagaConversas);
		if (!$getVagaConversas) {
			$getVagaConversas = FALSE;
		}
		//	debug($sessionUsuario_id);

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),

			'title' => 'Conversas serviços ',
			'empresa_session' => $empresa_session,

			'userSessionid' => $sessionUsuario_id,
			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'getVagaMensagem' => getNotificantionMessagem($sessionUsuario_id),
			'haGetVagaConversas' => $getVagaConversas,
			'getVagaConversas' => $getVagaConversas,

		], 'usuario.conversavagas');
	}

}