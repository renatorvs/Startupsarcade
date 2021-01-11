<?php

namespace app\models\usuario;
use app\models\Banco;

class GrupoMensagemLink {
	private $gml_id;
	private $gml_user_destinatario_id;
	private $gml_grupo_id;
	private $gml_msn_id;
	private $gml_date;

	public function getgml_user_destinatario_id() {
		return $this->gml_user_destinatario_id;
	}

	public function setgml_user_destinatario_id($gml_user_destinatario_id) {
		$this->gml_user_destinatario_id = $gml_user_destinatario_id;
	}

	public function getgml_pedi_id() {
		return $this->gml_pedi_id;
	}

	public function setgml_pedi_id($gml_pedi_id) {
		$this->gml_pedi_id = $gml_pedi_id;
	}
	public function getgml_msn_id() {
		return $this->gml_msn_id;
	}

	public function setgml_msn_id($gml_msn_id) {
		$this->gml_msn_id = $gml_msn_id;
	}
	public function getgml_date() {
		return $this->gml_date;
	}

	public function setgml_date($gml_date) {
		$this->gml_date = $gml_date;
	}
	public function getgml_view() {
		return $this->gml_view;
	}

	public function setgml_view($gml_view) {
		$this->gml_view = $gml_view;
	}

	public static function getGruposConversas($remetente_destinatario_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from pedido_conversas   WHERE gml_user_remetente_id = :gml_user_destinatario_id or

			gml_user_destinatario_id = :gml_user_destinatario_id group BY pedi_id DESC", array(
			":gml_user_remetente_id" => $remetente_destinatario_id,
			":gml_user_destinatario_id" => $remetente_destinatario_id,
		));

	}

	public static function getGruposMensagem($pedi_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from pedido_conversas   WHERE pedi_id = :pedi_id
			ORDER BY msn_id ASC", array(
			":pedi_id" => $pedi_id,
		));

	}

	public static function getGrupoMensagemDados($pedi_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from grupo_conversas   WHERE gr_id = :pedi_id
			 LIMIT 1", array(
			":pedi_id" => $pedi_id,
		));

	}

	public function addGrupo_mensagem_link() {
		$banco = new Banco();

		return $result = $banco->query("INSERT INTO  grupo_mensagem_link ( gml_user_remetente_id,  gml_user_destinatario_id,  gml_pedi_id,  gml_msn_id, gml_pmdl_id) VALUES (:gml_user_remetente_id,  :gml_user_destinatario_id,  :gml_pedi_id, :gml_msn_id) ", array(
			":gml_user_remetente_id" => $this->getgml_user_remetente_id(),
			":gml_user_destinatario_id" => $this->getgml_user_destinatario_id(),
			":gml_pedi_id" => $this->getgml_pedi_id(),
			":gml_msn_id" => $this->getgml_msn_id(),
		));
	}

}