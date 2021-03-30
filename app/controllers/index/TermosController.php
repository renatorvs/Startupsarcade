<?php
namespace app\controllers\index;

use app\controllers\ContainerController;

class TermosController extends ContainerController {

	public function show() {

		$this->view([
			'pais_id' => Session::get("PAIS_ID"),

		], 'index.termos');
	}

}