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
			'pais_id' => Session::get("PAIS_ID"),

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
			'duvcategoria_id' => 'integer',
			'tiuser_id' => 'integer',

		]);

		$duv->setDuv_pergunta($val->duv_pergunta);
		$duv->setDuv_resposta($val->duv_resposta);
		$duv->setDuvcategoria_id($val->duvcategoria_id);

		$duv->addDuvida();

		redirecionar("/duvidas/create");
	}

	public function addduvidacategoria() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$val = Validate::validate([

			'duvcat_nome' => 'string',
			'duvpais_id' => 'integer',

		]);

		$duvcat = new Duvida_categoria();

		$duvcat->setDuvcat_nome($val->duvcat_nome);
		$duvcat->setDuvpais_id($val->duvpais_id);

		$duvcat->addDuvidaCategoria();

		redirecionar("/duvidas/create");

	}
}
