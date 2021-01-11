<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Pedido;
use app\models\usuario\PedidoPrestador;
use app\session\Session;
use app\validate\Validate;

class PedidosController extends ContainerController {

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$empresaSession_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$meuspedidos = Pedido::getEmpresaMeuspedidos($sessionUsuario_id);

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$candidatoSession_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$meuspedidos = Pedido::getCandidatoMeuspedidos($sessionUsuario_id);

		}

		//	debug($meuspedidos);

		if (!$meuspedidos) {
			$meuspedidos = false;
		}

		$this->view([
			'title' => 'pedidos',
			'empresa_session' => $empresa_session,
			'haPedidos' => $meuspedidos,
			'getMeuspedidos' => $meuspedidos,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.pedidos');
	}

	public function pedidodetalhes($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		if (!$getPedidosDetalhes = Pedido::getPedidosDetalhes($request->parameter)) {
			$getPedidosDetalhes = false;
		}

		$this->view([
			'title' => 'pedfidos',
			'empresa_session' => $empresa_session,
			'hadetalhePedidos' => $getPedidosDetalhes,
			'getPedidosDetalhes' => $getPedidosDetalhes,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.pedidodetalhes');

	}

	public function servicodetalhes($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$empresaSession_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$candidatoSession_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		if (!$getPedidosDetalhes = Pedido::getPedidosDetalhes($request->parameter)) {
			$getPedidosDetalhes = false;
		}

		$this->view([
			'title' => 'pedidos',
			'empresa_session' => $empresa_session,
			'hadetalhePedidos' => $getPedidosDetalhes,
			'getPedidosDetalhes' => $getPedidosDetalhes,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.servicodetalhes');
	}

	public function updatestatus($request) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		if (!$getPedidosDetalhes = Pedido::getPedidosDetalhes($request->parameter)) {
			$getPedidosDetalhes = false;
		}

		$this->view([
			'title' => 'pedidos',
			'empresa_session' => $empresa_session,
			'hadetalhePedidos' => $getPedidosDetalhes,
			'getPedidosDetalhes' => $getPedidosDetalhes,
			'getStatuspedido' => PedidoPrestador::getStatuspedido(),
			'getStatusprogress' => PedidoPrestador::getStatusprogress(),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.updatestatus');

	}

	public function updatestatustore() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$val = Validate::validate([

			'pedi_id' => 'integer',
			'status_number_id' => 'integer',
			'statuspe_id' => 'integer',

		]);

		//toJson($val);

		PedidoPrestador::setStatuspedidoAndProgress($val->pedi_id, $val->statuspe_id, $val->status_number_id);

		redirecionar("/servicoandamento/create/$val->pedi_id");
	}

}
