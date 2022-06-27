<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\session\Session;

class ErrorController extends ContainerController {

	public function error() {
		$lin = Linguagem::getError();
		$this->view([
			'title' => $lin->title,
			'error_h1_ops' => $lin->error_h1_ops,
			'error_h2_404' => $lin->error_h2_404,
			'errordetalhe' => $lin->errordetalhe,
			'btn_erro_grupos' => $lin->btn_erro_grupos,
			'pais_id' => Session::get("PAIS_ID"),
			'admin_id' => Session::get("ADMIN_SESSION"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.error');
	}

}