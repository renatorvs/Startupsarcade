<?php

namespace app\models\admin;

use app\models\Banco;

class Duvidas {

	private $duv_id;
	private $duv_pergunta;
	private $duv_resposta;
	private $duvcategoria_id;

	public function getDuvcategoria_id() {
		return $this->duvcategoria_id;
	}

	public function setDuvcategoria_id($duvcategoria_id) {
		$this->duvcategoria_id = $duvcategoria_id;
	}
	public function getDuvcat_id() {
		return $this->duvcat_id;
	}

	public function setDuvcat_id($duvcat_id) {
		$this->duvcat_id = $duvcat_id;
	}
	public function getTiuser_id() {
		return $this->tiuser_id;
	}

	public function setTiuser_id($tiuser_id) {
		$this->tiuser_id = $tiuser_id;
	}
	public function getDuv_id() {
		return $this->duv_id;
	}

	public function setDuv_id($duv_id) {
		$this->duv_id = $duv_id;
	}
	public function getDuv_pergunta() {
		return $this->duv_pergunta;
	}

	public function setDuv_pergunta($duv_pergunta) {
		$this->duv_pergunta = $duv_pergunta;
	}
	public function getDuv_resposta() {
		return $this->duv_resposta;
	}

	public function setDuv_resposta($duv_resposta) {
		$this->duv_resposta = $duv_resposta;
	}

	public static function getDuvidasCandidato() {
		$banco = new Banco();

		return $banco->select("SELECT * FROM duvidas ");
	}

	public static function getDuvidasEmpresa() {
		$banco = new Banco();

		return $banco->select("SELECT * FROM duvidas");
	}

	public function addDuvida() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO duvidas(duv_pergunta, duv_resposta, duvcategoria_id) VALUES ( :duv_pergunta, :duv_resposta, :duvcategoria_id) ", array(
			":duv_pergunta" => $this->getDuv_pergunta(),
			":duv_resposta" => $this->getDuv_resposta(),
			":duvcategoria_id" => $this->getDuvcategoria_id(),

		));
	}

	public function deleteDuvida() {
		$banco = new Banco();

		$result = $banco->query("DELETE FROM  duvidas  WHERE  duv_id =:duv_id", array(
			":duv_id" => $this->getDuv_id(),

		));
	}

}