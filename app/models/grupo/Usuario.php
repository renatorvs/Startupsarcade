<?php
namespace app\models\grupo;
use app\models\Banco;

class Usuario {

	private $us_id;
	private $us_email;
	private $us_nome;
	private $us_tipo_pessoa;
	private $us_senha;
	private $us_foto;
	private $us_status_conta;
	private $us_data_compra;
	private $us_data_expiracao;
	private $us_cpf_cnpj;

	public function getUs_id() {
		return $this->us_id;
	}

	public function setUs_id($us_id) {
		$this->us_id = $us_id;
	}
	public function getUs_email() {
		return $this->us_email;
	}

	public function setUs_email($us_email) {
		$this->us_email = $us_email;
	}
	public function getUs_nome() {
		return $this->us_nome;
	}

	public function setUs_nome($us_nome) {
		$this->us_nome = $us_nome;
	}
	public function getUs_tipo_pessoa() {
		return $this->us_tipo_pessoa;
	}

	public function setUs_tipo_pessoa($us_tipo_pessoa) {
		$this->us_tipo_pessoa = $us_tipo_pessoa;
	}
	public function getUs_senha() {
		return $this->us_senha;
	}

	public function setUs_senha($us_senha) {
		$this->us_senha = $us_senha;
	}
	public function getUs_foto() {
		return $this->us_foto;
	}

	public function setUs_foto($us_foto) {
		$this->us_foto = $us_foto;
	}
	public function getUs_status_conta() {
		return $this->us_status_conta;
	}

	public function setUs_status_conta($us_status_conta) {
		$this->us_status_conta = $us_status_conta;
	}
	public function getUs_data_compra() {
		return $this->us_data_compra;
	}

	public function setUs_data_compra($us_data_compra) {
		$this->us_data_compra = $us_data_compra;
	}
	public function getUs_data_expiracao() {
		return $this->us_data_expiracao;
	}

	public function setUs_data_expiracao($us_data_expiracao) {
		$this->us_data_expiracao = $us_data_expiracao;
	}
	public function getUs_cpf_cnpj() {
		return $this->us_cpf_cnpj;
	}

	public function setUs_cpf_cnpj($us_cpf_cnpj) {
		$this->us_cpf_cnpj = $us_cpf_cnpj;
	}

	public static function getusuarioPerfil($us_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM usuario WHERE  us_id = :us_id LIMIT 1", array(
			":us_id" => $us_id,
		));
	}

	public function getEmailUsuario() {

		$banco = new Banco();

		return $banco->select("SELECT us_id, us_nome, us_email, us_senha  FROM usuario WHERE us_email = :us_email LIMIT 1", array(
			":us_email" => $this->getUs_email(),
		));

	}

	public function getUsuario() {

		$banco = new Banco();

		return $banco->select("SELECT us_id, us_nome,us_senha  FROM usuario WHERE us_email = :US_EMAIL LIMIT 1", array(
			":US_EMAIL" => $this->getus_nome(),
		));

	}

	public static function getLastUsuario_id() {
		$banco = new Banco();

		return $banco->select("SELECT * FROM usuario GROUP BY us_id DESC LIMIT 1");

	}

	public static function getLoadUsuario_id($us_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM usuario WHERE us_id = :us_id LIMIT 1 ", array(
			":us_id" => $us_id,
		));

	}

	public static function getUsuariosgrupos($gr_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM usuariogrupos WHERE gr_id = :gr_id  GROUP BY us_id", array(
			":gr_id" => $gr_id,
		));

	}

	public static function getUsuariosgrupo($gr_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM usuariogrupos WHERE gr_id = :gr_id  GROUP BY us_id limit 1", array(
			":gr_id" => $gr_id,
		));

	}

	public function adicionaUsuario() {

		$banco = new Banco();

		$result = $banco->query("INSERT INTO usuario (us_email, us_nome, us_tipo_pessoa, us_senha, us_foto, us_status_conta) VALUES (:us_email, :us_nome, :us_tipo_pessoa, :us_senha, :us_foto, :us_status_conta)", array(

			":us_email" => $this->getUs_email(),
			":us_nome" => $this->getUs_nome(),
			":us_tipo_pessoa" => $this->getUs_tipo_pessoa(),
			":us_senha" => $this->getus_senha(),
			":us_foto" => $this->getUs_foto(),
			":us_status_conta" => $this->getUs_status_conta(),
		));

	}

	public function updateUsuario() {

		$banco = new Banco();

		$result = $banco->query("UPDATE  usuario SET us_nome = :us_nome, us_tipo_pessoa = :us_tipo_pessoa, us_foto = :us_foto WHERE us_id = :us_id ", array(

			":us_nome" => $this->getUs_nome(),
			":us_foto" => $this->getUs_foto(),
			":us_tipo_pessoa" => $this->getUs_tipo_pessoa(),
			":us_id" => $this->getUs_id(),

		));

	}

	public function updateUsuarioSenha() {

		$banco = new Banco();

		$result = $banco->query("UPDATE  usuario SET  us_senha =:us_senha WHERE us_id = :us_id ", array(

			":us_senha" => $this->getus_senha(),
			":us_id" => $this->getUs_id(),

		));

	}

	public static function deleteusuario($us_id) {

		$banco = new Banco();

		$banco->query("DELETE FROM usuario WHERE  us_id = :us_id ", array(

			":us_id" => $us_id,

		));

	}

}
