<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\session\Session;

class StatisticsController extends ContainerController {

	public function show() {

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.statistics');
	}

}