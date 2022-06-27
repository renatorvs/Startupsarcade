<?php

namespace app\controllers\index;
use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Validate;

class EntrarController extends ContainerController {

	public function show() {
		Session::sessionDestroy();
		$lin = Linguagem::getEntrar();
		$this->view([
			'pais_id' => Session::get("PAIS_ID"),
			'title' => $lin->title,
			'navmenu_1' => $lin->navmenu_1,
			'navmenu_2' => $lin->navmenu_2,
			'navmenu_3' => $lin->navmenu_3,
			'navmenu_4' => $lin->navmenu_4,
			'navmenu_5' => $lin->navmenu_5,
			'login_h4' => $lin->login_h4,
			'login_a_strong' => $lin->login_a_strong,
			'login_a_cadastra_se' => $lin->login_a_cadastra_se,
			'login_email' => $lin->login_email,
			'login_email_reploceholder' => $lin->login_email_reploceholder,
			'login_senha' => $lin->login_senha,
			'entrar_com' => $lin->entrar_com,
			'card_alert_h4' => $lin->card_alert_h4,
			'card_alert_p' => $lin->card_alert_p,
			'button_entrar' => $lin->button_entrar,
			'login_frash' => $lin->login_frash,

		], 'index.entrar');
	}

	public function store() {

		$usuario = new Usuario();

		$validacao = Validate::validate(['user_email' => 'string', 'user_senha' => 'string']);

		$usuario->setUs_email($validacao->user_email);

		$respUsuario = $usuario->getEmailUsuario();
		$password_hash = $respUsuario[0]['us_senha'];

		$senha = $validacao->user_senha;

		$senhaVerify = Validate::getPasswordVerify($senha, $password_hash);

		if ($senhaVerify) {

			//debug($respUsuario);
			Session::set("US_EMAIL", $respUsuario[0]['us_email']);
			Session::set("USUARIO_ID", $respUsuario[0]['us_id']);
			Session::set("US_NOME", $respUsuario[0]['us_nome']);
			Session::set("US_FOTO", $respUsuario[0]['us_foto']);

			redirecionar("/grupos/categorias");
		} else {
			flash(['login' => "$lin->login_frash"]);

			redirecionar("/entrar/show");
		}

	}

	public function destroy() {
		Session::sessionDestroy();
		if (Session::get("ADMIN_SESSION")) {

			redirecionar("/adminlogin/admin");
		} else {

			redirecionar("/entrar/show");
		}

	}

}