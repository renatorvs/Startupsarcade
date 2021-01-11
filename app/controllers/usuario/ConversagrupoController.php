<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Pedido_mensagem_link;
use app\session\Session;

class ConversagrupoController extends ContainerController {

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

		$getPedidoConversas = Pedido_mensagem_link::getPedidoConversas($sessionUsuario_id);
		if (!$getPedidoConversas) {
			$getPedidoConversas = FALSE;
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
			'getPedidoMensagem' => getNotificantionMessagem($sessionUsuario_id),
			'haGetPedidoMensagem' => $getPedidoConversas,
			'getPedidoConversas' => $getPedidoConversas,

		], 'usuario.conversagrupo');
	}

}