<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\Session;

class AdmindashboardController extends ContainerController {

	public function index() {

	}

	public function create($request) {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'title' => 'Curso',

		], 'admin.admindashboard');
	}

}
