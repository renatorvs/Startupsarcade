<?php
namespace app\models\admin;

use app\models\Banco;

class Postblog_categoria {
	private $postblogcat_id;
	private $postblogcat_nome;


	public function getPostblogcat_nome() {
		return $this->postblogcat_nome;
	}

	public function setPostblogcat_nome($postblogcat_nome) {
		$this->postblogcat_nome = $postblogcat_nome;
	}
	public function getPostblogcat_id() {
		return $this->postblogcat_id;
	}

	public function setPostblogcat_id($postblogcat_id) {
		$this->postblogcat_id = $postblogcat_id;
	}

	public static function getpostblogCategoria($postblogpais_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM postblog_categoria WHERE   postblogcat_id != 5 and   postblogcat_id != 10  AND postblogpais_id = :postblogpais_id", array(
			":postblogpais_id" => $postblogpais_id,
		));
	}

	public static function getpostblogCategoria_nome($postblogcat_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM postblog_categoria WHERE postblogcat_id = :postblogcat_id ", array(
			":postblogcat_id" => $postblogcat_id,

		));
	}

	public function adicionapostBlogCategoria() {

		$banco = new Banco();

		$result = $banco->select("INSERT INTO  postblog_categoria (postblogcat_nome ) VALUES (:postblogcat_nome)", array(
			":postblogcat_nome" => $this->getPostblogcat_nome(),
		));

	}

	public function editarPostblogCategoria() {

		$banco = new Banco();

		$banco->query(" UPDATE postblog_categoria SET postblogcat_nome = :postblogcat_nome  WHERE postblogcat_id = :postblogcat_id ", array(
			":postblogcat_id" => $this->getpostblogcat_id(),
			":postblogcat_nome" => $this->getpostblogcat_nome(),
		));
	}

	public function deleteBlogCategoria() {
		$banco = new Banco();

		return $banco->query("DELETE FROM postblog_categoria WHERE postblogcat_id = :postblogcat_id", array(
			":postblogcat_id" => $this->getPostblogcat_id(),
		));

	}
}