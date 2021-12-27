<?php
namespace app\models\admin;
use app\models\Banco;

class Termos {
	private $term_id;
	private $term_titulo;
	private $term_subtitulo;
	private $term_text;
	private $term_pais_id;
	private $term_date;

	public function getTerm_id() {
		return $this->term_id;
	}

	public function setTerm_id($term_id) {
		$this->term_id = $term_id;
	}
	public function getTerm_text() {
		return $this->term_text;
	}

	public function getTerm_titulo() {
		return $this->term_titulo;
	}

	public function setTerm_titulo($term_titulo) {
		$this->term_titulo = $term_titulo;
	}
	public function getTerm_subtitulo() {
		return $this->term_subtitulo;
	}

	public function setTerm_subtitulo($term_subtitulo) {
		$this->term_subtitulo = $term_subtitulo;
	}
	public function setTerm_text($term_text) {
		$this->term_text = $term_text;
	}
	public function getTerm_pais_id() {
		return $this->term_pais_id;
	}

	public function setTerm_pais_id($term_pais_id) {
		$this->term_pais_id = $term_pais_id;
	}
	public function getTerm_date() {
		return $this->term_date;
	}

	public function setTerm_date($term_date) {
		$this->term_date = $term_date;
	}

	public function addTermo($term_titulo, $term_subtitulo, $term_text, $term_pais_id) {
		$banco = new Banco();

		$result = $banco->query(" INSERT INTO termos (term_titulo, term_subtitulo, term_text, term_pais_id) VALUES  (:term_titulo,  :term_subtitulo, :term_text, :term_pais_id) ", array(

			":term_titulo" => $term_titulo,
			":term_subtitulo" => $term_subtitulo,
			":term_text" => $term_text,
			":term_pais_id" => $term_pais_id,
		));
	}

	public function addUpdate($term_titulo, $term_subtitulo, $term_text, $term_pais_id, $term_id) {
		$banco = new Banco();

		$result = $banco->query(" UPDATE termos SET term_titulo = :term_titulo, term_subtitulo = :term_subtitulo, term_text = :term_text, term_pais_id = :term_pais_id, term_id = :term_id", array(
			":term_titulo" => $term_titulo,
			":term_subtitulo" => $term_subtitulo,
			":term_text" => $term_text,
			":term_pais_id" => $term_pais_id,
			":term_id" => $term_id,
		));
	}

	public static function gettermos($term_pais_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM  termos WHERE term_pais_id = :term_pais_id", array(
			":term_pais_id" => $term_pais_id,
		));
	}

	public static function gettermosAdmin() {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM  termos ");
	}

}