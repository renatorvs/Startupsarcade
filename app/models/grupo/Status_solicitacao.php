<?php

namespace app\models\usuario;

use app\models\Banco;

class Status_solicitacao {

	private $status_soli_id;
	private $status_soli;
	public function getStatus_soli_id() {
		return $this->status_soli_id;
	}

	public function setStatus_soli_id($status_soli_id) {
		$this->status_soli_id = $status_soli_id;
	}
	public function getStatus_soli() {
		return $this->status_soli;
	}

	public function setStatus_soli($status_soli) {
		$this->status_soli = $status_soli;
	}

	public static function addStatusSolicitacao($status_soli) {
		$banco = new Banco();

		return $banco->query(" INSERT INTO `status_solicitacao`(`status_soli`) VALUES (:status_soli)", array(

			":status_soli" => $getStatus_soli(),

		));

	}

	public static function getStatusSolicitacao() {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM status_solicitacao ");

	}

}