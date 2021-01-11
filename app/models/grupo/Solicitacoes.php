<?php

namespace app\models\usuario;

use app\models\Banco;

class Solicitacoes {

	private $soli_id;
	private $soli_descricao;
	private $soli_date;
	private $soli_response;
	private $solistatus_id;
	private $soliusuario_id;
	private $solicategoria_id;

	public function __construct($soli_descricao, $soli_date, $solistatus_id, $soliusuario_id, $solicategoria_id) {
		$this->soli_descricao = $soli_descricao;
		$this->solistatus_id = $solistatus_id;
		$this->soliusuario_id = $soliusuario_id;
		$this->solicategoria_id = $solicategoria_id;
		$this->soli_date = $soli_date;
	}

	public function getSoli_id() {
		return $this->soli_id;
	}

	public function setSoli_id($soli_id) {
		$this->soli_id = $soli_id;
	}
	public function getSoli_descricao() {
		return $this->soli_descricao;
	}

	public function setSoli_descricao($soli_descricao) {
		$this->soli_descricao = $soli_descricao;
	}
	public function getSoli_date() {
		return $this->soli_date;
	}

	public function setSoli_date($soli_date) {
		$this->soli_date = $soli_date;
	}
	public function getSoli_response() {
		return $this->soli_response;
	}

	public function setSoli_response($soli_response) {
		$this->soli_response = $soli_response;
	}
	public function getSolistatus_id() {
		return $this->solistatus_id;
	}

	public function setSolistatus_id($solistatus_id) {
		$this->solistatus_id = $solistatus_id;
	}
	public function getSoliusuario_id() {
		return $this->soliusuario_id;
	}

	public function setSoliusuario_id($soliusuario_id) {
		$this->soliusuario_id = $soliusuario_id;
	}
	public function getSolicategoria_id() {
		return $this->solicategoria_id;
	}

	public function setSolicategoria_id($solicategoria_id) {
		$this->solicategoria_id = $solicategoria_id;
	}

	public function addSolicitacao() {
		$banco = new Banco();

		return $banco->query(" INSERT INTO  solicitacoes (soli_descricao,  soli_date, solistatus_id,  soliusuario_id,  solicategoria_id) VALUES (:soli_descricao,  :soli_date, :solistatus_id,  :soliusuario_id,  :solicategoria_id) ", array(

			":soli_descricao" => $this->getSoli_descricao(),
			":soli_date" => $this->getSoli_date(),
			":solistatus_id" => $this->getSolistatus_id(),
			":soliusuario_id" => $this->getSoliusuario_id(),
			":solicategoria_id" => $this->getSolicategoria_id(),

		));

	}

	public static function addResponseSolicitacao($soli_id, $soli_response) {
		$banco = new Banco();

		return $banco->query(" UPDATE solicitacoes SET soli_response = :soli_response  WHERE soli_id = :soli_id  ", array(

			":soli_id" => $soli_id,
			":soli_response" => $soli_response,

		));

	}

	public static function getEmpresaSolicitacoes($emp_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM empresa_solicitacoes  WHERE emp_id = :emp_id", array(

			":emp_id" => $emp_id,

		));
	}
	public static function getEmAbertoEmpresaSolicitacoes($emp_id) {
		$banco = new Banco();

		return $banco->select(" SELECT count(soli_id) FROM empresa_solicitacoes  WHERE  status_soli_id  = 1 AND emp_id = :emp_id", array(

			":emp_id" => $emp_id,

		));
	}

	public static function getConcluidoEmpresaSolicitacoes($emp_id) {
		$banco = new Banco();

		return $banco->select(" SELECT count(soli_id) FROM empresa_solicitacoes  WHERE  status_soli_id  = 3 AND emp_id = :emp_id", array(

			":emp_id" => $emp_id,

		));

	}

// candidatos

	public static function getCandidatoSolicitacoes($cand_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM candidato_solicitacoes  WHERE cand_id = :cand_id", array(

			":cand_id" => $cand_id,

		));
	}

	public static function getEmAbertoCandidatoSolicitacoes($cand_id) {
		$banco = new Banco();

		return $banco->select(" SELECT count(soli_id) FROM candidato_solicitacoes  WHERE  status_soli_id  = 1 AND cand_id = :cand_id", array(

			":cand_id" => $cand_id,

		));
	}

	public static function getConcluidoCandidatoSolicitacoes($cand_id) {
		$banco = new Banco();

		return $banco->select(" SELECT count(soli_id) FROM candidato_solicitacoes  WHERE  status_soli_id  = 1 AND cand_id = :cand_id", array(

			":cand_id" => $cand_id,

		));
	}

}