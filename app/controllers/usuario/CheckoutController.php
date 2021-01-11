<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\candidato\Candidato;
use app\models\empresa\Empresa;
use app\models\usuario\Mensagem;
use app\models\usuario\Pedido;
use app\models\usuario\pedido_mensagem_dados_link;
use app\models\usuario\Pedido_mensagem_link;
use app\models\usuario\Servico;
use app\session\Session;

class CheckoutController extends ContainerController {

	public function create($pedido) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;

			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');

			$empresa = new Empresa();
			$getdadoscliente = $empresa->getEmpresa_dados($session_id);

			$getServico_id = Pedido::getPedidosDetalhes($pedido->parameter);
			$prestador_user_id = Servico::getLoadbyUsuario_id($getServico_id[0]['pedi_serv_id']);

		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;

			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');

			$candidato = new Candidato();
			$getdadoscliente = $candidato->getCandidato($session_id);

			$getServico_id = Pedido::getPedidosDetalhes($pedido->parameter);
			$prestador_user_id = Servico::getLoadbyUsuario_id($getServico_id[0]['pedi_serv_id']);

		} else {
			redirecionar("/");
		}

///-----------------------------------------------------------------------------------------------

		////////////////TESTE DE INTEGRAÇÃO COM PAGSEGURo PARA PODE ENVIAR A MENSAGEM
		////////////////TESTE DE INTEGRAÇÃO COM PAGSEGURo PARA PODE ENVIAR A MENSAGEM
		////////////////TESTE DE INTEGRAÇÃO COM PAGSEGURo PARA PODE ENVIAR A MENSAGEM
		$dadosPedido = Pedido::getPedidosDetalhes($pedido->parameter);
		//toJson($dadosPedido);

		// construtor de mensagem
		$msn = new mensagem($dadosPedido[0]['pedi_description']);
		$msn->addMensagem();

		pedido_mensagem_dados_link::addpedidoMensagemDados(
			$getdadoscliente[0]['user_img'], $getdadoscliente[0]['user_nome'],
			$prestador_user_id[0]['user_img'], $prestador_user_id[0]['user_nome']);

		//pega ultima mensagem enviada
		$lastMsn = mensagem::getLastMessagem_id();
/////pega ultima mensagem enviada
		$getLastMensagemPedidoDados = pedido_mensagem_dados_link::getLastMensagemPedidoDados();

		//instacia link para mensagem e pedido.
		$pml = new Pedido_mensagem_link();

		$pml->setPml_user_remetente_id($dadosPedido[0]['cliente_user_id']);
		$pml->setPml_user_destinatario_id($dadosPedido[0]['pedi_prestador_user_id']);
		$pml->setPml_pedi_id($dadosPedido[0]['pedi_id']);
		$pml->setPml_msn_id($lastMsn[0]['msn_id']);
		$pml->setPml_pmdl_id($getLastMensagemPedidoDados[0]['pmdl_id']);
		$pml->addPedido_mensagem_link();
///-----------------------------------------------------------------------------------------------
		///-----------------------------------------------------------------------------------------------
		///-----------------------------------------------------------------------------------------------

		$taxaservico = (double) 2;
		$totalaPagar = (double) $taxaservico + $dadosPedido[0]['serv_valor'];

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),

			'title' => 'meus serviços',
			'cliente_user_id' => $sessionEmpresa_id,
			'serv_id' => $dadosPedido[0]['serv_id'],
			'post_titulo' => $dadosPedido[0]['post_titulo'],
			'post_subtitulo' => $dadosPedido[0]['post_subtitulo'],
			'post_description' => $dadosPedido[0]['post_description'],
			'serv_preRequisitos' => $dadosPedido[0]['serv_preRequisitos'],
			'serv_prazo' => $dadosPedido[0]['serv_prazo'],
			'serv_valor' => $dadosPedido[0]['serv_valor'],
			'taxaservico' => $taxaservico,
			'totalaPagar' => $totalaPagar,
			'empresa_session' => $empresa_session,

			'ender_bairro' => $getdadoscliente[0]['ender_bairro'],
			'ender_cidade' => $getdadoscliente[0]['ender_cidade'],
			'emp_nomeresponsavel' => $getdadoscliente[0]['emp_nomeresponsavel'],
			'emp_nomeresponsavel' => $getdadoscliente[0]['emp_nomeresponsavel'],
			'emp_cnpj' => $getdadoscliente[0]['emp_cnpj'],
			'emp_datafundacao' => $getdadoscliente[0]['emp_datafundacao'],

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

			//'pedi_accept' => $dadosPedido,

		], 'usuario.checkout');
	}

}
