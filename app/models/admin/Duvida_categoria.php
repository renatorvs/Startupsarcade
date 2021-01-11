<?php
namespace app\models\admin;

use app\models\Banco;

class Duvida_categoria {
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
	public function getDuvcat_tipo_id() {
		return $this->duvcat_tipo_id;
	}

	public function setDuvcat_tipo_id($duvcat_tipo_id) {
		$this->duvcat_tipo_id = $duvcat_tipo_id;
	}

	public function addDuvidaCategoria() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO duvidas_categoria(duvcat_nome, duvcat_tipo_id) VALUES (:duvcat_nome, :duvcat_tipo_id) ", array(
			":duvcat_nome" => $this->getDuvcat_nome(),
			":duvcat_tipo_id" => $this->getDuvcat_tipo_id(),

		));
	}

	public static function getduvidascategoria() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM duvidas_categoria");
	}
	public static function getDuvidasCandidatoCategoria() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM duvidas_categoria WHERE duvcat_tipo_id = 1");
	}

	public static function getDuvidasEmpresaCategoria() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM duvidas_categoria WHERE duvcat_tipo_id = 2");
	}

	public static function loadByDuvidaCategoria($duvcat_id) {

		$banco = new Banco();

		return $banco->select(" SELECT * FROM duvidas_categorias_view WHERE duvcat_id = :duvcat_id ", array(
			":duvcat_id" => $duvcat_id,
		));
	}

}