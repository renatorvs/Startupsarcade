<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\Admin\Duvida_categoria;
use app\session\Session;

class DuvidascategoriaController extends ContainerController {

	public function show($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
			$getduvidacategoria = Duvida_categoria::getduvidascategoria();

		}

		$duvcat = new Duvida_categoria();
		$loadByDuvidaCategoria = $duvcat->loadByDuvidaCategoria($request->parameter);

		$this->view([
			'title' => 'Duvidas Empresa',
			'empresa_session' => $empresa_session,
			'candidato_session' => $candidato_session,
			'admin_session' => $admin_session,
			'getduvidas' => $loadByDuvidaCategoria,
			'getduvidacategoria' => $getduvidacategoria,
			'pais_id' => Session::get('PAIS_ID'),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.duvidascategoria');
	}

}
