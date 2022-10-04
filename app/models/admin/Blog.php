<?php
namespace app\models\admin;
use app\models\admin\Post;
use app\models\Banco;

class Blog extends Post {

	private $blog_id;
	private $postdestaque_id;
	private $blog_categoria_id;
	private $blog_text;
	private $postcat_id;
	private $blog_date;
	private $blog_img;
	private $post_id;
	private $post_titulo;
	private $post_subtitulo;
	private $post_description;
	private $cat_id;
	private $tipo_post_id;
	private $post_ender_id;
	private $user_id;
	private $blog_subtitulo;
	private $blog_img_alt;
	private $blog_fonte;
	private $blog_autor;
	private $blog_video_src;

/// post_img
	// post_img_alt
	// blog_subtitulo
	// blog_video_src
	// blog_img
	// blog_img_alt
	// blog_fonte
	// blog_autor

	public function getBlog_autor() {
		return $this->blog_autor;
	}

	public function setBlog_autor($blog_autor) {
		$this->blog_autor = $blog_autor;
	}
	public function getBlog_video_src() {
		return $this->blog_video_src;
	}

	public function setBlog_video_src($blog_video_src) {
		$this->blog_video_src = $blog_video_src;
	}
	public function getBlog_img_alt() {
		return $this->blog_img_alt;
	}

	public function setBlog_img_alt($blog_img_alt) {
		$this->blog_img_alt = $blog_img_alt;
	}

	public function getBlog_subtitulo() {
		return $this->blog_subtitulo;
	}

	public function setBlog_subtitulo($blog_subtitulo) {
		$this->blog_subtitulo = $blog_subtitulo;
	}
	public function getBlog_fonte() {
		return $this->blog_fonte;
	}

	public function setBlog_fonte($blog_fonte) {
		$this->blog_fonte = $blog_fonte;
	}
	public function getUser_id() {
		return $this->user_id;
	}

	public function setUser_id($user_id) {
		$this->user_id = $user_id;
	}
	public function getPost_ender_id() {
		return $this->post_ender_id;
	}

	public function setPost_ender_id($post_ender_id) {
		$this->post_ender_id = $post_ender_id;
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
	public function getTipo_post_id() {
		return $this->tipo_post_id;
	}

	public function setTipo_post_id($tipo_post_id) {
		$this->tipo_post_id = $tipo_post_id;
	}
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

	public function adicionaBlog() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO blog (blog_subtitulo, blog_text, blog_date, blog_img, blog_img_alt, blog_video_src, blog_autor, blogpost_id, blog_fonte) VALUES (:blog_subtitulo, :blog_text, now(), :blog_img, :blog_img_alt, :blog_video_src, :blog_autor, :blogpost_id, :blog_fonte)",
			array(
				":blog_text" => $this->getBlog_text(),
				":blog_img" => $this->getBlog_img(),
				//":blog_categoria_id" => $this->getBlog_categoria_id(),
				":blogpost_id" => $this->getBlogpost_id(),
				":blog_fonte" => $this->getBlog_fonte(),
				":blog_subtitulo" => $this->getBlog_subtitulo(),
				":blog_video_src" => $this->getBlog_video_src(),
				":blog_img_alt" => $this->getBlog_img_alt(),
				":blog_autor" => $this->getBlog_autor(),

			));

	}

	public function editarBlogStore() {

		$banco = new Banco();
		return $banco->query("UPDATE  blog  SET blog_subtitulo= :blog_subtitulo,  blog_text = :blog_text, blog_img = :blog_img, blog_img_alt = :blog_img_alt, blog_video_src = :blog_video_src, blog_autor = :blog_autor, blog_fonte = :blog_fonte WHERE blog_id = :blog_id ", array(

			":blog_id" => $this->getBlog_id(),
			//	":blog_categoria_id" => $this->getBlog_categoria_id(),
			":blog_text" => $this->getBlog_text(),
			":blog_subtitulo" => $this->getBlog_subtitulo(),
			":blog_video_src" => $this->getBlog_video_src(),
			":blog_img" => $this->getBlog_img(),
			":blog_img_alt" => $this->getBlog_img_alt(),
			":blog_fonte" => $this->getBlog_fonte(),
			":blog_autor" => $this->getBlog_autor(),
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

	public static function getPostBlog($post_paisid) {

		$banco = new Banco();
		return $banco->select("SELECT * FROM blog_post_categoria
			WHERE  postdestaque_id  = 1  AND postblogcat_id != 5
			AND post_paisid = :post_paisid GROUP BY post_id"
			, array(
				':post_paisid' => $post_paisid,
			));

	}
	public static function getPostPublicidade($post_paisid) {

		$banco = new Banco();
// post_paisid =  post_paisid
		return $banco->select("SELECT * FROM blog_post_categoria
			WHERE  postdestaque_id  != 3  AND postcat_id != 5
			and post_paisid = :post_paisid"
			, array(
				':post_paisid' => $post_paisid,
			));

	}

	public static function getPostBlogTermoBr($post_paisid) {

		$banco = new Banco();
// post_paisid =  post_paisid
		return $banco->select("SELECT * FROM blog_post_categoria
			WHERE  postdestaque_id  = 3  AND postcat_id = 5
			AND post_paisid = 1 ");

	}
	public static function getPostBlogTermoUsa() {

		$banco = new Banco();
// post_paisid =  post_paisid
		return $banco->select("SELECT * FROM blog_post_categoria
			WHERE  postdestaque_id  = 3  AND postcat_id = 10
			AND post_paisid = 2 ");

	}

	public static function getDestaque($post_paisid) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_destaque", array(
			':post_paisid' => $post_paisid,
		));
	}

	public static function getPostBlogCategoria($postblogcat_id, $postblogpais_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria   WHERE postblogcat_id = :postblogcat_id and postblogpais_id = :postblogpais_id  ", array(
			':postblogcat_id' => $postblogcat_id,
			':postblogpais_id' => $postblogpais_id,
		));

	}

	// exibe Para a pagina de artigos atras apneas um post destaque
	public static function getPostBlogDestaqueLimit($post_paisid) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria  WHERE postdestaque_id = 2  and post_paisid = :post_paisid ORDER by post_id DESC LIMIT 1  ", array(
			':post_paisid' => $post_paisid,
		));

	}
	public static function getPostBlogDestaqueAll($post_paisid) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria  WHERE postdestaque_id = 2  and post_paisid = :post_paisid ORDER by post_id DESC  ", array(
			':post_paisid' => $post_paisid,
		));

	}

	///ver os que estão em destaque todos
	public static function getBlogDestaque($post_paisid) {

		$banco = new Banco();

		return $banco->select(" SELECT * FROM blog_post_categoria  WHERE postdestaque_id = 2 and post_paisid = :post_paisid  ORDER by post_id DESC  ", array(

			':post_paisid' => $post_paisid,
		));

	}

	///Exibe apenas dois post recentes limitando a duas linhas

	public static function getPostBlogIndex($post_paisid) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria  WHERE postdestaque_id = 3  and post_paisid = :post_paisid  ORDER by blog_id DESC LIMIT 2  ", array(

			':post_paisid' => $post_paisid,

		));

	}

	public static function getBlogLoad_id($post_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria  WHERE post_id = :post_id ", array(
			':post_id' => $post_id,

		));

	}

	public static function getBlogByid($post_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog  WHERE blogpost_id = :blogpost_id ", array(
			':blogpost_id' => $post_id,

		));

	}
	public static function getBlogDestaqueAll() {

		$banco = new Banco();

		return $banco->select("SELECT * FROM post_destaque");

	}
	public static function getPostByid($post_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM blog_post_categoria  WHERE post_id = :post_id ", array(
			':post_id' => $post_id,

		));

	}

}
