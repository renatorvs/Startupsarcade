<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Blog;
use app\models\admin\Postblog_categoria;
use app\session\Session;
use app\classes\Uri;

class learningController extends ContainerController {

	public function create() {

		$getcategoria = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));
		$postBlog = Blog::getPostBlog(Session::get('PAIS_ID'));
		$postBlogDestaque = Blog::getPostBlogDestaqueLimit(Session::get('PAIS_ID'));


	$postBlogDestaqueUrl = Uri::encodeUrlFactorylink($postBlogDestaque, "post");
		$postBlogUrl = Uri::encodeUrlFactorylink($postBlog, "post");

		//debug($getcategoria);
		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getLearning();

			$this->view([
				'btn_excluir' => $lin->btn_excluir,
				'btn_editar' => $lin->btn_editar,
				'title' => $lin->title,
				'continue_lendo' => $lin->continue_lendo,
				'usuario_id' => Session::get('USUARIO_ID'),
				'admin_session' => $admin_session,
				'getblogcategorias' => $getcategoria,
				'postBlog' => $postBlogUrl,
				'postBlogDestaque' => $postBlogDestaqueUrl,
				'pais_id' => Session::get("PAIS_ID"),
				'admin_id' => Session::get("ADMIN_SESSION"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
			], 'grupo.learning');

		}
	}

	public function show($request) {
//mudar para while e colocar mais um button pra adiconar maism texto e imagens no artigo
		$post_id = $request->parameter;

	$decodepostUri = Uri::decodeUrlFactorylink($post_id, "post");

		$getPost = Blog::getPostByid($decodepostUri);
		$getBlogsAll = Blog::getBlogLoadInterno($decodepostUri);
		$blogCategoria_nome = Postblog_categoria::getpostblogCategoria_nome($decodepostUri);

		$getcategoria = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));

	//	debug($getPost);
		//blogcat_id
		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getLearningartigo();
			//debug($lin);
			$this->view([
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
				'getPostAndArtigos' => $getBlogsAll,
				'postblogcat_nome' => $getPost[0]['postblogcat_nome'],

				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
				'getblogcategorias' => $getcategoria,

			], 'grupo.learningartigo');

		}

	}

	public function learningcategoria($request) {

		$blogcat_id = $request->parameter;
		$blogCategoria_nome = Postblog_categoria::getpostblogCategoria_nome($blogcat_id);
		$getcategoriasAll = Postblog_categoria::getpostblogCategoria(Session::get('PAIS_ID'));

				//	$postBlog = Blog::getPostBlog(Session::get('PAIS_ID'));
					$postBlog = Blog::getPostBlogCategoria($blogcat_id, Session::get('PAIS_ID'));

		

		//debug($postBlog);

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}

			$lin = Linguagem::getLearningcategoria();

			$this->view([
				'header_h1' => $lin->header_h1,
				'header_h2' => $lin->header_h2,
				'header_button' => $lin->header_button,
				'continue_lendo' => $lin->continue_lendo,

				'title' => "Artigo categoria",
				'html_lang' => $lin->html_lang,
				'admin_id' => Session::get("ADMIN_SESSION"),
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
				'getblogcategorias' => $getcategoriasAll,
				'postBlog' => $postBlog,
				'nao_ha_artigo' => $lin->nao_ha_artigo,
				'continue_lendo' => $lin->continue_lendo,
				'categoria_nome' => $blogCategoria_nome[0]['postblogcat_nome'],
				'hablog' => $hablog,
				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
			], 'grupo.learningcategoria');

		}

	}

	public function learningdestaque() {

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
				'admin_id' => Session::get("ADMIN_SESSION"),
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

			], 'grupo.learningdestaque');

		}

	}

}