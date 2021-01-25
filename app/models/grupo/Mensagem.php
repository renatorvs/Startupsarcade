<?php
namespace app\models\grupo;

use app\models\Banco;

class Mensagem {
	private $msn_id;
	private $msn_nome;
	private $msn_date;
	private $msn_type;

	public function getMsn_type() {
		return $this->msn_type;
	}

	public function setMsn_type($msn_type) {
		$this->msn_type = $msn_type;
	}

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

	public static function addMensagem($msn_nome, $msn_type) {
		$banco = new Banco();

		$result = $banco->query("INSERT INTO mensagem(msn_nome, msn_type) VALUES (:msn_nome, :msn_type)", array(
			":msn_nome" => $msn_nome,
			":msn_type" => $msn_type,
		));
	}

	public static function addMensagemdados($mdl_nome, $mdl_grupo_id, $mdl_user_id) {
		$banco = new Banco();

		$result = $banco->query("INSERT INTO mensagem_dados_link(mdl_nome, mdl_grupo_id, mdl_user_id) VALUES (:mdl_nome, :mdl_grupo_id, :mdl_user_id)", array(
			":mdl_nome" => $mdl_nome,
			":mdl_grupo_id" => $mdl_grupo_id,
			":mdl_user_id" => $mdl_user_id,
		));
	}

	public static function getMensagemDadoslink($mdl_user_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM mensagem_dados_link WHERE mdl_user_id = :mdl_user_id ",
			array(
				":mdl_user_id" => $mdl_user_id,

			));
	}
	public static function chatGrupoMensagem($gml_grupo_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM chatGrupoMensagem WHERE gml_grupo_id = :gml_grupo_id ",
			array(
				":gml_grupo_id" => $gml_grupo_id,

			));
	}
	public static function chatPrivadoMensagem($mdl_user_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM chatprivadomensagem WHERE mdl_user_id = :mdl_user_id ",
			array(
				":mdl_user_id" => $mdl_user_id,

			));
	}

	public static function updateMensagemDados($mdl_user_id) {
		$banco = new Banco();

		return $banco->query("UPDATE  mensagem_dados_link  SET  mdl_nome = :mdl_nome  WHERE mdl_user_id = mdl_user_id ",
			array(
				":mdl_user_id" => $mdl_user_id,

			));
	}
	public static function getLastMessagem_id() {
		$banco = new Banco();

		return $banco->select("SELECT msn_id FROM mensagem ORDER BY msn_id DESC LIMIT  1 ");
	}

}