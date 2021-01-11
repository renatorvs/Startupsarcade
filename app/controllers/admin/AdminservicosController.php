<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\session\session;

class AdminservicosController extends ContainerController {

	public function create() {
		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/admin/admin");
		}

		$this->view([

		], 'admin.adminservicos');
	}

}
