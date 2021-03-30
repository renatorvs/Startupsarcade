<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\admin\Blog;
use app\models\admin\Blogcategoria;
use app\session\Session;

class BlogController extends ContainerController {

	public function create() {

		$getcategoria = Blogcategoria::getblogCategoria(Session::get('PAIS_ID'));

		$postBlog = Blog::getPostBlog();
		$postBlogDestaque = Blog::getPostBlogDestaque();

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}
			$this->view([
				'title' => " onclickup bWWlog",
				'usuario_id' => Session::get('USUARIO_ID'),
				'admin_session' => $admin_session,
				'candidato_session' => $candidato_session,
				'getblogcategorias' => $getcategoria,
				'postBlog' => $postBlog,
				'postBlogDestaque' => $postBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),

			], 'grupo.bloginterior');

		} else {
			$this->view([
				'title' => " onclickup blog",
				'usuario_id' => Session::get('USUARIO_ID'),
				'admin_session' => $admin_session,
				'candidato_session' => $candidato_session,
				'getblogcategorias' => $getcategoria,
				'postBlog' => $postBlog,
				'postBlogDestaque' => $postBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),

			], 'index.blogexterior');
		}
	}

	public function show($request) {

		$post_id = $request->parameter;

		$blogLoad_id = Blog::getBlogLoad_id($post_id);
		///debug($blogLoad_id);
		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}
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
				'pais_id' => Session::get("PAIS_ID"),

				// 'NotsSShere' => getNotificantionShere($sessionUsuario_id),
				// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
				// 'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
				// 'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
				// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
				// 'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

			], 'grupo.blogartigoexterno');

		} else {
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
				'pais_id' => Session::get("PAIS_ID"),

				// 'NotsSShere' => getNotificantionShere($sessionUsuario_id),
				// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
				// 'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
				// 'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
				// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
				// 'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

			], 'index.blogartigoexterno');
		}

	}

	public function blogcategoria($request) {

		$getcategorias = Blogcategoria::getblogCategoria();
		$blogcat_id = $request->parameter;

		$blogCategoria = Blog::getPostBlogCategoria($blogcat_id);
		$blogCategoria_nome = Blogcategoria::getblogCategoria_nome($blogcat_id);

		if (!$blogCategoria) {
			$blogCategoria = FALSE;

		}

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
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
				'pais_id' => Session::get("PAIS_ID"),

			], 'grupo.blogcategoriainterior');

		} else {

			$this->view([
				'title' => "Artigo categoria",
				'categoria_nome' => $blogCategoria_nome[0]['blogcat_nome'],
				'haBlogCategoria' => $blogCategoria,
				'admin_session' => $admin_session,
				'empresa_session' => $empresa_session,
				'candidato_session' => $candidato_session,
				'blogCategoria' => $blogCategoria,
				'getcategorias' => $getcategorias,
				'pais_id' => Session::get("PAIS_ID"),

			], 'index.blogcategoriaexterior');

		}

	}

	public function blogdestaque() {

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			redirecionar("/adminlogin/admin");
		} else {
			$admin_session = TRUE;
		}

		$getBlogDestaque = Blog::getBlogDestaque();

		if (Session::get('USUARIO_ID')) {

			$this->view([
				'title' => "Post Em destaque",
				'admin_session' => $admin_session,
				'getBlogDestaque' => $getBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				// 'NotsSShere' => getNotificantionShere($sessionUsuario_id),
				// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
				// 'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
				// 'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
				// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
				// 'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

			], 'grupo.blogdestaqueinterior');

		} else {
			$this->view([
				'title' => "Post Em destaque",
				'admin_session' => $admin_session,
				'getBlogDestaque' => $getBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				// 'NotsSShere' => getNotificantionShere($sessionUsuario_id),
				// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
				// 'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
				// 'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
				// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
				// 'NotsEmpresaContacta' => getNotificantionEmpresaContacta($sessionUsuario_id),

			], 'index.blogdestaqueexterior');
		}

	}

}