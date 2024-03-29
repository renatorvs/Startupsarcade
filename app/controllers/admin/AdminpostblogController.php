<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\admin\Blog;
use app\models\admin\Blogcategoria;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class AdminpostblogController extends ContainerController {

	public function show($request) {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$getBlogLoad_id = blog::getBlogLoad_id($request->parameter);

		$getcategoria = Blogcategoria::getblogCategoria(Session::get("PAIS_ID"));
		$getPostBlog = Blog::getDestaque(Session::get('PAIS_ID'));

		//	toJson($getPostBlog);

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => 'editar artigo',
			'getcategorias' => $getcategoria,
			'post_id' => $getBlogLoad_id[0]['post_id'],
			'post_img_old' => $getBlogLoad_id[0]['post_img'],
			'blog_id' => $getBlogLoad_id[0]['blog_id'],
			'post_titulo' => $getBlogLoad_id[0]['post_titulo'],
			'post_subtitulo' => $getBlogLoad_id[0]['post_subtitulo'],
			'post_description' => $getBlogLoad_id[0]['post_description'],
			'blog_text' => $getBlogLoad_id[0]['blog_text'],
			'getBlogDestaques' => $getPostBlog,
			'blogdest_id' => $getBlogLoad_id[0]['blogdest_id'],
			'blogdest_nome' => $getBlogLoad_id[0]['blogdest_nome'],
			'blogcat_id' => $getBlogLoad_id[0]['blogcat_id'],
			'blogcat_nome' => $getBlogLoad_id[0]['blogcat_nome'],
			'post_paisid' => $getBlogLoad_id[0]['post_paisid'],
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.admineditpostblog');
	}

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$getcategoria = Blogcategoria::getblogCategoria(Session::get("PAIS_ID"));
		$getPostBlog = Blog::getDestaque(Session::get('PAIS_ID'));
		$this->view([
			'title' => 'novo artigo',
			'getblogcategoria' => $getcategoria,
			'getBlogDestaques' => $getPostBlog,
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminaddpostblog');
	}

	public function store() {
		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$session_id = Session::get("ADMIN_SESSION");

		$val = Validate::validate([
			'post_titulo' => 'string',
			'post_subtitulo' => 'string',
			'post_description' => 'string',
			'blog_text' => 'string',
			'blog_date' => 'date',
			'postdestaque_id' => 'integer',
			'blogcat_id' => 'integer',
			'post_paisid' => 'integer',
			'post_img_old' => 'string',
			'post_img_alt' => 'string',

			'blog_subtitulo' => 'string',
			'blog_video_src' => 'string',

			'blog_fonte' => 'string',

			//'blog_img' => 'string',

			'blog_img_alt' => 'string',

			'blog_autor' => 'string',

		]);
/// post_img
		// post_img_alt
		// blog_subtitulo
		// blog_video_src
		// blog_img
		// blog_img_alt
		// blog_fonte
		// blog_autor

		//debug($val);
		if ($_FILES['blog_img']) {
			$blog_img = Imagem::uploadImage($_FILES['blog_img']);
		} else {
			$blog_img = null;
		}
		if ($_FILES['post_img']) {
			$post_img = Imagem::uploadImage($_FILES['post_img']);
		} else {
			$post_img = null;
		}

		$blog = new Blog();
		$blog->setPost_titulo($val->post_titulo);
		$blog->setPost_subtitulo($val->post_subtitulo);
		$blog->setPost_description($val->post_description);
		$blog->setTipo_post_id($val->postdestaque_id);
		$blog->setUser_id($session_id);
		$blog->setPost_paisid($val->post_paisid);
		$blog->setPostdestaque_id($val->postdestaque_id);
		$blog->setPost_img_alt($val->post_img_alt);
		$blog->setPost_img($post_img);
		//post e blog tem categoria
		$blog->setCat_id($val->blogcat_id);
		//debug($blog);
		$blog->adicionaPost();

		$blogpost_id = Blog::getLastPost_id();
		//post e blog tem categoria, excluindo de blog apenas  post do artigo tem categoria
		$blog->setBlog_categoria_id($val->blogcat_id);

		$blog->setPostdestaque_id($val->postdestaque_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlogpost_id($blogpost_id[0]['post_id']);
		$blog->setBlog_subtitulo($val->blog_subtitulo);
		$blog->setBlog_video_src($val->blog_video_src);
		$blog->setBlog_img_alt($val->blog_img_alt);
		$blog->setBlog_fonte($val->blog_fonte);
		$blog->setBlog_autor($val->blog_autor);

		$blog->setBlog_img($blog_img);

		$blog->adicionaPostBlog();

		redirecionar("/academystartup/show/" . $blogpost_id[0]['post_id']);

	}

	public function destroy($request) {
		Blog::deletePostBlog($request->parameter);
		redirecionar("/blog/create");

	}

	public function editpoststore() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'postdestaque_id' => 'integer',
			'post_id' => 'integer',
			'post_titulo' => 'string',
			'post_subtitulo' => 'string',
			'post_description' => 'string',
			'post_paisid' => 'integer',
			'post_img_alt' => 'string',
			'post_img_old' => 'string',

		]);


// TESTAR ESSA PARTE
		if ($_FILES['post_img']['name'] != $post_img_old) {
			$post_img = Imagem::uploadImage($_FILES['post_img']);
		} else if ($_FILES['post_img']['name'] == $post_img_old) { {
			$post_img = $_FILES['post_img']['name'];
		} else {
			$post_img = null;

		}

		$blog = new Blog();

		$blog->setPost_id($val->post_id);
		$blog->setPost_titulo($val->post_titulo);
		$blog->setPost_subtitulo($val->post_subtitulo);
		$blog->setPost_description($val->blog_text);
		$blog->setPost_paisid($val->post_paisid);
		$blog->setPost_img_alt($val->post_img_alt);
		$blog->setPost_img($post_img);
		$blog->setCat_id(0);
		$blog->setTipo_post_id(5);
		$blog->setPost_ender_id(0);
		$blog->setPostdestaque_id($val->postdestaque_id);

		//	$blog->updatePost();

		redirecionar("/academystartup/show/" . $val->post_id);
	}

	public function addblogstore() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'post_id' => 'integer',
			'blog_id' => 'integer',
			'post_titulo' => 'string',
			'post_subtitulo' => 'string',
			'post_description' => 'string',
			'post_paisid' => 'integer',
			'blog_text' => 'string',
			//'post_img' => 'string',
			'blog_subtitulo' => 'string',
			'blog_fonte' => 'string',
			'blog_date' => 'date',
			'blogcat_id' => 'integer',
			'post_paisid' => 'integer',
			//'blog_img' => 'string',
			'blog_img_alt' => 'string',
			'post_img_alt' => 'string',
			'blog_autor' => 'string',
			'blog_video_src' => 'string',

		]);


		if ($_FILES['blog_img']['name'] != $blog_img_old) {
			$blog_img = Imagem::uploadImage($_FILES['post_img']);
		} else if ($_FILES['blog_img']['name'] == $blog_img_old) { {
			$blog_img = $_FILES['blog_img']['name'];
		} else {
			$blog_img = null;

		}

		$blog = new Blog();

		$blog->setBlog_id($val->blog_id);
		$blog->setPost_id($val->post_id);
		$blog->setBlog_categoria_id($val->blogcat_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlog_subtitulo($val->blog_subtitulo);
		$blog->setBlog_video_src($val->blog_video_src);
		$blog->setBlog_img_alt($val->blog_img_alt);
		$blog->setBlog_img($blog_img);
		$blog->setBlog_fonte($val->blog_fonte);
		$blog->setBlog_autor($val->blog_autor);

		# code...

		$blog->adicionaBlog();

		redirecionar("/academystartup/show/" . $val->post_id);
	}
	public function editblogstore() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'post_id' => 'integer',
			'blog_id' => 'integer',
			'post_titulo' => 'string',
			'post_subtitulo' => 'string',
			'post_description' => 'string',
			'post_paisid' => 'integer',
			'blog_text' => 'string',
			//'post_img' => 'string',
			'blog_subtitulo' => 'string',
			'blog_fonte' => 'string',
			'blog_date' => 'date',
			'blogcat_id' => 'integer',
			'post_paisid' => 'integer',
			//'blog_img' => 'string',
			'blog_img_alt' => 'string',
			'post_img_alt' => 'string',
			'blog_autor' => 'string',
			'blog_video_src' => 'string',

		]);


		if ($_FILES['blog_img']['name'] != $blog_img_old) {
			$blog_img = Imagem::uploadImage($_FILES['post_img']);
		} else if ($_FILES['blog_img']['name'] == $blog_img_old) { {
			$blog_img = $_FILES['blog_img']['name'];
		} else {
			$blog_img = null;

		}

		$blog = new Blog();

		$blog->setBlog_id($val->blog_id);
		$blog->setPost_id($val->post_id);
		$blog->setBlog_categoria_id($val->blogcat_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlog_subtitulo($val->blog_subtitulo);
		$blog->setBlog_video_src($val->blog_video_src);
		$blog->setBlog_img_alt($val->blog_img_alt);
		$blog->setBlog_img($blog_img);
		$blog->setBlog_fonte($val->blog_fonte);
		$blog->setBlog_autor($val->blog_autor);

		# code...

		$blog->adicionaBlog();

		redirecionar("/academystartup/show/" . $val->post_id);
	}

}
