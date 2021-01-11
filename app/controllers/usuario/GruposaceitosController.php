<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Pedido;
use app\session\Session;

class GruposaceitosController extends ContainerController {

	public function store() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$getconta = Contabancaria::getContaEmpresa($session_id);

		} else if (Session::get('CANDIDATO_SESSION_id')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$getconta = Contabancaria::getContaCandidato($session_id);

		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
			redirecionar("/");
		}

	}

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$prestadorPedidos = Pedido::getEmpresaPrestadorPedidosAceitos($session_id);

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$prestadorPedidos = Pedido::getCandidatoPrestadorPedidosAceitos($session_id);

		} else {

			redirecionar("/");
		}

		if (!$prestadorPedidos) {
			$prestadorPedidos = false;
		}

		//debug("", $prestadorPedidos);

		//toJson("", $prestadorPedidos);

		$this->view([
			'empresa_session' => $empresa_session,
			'candidato_session' => $candidato_session,
			'title' => 'Seu serviços em andamento',
			'prestadorPedidos' => $prestadorPedidos,
			'haPrestadorPedidos' => $prestadorPedidos,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),
		], 'usuario.servicosaceitos');
	}

	public function update($id) {

	}

}
