<?php
namespace app\models\grupo;
use app\models\Banco;

class grupo_mensagem_link {

	private $gml_id;
	private $gml_date;
	private $gml_grupo_id;
	private $gml_remetente_id;
	private $gml_msn_id;
	private $gmdl_id;
	private $gml_view;
	private $gml_destinatario_id;

// pml_id
	// pml_grupo_id
	// pml_user_remetente_id
	// pml_msn_id
	// pml_user_destinatario_id
	// pml_date
	// pml_view
	// pmld_id
	public static function addGrupoMensagemLink($gml_grupo_id, $gml_remetente_id, $gml_msn_id,
		$gmdl_id) {
		$banco = new Banco();

		return $banco->query("INSERT INTO grupo_mensagem_link(gml_grupo_id, gml_remetente_id, gml_msn_id, gmdl_id ) VALUES (:gml_grupo_id, :gml_remetente_id, :gml_msn_id, :gmdl_id)", array(
			":gml_grupo_id" => $gml_grupo_id,
			":gml_remetente_id" => $gml_remetente_id,
			":gml_msn_id" => $gml_msn_id,
			":gmdl_id" => $gmdl_id,
		));

	}

	public static function getLastMensagemPedidoDados() {
		$banco = new Banco();

		return $banco->select("SELECT  mdl_id FROM pedido_mensagem_dados_link ORDER BY mdl_id DESC");

	}

}