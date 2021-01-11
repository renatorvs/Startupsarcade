<?php
namespace app\controllers\usuario;

use app\controllers\ContainerController;
use app\models\admin\Blog;
use app\models\admin\Blogcategoria;
use app\session\Session;

class BlogController extends ContainerController {

	public function create() {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_ID')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$session_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		}

		$getcategoria = Blogcategoria::getblogCategoria();

		$postBlog = Blog::getPostBlog();
		$postBlogDestaque = Blog::getPostBlogDestaque();

		//debug($postBlogDestaque);

		$this->view([
			'title' => " onclickup blog",
			'empresa_session' => $empresa_session,
			'admin_session' => $admin_session,
			'candidato_session' => $candidato_session,
			'getblogcategorias' => $getcategoria,
			'postBlog' => $postBlog,
			'postBlogDestaque' => $postBlogDestaque,
			'pref' => Session::get("USER_PREFERENCIAS"),

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($session_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.blog');
	}

	public function show($request) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$empresaSession_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_id')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidatoSession_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		}

		$post_id = $request->parameter;

		$blogLoad_id = Blog::getBlogLoad_id($post_id);

		$this->view([
			'title' => " Artigo: " . $blogLoad_id[0]['post_titulo'],

			'admin_session' => $admin_session,
			'empresa_session' => $empresa_session,
			'candidato_session' => $candidato_session,
			'post_id' => $blogLoad_id[0]['post_id'],
			'blogcat_nome' => $blogLoad_id[0]['blogcat_nome'],
			'post_titulo' => $blogLoad_id[0]['post_titulo'],
			'post_subtitulo' => $blogLoad_id[0]['post_subtitulo'],
			'blog_text' => $blogLoad_id[0]['blog_text'],
			'blog_date' => $blogLoad_id[0]['blog_date'],
			'blog_img' => $blogLoad_id[0]['blog_img'],

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'usuario.blogverartigo');

	}

	public function blogcategoria($request) {
		if (Session::get('EMPRESA_SESSION_ID')) {
			$empresa_session = TRUE;
			$candidato_session = FALSE;
			$admin_session = FALSE;
			$empresaSession_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else if (Session::get('CANDIDATO_SESSION_id')) {
			$candidato_session = TRUE;
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidatoSession_id = Session::get('CANDIDATO_SESSION_ID');
			$sessionUsuario_id = Session::get('CANDIDATO_USUARIO_ID');
		} else if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		} else {
			$admin_session = FALSE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
		}

		$getcategorias = Blogcategoria::getblogCategoria();
		$blogcat_id = $request->parameter;

		$blogCategoria = Blog::getPostBlogCategoria($blogcat_id);
		$blogCategoria_nome = Blogcategoria::getblogCategoria_nome($blogcat_id);

		if (!$blogCategoria) {
			$blogCategoria = FALSE;

		}

		$this->view([
			'title' => "Artigo categoria",
			'categoria_nome' => $blogCategoria_nome[0]['blogcat_nome'],
			'haBlogCategoria' => $blogCategoria,
			'admin_session' => $admin_session,
			'empresa_session' => $empresa_session,
			'candidato_session' => $candidato_session,
			'blogCategoria' => $blogCategoria,
			'getcategorias' => $getcategorias,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),
		], 'usuario.blogcategoria');

	}

	public function blogdestaque() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		} else {
			$admin_session = TRUE;
		}

		$getBlogDestaque = Blog::getBlogDestaque();

		$this->view([
			'title' => "Post Em destaque",
			'admin_session' => $admin_session,
			'getBlogDestaque' => $getBlogDestaque,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
			'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

		], 'admin.blogdestaque');

	}

}