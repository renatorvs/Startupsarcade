<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\candidato\Candidato;
use app\models\candidato\FichaExperiencia;
use app\models\empresa\Competencias;
use app\models\usuario\UsuariosSeguidores;
use app\session\Session;
use app\validate\Data;

class PerfilcandidatoController extends ContainerController {

	public function create($user_id) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else if (Session::get('ADMIN_SESSION')) {
			$candidato_session = FALSE;
			$admin_session = TRUE;
			$empresa_session = FALSE;
		} else {
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
		}

		$seguindo = UsuariosSeguidores::seguindo($user_id->parameter);
		$seguidores = UsuariosSeguidores::seguidores($user_id->parameter);

		//toJson($seguindo);

		$checkSeguidores = UsuariosSeguidores::checkSeguidores($sessionUsuario_id, $user_id->parameter);
		if (!$checkSeguidores) {
			$checkSeguidores = false;
		}

		$candidato = new Candidato();
		$ficha = new FichaExperiencia();

		$getCandidato = $candidato->getCandidato($user_id->next);

		$getFichaCandidato = FichaExperiencia::getFichaCandidato($user_id->next);
		$getCountFicha = FichaExperiencia::getCountFicha($user_id->next);
		$datadeNascimento = Data::dataformat($getCandidato[0]['cand_dataDenasci']);
		$getMinhasCompetencias = Competencias::getMinhasCompetenciasCandidato($user_id->next);

		if (!$getMinhasCompetencias) {
			$getMinhasCompetencias = FALSE;
		}

		//debug($getCandidato);
		$this->view([
			'title' => 'Perfil: ' . $getCandidato[0]['user_nome'],
			'empresa_session' => $empresa_session,
			'user_id' => $user_id->parameter,
			'seguidores' => $seguidores[0]['countSeguidores'],
			'seguindo' => $seguindo[0]['countSeguindo'],
			'checkSeguidores' => $checkSeguidores,
			'candidato_session' => $candidato_session,
			'admin_session' => $admin_session,
			'empresa_session' => $empresa_session,
			'user_nome' => $getCandidato[0]['user_nome'],
			'candNome_user' => $getCandidato[0]['cand_nome'],
			'ender_cidade' => $getCandidato[0]['ender_cidade'],
			'est_nome' => $getCandidato[0]['est_nome'],
			'cand_email' => $getCandidato[0]['user_email'],
			'cand_img' => $getCandidato[0]['cand_img'],
			'cand_dataDenasci' => $datadeNascimento,
			'fic_id' => $getCandidato[0]['fic_id'],
			'countFic_id' => $getCountFicha[0]['countFic_id'],
			'fichaCandidato' => $getFichaCandidato,
			'haGetMinhasCompetencias' => $getMinhasCompetencias,
			'getMinhasCompetencias' => $getMinhasCompetencias,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.perfilcandidato');
	}
}
