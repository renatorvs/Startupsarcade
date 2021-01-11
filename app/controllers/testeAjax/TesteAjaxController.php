<?php

namespace app\controllers\testeAjax;

use app\controllers\ContainerController;

class TesteAjaxController extends ContainerController {

	public function create() {
		$this->view([
			'teste' => 'meus serviços',

		], 'testeAjax.testeAjax');

	}

	public function show() {

		$this->ajaxView([
			'teste' => 'meus show',

		], 'testeAjax.requestAjax');

	}

}