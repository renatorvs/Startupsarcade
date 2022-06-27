<?php
namespace app\controllers\grupo;

use app\controllers\ContainerController;
use app\linguagem\Linguagem;
use app\models\grupo\Grupo;
use app\models\grupo\Usuario;
use app\session\Session;
use app\validate\Imagem;
use app\validate\Validate;

class PerfilController extends ContainerController {

	public function create() {
		if (Session::get('USUARIO_ID')) {
			Session::get('US_FOTO');
			Session::get('US_NOME');
		} else {
			redirecionar("/");
		}
		Usuario::getusuarioPerfil(Session::get('USUARIO_ID'));
		$lin = Linguagem::getPerfil();

		//debug($lin);
		$this->view([

			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => $lin->title,
			'login_tipo_user' => $lin->login_tipo_user,
			'login_a_cadastra_se' => $lin->login_a_cadastra_se,
			'login_nome_usuario' => $lin->login_nome_usuario,
			'login_nome_reploceholder' => $lin->login_nome_reploceholder,
			'login_senha' => $lin->login_senha,
			'email_foto' => $lin->email_foto,
			'termos' => $lin->termos,
			'button_inscrever' => $lin->button_inscrever,
			'pf' => $lin->pf,
			'pj' => $lin->pj,
			'senha_old' => $lin->senha_old,
			'btn_senha' => $lin->btn_senha,
			'btn_senha_editar' => $lin->btn_senha_editar,
			'requered_termo' => $lin->requered_termo,
			'required_foto' => $lin->required_foto,
			'required_senha' => $lin->required_senha,
			'requered_nome' => $lin->requered_nome,
			'usuario_id' => Session::get('USUARIO_ID'),
			'pais_id' => Session::get("PAIS_ID"),
			'getusuarioPerfil' => Usuario::getusuarioPerfil(Session::get('USUARIO_ID')),

			'NotsGrupo' => getNotificantionGrupo(Session::get('USUARIO_ID')),
			'NotsMessagem' => getNotificantionMessagem(Session::get('USUARIO_ID')),
		], 'grupo.perfil');

	}

	public function store() {

		$validacao = Validate::validate([

			'us_tipo_pessoa' => 'integer',
			'us_nome' => 'string',
			'us_email' => 'string',
			'us_foto_old' => 'string',

		]);

		$usuario = new Usuario();
		$usuario->setUs_id(Session::get('USUARIO_ID'));
		$usuario->setUs_email($validacao->us_email);
		$respUsuario = $usuario->getEmailUsuario();
		$usuario->setUs_nome($validacao->us_nome);
		$usuario->setUs_tipo_pessoa($validacao->us_tipo_pessoa);
		if ($_FILES['us_foto']['name'] != null) {
			$us_foto = Imagem::uploadImage($_FILES['us_foto']);
			$usuario->setUs_foto($us_foto);
		} else {
			$usuario->setUs_foto($validacao->us_foto_old);

		}
		// debug($usuario);
		$usuario->updateUsuario();

		Session::set("US_NOME", $respUsuario[0]['us_nome']);
		Session::set("US_FOTO", $respUsuario[0]['us_foto']);

		redirecionar("/perfil/create");

	}

	public function storesenha() {

		$validacao = Validate::validate([

			'us_tipo_pessoa' => 'integer',
			'us_nome' => 'string',
			'us_senha' => 'password',
			'us_email' => 'string',
			'senha_old' => 'string',
			'us_foto_old' => 'string',

		]);

		$usuario = new Usuario();

		$usuario->setUs_id(Session::get('USUARIO_ID'));
		$usuario->setUs_email($validacao->us_email);
		$usuario->setUs_nome($validacao->us_nome);

		$respUsuario = $usuario->getEmailUsuario();
		$password_hash = $respUsuario[0]['us_senha'];

		$usuario->setUs_senha($validacao->us_senha);

		$senha = $validacao->senha_old;

		$lin = Linguagem::getPerfil();

		$senhaVerify = Validate::getPasswordVerify($senha, $password_hash);
		if ($senhaVerify) {
			$usuario->updateUsuarioSenha();

			Session::set("US_NOME", $respUsuario[0]['us_nome']);
			Session::set("US_FOTO", $respUsuario[0]['us_foto']);
			flash(['login_aceito' => $lin->login_aceito]);

			redirecionar("/perfil/create");
		} else {
			flash(['login_frash' => $lin->login_frash]);

			redirecionar("/perfil/create");
		}

	}

}