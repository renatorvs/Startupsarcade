<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\admin\Admin;
use app\session\Session;
use app\validate\Validate;

class AdminloginController extends ContainerController {

	public function admin() {
		Linguagem::getIdiomaSession();

		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'pais_id' => Session::get("PAIS_ID"),

		], 'admin.adminlogin');
	}

	public function store() {

		$validacao = Validate::validate(['adm_email' => 'string', 'adm_senha' => 'string']);

		$respAdmin = Admin::getEmailAdmin($validacao->adm_email);

		//debug($respAdmin);

		$password_hash = $respAdmin[0]['adm_senha'];

		$senha = $validacao->adm_senha;

		$senhaVerify = Validate::getPasswordVerify($senha, $password_hash);
		//debug($senhaVerify);

		if ($senhaVerify) {

			$getAdmId = Admin::getEmailAdmin($validacao->adm_email);

			$admSession = (int) $getAdmId[0]['adm_id'];

			Session::set("ADMIN_SESSION", $admSession);

			header("Location: /admindashboard/create");

			exit();

		} else {
			flash(['login' => "senha ou usuario incorretos"]);

			header("Location: /adminlogin/admin");
			exit();
		}

	}

	public function destroy() {
		Session::sessionDestroy();
		header("Location: /");

	}

}
