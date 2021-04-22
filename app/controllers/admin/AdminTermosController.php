<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class AdminaddduvidaController extends ContainerController {

	public function create() {
		$this->view([
			'title' => 'admin termos ',
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.admintermos');
	}

}
