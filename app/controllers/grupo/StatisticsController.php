<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\session\Session;

class StatisticsController extends ContainerController {

	public function show() {

		$lin = Linguagem::getstatistics();

		$this->view([

			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => $lin->title,
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'h1_empreendedores' => $lin->h1_empreendedores,
			'p_perfil' => $lin->p_perfil,
			'card_myBarChart_h6' => $lin->card_myBarChart_h6,
			'card_myBarChart_text_p' => $lin->card_myBarChart_text_p,
			'card_myBarChart_text_P_2' => $lin->card_myBarChart_text_P_2,
			'chart_pie_1_h6' => $lin->chart_pie_1_h6,
			'chart_pie_1_card_body' => $lin->chart_pie_1_card_body,
			'chart_pie_2_h6' => $lin->chart_pie_2_h6,
			'chart_pie_2_card_body' => $lin->chart_pie_2_card_body,

			'pref' => Session::get("USER_PREFERENCIAS"),
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.statistics');
	}

}