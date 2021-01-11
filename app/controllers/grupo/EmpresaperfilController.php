<?php
namespace app\controllers\empresa;

use app\controllers\ContainerController;
use app\models\empresa\Empresa;
use app\models\empresa\Vaga;
use app\models\usuario\Endereco;
use app\models\usuario\Estado;
use app\models\usuario\Servico;
use app\models\usuario\UsuariosSeguidores;
use app\session\Session;
use app\validate\Validate;

class EmpresaperfilController extends ContainerController {

	public function show() {

		if (Session::get('EMPRESA_USUARIO_ID')) {
			$session_id = Session::get('EMPRESA_SESSION_ID');
			$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		} else {
			redirecionar("/");
		}

		$empresa = new Empresa();
		$seguindo = UsuariosSeguidores::seguindo($sessionUsuario_id);
		$seguidores = UsuariosSeguidores::seguidores($sessionUsuario_id);

		$getMinhasvagasLimit = Vaga::getMinhasvagasLimit($session_id);
		if (!$getMinhasvagasLimit) {
			$getMinhasvagasLimit = false;
		}

		$getMeusServicosLimit = Servico::getMeusServicosLimit($session_id);
		if (!$getMeusServicosLimit) {
			$getMeusServicosLimit = false;
		}
		$listEstado = Estado::listEstados();

		$getDadosEmpresa = $empresa->getEmpresa_dados($session_id, $sessionUsuario_id);

		// checkParameter($getDadosEmpresa);

		$this->view([
			'pref' => Session::get("USER_PREFERENCIAS"),

			'user_nome' => $getDadosEmpresa[0]['user_nome'],
			'emp_id' => $getDadosEmpresa[0]['emp_id'],
			'user_id' => $getDadosEmpresa[0]['user_id'],
			'empresa_usernome' => $getDadosEmpresa[0]['user_nome'],
			'empresa_email' => $getDadosEmpresa[0]['user_email'],
			'seguidores' => $seguidores[0]['countSeguidores'],
			'seguindo' => $seguindo[0]['countSeguindo'],
			'emp_img' => $getDadosEmpresa[0]['emp_img'],
			'emp_cnpj' => $getDadosEmpresa[0]['emp_cnpj'],
			'emp_razaosocial' => $getDadosEmpresa[0]['emp_razaosocial'],
			'emp_nomeresponsavel' => $getDadosEmpresa[0]['emp_nomeresponsavel'],
			'emp_nomefantasia' => $getDadosEmpresa[0]['emp_nomefantasia'],
			'ender_id' => $getDadosEmpresa[0]['ender_id'],
			'emp_descri' => $getDadosEmpresa[0]['emp_descri'],
			'emp_contato' => $getDadosEmpresa[0]['uel_emp_contato'],
			'emp_datafundacao' => $getDadosEmpresa[0]['emp_datafundacao'],
			'ender_cidade' => $getDadosEmpresa[0]['ender_cidade'],
			'ender_numero' => $getDadosEmpresa[0]['ender_numero'],
			'ender_comple' => $getDadosEmpresa[0]['ender_comple'],
			'ender_cep' => $getDadosEmpresa[0]['ender_cep'],
			'ender_bairro' => $getDadosEmpresa[0]['ender_bairro'],
			'ender_logradouro' => $getDadosEmpresa[0]['ender_logradouro'],
			'est_nome' => $getDadosEmpresa[0]['est_nome'],
			'est_id' => $getDadosEmpresa[0]['est_id'],
			'haGetMinhasvagasLimit' => $getMinhasvagasLimit,
			'getMinhasvagasLimit' => $getMinhasvagasLimit,
			'haGetMeusServicosLimit' => $getMeusServicosLimit,
			'getMeusServicosLimit' => $getMeusServicosLimit,
			'listEstado' => $listEstado,

			'NotsSShere' => getNotificantionShere($sessionUsuario_id),
			'NotsSeguir' => getNotificantionSeguir($sessionUsuario_id),
			'NotsContratouServico' => getNotificantionContratouServico($sessionUsuario_id),
			'NotsCandidatoVaga' => getNotificantionCandidatoVaga($sessionUsuario_id),
			'NotsMessagem' => getNotificantionMessagem($sessionUsuario_id),

		], 'empresa.empresaperfil');

	}

	public function update() {

		$empresaSession_id = Session::get('EMPRESA_SESSION_ID');
		$sessionUsuario_id = Session::get('EMPRESA_USUARIO_ID');
		$validacao = Validate::validate([

			'emp_id' => 'integer',
			'user_id' => 'integer',
			'user_nome' => 'string',
			'emp_cnpj' => 'string',
			'emp_nomeresponsalvel' => 'string',
			'emp_nomefantasia' => 'string',
			'emp_razaosocial' => 'string',
			'emp_datafundacao' => 'string',
			'emp_contato' => 'string',
			'emp_descri' => 'string',

			'ender_logradouro' => 'string',
			'ender_bairro' => 'string',
			'ender_numero' => 'string',
			'ender_cep' => 'integer',
			'ender_comple' => 'string',
			'ender_cidade' => 'string',
			'est_id' => 'integer',
			'ender_id' => 'integer',

		]);

		$endereco = new Endereco();
		$endereco->setEnder_id($validacao->ender_id);
		$endereco->setEnder_logradouro($validacao->ender_logradouro);
		$endereco->setEnder_bairro($validacao->ender_bairro);
		$endereco->setEnder_cidade($validacao->ender_cidade);
		$endereco->setEnder_numero($validacao->ender_numero);
		$endereco->setEnder_cep($validacao->ender_cep);
		$endereco->setEnder_comple($validacao->ender_comple);

		$estado = new Estado();
		$estado->setEst_id($validacao->est_id);
		$endereco->setEstado($estado);
		$endereco->updateEndereco();

		$empresa = new Empresa();
		$empresa->setEmp_id($empresaSession_id);
		$empresa->setEmp_cnpj($validacao->emp_cnpj);
		$empresa->setEmp_nomeresponsavel($validacao->emp_nomeresponsalvel);
		$empresa->setEmp_nomefantasia($validacao->emp_nomefantasia);
		$empresa->setEmp_razaosocial($validacao->emp_razaosocial);
		$empresa->setEmp_descri($validacao->emp_descri);
		$empresa->setEmp_contato($validacao->emp_contato);
		$empresa->setEmp_datafundacao($validacao->emp_datafundacao);
		$empresa->updateEmpresa();

		Empresa::updateUsuario_empresa_link($sessionUsuario_id, $validacao->emp_contato);
		$getUsuarioEmpresa = $empresa->getUsuarioEmpresa($user_id[0]['user_id']);

		$empresaSession = (int) $getUsuarioEmpresa[0]['emp_id'];

		redirecionar("/empresaperfil/show");

	}

}
