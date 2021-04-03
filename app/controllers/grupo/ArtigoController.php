<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\session\Session;

class ArtigoController extends ContainerController {

	public function artigo() {

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),
			'pais_id' => Session::get("PAIS_ID"),
			// 'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			// 'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'usuario.verartigo');
	}

}