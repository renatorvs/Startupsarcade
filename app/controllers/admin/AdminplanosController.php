<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\Session;

class AdminplanosController extends ContainerController {

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminplanos');
	}
}
