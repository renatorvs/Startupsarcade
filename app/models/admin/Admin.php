<?php
namespace app\models\admin;

use app\models\Banco;

class Admin {
	private $adm_id;
	private $adm_nome;
	private $adm_email;
	private $adm_senha;
	private $car_id;

	public function __construct($adm_nome, $adm_email, $adm_senha, $car_id) {
		$this->adm_nome = $adm_nome;
		$this->adm_email = $adm_email;
		$this->adm_senha = $adm_senha;
		$this->car_id = $car_id;
	}

	public function getCar_id() {
		return $this->car_id;
	}
	public function setCar_id($car_id) {
		$this->car_id = $car_id;
	}
	public function getAdm_id() {
		return $this->adm_id;
	}
	public function getAdm_nome() {
		return $this->adm_nome;
	}
	public function getAdm_email() {
		return $this->adm_email;
	}
	public function getAdm_senha() {
		return $this->adm_senha;
	}

	public function adicionaAdm() {

		$banco = new Banco();

		$result = $banco->query("
			INSERT INTO adm (adm_nome, adm_email, adm_senha, car_id) VALUES (:adm_nome, :adm_email, :adm_senha, :car_id)",
			array(
				":adm_nome" => $this->getAdm_nome(),
				":adm_email" => $this->getAdm_email(),
				":adm_senha" => $this->getAdm_senha(),
				":car_id" => $this->getCar_id(),
			));

	}

	public function EditarAdm() {

		$banco = new Banco();

		$banco->query(" UPDATE adm SET adm_email = :ADM_EMAIL, adm-senha = :ADM_SENHA  WHERE adm_id = :ADM_ID ", array(
			":ADM_EMAIL" => $this->getAdm_email(),
			":ADM_SENHA" => $this->getAdm_senha(),
			":ADM_ID" => $this->getAdm_id(),
		));
	}

	public function deleteAdm() {
		$banco = new Banco();

		return $banco->query("DELETE FROM adm WHERE adm_id = :ID", array(
			":ID" => $this->getAdm_id(),
		));

	}

	public static function getEmailAdmin($adm_email) {

		$banco = new Banco();

		return $banco->select("SELECT adm_id, adm_nome, adm_email, adm_senha, car_id FROM adm WHERE  adm_email = :ADM_EMAIL LIMIT 1", array(
			":ADM_EMAIL" => $adm_email,
		));

	}

}
