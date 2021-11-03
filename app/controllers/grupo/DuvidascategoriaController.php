<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\Admin\Duvida_categoria;
use app\session\Session;

class DuvidascategoriaController extends ContainerController {

	public function show($request) {

		if (Session::get('EMPRESA_SESSION_ID')) {
			$admin_session = TRUE;
			$empresa_session = FALSE;
			$candidato_session = FALSE;
			$getduvidacategoria = Duvida_categoria::getduvidascategoria();

		}

		$lin = Linguagem::getduvidascategoria();

		$duvcat = new Duvida_categoria();
		$loadByDuvidaCategoria = $duvcat->loadByDuvidaCategoria($request->parameter);

		$this->view([
			'description' => $lin->description,
			'keywords' => $lin->keywords,
			'btn_a_addduvida' => $lin->btn_a_addduvida,
			'author' => $lin->author,
			'h5_duvidas_frequentes' => $lin->h5_duvidas_frequentes,
			'excluir_duvidas' => $lin->excluir_duvidas,
			'strong_BR' => $lin->strong_BR,
			'strong_USA' => $lin->strong_USA,
			'title' => $lin->title,
			'empresa_session' => $empresa_session,
			'candidato_session' => $candidato_session,
			'admin_session' => $admin_session,
			'getduvidas' => $loadByDuvidaCategoria,
			'getduvidacategoria' => $getduvidacategoria,
			'pais_id' => Session::get('PAIS_ID'),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.duvidascategoria');
	}

}
