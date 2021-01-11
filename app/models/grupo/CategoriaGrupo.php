<?php

namespace app\models\grupo;
use app\models\Banco;

class CategoriaGrupo {

	private $cg_id;
	private $cg_nome;

	public function getCg_id() {
		return $this->cg_id;
	}

	public function setCg_id($cg_id) {
		$this->cg_id = $cg_id;
	}
	public function getCg_nome() {
		return $this->cg_nome;
	}

	public function setCg_nome($cg_nome) {
		$this->cg_nome = $cg_nome;
	}
	public static function CategoriaGrupoAll() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM categoria_grupo");

	}
	public function adicionaCategoria() {

		$banco = new Banco();

		$banco->select("CALL sp_categoria_insert(:cat_nome)", array(
			":cg_nome" => $this->getCg_nome(),

		));

	}

	public function EditarCategoriaGrupo($car_id, $car_nome) {
		$this->setCar_id($car_id);
		$this->setCar_nome($car_nome);

		$banco = new Banco();

		$banco->query(" UPDATE CategoriaGrupo_grupo SET cat_nome = :CAT_NOME  WHERE cat_id = :CAT_ID ", array(
			":CAT_ID" => $this->getCat_id(),
			":CAT_NOME" => $this->getCat_nome(),
		));

	}

	public function deleteCategoriaGrupo($cat_id) {

		$this->setCg_id($cat_id);

		$banco = new Banco();

		return $banco->query("DELETE FROM categoria_grupo WHERE cg_id = :cg_id", array(
			":cg_id" => $this->getCg_id(),
		));

	}

}
