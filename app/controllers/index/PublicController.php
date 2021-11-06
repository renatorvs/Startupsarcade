<?php

namespace app\controllers\index;

use app\controllers\ContainerController;
use app\Linguagem\Linguagem;
use app\session\Session;

class PublicController extends ContainerController {

	public function index() {
		//debug(Session::get("PAIS_ID"));
		$lin = Linguagem::getIdiomaindex();
		$this->view([
			'pais_id' => Session::get("PAIS_ID"),
			'title' => $lin->title,
			'betas_version' => $lin->betas_version,
			'navmenu_1' => $lin->navmenu_1,
			'navmenu_2' => $lin->navmenu_2,
			'navmenu_3' => $lin->navmenu_3,
			'navmenu_4' => $lin->navmenu_4,
			'navmenu_5' => $lin->navmenu_5,
			'nav_redesocial_1' => $lin->nav_redesocial_1,
			'nav_redesocial_2' => $lin->nav_redesocial_2,
			'nav_redesocial_3' => $lin->nav_redesocial_3,
			'nav_redesocial_4' => $lin->nav_redesocial_4,
			'header_h1' => $lin->header_h1,
			'header_h2' => $lin->header_h2,
			'header_button' => $lin->header_button,
			'main_about_h3' => $lin->main_about_h3,
			'main_about_P' => $lin->main_about_P,
			'filter_app' => $lin->app,
			'filter_card' => $lin->notificaçoes,
			'filter_active' => $lin->active,
			'filter_web' => $lin->perfil,

			'main_features_1_h4' => $lin->main_features_1_h4,
			'main_features_1_p' => $lin->main_features_1_p,
			'main_features_2_h4' => $lin->main_features_2_h4,
			'main_features_2_p' => $lin->main_features_2_p,
			'main_features_3_h4' => $lin->main_features_3_h4,
			'main_features_3_p' => $lin->main_features_3_p,
			'main_features_4_h4' => $lin->main_features_4_h4,
			'main_features_4_p' => $lin->main_features_4_p,

			'main_services_h2' => $lin->main_services_h2,
			'main_services_P' => $lin->main_services_P,
			'main_services_card_1_h4' => $lin->main_services_card_1_h4,
			'main_services_card_1_p' => $lin->main_services_card_1_p,
			'main_services_card_2_h4' => $lin->main_services_card_2_h4,
			'main_services_card_2_p' => $lin->main_services_card_2_p,
			'main_services_card_3_h4' => $lin->main_services_card_3_h4,
			'main_services_card_3_p' => $lin->main_services_card_3_p,

			'main_portifolio_h1' => $lin->main_portifolio_h1,
			'main_portifolio_p' => $lin->main_portifolio_p,

			'main_questions_h2' => $lin->main_questions_h2,
			'main_question_1' => $lin->main_question_1,
			'main_question_resp_1' => $lin->main_question_resp_1,
			'main_question_2' => $lin->main_question_2,
			'main_question_resp_2' => $lin->main_question_resp_2,
			'main_question_3' => $lin->main_question_3,
			'main_question_resp_3' => $lin->main_question_resp_3,
			'main_question_4' => $lin->main_question_4,
			'main_question_resp_4' => $lin->main_question_resp_4,
			'main_question_5' => $lin->main_question_5,
			'main_question_resp_5' => $lin->main_question_resp_5,
			'main_question_6' => $lin->main_question_6,

			'main_question_resp_6' => $lin->main_question_resp_6,

			'main_contato_h2' => $lin->main_contato_h2,
			'main_contato_adress' => $lin->main_contato_adress,
			'main_contato_email' => $lin->main_contato_email,
			'main_contato_fone' => $lin->main_contato_fone,
			'main_contato_nome' => $lin->main_contato_nome,
			'main_contato_email' => $lin->main_contato_email,
			'main_contato_assunto' => $lin->main_contato_assunto,
			'main_contato_mensagem' => $lin->main_contato_mensagem,

			'main_contato_form_nome' => $lin->main_contato_form_nome,
			'main_contato_form_email' => $lin->main_contato_form_email,
			'main_contato_form_assunto' => $lin->main_contato_form_assunto,
			'main_contato_form_mensagem' => $lin->main_contato_form_mensagem,
			'main_contato_form_button' => $lin->main_contato_form_button,
		], 'index.index');

	}

}