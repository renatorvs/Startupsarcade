<?php

namespace app\controllers\index;
use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class UsuarioController extends ContainerController {

	public function show() {
		$lin = Linguagem::getIdiomaInscrevase();

		$this->view([
			'navmenu_1' => $lin->navmenu_1,
			'navmenu_2' => $lin->navmenu_2,
			'navmenu_3' => $lin->navmenu_3,
			'navmenu_4' => $lin->navmenu_4,
			'navmenu_5' => $lin->navmenu_5,
			'login_h4' => $lin->login_h4,
			'login_p' => $lin->login_p,
			'login_tipo_user' => $lin->login_tipo_user,
			'login_a_cadastra_se' => $lin->login_a_cadastra_se,
			'login_nome_usuario' => $lin->login_nome_usuario,
			'login_nome__reploceholder' => $lin->login_nome__reploceholder,
			'login_senha' => $lin->login_senha,
			'email_foto' => $lin->email_foto,
			'termos' => $lin->termos,
			'button_inscrever' => $lin->button_inscrever,
			'pf' => $lin->pf,
			'pj' => $lin->pj,
			'requered_termo' => $lin->requered_termo,
			'required_foto' => $lin->required_foto,
			'required_senha' => $lin->required_senha,
			'requered_nome' => $lin->requered_nome,

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