<?php
namespace app\models\admin;
use app\models\Banco;

abstract class Post {

	private $post_id;
	private $post_titulo;
	private $post_subtitulo;
	private $post_description;
	private $cat_id;
	private $tipo_post_id;
	private $user_id;
	private $post_ender_id;
	private $post_paisid;

	public function getPost_paisid() {
		return $this->post_paisid;
	}

	public function setPost_paisid($post_paisid) {
		$this->post_paisid = $post_paisid;
	}

	public function getPost_ender_id() {
		return $this->post_ender_id;
	}

	public function setPost_ender_id($post_ender_id) {
		$this->post_ender_id = $post_ender_id;
	}

	public function getTipo_post_id() {
		return $this->tipo_post_id;
	}

	public function setTipo_post_id($tipo_post_id) {
		$this->tipo_post_id = $tipo_post_id;
	}
	public function getPost_id() {
		return $this->post_id;
	}

	public function setPost_id($post_id) {
		$this->post_id = $post_id;
	}

	public function getPost_titulo() {
		return $this->post_titulo;
	}

	public function setPost_titulo($post_titulo) {
		$this->post_titulo = $post_titulo;
	}
	public function getPost_subtitulo() {
		return $this->post_subtitulo;
	}

	public function setPost_subtitulo($post_subtitulo) {
		$this->post_subtitulo = $post_subtitulo;
	}
	public function getPost_description() {
		return $this->post_description;
	}

	public function setPost_description($post_description) {
		$this->post_description = $post_description;
	}

	public function getCat_id() {
		return $this->cat_id;
	}

	public function setCat_id($cat_id) {
		$this->cat_id = $cat_id;
	}

	public function getUser_id() {
		return $this->user_id;
	}

	public function setUser_id($user_id) {
		$this->user_id = $user_id;
	}

	public static function getEmpresaSherepointPost($us_usuario_id) {
		$banco = new Banco();

		return $banco->select(" SELECT  * from dados_usuario_post  where user_id = :user_id OR :user_id IN (SELECT us_seguindo_id_usuario from usuarios_seguidores where us_usuario_id = :user_id )", array(

			":user_id" => $us_usuario_id,

		));
	}
	public static function getCandidatoSherepointPost($us_usuario_id) {
		$banco = new Banco();

		return $banco->select(" SELECT  * from dados_usuario_post  where user_id = :user_id OR :user_id IN (SELECT us_seguindo_id_usuario from usuarios_seguidores where us_usuario_id = :user_id )", array(

			":user_id" => $us_usuario_id,

		));
	}

	public static function DeletePostvaga($post_id) {
		$banco = new Banco();

		$banco->query(" DELETE FROM vaga  WHERE postvaga_id = :postvaga_id ", array(

			":postvaga_id" => $post_id,

		));

		return $banco->query(" DELETE FROM post  WHERE post_id = :post_id ", array(

			":post_id" => $post_id,

		));
	}
	public static function getPostVaga($post_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  FROM  post_vaga WHERE tipo_post_id = 1  AND   post_id = :POST_ID GROUP BY post_id ", array(

			":POST_ID" => $post_id,

		));
	}

	public function getLastPost_id() {
		$banco = new Banco();

		return $banco->select("SELECT post_id FROM post ORDER BY post_id DESC LIMIT 1 ");
	}

	public function adicionaPost() {
		$banco = new Banco();

		$result = $banco->query(" INSERT INTO post (post_titulo, post_subtitulo, post_description, postcat_id, tipo_post_id, userpost_id) VALUES  (:post_titulo, :post_subtitulo, :post_description, :postcat_id, :tipo_post_id, :userpost_id) ", array(

			":post_titulo" => $this->getPost_titulo(),
			":post_subtitulo" => $this->getPost_subtitulo(),
			":post_description" => $this->getPost_description(),
			":postcat_id" => $this->getCat_id(),
			":tipo_post_id" => $this->getTipo_post_id(),
			":userpost_id" => $this->getUser_id(),

		));
	}

	public function updatePost() {
		$banco = new Banco();

		$result = $banco->query(" UPDATE post SET post_titulo = :post_titulo, post_subtitulo = :post_subtitulo, post_description = :post_description, postcat_id = :postcat_id WHERE post_id = :post_id ", array(

			":post_id" => $this->getPost_id(),
			":post_titulo" => $this->getPost_titulo(),
			":post_subtitulo" => $this->getPost_subtitulo(),
			":post_description" => $this->getPost_description(),
			":postcat_id" => $this->getCat_id(),

		));
	}

}
