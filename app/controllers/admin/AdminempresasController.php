<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\Session;

class AdminempresasController extends ContainerController {

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminempresas');
	}
}
