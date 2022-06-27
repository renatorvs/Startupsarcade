<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\Session;

class AdmindashboardController extends ContainerController {

	public function create($request) {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => 'Curso',
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.admindashboard');
	}

}
