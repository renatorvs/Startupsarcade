<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\Admin\Duvidas;
use app\models\Admin\Duvida_categoria;
use app\session\Session;
use app\validate\Validate;

class AdminaddduvidasController extends ContainerController {

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'title' => 'Duvidas',
			'getduvidascategoria' => Duvida_categoria::getduvidascategoria(),

		], 'admin.adminaddduvidas');
	}

	public function addduvida() {
		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$duv = new Duvidas();

		$val = Validate::validate([

			'duv_pergunta' => 'string',
			'duv_resposta' => 'string',
			'duvcategoria_id' => 'string',
			'tiuser_id' => 'integer',

		]);

		if ($val->duvcategoria_id == 3) {
			$duv->setDuv_pergunta($val->duv_pergunta);
			$duv->setDuv_resposta($val->duv_resposta);
			$duv->setDuvcat_id(1);
			$duv->setTiuser_id($val->tiuser_id);
			$duv->addDuvida();

			$duv->setDuv_pergunta($val->duv_pergunta);
			$duv->setDuv_resposta($val->duv_resposta);
			$duv->setDuvcat_id(3);
			$duv->setTiuser_id($val->tiuser_id);
			$duv->addDuvida();

		}

		$duv->setDuv_pergunta($val->duv_pergunta);
		$duv->setDuv_resposta($val->duv_resposta);
		$duv->setDuvcat_id($val->duvcategoria_id);
		$duv->setTiuser_id($val->tiuser_id);

		$duv->addDuvida();
		if ($val->tiuser_id == 1) {
			redirecionar("/candidatoduvidas/create");

		}

		redirecionar("/empresaduvidas/create");
	}

	public function addduvidacategoria() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'duvcat_nome' => 'string',
			'duvcat_tipo_id' => 'integer',

		]);

		$duvcat = new Duvida_categoria();

		$duvcat->setDuvcat_nome($val->duvcat_nome);
		$duvcat->setDuvcat_tipo_id($val->duvcat_tipo_id);

		$duvcat->addDuvidaCategoria();
		if ($val->duvcat_tipo_id == 1) {
			redirecionar("/candidatoduvidas/create");

		}

		redirecionar("/empresaduvidas/create");

	}
}
