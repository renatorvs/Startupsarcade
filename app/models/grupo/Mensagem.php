<?php
namespace app\models\usuario;

use app\models\Banco;

class Mensagem {
	private $msn_id;
	private $msn_nome;
	private $msn_date;

	public function __construct($msn_nome) {
		$this->msn_nome = $msn_nome;
	}

	public function getMsn_id($msn_nome, $msn_date) {
		return $this->msn_id;
	}

	public function setMsn_id($msn_id) {
		$this->msn_id = $msn_id;
	}
	public function getMsn_date() {
		return $this->msn_date;
	}

	public function setMsn_date($msn_date) {
		$this->msn_date = $msn_date;
	}
	public function getMsn_nome() {
		return $this->msn_nome;
	}

	public function setMsn_nome($msn_nome) {
		$this->msn_nome = $msn_nome;
	}

	public function addMensagem() {
		$banco = new Banco();

		$result = $banco->query("INSERT INTO mensagem(msn_nome) VALUES (:msn_nome)", array(
			":msn_nome" => $this->getMsn_nome(),
		));
	}

	public static function getLastMessagem_id() {
		$banco = new Banco();

		return $banco->select("SELECT msn_id FROM mensagem ORDER BY msn_id DESC LIMIT  1 ");
	}

}