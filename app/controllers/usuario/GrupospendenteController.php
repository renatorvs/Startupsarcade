<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Pedido;
use app\session\Session;

//
class ServicospendenteController extends ContainerController {

	//  1 aceito
	// 2 pendente
	// 3 negado
	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			$prestadorPedidos = Pedido::getEmpresaPrestadorPedidosPendentes($session_id);

		} else {
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');

			$prestadorPedidos = Pedido::getCandidatoPrestadorPedidosPendentes($session_id);

		}

		if (!$prestadorPedidos) {
			$prestadorPedidos = false;
		}

		//debug("", $prestadorPedidos);

		//toJson("", $prestadorPedidos);

		$this->view([
			'empresa_session' => $empresa_session,
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
		], 'usuario.servicospendente');
	}

	public function aceitar($pedido_id) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$getPedidosPrestadorDados = Pedido::getEmpresaPrestadorDados($pedido_id->parameter);
			Pedido::UpdateAcceptStatus($getPedidosPrestadorDados[0]['pedi_id'], 3);

		} else {
			$getPedidosPrestadorDados = Pedido::getCandidatoPrestadorDados($pedido_id->parameter);
			Pedido::UpdateAcceptStatus($getPedidosPrestadorDados[0]['pedi_id'], 3);

		}
		redirecionar("/servicospendente/create");
	}

	public function negar($pedido_id) {

		if (Session::get('EMPRESA_SESSION_ID')) {

			$getPedidosPrestadorDados = Pedido::getEmpresaPrestadorDados($pedido_id->parameter);
			Pedido::UpdateAcceptStatus($getPedidosPrestadorDados[0]['pedi_id'], 1);

		} else {
			$getPedidosPrestadorDados = Pedido::getCandidatoPrestadorDados($pedido_id->parameter);
			Pedido::UpdateAcceptStatus($getPedidosPrestadorDados[0]['pedi_id'], 1);

		}
		redirecionar("/servicospendente/create");

	}

}