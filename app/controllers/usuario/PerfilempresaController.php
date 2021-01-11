<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\empresa\Empresa;
use app\models\empresa\Vaga;
use app\models\usuario\Servico;
use app\models\usuario\UsuariosSeguidores;
use app\session\Session;

class PerfilempresaController extends ContainerController {

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

		$seguidores = UsuariosSeguidores::seguidores($user_id->parameter);
		$seguindo = UsuariosSeguidores::seguindo($user_id->parameter);

		//toJson($seguindo);

		$checkSeguidores = UsuariosSeguidores::checkSeguidores($sessionUsuario_id, $user_id->parameter);
		if (!$checkSeguidores) {
			$checkSeguidores = false;
		}

		$getMinhasvagasLimit = Vaga::getMinhasvagasLimit($user_id->next);

		if (!$getMinhasvagasLimit) {
			$getMinhasvagasLimit = false;
		}

		$getMeusServicosLimit = Servico::getMeusServicosLimit($user_id->next);
		if (!$getMeusServicosLimit) {
			$getMeusServicosLimit = false;
		}
		$empresa = new Empresa();
		$getDadosEmpresa = $empresa->getEmpresa_dados($user_id->next);
		//debug($getDadosEmpresa);

		checkParameter($getDadosEmpresa);

		// MUDAR O ID DA SESSSIOM PARA O ID DO CANDIDATO OU DA EMPRESA  E n~so do usuario SE NÃO DA DIVERGENCIA

		$this->view([

			'user_id' => $user_id->parameter,
			'empresa_session' => $empresa_session,
			'empresa_nome' => $getDadosEmpresa[0]['user_nome'],
			'seguidores' => $seguidores[0]['countSeguidores'],
			'seguindo' => $seguindo[0]['countSeguindo'],
			'checkSeguidores' => $checkSeguidores,
			'empresa_email' => $getDadosEmpresa[0]['user_email'],
			'emp_img' => $getDadosEmpresa[0]['emp_img'],
			'emp_cnpj' => $getDadosEmpresa[0]['emp_cnpj'],
			'emp_razaosocial' => $getDadosEmpresa[0]['emp_razaosocial'],
			'emp_nomeresponsavel' => $getDadosEmpresa[0]['emp_nomeresponsavel'],
			'emp_nomefantasia' => $getDadosEmpresa[0]['emp_nomefantasia'],
			'emp_descri' => $getDadosEmpresa[0]['emp_descri'],
			'emp_contato' => $getDadosEmpresa[0]['emp_contato'],
			'emp_datafundacao' => $getDadosEmpresa[0]['emp_datafundacao'],
			'ender_cidade' => $getDadosEmpresa[0]['ender_cidade'],
			'est_nome' => $getDadosEmpresa[0]['est_nome'],
			'haGetMinhasvagasLimit' => $getMinhasvagasLimit,
			'getMinhasvagasLimit' => $getMinhasvagasLimit,
			'haGetMeusServicosLimit' => $getMeusServicosLimit,
			'getMeusServicosLimit' => $getMeusServicosLimit,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.perfilempresa');
	}

}
