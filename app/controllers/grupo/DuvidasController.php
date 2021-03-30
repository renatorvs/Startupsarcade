<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\Admin\Duvidas;
use app\models\Admin\Duvida_categoria;
use app\session\Session;

class DuvidasController extends ContainerController {
	public function create($request) {

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
			'pais_id' => Session::get("PAIS_ID"),
			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.duvidas');
	}

	public function destroy($request) {
		$duv = new Duvidas();
		$duv->setDuv_id($request->parameter);
		$duv->deleteDuvida();
		redirecionar("/duvidas/create");

	}

}
