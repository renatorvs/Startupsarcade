<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class AdminaddduvidaController extends ContainerController {

	public function create() {
		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => 'Duvidas Preguentes',
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminaddduvida');
	}

}