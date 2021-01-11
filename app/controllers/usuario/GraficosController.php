<?php

namespace app\controllers\usuario;

use app\controllers\ContainerController;

class GraficosController extends ContainerController {

	public function show($request) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$exploreServicos = $serv->getUsuarioExploreServico($sessionUsuario_id);

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$exploreServicos = $serv->getUsuarioExploreServico($sessionUsuario_id);

		}
		$this->view([
			'title' => 'Curso',
			'empresa_session' => $empresa_session,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.graficos');
	}

}
