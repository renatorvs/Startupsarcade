<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;

class Adminmeuspostblog extends ContainerController {

	public function admin() {

		$this->view([

		], 'admin.adminmeuspostblog');
	}

}