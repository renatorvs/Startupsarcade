<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Blog;
use app\models\admin\Blogcategoria;
use app\session\Session;

class AcademystartupController extends ContainerController {

	public function create() {

		$getcategoria = Blogcategoria::getblogCategoria(Session::get('PAIS_ID'));

		$postBlog = Blog::getPostBlog(Session::get('PAIS_ID'));
		$postBlogDestaque = Blog::getPostBlogDestaque(Session::get('PAIS_ID'));

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getacademy();

			$this->view([
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'title' => $lin->title,
				'continue_lendo' => $lin->continue_lendo,
				'usuario_id' => Session::get('USUARIO_ID'),
				'admin_session' => $admin_session,
				'candidato_session' => $candidato_session,
				'getblogcategorias' => $getcategoria,
				'postBlog' => $postBlog,
				'postBlogDestaque' => $postBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
			], 'grupo.academy');

		}
	}

	public function show($request) {

		$post_id = $request->parameter;

		$blogLoad_id = Blog::getBlogLoad_id($post_id);
		///debug($blogLoad_id);
		$getcategoria = Blogcategoria::getblogCategoria(Session::get('PAIS_ID'));

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getacademyartigo();
			//debug($blogLoad_id);
			$this->view([
				'title' => " Artigo: " . $blogLoad_id[0]['post_titulo'],
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_voltar' => $lin->btn_voltar,
				'blog_categoria' => $lin->blog_categoria,
				'blog_artigo' => $lin->blog_artigo,
				'blog_Data_post' => $lin->blog_Data_post,
				'admin_session' => $admin_session,
				'empresa_session' => $empresa_session,
				'candidato_session' => $candidato_session,
				'post_id' => $blogLoad_id[0]['post_id'],
				'blogcat_nome' => $blogLoad_id[0]['blogcat_nome'],
				'post_titulo' => $blogLoad_id[0]['post_titulo'],
				'post_subtitulo' => $blogLoad_id[0]['post_subtitulo'],
				'post_description' => $blogLoad_id[0]['post_description'],
				'blog_date' => $blogLoad_id[0]['blog_date'],
				'blog_img' => $blogLoad_id[0]['blog_img'],
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
				'getblogcategorias' => $getcategoria,

			], 'grupo.academyartigo');

		}

	}

	public function academycategoria($request) {

		$blogcat_id = $request->parameter;

		$blogCategoria = Blog::getPostBlogCategoria($blogcat_id);
		$blogCategoria_nome = Blogcategoria::getblogCategoria_nome($blogcat_id);

		if (!$blogCategoria) {
			$blogCategoria = FALSE;

		}

		$getcategoria = Blogcategoria::getblogCategoria(Session::get('PAIS_ID'));
		//debug($getcategoria);
		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getacademycategoria();

			$this->view([
				'header_h1' => $lin->header_h1,
				'header_h2' => $lin->header_h2,
				'header_button' => $lin->header_button,
				'continue_lendo' => $lin->continue_lendo,

				'title' => "Artigo categoria",
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'btn_a_destaque' => $lin->btn_a_destaque,
				'btn_artigo' => $lin->btn_artigo,
				'btn_a_ir_blog' => $lin->btn_a_ir_blog,
				'categoria_artigo' => $lin->categoria_artigo,
				'nao_ha_artigo' => $lin->nao_ha_artigo,
				'continue_lendo' => $lin->continue_lendo,
				'categoria_nome' => $blogCategoria_nome[0]['blogcat_nome'],
				'haBlogCategoria' => $blogCategoria,
				'admin_session' => $admin_session,
				'empresa_session' => $empresa_session,
				'candidato_session' => $candidato_session,
				'blogCategoria' => $blogCategoria,
				'getcategorias' => $getcategoria,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
			], 'grupo.academycategoria');

		}

	}

	public function academydestaque() {

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			redirecionar("/adminlogin/admin");
		} else {
			$admin_session = TRUE;
		}

		$getBlogDestaque = Blog::getBlogDestaque();

		$lin = Linguagem::getBlogInterior();

		if (Session::get('USUARIO_ID')) {

			$this->view([
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'btn_a_destaque' => $lin->btn_a_destaque,
				'btn_artigo' => $lin->btn_artigo,
				'btn_a_add_artigo' => $lin->btn_a_add_artigo,
				'admin_session' => $admin_session,
				'getBlogDestaque' => $getBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

			], 'grupo.academydestaque');

		}

	}

}