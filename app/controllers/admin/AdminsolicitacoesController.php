<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\Session;

class AdminsolicitacoesController extends ContainerController {

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),

		], 'admin.adminsolicitacoes');
	}
}
