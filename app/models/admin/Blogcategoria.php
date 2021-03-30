<?php
namespace app\models\admin;

use app\models\Banco;

class Blogcategoria {
	private $blogcat_id;
	private $blogcat_nome;

	public function getBlogcat_id() {
		return $this->blogcat_id;
	}

	public function setBlogcat_id($blogcat_id) {
		$this->blogcat_id = $blogcat_id;
	}
	public function getBlogcat_nome() {
		return $this->blogcat_nome;
	}

	public function setBlogcat_nome($blogcat_nome) {
		$this->blogcat_nome = $blogcat_nome;
	}
	public static function getblogCategoria($blogpais_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_categoria WHERE blogpais_id = :blogpais_id", array(
			":blogpais_id" => $blogpais_id,
		));
	}

	public static function getblogCategoria_nome($blogcat_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_categoria WHERE blogcat_id = :blogcat_id ", array(
			":blogcat_id" => $blogcat_id,
		));
	}

	public function adicionaBlogCategoria() {

		$banco = new Banco();

		$result = $banco->select("INSERT INTO  blog_categoria (blogcat_nome ) VALUES (:blogcat_nome)", array(
			":blogcat_nome" => $this->getBlogcat_nome(),
		));

	}

	public function editarBlogCategoria() {

		$banco = new Banco();

		$banco->query(" UPDATE blog_categoria SET blogcat_nome = :blogcat_nome  WHERE blogcat_id = :blogcat_id ", array(
			":blogcat_id" => $this->getBlogcat_id(),
			":blogcat_nome" => $this->getBlogcat_nome(),
		));
	}

	public function deleteBlogCategoria() {
		$banco = new Banco();

		return $banco->query("DELETE FROM blog_categoria WHERE car_id = :CAR_ID", array(
			":CAR_ID" => $this->getCar_id(),
		));

	}
}