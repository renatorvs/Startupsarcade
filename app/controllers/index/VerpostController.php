<?php

namespace app\controllers\index;

use app\controllers\ContainerController;

class VerpostController extends ContainerController {

	public function show() {

		$this->view([

		], 'index.verpost');
	}

}