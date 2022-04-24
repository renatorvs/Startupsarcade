<?php
namespace app\controllers\index;

use app\controllers\ContainerController;

class TermosexternoController extends ContainerController {

	public function show() {

		$this->view([
			'pais_id' => Session::get("PAIS_ID"),

		], 'index.termos');
	}
	public function termos() {

		if (Session::get('USUARIO_ID') OR Session::get('ADMIN_SESSION')) {
			if (Session::get('ADMIN_SESSION')) {
				$admin_session = true;
			}
			$getUsuarioTermos = getUsuarioTermos(Session::get('USUARIO_ID'));

			if ($getUsuarioTermos[0]) {
				$haNotsMessagem = true;
			}

			$lin = Linguagem::getTermos();

			$this->view([

				'title' => $lin->title,
				'header_button' => $lin->header_button,

				'pais_id' => Session::get("PAIS_ID"),
				'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
				'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
			], 'grupo.termosinterno');

		} else {

			$lin = Linguagem::getTermos();

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
				'postBlog' => $postBlog,
				'postBlogDestaque' => $postBlogDestaque,
				'pais_id' => Session::get("PAIS_ID"),

			], 'index.termosexterior');
		}

	}

}