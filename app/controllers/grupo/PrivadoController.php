<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\models\grupo\Mensagem;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class PrivadoController extends ContainerController {

	public function chat($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$meusGrupos = Grupo::meusGrupos(Session::get('USUARIO_ID'));

		$this->view([
			'title' => 'SA | Grupos startup',
			'meusGrupos' => $meusGrupos,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.chatprivado ');
	}

	public function conversas($gr_id) {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$getchatPrivadoMensagem = Mensagem::getchatPrivadoMensagem(Session::get('USUARIO_ID'));
		$this->view([
			'title' => 'SA | Grupos startup',
			'getchatPrivadoMensagem' => $getchatPrivadoMensagem,
			'listEstados' => Estado::listEstados(),
			'grupoAll' => $grupoAll,
			'pais_id' => Session::get("PAIS_ID"),
			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),

		], 'grupo.conversas');
	}

	public function grupoUsuarioUpdate() {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupoAll = CategoriaGrupo::CategoriaGrupoAll();

		$grupo = new Grupo();

		$v = Validate::validate([
			'gr_id' => 'integer',
			'gr_nome' => 'string',
			'gr_descricao' => 'string',
			'gr_cidade' => 'string',
			'gr_estado' => 'string',
			'gu_private' => 'integer',
			'grcat_id' => 'integer',
			'grcat_id' => 'integer',
			'gr_old_foto' => 'string',
		]);

		$grupo->setGr_id($v->gr_id);
		$grupo->setGr_nome($v->gr_nome);
		$grupo->setGr_descricao($v->gr_descricao);
		$grupo->setGr_cidade($v->gr_cidade);
		$grupo->setGr_estado($v->gr_estado);

		if ($_FILES['gr_foto']['name'] == null or $_FILES['gr_foto']['name'] == NULL) {
			$grupo->setGr_foto($v->gr_old_foto);
		} else {

			$gr_foto = Imagem::uploadImage($_FILES['gr_foto']);
			$grupo->setGr_foto($gr_foto);
		}
		$grupo->setGrcat_id($v->grcat_id);

		$grupo->grupoUpdate();

		$grupo->setGu_grupo_id($v->gr_id);
		$grupo->setGu_private($v->gu_private);
		$grupo->grupoUsuarioUpdate();

		redirecionar('\meusGrupos\grupos');

	}

	public function grupoDelete($gr_id) {

		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}

		$grupo = new Grupo();

		Grupo::grupoDelete($gr_id->parameter);
		Grupo::grupoUsuarioDelete($gr_id->parameter);

		redirecionar('\meusGrupos\grupos');

	}

}