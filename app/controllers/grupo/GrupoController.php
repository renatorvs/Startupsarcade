<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\models\grupo\grupo_mensagem_link;
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

		$categoriaGrupoLoad = Grupo::CategoriaGrupoLoad($gr_id->parameter);
		$chatGrupoMensagem = Mensagem::chatGrupoMensagem($gr_id->parameter);
		//debug($chatGrupoMensagem);
		$this->view([
			'title' => 'SA | Grupos startup',
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
			// 'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			// 'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

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

		grupo_mensagem_link::addGrupoMensagemLink($val->gml_grupo_id, Session::get('USUARIO_ID'), $msn_id[0]['msn_id'],
			$getMensagemDadoslink[0]['mdl_id']);

	}

}
