<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class AdminaddduvidaController extends ContainerController {

	public function create() {
		$this->view([
			'title' => 'Duvidas Preguentes',

		], 'admin.adminaddduvida');
	}

}