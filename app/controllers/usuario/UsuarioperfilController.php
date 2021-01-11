<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\candidato\Candidato;
use app\models\usuario\UsuariosSeguidores;
use app\session\Session;

class UsuarioperfilController extends ContainerController {

	public function perfil($user_id) {

		$getusuarioPerfil = Candidato::getusuarioPerfil($user_id->parameter);
		//debug($getusuarioPerfil);
		if ($getusuarioPerfil[0]['tiuser_id'] == 2) {
			if (Session::get('EMPRESA_USUARIO_ID') == $user_id->parameter) {
				redirecionar("/empresaperfil/show");
			} else {
				$emp_id = $getusuarioPerfil[0]['emp_id'];
				redirecionar("/perfilempresa/create/$user_id->parameter/$emp_id");
			}

		} else if ($getusuarioPerfil[0]['tiuser_id'] == 1) {
			if (Session::get('CANDIDATO_USUARIO_ID') == $user_id->parameter) {
				redirecionar("/candidatoperfil/show");
			} else {
				$cand_id = $getusuarioPerfil[0]['cand_id'];
				redirecionar("/perfilcandidato/create/$user_id->parameter/$cand_id");
			}

		}

	}

	public function seguir($userSeguindo_id) {

		$seguirUser = new UsuariosSeguidores();

		if (Session::get('EMPRESA_USUARIO_ID')) {

			$session_id = Session::get('EMPRESA_USUARIO_ID');
			$session_nome = Session::get('EMPRESA_NOME');

			$seguirUser->setUs_usuario_id($session_id);
			$seguirUser->setUs_usuario_nome($session_nome);
			$seguirUser->setUs_seguindo_id_usuario($userSeguindo_id->parameter);
			$seguirUser->seguir();

		} else {

			$session_id = Session::get('CANDIDATO_USUARIO_ID');
			$session_nome = Session::get('CANDIDATO_NOME');

			$seguirUser->setUs_usuario_id($session_id);
			$seguirUser->setUs_usuario_nome($session_nome);
			$seguirUser->setUs_seguindo_id_usuario($userSeguindo_id->parameter);
			$seguirUser->seguir();

		}

		redirecionar("/usuario/perfil/$userSeguindo_id->parameter");

	}

	public function deixarDeSeguir($userSeguindo_id) {
		$seguirUser = new UsuariosSeguidores();

		if (Session::get('EMPRESA_USUARIO_ID')) {

			$session_id = Session::get('EMPRESA_USUARIO_ID');
			$seguirUser->setUs_usuario_id($session_id);
			$seguirUser->setUs_seguindo_id_usuario($userSeguindo_id->parameter);
			$seguirUser->deixaDeSeguir();
		} else {

			$session_id = Session::get('CANDIDATO_USUARIO_ID');
			$seguirUser->setUs_usuario_id($session_id);
			$seguirUser->setUs_seguindo_id_usuario($userSeguindo_id->parameter);
			$seguirUser->deixaDeSeguir();
		}

		redirecionar("/usuario/perfil/$userSeguindo_id->parameter");

	}

}