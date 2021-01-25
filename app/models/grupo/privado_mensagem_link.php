<?php
namespace app\models\grupo;
use app\models\Banco;

class privado_mensagem_link {

	private $pml_id;
	private $pml_date;
	private $pml_grupo_id;
	private $pml_remetente_id;
	private $pml_msn_id;
	private $pmdl_id;
	private $pml_view;
	private $pml_destinatario_id;

// pml_id
	// pml_grupo_id
	// pml_user_remetente_id
	// pml_msn_id
	// pml_user_destinatario_id
	// pml_date
	// pml_view
	// pmld_id
	public static function addPrivadoMensagemLink($pml_grupo_id, $pml_remetente_id, $pml_msn_id,
		$pmdl_id) {
		$banco = new Banco();

		return $banco->query("INSERT INTO privado_mensagem_link( pml_grupo_id, pml_user_remetente_id, pml_msn_id, pmld_id, pml_user_destinatario_id) VALUES ( :pml_grupo_id, :pml_user_remetente_id, :pml_msn_id, :pmld_id, :pml_user_destinatario_id)", array(
			":pml_grupo_id" => $pml_grupo_id,
			":pml_remetente_id" => $pml_remetente_id,
			":pml_destinatario_id" => $pml_remetente_id,
			":pml_msn_id" => $pml_msn_id,
			":pmdl_id" => $pmdl_id,
		));

	}

	public static function getLastMensagemPedidoDados() {
		$banco = new Banco();

		return $banco->select("SELECT  mdl_id FROM pedido_mensagem_dados_link ORDER BY mdl_id DESC");

	}

}