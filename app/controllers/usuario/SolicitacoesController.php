<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\usuario\Solicitacao_categoria;
use app\models\usuario\Solicitacoes;
use app\session\Session;
use app\validate\Validate;

//
class SolicitacoesController extends ContainerController {

	//  1 aceito
	// 2 pendente
	// 3 negado

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$sessionUsuario_id = Session::get('EMPRESA_SESSION_ID');

			$getSolicitacoes = Solicitacoes::getEmpresaSolicitacoes($sessionUsuario_id);
			$getCountAberto = Solicitacoes::getEmAbertoEmpresaSolicitacoes($sessionUsuario_id);
			$getCountConcluido = Solicitacoes::getConcluidoEmpresaSolicitacoes($sessionUsuario_id);

		} else {
			$empresa_session = FALSE;
			$sessionUsuario_id = Session::get('CANDIDATO_SESSION_ID');

			$getSolicitacoes = Solicitacoes::getCandidatoSolicitacoes($sessionUsuario_id);
			$getCountAberto = Solicitacoes::getEmAbertoCandidatoSolicitacoes($sessionUsuario_id);
			$getCountConcluido = Solicitacoes::getConcluidoCandidatoSolicitacoes($sessionUsuario_id);

		}

		if (!$getSolicitacoes) {
			$getSolicitacoes = false;
		}

		//	debug("", $getCountAberto);
		//	debug("", $getCountConcluido);

		$this->view([
			'empresa_session' => $empresa_session,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'title' => 'Solicitaçoes',
			'getCountAberto' => $getCountAberto[0]['count(soli_id)'],
			'getCountConcluido' => $getCountConcluido[0]['count(soli_id)'],
			'categoria' => Solicitacao_categoria::getSolicitacaoCategoria(),
			'getSolicitacoes' => $getSolicitacoes,
			'haSolicitacoes' => $getSolicitacoes,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.solicitacoes');
	}

	public function store() {
		if (Session::get('EMPRESA_SESSION')) {
			$empresa_session = TRUE;
			$sessionUsuario_id = Session::get('EMPRESA_SESSION_ID');
		} else {
			$empresa_session = FALSE;
			$sessionUsuario_id = Session::get('CANDIDATO_SESSION_ID');
		}

		$val = Validate::validate([

			'solistatus_id' => 'integer',
			'soli_descricao' => 'string',
			'solicategoria_id' => 'string',
			'soli_date' => 'date',

		]);

		$soli = new Solicitacoes($val->soli_descricao, $val->soli_date,
			$val->solistatus_id, $sessionUsuario_id, $val->solicategoria_id);
		$soli->addSolicitacao();

		redirecionar("/solicitacoes/create");
		//debug("", $soli);
	}

}