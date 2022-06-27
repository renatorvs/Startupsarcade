<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class Adminmeuspostblog extends ContainerController {

	public function admin() {

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminmeuspostblog');
	}

}