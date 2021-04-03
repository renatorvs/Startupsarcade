<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class Adminmeuspostblog extends ContainerController {

	public function admin() {

		$this->view([
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminmeuspostblog');
	}

}