<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Blog;
use app\models\admin\Blogcategoria;
use app\session\Session;

class LearningController extends ContainerController {

	public function show() {
		$lin = Linguagem::getlearning();

		$getcategoria = Blogcategoria::getblogCategoria(Session::get('PAIS_ID'));

		$postBlog = Blog::getPostBlog();
		$postBlogDestaque = Blog::getPostBlogDestaque();

		if (Session::get('ADMIN_SESSION')) {
			$admin_session = true;
		}
		$this->view([
			'title' => $lin->title,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'btn_excluir' => $lin->btn_excluir,
			'btn_editar' => $lin->btn_editar,
			'btn_a_continue' => $lin->btn_a_continue,
			'btn_a_destaque' => $lin->btn_a_destaque,
			'btn_artigo' => $lin->btn_artigo,
			'learning_h5' => $lin->learning_h5,
			'learning_p' => $lin->learning_p,

			'usuario_id' => Session::get('USUARIO_ID'),
			'admin_session' => $admin_session,
			'candidato_session' => $candidato_session,
			'getblogcategorias' => $getcategoria,
			'postBlog' => $postBlog,
			'postBlogDestaque' => $postBlogDestaque,
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.learning');

	}
	public function showLearning($request) {
		$post_id = $request->parameter;

		$blogLoad_id = Blog::getBlogLoad_id($post_id);
		///debug($blogLoad_id);
		$lin = Linguagem::LearningartigoPortugues();

		if (Session::get('ADMIN_SESSION')) {
			$admin_session = true;
		}
		$this->view([

			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'btn_voltar' => $lin->btn_voltar,
			'blog_categoria' => $lin->blog_categoria,
			'blog_artigo' => $lin->blog_artigo,
			'blog_Data_post' => $lin->blog_Data_post,
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
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.learningartigo');

	}

}