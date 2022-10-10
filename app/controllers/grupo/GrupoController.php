<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\models\grupo\Grupo_mensagem_link;
use app\models\grupo\Mensagem;
use app\session\Session;
use app\validate\Validate;

class GrupoController extends ContainerController {

	public function chat($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$decodegrid =  Uri::decodeUrlFactorylink($gr_id->parameter);

		$categoriaGrupoLoad = Grupo::CategoriaGrupoLoad($gr_id->parameter);
		$chatGrupoMensagem = Mensagem::chatGrupoMensagem($gr_id->parameter);
		//debug($chatGrupoMensagem);
		$this->view([
			'title' => $lin->title,
			'description' => $lin->description,
			'admin_id' => Session::get("ADMIN_SESSION"),
			'keywords' => $lin->keywords,
			'p_strong' => $lin->p_strong,
			'meusGrupos' => $categoriaGrupoLoad[0]['gr_nome'],
			'nomgrupo' => $categoriaGrupoLoad[0]['gr_nome'],
			'categoriagrupo' => $categoriaGrupoLoad[0]['cg_nome'],
			'fotogrupo' => $categoriaGrupoLoad[0]['gr_foto'],
			'listEstados' => Estado::listEstados(),
			'CategoriaGrupoLoad' => $CategoriaGrupoLoad,
			'gml_grupo_id' => $gr_id->parameter,
			'chatGrupoMensagem' => $chatGrupoMensagem,
			'usuario_id' => Session::get('USUARIO_ID'),
			'usuario_nome' => Session::get('US_NOME'),
			'pais_id' => Session::get("PAIS_ID"),

			'NotsGrupo' => getNotificantionGrupo($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),
		], 'grupo.chatgrupo');
	}

	public function grupochatStore() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$val = Validate::validate([

			'gml_grupo_id' => 'integer',
			'gml_remetente_id' => 'integer',
			'msn_nome' => 'string',
			'msn_type' => 'integer',

		]);

		Mensagem::addMensagem($val->msn_nome, $val->msn_type);

		$msn_id = Mensagem::getLastMessagem_id();
		$getMensagemDadoslink = Mensagem::getMensagemDadoslink(Session::get('USUARIO_ID'));

		if ($getMensagemDadoslink[0] == NULL) {
			Mensagem::addMensagemdados(Session::get('US_NOME'), $val->gml_grupo_id, Session::get('USUARIO_ID'));

		}

		$getMensagemDadoslink = Mensagem::getMensagemDadoslink(Session::get('USUARIO_ID'));

		Grupo_mensagem_link::addGrupoMensagemLink($val->gml_grupo_id, Session::get('USUARIO_ID'), $msn_id[0]['msn_id'],
			$getMensagemDadoslink[0]['mdl_id']);

		redirecionar("/grupo/chat/$val->gml_grupo_id");

	}

	public function privadochatStore() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$val = Validate::validate([

			'pml_grupo_id' => 'integer',
			'pml_user_remetente_id' => 'integer',
			'pml_user_destinatario_id' => 'integer',
			'pml_user_remetente_nome' => 'string',
			'msn_nome' => 'string',
			'msn_type' => 'integer',

		]);

		// Mensagem::addMensagem($val->msn_nome, $val->msn_type);

		// Mensagem::addconversaprivate($val->pml_user_remetente_id, Session::get('USUARIO_ID'));
		// $getconversaprivate = Mensagem::getconversaprivate();

		// $msn_id = Mensagem::getLastMessagem_id();
		// $getMensagemDadoslink = Mensagem::getMensagemDadoslink(Session::get('USUARIO_ID'));

		// ///debug($getMensagemDadoslink);
		// if ($getMensagemDadoslink[0] == NULL) {
		// 	Mensagem::addMensagemdados(Session::get('US_NOME'), $val->pml_grupo_id, Session::get('USUARIO_ID'));
		// }

		// privado_mensagem_link::addPrivadoMensagemLink($val->pml_grupo_id, Session::get('USUARIO_ID'), $val->pml_user_destinatario_id, $msn_id[0]['msn_id'],
		// 	$getMensagemDadoslink[0]['mdl_id'], $getconversaprivate[0]['cp_id']);

	}

}
