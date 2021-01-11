<?php

namespace app\controllers\index;
use app\controllers\ContainerController;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Validate;

class EntrarController extends ContainerController {

	public function show() {

		$this->view([

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
			Session::set("USUARIO_ID", $respUsuario[0]['us_id']);
			Session::set("US_NOME", $respUsuario[0]['us_nome']);
			Session::set("US_FOTO", $respUsuario[0]['us_foto']);

			redirecionar("/grupos/categorias");
		} else {
			flash(['login' => "senha ou usuario incorretos"]);

			redirecionar("/entrar/show");
		}

	}

	public function destroy() {
		Session::sessionDestroy();
		redirecionar("/");

	}

}