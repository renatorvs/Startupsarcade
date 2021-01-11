<?php

namespace app\controllers\index;

use app\controllers\ContainerController;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class UsuarioController extends ContainerController {

	public function show() {

		$this->view([
		], 'index.usuarioincrevase');
	}

	public function store() {

		$validacao = Validate::validate([

			'us_tipo_pessoa' => 'integer',
			'us_nome' => 'string',
			'us_email' => 'email',
			'us_senha' => 'password',
			'us_status_conta' => 'integer',

		]);

		$usuario = new Usuario();

		$usuario->setUs_tipo_pessoa($validacao->us_tipo_pessoa);
		$usuario->setUs_nome($validacao->us_nome);
		$usuario->setUs_email($validacao->us_email);
		$usuario->setUs_senha($validacao->us_senha);
		$us_foto = Imagem::uploadImage($_FILES['us_foto']);

		$usuario->setUs_foto($us_foto);
		$usuario->setUs_status_conta(1);

		$usuario->adicionaUsuario();
		if ($respUsuario = $usuario->getEmailUsuario()) {
			flash(['emailCadastrado' => "Email Já cadastrado"]);
			redirecionar("/");
		}

		$user_id = usuario::getLastUsuario_id();
		$usuario_id = $user_id[0]['user_id'];

		$getUsuarioEmpresa = usuario::getLastUsuarioEmpresa();
		$empresaSession = $getUsuarioEmpresa[0]['US_id'];

		Session::set("USUARIO_ID", $user_id[0]['us_id']);
		Session::set("US_NOME", $user_id[0]['us_nome']);
		Session::set("US_FOTO", $user_id[0]['us_foto']);

		redirecionar("/grupos/categorias");

	}

}