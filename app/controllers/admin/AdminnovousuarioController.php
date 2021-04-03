<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\admin\Admin;
use app\models\admin\Cargo;
use app\models\usuario\Estado;
use app\session\Session;
use app\validate\Validate;

class AdminnovousuarioController extends ContainerController {

	public function create() {
		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			"estado" => Estado::listEstados(),
			"getcargos" => Cargo::getcargos(),
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminnovousuario');
	}

	public function store() {
		$val = Validate::validate([

			'adm_nome' => 'string',
			'adm_email' => 'string',
			'adm_senha' => 'password',
			'car_id' => 'integer',

		]);

		$admin = new Admin($val->adm_nome, $val->adm_email, $val->adm_senha, $val->car_id);

		$admin->adicionaAdm();

		Session::set("ADMIN_SESSION", $candidatoSession);
		header("Location: /admindashboard/create");
		exit();

	}

}
