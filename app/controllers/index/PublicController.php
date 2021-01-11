<?php

namespace app\controllers\index;

use app\controllers\ContainerController;

class PublicController extends ContainerController {

	public function index() {

		$this->view([

		], 'index.index');

	}

}