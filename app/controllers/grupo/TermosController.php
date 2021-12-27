<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\Linguagem\Linguagem;
use app\models\admin\Termos;
use app\session\Session;
use app\validate\Validate;

class TermosController extends ContainerController {

	public function create() {
		if (Session::get("ADMIN_SESSION") != null) {
			$admin = true;
			$gettermos = Termos::gettermosAdmin();
		} else {

			$gettermos = Termos::gettermos(Session::get("PAIS_ID"));
		}
		$lin = Linguagem::getInscrevase();

		if (Session::get("ADMIN_SESSION") OR Session::get("USUARIO_ID")) {

			$this->view([
				'title' => 'usuarios termos ',
				'h1_termo' => $lin->h1_termo,
				'termo_p' => $lin->termo_p,

				'pais_id' => Session::get("PAIS_ID"),
				'admin' => $admin,
				'gettermos' => $gettermos,
			], 'grupo.termos');

		} else {
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
				'h1_termo' => $lin->h1_termo,
				'termo_p' => $lin->termo_p,
				'header_button' => $lin->header_button,
				'continue_lendo' => $lin->continue_lendo,
				'continue_lendo' => $lin->continue_lendo,
				'title' => " Blog Startup´s arcade ",
				'usuario_id' => Session::get('USUARIO_ID'),
				'admin_session' => $admin_session,
				'candidato_session' => $candidato_session,
				'getblogcategorias' => $getcategoria,
				'postBlog' => $postBlog,
				'postBlogDestaque' => $postBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),
				'admin' => $admin,
				'gettermos' => $gettermos,
			], 'index.termosexterno');
		}
	}

	public function addtermos() {

		$val = Validate::validate([
			'term_id' => 'integer',
			'term_titulo' => 'string',
			'term_subtitulo' => 'string',
			'term_text' => 'string',
			'term_pais_id' => 'integer',

		]);

		Termos::addTermo($val->term_titulo, $val->term_subtitulo, $val->term_text, $val->term_pais_id);
		redirecionar('\Termos\create');

	}

	public function updatetermos() {

		$val = Validate::validate([
			'term_id' => 'integer',
			'term_titulo' => 'string',
			'term_subtitulo' => 'string',
			'term_text' => 'string',
			'term_pais_id' => 'integer',

		]);

		Termos::addUpdate($val->term_titulo, $val->term_subtitulo, $val->term_text, $val->term_pais_id, $val->term_id);
		redirecionar('\Termos\create');

	}

}
