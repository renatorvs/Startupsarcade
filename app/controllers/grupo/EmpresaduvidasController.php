<?php
namespace app\controllers\empresa;

use app\controllers\ContainerController;
use app\models\Admin\Duvidas;
use app\models\Admin\Duvida_categoria;
use app\session\Session;

class EmpresaduvidasController extends ContainerController {
	public function create($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		}

		$getduvidasempresa = Duvidas::getDuvidasEmpresa();
		$getDuvidasempresacategoria = Duvida_categoria::getDuvidasEmpresaCategoria();

		$this->view([
			'title' => 'Duvidas Empresa',
			'empresa_session' => $empresa_session,
			'admin_session' => $admin_session,
			'getduvidasempresa' => $getduvidasempresa,
			'getduvidaempresacategoria' => $getDuvidasempresacategoria,
			'title' => 'Empresa duvidas',
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresaduvidas');
	}

	public function destroy($request) {
		$duv = new Duvidas();
		$duv->setDuv_id($request->parameter);
		$duv->deleteDuvida();
		redirecionar("/empresaduvidas/create");

	}

}
