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

		$getcategoria = Blogcategoria::getblogCategoria();
		$getPostBlog = Blog::getDestaque();

		//	toJson($getPostBlog);

		$this->view([
			'title' => 'editar artigo',
			'getcategorias' => $getcategoria,
			'post_id' => $getBlogLoad_id[0]['post_id'],
			'blog_id' => $getBlogLoad_id[0]['blog_id'],
			'post_titulo' => $getBlogLoad_id[0]['post_titulo'],
			'post_subtitulo' => $getBlogLoad_id[0]['post_subtitulo'],
			'blog_text' => $getBlogLoad_id[0]['blog_text'],
			'getBlogDestaques' => $getPostBlog,
			'blogdest_id' => $getBlogLoad_id[0]['blogdest_id'],
			'blogdest_nome' => $getBlogLoad_id[0]['blogdest_nome'],
			'blogcat_id' => $getBlogLoad_id[0]['blogcat_id'],
			'blogcat_nome' => $getBlogLoad_id[0]['blogcat_nome'],

		], 'admin.admineditpostblog');
	}

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$getcategoria = Blogcategoria::getblogCategoria();
		$getPostBlog = Blog::getDestaque();
		$this->view([
			'title' => 'novo artigo',
			'getblogcategoria' => $getcategoria,
			'getBlogDestaques' => $getPostBlog,

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
			'blog_text' => 'string',
			'blog_text' => 'string',
			'blog_date' => 'date',
			'blogdestaque_id' => 'integer',
			'blogcat_id' => 'integer',

		]);

		if ($_FILES['blog_img']) {
			$blog_img = Imagem::uploadImage($_FILES['blog_img']);
		}
		$blog_img = "";

		$blog = new Blog();
		$blog->setPost_titulo($val->post_titulo);
		$blog->setPost_subtitulo($val->post_subtitulo);
		$blog->setPost_description($val->blog_text);
		$blog->setCat_id(0);
		$blog->setTipo_post_id(5);
		$blog->setPost_ender_id(0);
		$blog->setUser_id($session_id);

		$blog->adicionaPost();

		$blogpost_id = Blog::getLastPost_id();

		$blog->setBlogdestaque_id($val->blogdestaque_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlog_categoria_id($val->blogcat_id);
		$blog->setBlog_date($val->blog_date);
		$blog->setBlogpost_id($blogpost_id[0]['post_id']);

		$blog->setBlog_img($blog_img);

		$blog->adicionaPostBlog();

		redirecionar("/blog/create");

	}

	public function edit() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'post_id' => 'integer',
			'blog_id' => 'integer',
			'post_titulo' => 'string',
			'post_subtitulo' => 'string',
			'blog_text' => 'string',
			'blogdestaque_id' => 'integer',
			'blog_date' => 'date',
			'blogcat_id' => 'integer',

		]);

		if ($_FILES['blog_img']) {
			$blog_img = Imagem::uploadImage($_FILES['blog_img']);
		} else {
			$blog_img = null;
		}

		$blog = new Blog();

		$blog->setPost_id($val->post_id);
		$blog->setPost_titulo($val->post_titulo);
		$blog->setPost_subtitulo($val->post_subtitulo);
		$blog->setPost_description($val->blog_text);

		$blog->setCat_id(0);
		$blog->setTipo_post_id(5);
		$blog->setPost_ender_id(0);

		$blog->updatePost();

		$blog->setBlogdestaque_id($val->blogdestaque_id);
		$blog->setBlog_text($val->blog_text);
		$blog->setBlog_categoria_id($val->blogcat_id);
		$blog->setBlog_id($val->blog_id);
		$blog->setBlog_img($blog_img);

		$blog->editarpostBlog();

		redirecionar("/blog/create");
	}

	public function destroy($request) {
		Blog::deletePostBlog($request->parameter);
		redirecionar("/blog/create");

	}

}
