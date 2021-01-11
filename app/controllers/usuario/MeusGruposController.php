<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Servico;
use app\session\Session;

class MeusservicosController extends ContainerController {

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			if (Session::get("USER_PREFERENCIAS") == 1) {
				$meusServicos = Servico::getGestorMeusServicos($session_id);
			}
			$meusServicos = Servico::getEmpresaMeusServicos($session_id, $sessionUsuario_id);
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$meusServicos = Servico::getCandidatoMeusServicos($session_id, $sessionUsuario_id);

		} else {
			redirecionar("/");
		}
		if (!$meusServicos) {
			$meusServicos = false;
		}

		//debug($meusServicos);
		$this->view([
			'title' => 'meus serviços',
			'pref' => Session::get("USER_PREFERENCIAS"),
			'empresa_session' => $empresa_session,
			'meusServicos' => $meusServicos,
			'haServicos' => $meusServicos,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.meusservicos');
	}

}
