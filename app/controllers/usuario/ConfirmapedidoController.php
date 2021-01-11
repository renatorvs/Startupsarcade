<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\candidato\Candidato;
use app\models\empresa\Empresa;
use app\models\usuario\Pedido;
use app\models\usuario\PedidoPrestador;
use app\models\usuario\Servico;
use app\session\Session;
use app\validate\Validate;

class ConfirmapedidoController extends ContainerController {

	public function create($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
			$nome_user = Session::get('EMPRESA_USERNOME');
			$getServico = Servico::getPostServico($request->parameter);
			$empresa = new Empresa();
			$getdadoscliente = $empresa->getEmpresa_dados($session_id);
			$prestador_user_id = Servico::getLoadbyUsuario_id($getServico[0]['serv_id']);

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;

			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
			$nome_user = Session::get('CANDIDATO_USERNOME');

			$getServico = Servico::getPostServico($request->parameter);

			$candidato = new candidato();
			$getdadoscliente = $candidato->getCandidato($session_id);

			$prestador_user_id = Servico::getLoadbyUsuario_id($getServico[0]['serv_id']);
			//debug($getServico);
		} else {
			redirecionar("/");
		}

		$taxaservico = (double) 5.00;
		$totalaPagar = (double) $taxaservico + $getServico[0]['serv_valor'];
		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),

			'title' => 'Meus pedidos',
			'empresa_session' => $empresa_session,
			'pedi_serv_id' => $getServico[0]['serv_id'],
			'cliente_user_id' => $sessionUsuario_id,
			'cliente_nome' => $nome_user,
			'prestador_user_id' => $prestador_user_id[0]['user_id'],
			'post_titulo' => $getServico[0]['post_titulo'],
			'post_subtitulo' => $getServico[0]['post_subtitulo'],
			'post_description' => $getServico[0]['post_description'],
			'cat_nome' => $getServico[0]['cat_nome'],
			'serv_preRequisitos' => $getServico[0]['serv_preRequisitos'],
			'serv_prazo' => $getServico[0]['serv_prazo'],
			'serv_valor' => $getServico[0]['serv_valor'],
			'taxaservico' => $taxaservico,
			'totalaPagar' => $totalaPagar,
			'statusServ_nome' => $getServico[0]['statusServ_nome'],
			'ender_bairro' => $getServico[0]['ender_bairro'],
			'ender_cidade' => $getServico[0]['ender_cidade'],
			'emp_nomeresponsavel' => $getdadoscliente[0]['emp_nomeresponsavel'],
			'emp_cnpj' => $getdadoscliente[0]['emp_cnpj'],
			'emp_datafundacao' => $getdadoscliente[0]['emp_datafundacao'],

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

			//'pedi_accept' => $getServico,

		], 'usuario.confirmapedido');
	}

	public function store($request) {
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
		} else {
			redirecionar("/");
		}

		$val = Validate::validate([

			'status_number_id' => 'string',
			'pedi_registro' => 'date',
			'pedi_valortotal' => 'string',
			'pedi_description' => 'string',
			'statuspe_id' => 'integer',
			'prestador_user_id' => 'integer',
			'pedi_serv_id' => 'integer',
			'status_pay_id' => 'integer',
			'pedi_acc_id' => 'integer',

		]);

		$pedido = new Pedido();

		$pedido->setStatus_number_id($val->status_number_id);
		$pedido->setPedi_registro($val->pedi_registro);
		$pedido->setPedi_valortotal($val->pedi_valortotal);
		$pedido->setPedi_serv_id($val->pedi_serv_id);
		$pedido->setStatuspe_id($val->statuspe_id);
		$pedido->setPedi_prestador_user_id($val->prestador_user_id);
		$pedido->setPedi_description($val->pedi_description);
		$pedido->setCliente_user_id($sessionUsuario_id);
		$pedido->setStatus_pay_id($val->status_pay_id);
		//debug($pedido);
		//debug($val);
		$pedido->addPedido();

		$getLastPedido = $pedido->getLastPedido_id();
		$pedi_id = $getLastPedido[0]['pedi_id'];

		$PedidoPrestador = new PedidoPrestador($pedi_id, $val->prestador_user_id, $val->pedi_acc_id, $val->pedi_registro);

		$PedidoPrestador->addpedidoPrestador();

		redirecionar("/checkout/create/$pedi_id");
	}

}