<?php

namespace app\models\usuario;
use app\models\Banco;

class PedidoMensagemLink {
	private $pml_id;
	private $pml_user_remetente_id;
	private $pml_user_destinatario_id;
	private $pml_grupo_id;
	private $pml_msn_id;
	private $pml_date;

	public function getPml_user_remetente_id() {
		return $this->pml_user_remetente_id;
	}

	public function setPml_user_remetente_id($pml_user_remetente_id) {
		$this->pml_user_remetente_id = $pml_user_remetente_id;
	}

	public function getPml_user_destinatario_id() {
		return $this->pml_user_destinatario_id;
	}

	public function setPml_user_destinatario_id($pml_user_destinatario_id) {
		$this->pml_user_destinatario_id = $pml_user_destinatario_id;
	}

	public function getPml_pedi_id() {
		return $this->pml_pedi_id;
	}

	public function setPml_pedi_id($pml_pedi_id) {
		$this->pml_pedi_id = $pml_pedi_id;
	}
	public function getPml_msn_id() {
		return $this->pml_msn_id;
	}

	public function setPml_msn_id($pml_msn_id) {
		$this->pml_msn_id = $pml_msn_id;
	}
	public function getPml_date() {
		return $this->pml_date;
	}

	public function setPml_date($pml_date) {
		$this->pml_date = $pml_date;
	}
	public function getPml_view() {
		return $this->pml_view;
	}

	public function setPml_view($pml_view) {
		$this->pml_view = $pml_view;
	}

	public static function getPedidoConversas($remetente_destinatario_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from pedido_conversas   WHERE pml_user_remetente_id = :pml_user_destinatario_id or

			pml_user_destinatario_id = :pml_user_destinatario_id group BY pedi_id DESC", array(
			":pml_user_remetente_id" => $remetente_destinatario_id,
			":pml_user_destinatario_id" => $remetente_destinatario_id,
		));

	}

	public static function getpedidoMensagem($pedi_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from pedido_conversas   WHERE pedi_id = :pedi_id
			ORDER BY msn_id ASC", array(
			":pedi_id" => $pedi_id,
		));

	}

	public static function getpedidoMensagemDados($pedi_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  from pedido_conversas   WHERE pedi_id = :pedi_id
			 LIMIT 1", array(
			":pedi_id" => $pedi_id,
		));

	}

	public function addPedido_mensagem_link() {
		$banco = new Banco();

		return $result = $banco->query("INSERT INTO  pedido_mensagem_link ( pml_user_remetente_id,  pml_user_destinatario_id,  pml_pedi_id,  pml_msn_id, pml_pmdl_id) VALUES (:pml_user_remetente_id,  :pml_user_destinatario_id,  :pml_pedi_id, :pml_msn_id, :pml_pmdl_id) ", array(
			":pml_user_remetente_id" => $this->getPml_user_remetente_id(),
			":pml_user_destinatario_id" => $this->getPml_user_destinatario_id(),
			":pml_pedi_id" => $this->getPml_pedi_id(),
			":pml_msn_id" => $this->getPml_msn_id(),
			":pml_pmdl_id" => $this->getPml_pmdl_id(),
		));
	}

}