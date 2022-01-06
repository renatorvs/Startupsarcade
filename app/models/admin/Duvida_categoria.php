<?php
namespace app\models\admin;

use app\models\Banco;

class Duvida_categoria {
	private $duvcat_id;
	private $duvcat_nome;
	private $duvpais_id;

	public function getDuvpais_id() {
		return $this->duvpais_id;
	}

	public function setDuvpais_id($duvpais_id) {
		$this->duvpais_id = $duvpais_id;
	}
	public function getDuvcat_id() {
		return $this->duvcat_id;
	}

	public function setDuvcat_id($duvcat_id) {
		$this->duvcat_id = $duvcat_id;
	}
	public function getDuvcat_nome() {
		return $this->duvcat_nome;
	}

	public function setDuvcat_nome($duvcat_nome) {
		$this->duvcat_nome = $duvcat_nome;
	}

	public function addDuvidaCategoria() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO duvidas_categoria(duvcat_nome, duvpais_id) VALUES (:duvcat_nome, :duvpais_id) ", array(
			":duvcat_nome" => $this->getDuvcat_nome(),
			":duvpais_id" => $this->getDuvpais_id(),

		));
	}

	public static function getDuvidasCategoria($pais_id) {

		$banco = new Banco();
		if ($pais_id == 1) {
			return $banco->select("SELECT * FROM `duvidas_categoria` WHere `duvpais_id` = 1");
		} else {
			return $banco->select("SELECT * FROM `duvidas_categoria` WHere `duvpais_id` = 2");
		}

	}

	public static function loadByDuvidaCategoria($duvcat_id) {

		$banco = new Banco();

		return $banco->select(" SELECT * FROM duvidas_categorias_view WHERE duvcat_id = :duvcat_id ", array(
			":duvcat_id" => $duvcat_id,
		));
	}

}