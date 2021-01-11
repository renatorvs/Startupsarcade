<?php

namespace app\models\usuario;

use app\models\Banco;

class Solicitacao_categoria {
	private $solicat_id;
	private $soli_cat_nome;

	public function getsolicat_id() {
		return $this->solicat_id;
	}

	public function setsolicat_id($solicat_id) {
		$this->solicat_id = $solicat_id;
	}
	public function getsoli_cat_nome() {
		return $this->soli_cat_nome;
	}

	public function setsoli_cat_nome($soli_cat_nome) {
		$this->soli_cat_nome = $soli_cat_nome;
	}

	public static function addSolicitacaoCategoria($soli_cat_nome) {
		$banco = new Banco();

		return $banco->query("INSERT INTO  solicitacao_categoria (soli_cat_nome ) VALUES
					(:soli_cat_nome)", array(

			":soli_cat_nome" => $getSoli_cat_nome(),

		));

	}

	public static function getSolicitacaoCategoria() {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM solicitacao_categoria ");

	}

}