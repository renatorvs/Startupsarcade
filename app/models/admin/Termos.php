<?php
namespace app\models\admin;

class Termos {
	private $term_text;
	private $term_pais_id;
	private $term_date;

	public function getTerm_text() {
		return $this->term_text;
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

	public function addTermo() {
		$banco = new Banco();

		$result = $banco->query(" INSERT INTO termos (term_text, term_pais_id) VALUES  (:term_text, :term_pais_id) ", array(

			":term_text" => $this->getTerm_text(),
			":term_pais_id" => $this->getTerm_date(),
		));
	}

	public function addUpdate() {
		$banco = new Banco();

		$result = $banco->query(" UPDATE termos SET term_text = :term_text, term_pais_id = :term_pais_id ", array(

			":term_text" => $this->getTerm_text(),
			":term_pais_id" => $this->getTerm_date(),
		));
	}

	public static function getTermos() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM termos");
		));
	}

}