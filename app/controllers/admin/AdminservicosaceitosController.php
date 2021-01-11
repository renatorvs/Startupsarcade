<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Pedido;
use app\session\Session;

class AdminservicosaceitosController extends ContainerController {

	public function index() {

	}

	public function show($request) {

	}

	public function store() {

	}

	public function create() {

		if (!Session::get('ADMIN_SESSION')) {
			redirecionar("/adminlogin/admin");
			$admin_session = TRUE;
			$sessionUsuario_id = Session::get('ADMIN_SESSION');

		}

		$prestadorPedidos = Pedido::getPedidosAceitos();
		//	debug($prestadorPedidos);

		if (!$prestadorPedidos) {
			$prestadorPedidos = false;
		}

		//toJson("", $prestadorPedidos);

		$this->view([

			'title' => 'Seu serviços em andamento',
			'prestadorPedidos' => $prestadorPedidos,
			'haPrestadorPedidos' => $prestadorPedidos,
		], 'admin.adminservicosaceitos');
	}

	public function update($id) {

	}

}
