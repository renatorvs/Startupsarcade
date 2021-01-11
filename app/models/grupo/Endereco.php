<?php

namespace app\models\usuario;
use app\models\Banco;

class Endereco {

	private $ender_id;
	private $ender_numero;
	private $ender_logradouro;
	private $ender_bairro;
	private $ender_comple;
	private $ender_cidade;
	private $ender_cep;
	private $estado;

	public function getEnder_cep() {
		return $this->ender_cep;
	}

	public function setEnder_cep($ender_cep) {
		$this->ender_cep = $ender_cep;
	}
	public function getEnder_comple() {
		return $this->ender_comple;
	}

	public function setEnder_comple($ender_comple) {
		$this->ender_comple = $ender_comple;
	}
	public function getEnder_id() {
		return $this->ender_id;
	}

	public function setEnder_id($ender_id) {
		$this->ender_id = $ender_id;
	}
	public function getEnder_numero() {
		return $this->ender_numero;
	}

	public function setEnder_numero($ender_numero) {
		$this->ender_numero = $ender_numero;
	}
	public function getEnder_logradouro() {
		return $this->ender_logradouro;
	}

	public function setEnder_logradouro($ender_logradouro) {
		$this->ender_logradouro = $ender_logradouro;
	}
	public function getEnder_bairro() {
		return $this->ender_bairro;
	}

	public function setEnder_bairro($ender_bairro) {
		$this->ender_bairro = $ender_bairro;
	}
	public function getEnder_cidade() {
		return $this->ender_cidade;
	}

	public function setEnder_cidade($ender_cidade) {
		$this->ender_cidade = $ender_cidade;
	}

	public function getEstado() {
		return $this->estado;
	}

	public function setEstado($estado) {
		$this->estado = $estado;
	}

	public static function listEndereco() {

		$banco = new Banco();

		return $bairro = $banco->select("SELECT * FROM endereco");

	}

	public static function listloadEndereco($ender_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM endereco WHERE ender_id = :ender_id", array(
			":ender_id" => $ender_id,

		));

	}

	public static function getLastEndereco_id() {

		$banco = new Banco();

		return $banco->select("SELECT ender_id FROM endereco ORDER BY ender_id DESC LIMIT 1");
	}

	public function adicionaEndereco() {

		$banco = new Banco();

		return $banco->query("INSERT INTO endereco (ender_numero, ender_logradouro, ender_bairro,  ender_cidade, enderest_id, ender_comple, ender_cep) VALUES (:ender_numero, :ender_logradouro, :ender_bairro,  :ender_cidade, :enderest_id, :ender_comple, :ender_cep)", array(

			":ender_numero" => $this->getEnder_numero(),
			":ender_logradouro" => $this->getEnder_logradouro(),
			":ender_bairro" => $this->getEnder_bairro(),
			":ender_cidade" => $this->getEnder_cidade(),
			":enderest_id" => $this->getEstado()->getEst_id(),
			":ender_comple" => $this->getEnder_comple(),
			":ender_cep" => $this->getEnder_cep(),
		));

	}

	public function updateEndereco() {

		$banco = new Banco();

		return $banco->query(" UPDATE endereco set ender_logradouro = :ender_logradouro, ender_bairro = :ender_bairro,  ender_cidade = :ender_cidade,  ender_numero = :ender_numero, ender_comple = :ender_comple,  enderest_id = :enderest_id, ender_cep = :ender_cep WHERE ender_id = :ender_id ", array(

			":ender_id" => $this->getEnder_id(),
			":ender_logradouro" => $this->getEnder_logradouro(),
			":ender_bairro" => $this->getEnder_bairro(),
			":ender_cidade" => $this->getEnder_cidade(),
			":ender_numero" => $this->getEnder_numero(),
			":ender_comple" => $this->getEnder_comple,
			":ender_cep" => $this->getEnder_cep(),
			":enderest_id" => $this->getEstado()->getEst_id(),
		));

	}

}
