<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\usuario\Pedido;
use app\session\Session;

class AdminservicosnegadosController extends ContainerController {

	public function create() {

		if (!Session::get('ADMIN_SESSION')) {
			redirecionar("/adminlogin/admin");
			$admin_session = TRUE;
			$sessionUsuario_id = Session::get('ADMIN_SESSION');

		}

		$prestadorPedidos = Pedido::getPedidosNegados();
		//	debug($prestadorPedidos);

		if (!$prestadorPedidos) {
			$prestadorPedidos = false;
		}

		//toJson("", $prestadorPedidos);

		$this->view([

			'title' => 'Seu serviços em andamento',
			'prestadorPedidos' => $prestadorPedidos,
			'haPrestadorPedidos' => $prestadorPedidos,
		], 'admin.adminservicosnegados');
	}
}