<?php

namespace app\models\grupo;
use app\models\Banco;

class Estado {
	private $est_id;
	private $est_nome;
	private $pais_id;

	public function getEst_id() {
		return $this->est_id;
	}

	public function setEst_id($est_id) {
		$this->est_id = $est_id;
	}
	public function getEst_nome() {
		return $this->est_nome;
	}

	public function setEst_nome($est_nome) {
		$this->est_nome = $est_nome;
	}
	public function getPais_id() {
		return $this->pais_id;
	}

	public function setPais_id($pais_id) {
		$this->pais_id = $pais_id;
	}

	public static function listEstados() {

		$banco = new Banco();

		return $estados = $banco->select("SELECT * FROM estado");

	}

	public function adicionaEstado() {

		$banco = new Banco();

		$result = $banco->select("CALL sp_estado_insert(:est_nome)", array(
			":cat_nome" => $this->getCat_nome(),

		));

	}

	public function EditarEstado($est_id, $est_nome) {
		$this->setEst_id($est_id);
		$this->setEst_nome($est_nome);

		$banco = new Banco();

		$banco->query(" UPDATE estado SET est_nome = :EST_NOME  WHERE est_id = :EST_ID ", array(
			":EST_ID" => $this->getEst_id(),
			":EST_NOME" => $this->getEst_nome(),
		));

	}

	public function deleteEstado($est_id) {

		$this->setEst_id($est_id);

		$banco = new Banco();

		return $banco->query("DELETE FROM estado WHERE est_id = :EST_ID", array(
			":EST_ID" => $this->getEst_id(),
		));

	}
}