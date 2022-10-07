<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Blog;
use app\models\admin\Postblog_categoria;
use app\session\Session;

class BlogController extends ContainerController {
	public function create() {

		$getcategoria = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));
		$postBlog = Blog::getPostBlog(Session::get('PAIS_ID'));
		$postBlogDestaqueL = Blog::getPostBlogDestaqueLimit(Session::get('PAIS_ID'));
		$postBlogDestaqueAll = Blog::getPostBlogDestaqueAll(Session::get('PAIS_ID'));
		$lin = Linguagem::getLearning();
		$lin = Linguagem::getblogexterior();

		$this->view([
			'title' => $lin->title,
			'betas_version' => $lin->betas_version,
			'navmenu_1' => $lin->navmenu_1,
			'navmenu_2' => $lin->navmenu_2,
			'navmenu_3' => $lin->navmenu_3,
			'navmenu_4' => $lin->navmenu_4,
			'navmenu_5' => $lin->navmenu_5,
			'header_h1' => $lin->header_h1,
			'header_h2' => $lin->header_h2,
			'conteudo_completo' => $lin->conteudo_completo,

			'header_button' => $lin->header_button,
			'continue_lendo' => $lin->continue_lendo,
			'continue_lendo' => $lin->continue_lendo,
			'title' => " Blog Startup´s arcade ",
			'usuario_id' => Session::get('USUARIO_ID'),
			'admin_session' => $admin_session,
			'candidato_session' => $candidato_session,
			'getblogcategorias' => $getcategoria,
			'continue_lendo' => $lin->continue_lendo,
			'usuario_id' => Session::get('USUARIO_ID'),
			'postBlog' => $postBlog,
			'postBlogDestaque' => $postBlogDestaqueL,
			'postBlogDestaqueAll' => $postBlogDestaqueAll,
			'pais_id' => Session::get("PAIS_ID"),
			'admin_id' => Session::get("ADMIN_SESSION"),

		], 'index.blogexterior');
	}

	public function show($request) {


		$lin = Linguagem::getartigoexterior();
//mudar para while e colocar mais um button pra adiconar maism texto e imagens no artigo
		$post_id = $request->parameter;

		$getPost = Blog::getPostByid($post_id);
		$getPostAndArtigos = Blog::getBlogLoad_id($post_id);
		$blogCategoria_nome = Postblog_categoria::getpostblogCategoria_nome($post_id);

		$getcategoria = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));
		$this->view([

			'navmenu_1' => $lin->navmenu_1,
			'navmenu_2' => $lin->navmenu_2,
			'navmenu_3' => $lin->navmenu_3,
			'navmenu_4' => $lin->navmenu_4,
			'navmenu_5' => $lin->navmenu_5,
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'conteudo_completo' => $lin->conteudo_completo,
			'conteudo_completo_link' => $lin->conteudo_completo_link,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'btn_voltar' => $lin->btn_voltar,
			'blog_categoria' => $lin->blog_categoria,

				'title' => $getPost[0]['post_titulo'] . $lin->title,
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_voltar' => $lin->btn_voltar,
				'admin_id' => Session::get("ADMIN_SESSION"),
				'getcategorias' => $getcategoria,
				'getPostDestaqueAll' => $getPostDestaqueAll,
				'blog_categoria' => $lin->blog_categoria,
				'blog_artigo' => $lin->blog_artigo,
				'blog_Data_post' => $lin->blog_Data_post,
				'admin_session' => $admin_session,
				'post_id' => $getPost[0]['post_id'],
				'post_titulo' => $getPost[0]['post_titulo'],
				'post_subtitulo' => $getPost[0]['post_subtitulo'],
				'post_description' => $getPost[0]['post_description'],
				'post_img' => $getPost[0]['post_img'],
				'post_img_old' => $getPost[0]['post_img'],
				'post_img_alt' => $getPost[0]['post_img_alt'],
				'postcat_id' => $getPost[0]['postcat_id'],
				'tipo_post_id' => $getPost[0]['tipo_post_id'],
				'postdestaque_id' => $getPost[0]['postdestaque_id'],
				'userpost_id' => $getPost[0]['userpost_id'],
				'getPostAndArtigos' => $getPostAndArtigos,
				'postblogcat_nome' => $getPost[0]['postblogcat_nome'],

				'candidato_session' => $candidato_session,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
				'getblogcategorias' => $getcategoria,


		

		], 'index.blogartigoexterno');
	}

	public function blogcategoria($request) {

		$blogcat_id = $request->parameter;

		$blogCategoria = Blog::getPostBlogCategoria($blogcat_id, Session::get('PAIS_ID'));
		$blogCategoria_nome = Postblog_categoria::getpostblogCategoria_nome($blogcat_id);

		if (!$blogCategoria) {
			$blogCategoria = FALSE;

		}
		$getcategoria = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));
		//debug($getcategoria);
		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}
			$notsMessagem = getNotificantionMessagem(Session::get('USUARIO_ID'));

			if ($notsMessagem[0]) {
				$haNotsMessagem = true;
			}

			$lin = Linguagem::getBlogCategoriaInterior();

			$this->view([
				'header_h1' => $lin->header_h1,
				'header_h2' => $lin->header_h2,
				'header_button' => $lin->header_button,

				'title' => "Artigo categoria",
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'continue_lendo' => $lin->continue_lendo,
				'btn_a_destaque' => $lin->btn_a_destaque,
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
			], 'grupo.blogcategoriainterior');

		} else {

			$lin = Linguagem::getBlogCategoriaExterior();
			//debug($continue_lendo);

			$this->view([
				'pais_id' => Session::get("PAIS_ID"),
				'betas_version' => $lin->betas_version,
				'navmenu_1' => $lin->navmenu_1,
				'navmenu_2' => $lin->navmenu_2,
				'navmenu_3' => $lin->navmenu_3,
				'navmenu_4' => $lin->navmenu_4,
				'navmenu_5' => $lin->navmenu_5,
				'title' => $lin->title . $blogCategoria_nome[0]['blogcat_nome'],
				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'header_h1' => $lin->header_h1,
				'header_h2' => $lin->header_h2,
				'header_button' => $lin->header_button,

				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'continue_lendovvvv' => $lin->btn_a_continue,
				'btn_a_destaque' => $lin->btn_a_destaque,
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
				'getcategoria' => $getcategoria,
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

		$getBlogDestaque = Blog::getBlogDestaque(Session::get('PAIS_ID'));

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
				'continue_lendo' => $lin->continue_lendo,
				'btn_a_destaque' => $lin->btn_a_destaque,
				'btn_a_add_artigo' => $lin->btn_a_add_artigo,
				'admin_session' => $admin_session,
				'getBlogDestaque' => $getBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

			], 'grupo.blogdestaqueinterior');

		} else {
			$lin = Linguagem::getBlogExterior();

			$this->view([
				'header_h1' => $lin->header_h1,
				'header_h2' => $lin->header_h2,
				'header_button' => $lin->header_button,

				'html_lang' => $lin->html_lang,
				'meta_charset' => $lin->meta_charset,
				'description' => $lin->description,
				'keywords' => $lin->keywords,
				'author' => $lin->author,
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'continue_lendo' => $lin->continue_lendo,
				'btn_a_destaque' => $lin->btn_a_destaque,
				'btn_a_add_artigo' => $lin->btn_a_add_artigo,

				'admin_session' => $admin_session,
				'getBlogDestaque' => $getBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),

			], 'index.blogdestaqueexterior');
		}

	}

}