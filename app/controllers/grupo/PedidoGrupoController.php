PedidoGrupo


<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\models\grupo\CategoriaGrupo;
use app\models\grupo\Estado;
use app\models\grupo\Grupo;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class PedidogrupoController extends ContainerController {
	public function aceitar($gr_id) {
		$v = Validate::validate([
			'gu_accept' => 'integer',
			'gu_user_id' => 'integer',
			'gu_grupo_id' => 'integer',
			'catgr_id' => 'integer',
			'redirect' => 'integer',
		]);

						Grupo::updateconvite($->gu_user_id, $v->gu_grupo_id);

				redirecionar("/meusgrupos/gruposconvites");

			
	}

	public function cancelarpedido() {
			$v = Validate::validate([
			'gu_accept' => 'integer',
			'gu_user_id' => 'integer',
			'gu_grupo_id' => 'integer',
			'catgr_id' => 'integer',
			'redirect' => 'integer',
		]);
	

	Grupo::cancelaPedidoGrupo(Session::get('USUARIO_ID'), $v->gu_grupo_id);
	redirecionar("/grupos/grupospendentes");


	}

	public function cancelar($gr_id) {
		$v = Validate::validate([
			'gu_accept' => 'integer',
			'gu_user_id' => 'integer',
			'gu_grupo_id' => 'integer',
			'catgr_id' => 'integer',
			'redirect' => 'integer',
		]);
	}

	Grupo::cancelaPedidoGrupo($v->gu_user_id, $v->gu_grupo_id);
	redirecionar("/meusgrupos/gruposconvites");


}