<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Duvidas;
use app\models\admin\Duvida_categoria;
use app\session\Session;

class DuvidasController extends ContainerController {
	public function create($request) {
		if (Session::get('ADMIN_SESSION')) {
			$admin_session = TRUE;
		}
		$getduvidasempresa = Duvidas::getDuvidas(Session::get("PAIS_ID"));
		$getDuvidasCategoria = Duvida_categoria::getDuvidasCategoria(Session::get("PAIS_ID"));

		$lin = Linguagem::getDuvidas();

		$this->view([
			'title' => $lin->title,

			'admin_id' => Session::get("ADMIN_SESSION"),
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'btn_a_addduvida' => $lin->btn_a_addduvida,
			'h5_duvidas_frequentes' => $lin->h5_duvidas_frequentes,
			'excluir_duvidas' => $lin->excluir_duvidas,
			'strong_BR' => $lin->strong_BR,
			'strong_USA' => $lin->strong_USA,
			'empresa_session' => $empresa_session,
			'admin_session' => $admin_session,
			'getduvidasempresa' => $getduvidasempresa,
			'getduvidaempresacategoria' => $getDuvidasCategoria,
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.duvidas');
	}

	public function destroy($request) {
		$duv = new Duvidas();
		$duv->setDuv_id($request->parameter);
		$duv->deleteDuvida();
		redirecionar("/duvidas/create");

	}
	public function categoriaduvidas($request) {

		$lin = Linguagem::getDuvidasCategoria();

		$this->view([
			'html_lang' => $lin->html_lang,
			'meta_charset' => $lin->meta_charset,
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'author' => $lin->author,
			'btn_a_addduvida' => $lin->btn_a_addduvida,
			'h5_duvidas_frequentes' => $lin->h5_duvidas_frequentes,
			'excluir_duvidas' => $lin->excluir_duvidas,
			'strong_BR' => $lin->strong_BR,
			'strong_USA' => $lin->strong_USA,

			'empresa_session' => $empresa_session,
			'admin_session' => $admin_session,
			'getduvidasempresa' => $getduvidasempresa,
			'getduvidaempresacategoria' => $getDuvidasempresacategoria,
			'pref' => Session::get("USER_PREFERENCIAS"),
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'grupo.categoriaduvidas');

	}

}
