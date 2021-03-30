<?php

namespace app\models\admin;

use app\models\Banco;

class Cargo {
	private $car_id;
	private $car_nome;

	public function getCar_id() {
		return $this->car_id;
	}
	public function getCar_nome() {
		return $this->car_nome;
	}
	public function setCar_id($id) {
		return $this->car_id;
	}
	public function setCar_nome($car_nome) {
		return $this->car_nome;
	}

	public static function getcargos() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM cargo");
	}

	public function adicionaCargo() {

		$banco = new Banco();

		$result = $banco->select("CALL sp_cargo_insert(:car_nome)", array(
			":car_nome" => $this->getCar_nome(),
		));

	}

	public function EditarCargo() {
		$this->setCar_id($car_id);
		$this->setCar_nome($car_nome);

		$banco = new Banco();

		$banco->query(" UPDATE cargo SET car_nome = :CAR_NOME  WHERE car_id = :CAR_ID ", array(
			":CAR_ID" => $this->getCar_id(),
			":CAR_NOME" => $this->getCar_nome(),
		));
	}

	public function deleteCargo() {
		$banco = new Banco();

		return $banco->query("DELETE FROM cargo WHERE car_id = :CAR_ID", array(
			":CAR_ID" => $this->getCar_id(),
		));

	}
}