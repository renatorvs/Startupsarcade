<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;

class MensagemvagaController extends ContainerController {

	public function show($request) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$exploreServicos = $serv->getEmpresaExploreServico($empresaSession_id);

		} else if (Session::get('CANDIDATO_SESSION_id')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$exploreServicos = $serv->getCandidatoExploreServico($candidatoSession_id);

		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		}

		$this->view([
			'title' => 'pedidos',
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.mensagemvaga');
	}

}
