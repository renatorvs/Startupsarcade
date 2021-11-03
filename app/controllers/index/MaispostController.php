<?php

namespace app\controllers\index;

use app\controllers\ContainerController;

class MaisPostController extends ContainerController {

	public function show() {

		$this->view([

		], 'index.maispost');
	}

	public function store() {

	}

}