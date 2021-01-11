<?php
namespace app\models\admin;

use app\models\Banco;

class Blog {

	private $blog_id;
	private $blogdestaque_id;
	private $blogpost_id;
	private $blog_text;
	private $blog_categoria_id;
	private $blog_date;
	private $blog_img;

	public function getBlogpost_id() {
		return $this->blogpost_id;
	}

	public function setBlogpost_id($blogpost_id) {
		$this->blogpost_id = $blogpost_id;
	}
	public function getBlogdestaque_id() {
		return $this->blogdestaque_id;
	}

	public function setBlogdestaque_id($blogdestaque_id) {
		$this->blogdestaque_id = $blogdestaque_id;
	}

	public function getBlog_date() {
		return $this->blog_date;
	}

	public function setBlog_date($blog_date) {
		$this->blog_date = $blog_date;
	}
	public function getBlog_img() {
		return $this->blog_img;
	}

	public function setBlog_img($blog_img) {
		$this->blog_img = $blog_img;
	}

	public function getBlog_id() {
		return $this->blog_id;
	}

	public function setBlog_id($blog_id) {
		$this->blog_id = $blog_id;
	}

	public function getBlog_text() {
		return $this->blog_text;
	}

	public function setBlog_text($blog_text) {
		$this->blog_text = $blog_text;
	}
	public function getBlog_categoria_id() {
		return $this->blog_categoria_id;
	}

	public function setBlog_categoria_id($blog_categoria_id) {
		$this->blog_categoria_id = $blog_categoria_id;
	}

	public function adicionaPostBlog() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO blog (blogdestaque_id, blog_text, blog_date, blog_img, blog_categoria_id, blogpost_id) VALUES (:blogdestaque_id, :blog_text, now(), :blog_img, :blog_categoria_id, :blogpost_id)",
			array(
				":blogdestaque_id" => $this->getBlogdestaque_id(),
				":blog_text" => $this->getBlog_text(),
				":blog_img" => $this->getBlog_img(),
				":blog_categoria_id" => $this->getBlog_categoria_id(),
				":blogpost_id" => $this->getBlogpost_id(),
			));

	}

	public function editarpostBlog() {

		$banco = new Banco();

		return $banco->query("UPDATE  blog  SET blogdestaque_id = :blogdestaque_id,  blog_text = :blog_text, blog_date = now(), blog_img = :blog_img, blog_categoria_id = :blog_categoria_id WHERE blog_id = :blog_id ", array(

			":blogdestaque_id" => $this->getBlogdestaque_id(),
			":blog_text" => $this->getBlog_text(),
			":blog_img" => $this->getBlog_img(),
			":blog_categoria_id" => $this->getBlog_categoria_id(),
			":blog_id" => $this->getBlog_id(),
		));
	}

	public static function deletePostBlog($blogpost_id) {
		$banco = new Banco();
		$banco->query("DELETE FROM post WHERE post_id = :post_id", array(
			":post_id" => $blogpost_id,
		));

		$banco->query("DELETE FROM blog WHERE blogpost_id = :blogpost_id", array(
			":blogpost_id" => $blogpost_id,
		));

	}

	public static function getPostBlog() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_blog_categorias WHERE  blogdestaque_id  IN(1, 3)  ");

	}

	public static function getDestaque() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_destaque");

	}

	public static function getPostBlogCategoria($blog_categoria_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_blog_categorias   WHERE blog_categoria_id = :blog_categoria_id ", array(
			':blog_categoria_id' => $blog_categoria_id,
		));

	}

	// exibe Para a pagina de artigos atras apneas um post destaque
	public static function getPostBlogDestaque() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_blog_categorias  WHERE blogdestaque_id = 2 ORDER by blog_id DESC LIMIT 1  ");

	}

	///ver os que estão em destaque todos
	public static function getBlogDestaque() {

		$banco = new Banco();

		return $banco->select(" SELECT * FROM post_blog_categorias  WHERE blogdestaque_id = 2  ORDER by blog_id DESC  ");

	}

	///Exibe apenas dois post recentes limitando a duas linhas

	public static function getPostBlogIndex() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_blog_categorias  WHERE blogdestaque_id = 3  ORDER by blog_id DESC LIMIT 2  ");

	}

	public static function getBlogLoad_id($post_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_blog_categorias  WHERE post_id = :post_id  LIMIT 1  ", array(
			'post_id' => $post_id,
		));

	}

}
