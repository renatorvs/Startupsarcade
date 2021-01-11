<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\Admin\Duvida_categoria;
use app\session\Session;

class DuvidascategoriaController extends ContainerController {

	public function show($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$getduvidacategoria = Duvida_categoria::getDuvidasEmpresaCategoria();

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = TRUE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$getduvidacategoria = Duvida_categoria::getDuvidasCandidatoCategoria();
		} else {
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

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.duvidascategoria');
	}

}
