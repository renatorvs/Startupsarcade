<?php
namespace app\models\admin;
use app\models\Banco;

class Publicidade {

	private $pu_id;
	private $pu_produto;
	private $pu_link;
	private $pu_categoria_id;
	private $pu_pais;
	private $pu_preco;
	private $pu_parcela;
	private $pu_src;

	public function __construct($pu_produto, $pu_link, $pu_src, $pu_categoria_id, $pu_pais, $pu_preco, $pu_parcela) {
		$this->pu_produto = $pu_produto;
		$this->pu_link = $pu_link;
		$this->pu_categoria_id = $pu_categoria_id;
		$this->pu_pais = $pu_pais;
		$this->pu_preco = $pu_preco;
		$this->pu_parcela = $pu_parcela;
		$this->pu_src = $pu_src;
	}
	public function getPu_src() {
		return $this->pu_src;
	}

	public function setPu_src($pu_src) {
		$this->pu_src = $pu_src;
	}

	public function getPu_preco() {
		return $this->pu_preco;
	}

	public function setPu_preco($pu_preco) {
		$this->pu_preco = $pu_preco;
	}
	public function getPu_parcela() {
		return $this->pu_parcela;
	}

	public function setPu_parcela($pu_parcela) {
		$this->pu_parcela = $pu_parcela;
	}
	public function getPu_id() {
		return $this->pu_id;
	}

	public function setPu_id($pu_id) {
		$this->pu_id = $pu_id;
	}
	public function getPu_produto() {
		return $this->pu_produto;
	}

	public function setPu_produto($pu_produto) {
		$this->pu_produto = $pu_produto;
	}
	public function getPu_link() {
		return $this->pu_link;
	}

	public function setPu_link($pu_link) {
		$this->pu_link = $pu_link;
	}
	public function getPu_categoria_id() {
		return $this->pu_categoria_id;
	}

	public function setPu_categoria_id($pu_categoria_id) {
		$this->pu_categoria_id = $pu_categoria_id;
	}
	public function getPu_pais() {
		return $this->pu_pais;
	}

	public function setPu_pais($pu_pais) {
		$this->pu_pais = $pu_pais;
	}

	public static function getPublicidade($pu_categoria_id, $pu_pais) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM publicidade where  pu_categoria_id = :pu_categoria_id and pu_categoria_id = 0 and pu_pais = :pu_pais ", array(
			":pu_categoria_id" => $pu_categoria_id,
			":pu_pais" => $pu_pais,
		));
	}

	public static function getDuvidaCategoria() {

	}

	public function add() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO publicidade(pu_produto, pu_link, pu_src, pu_categoria_id, pu_pais, pu_preco,  pu_parcela) VALUES (:pu_produto, :pu_link, :pu_src, :pu_categoria_id, :pu_pais, :pu_preco, :pu_parcela) ", array(
			":pu_produto" => $this->getPu_produto(),
			":pu_link" => $this->getPu_link(),
			":pu_categoria_id" => $this->getPu_categoria_id(),
			":pu_pais" => $this->getPu_pais(),
			":pu_preco" => $this->getPu_preco(),
			":pu_parcela" => $this->getPu_parcela(),
			":pu_src" => $this->getPu_src(),

		));
	}

	public function deleteDuvida() {
		$banco = new Banco();

		$result = $banco->query("DELETE FROM  duvidas  WHERE  duv_id =:duv_id", array(
			":duv_id" => $this->getDuv_id(),

		));
	}

}