<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\empresa\Empresa;
use app\payments\Payments;
use app\session\Session;
use app\validate\Validate;

class PedidoplanosController extends ContainerController {

	public function planocheckout() {
		if (Session::get('EMPRESA_SESSION_ID')) {

			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			$empresa = new Empresa();
			$getdadoscliente = $empresa->getEmpresa_dados($session_id, $sessionUsuario_id);

			//debug($getdadoscliente);
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$candidato_session = true;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$val = Validate::validate([

			'plan_id' => 'integer',
		]);

		if ($val->plan_id == 2) {
			$plano = "Premiun";
			$valortotal = 650.00;
		} else {
			$valortotal = 1100.00;
			$plano = "Premiun plus";
		}

		// var_dump($card);

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),
			'empresa_session' => $empresa_session,

			'title' => 'Planos',
			'valortotal' => $valortotal,
			'plano' => $plano,
			'userSessionid' => $sessionUsuario_id,
			'emp_razaosocial' => $getdadoscliente[0]['emp_razaosocial'],
			'emp_cnpj' => $getdadoscliente[0]['emp_cnpj'],
			'emp_nomeresponsavel' => $getdadoscliente[0]['emp_nomeresponsavel'],
			'emp_nomefantasia' => $getdadoscliente[0]['emp_nomefantasia'],
			'emp_contato' => $getdadoscliente[0]['uel_emp_contato'],
			'userSessionid' => $getdadoscliente[0]['user_status'],
			'userSessionid' => $getdadoscliente[0]['user_email'],
			'ender_numero' => $getdadoscliente[0]['ender_numero'],
			'ender_logradouro' => $getdadoscliente[0]['ender_logradouro'],
			'ender_bairro' => $getdadoscliente[0]['ender_bairro'],
			'ender_cidade' => $getdadoscliente[0]['ender_cidade'],
			'ender_comple' => $getdadoscliente[0]['ender_comple'],
			'est_nome' => $getdadoscliente[0]['est_nome'],
			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'getVagaMensagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresaplanocheckout');

	}

	public function meuplano() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$candidato_session = true;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),
			'empresa_session' => $empresa_session,

			'title' => 'Planos',
			'valortotal' => $valortotal,
			'userSessionid' => $sessionUsuario_id,
			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'getVagaMensagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresameuplano');

	}

	public function pagamentocheckout() {
		if (Session::get('EMPRESA_SESSION_ID')) {

			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			$empresa = new Empresa();
			$getdadoscliente = $empresa->getEmpresa_dados($session_id, $sessionUsuario_id);

			$card = Payments::executeCardCheckout($_POST['cardName'],
				$_POST['number'], $_POST['expMes'], $_POST['expAno'], $_POST['cvv']);

			// addcartão

			$transaction = Payments::executeTransation($getdadoscliente, $card,  
				$_POST['cardName'] $_POST['transaction_amount'],
				$_POST['description'], $_POST['installments']);

			debug($transaction);

		}

	}

	public function empresaplanos() {
		if (Session::get('EMPRESA_SESSION_ID')) {

			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			$empresa = new Empresa();
			$getdadoscliente = $empresa->getEmpresa_dados($session_id, $sessionUsuario_id);

		}
		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),
			'empresa_session' => $empresa_session,

			'title' => 'Planos',
			'valortotal' => $valortotal,
			'userSessionid' => $sessionUsuario_id,
			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'getVagaMensagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresaplanos');

	}

}
