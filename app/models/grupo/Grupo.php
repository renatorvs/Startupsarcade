<?php

namespace app\models\grupo;
use app\models\Banco;

class Grupo {
	private $gr_id;
	private $gr_nome;
	private $gr_descricao;
	private $gr_cidade;
	private $gr_estado;
	private $gr_pais;
	private $gu_private;
	private $gu_accept;
	private $gu_id;
	private $gu_user_admin_id;
	private $gu_subusers_admin_id;
	private $gu_user_id;
	private $gu_grupo_id;
	private $gr_foto;
	private $grcat_id;

	public function getGrcat_id() {
		return $this->grcat_id;
	}

	public function setGrcat_id($grcat_id) {
		$this->grcat_id = $grcat_id;
	}
	public function getGu_private() {
		return $this->gu_private;
	}

	public function setGu_private($gu_private) {
		$this->gu_private = $gu_private;
	}

	public function getGr_id() {
		return $this->gr_id;
	}

	public function setGr_id($gr_id) {
		$this->gr_id = $gr_id;
	}
	public function getGr_nome() {
		return $this->gr_nome;
	}

	public function setGr_nome($gr_nome) {
		$this->gr_nome = $gr_nome;
	}
	public function getGr_descricao() {
		return $this->gr_descricao;
	}

	public function setGr_descricao($gr_descricao) {
		$this->gr_descricao = $gr_descricao;
	}
	public function getGr_cidade() {
		return $this->gr_cidade;
	}

	public function setGr_cidade($gr_cidade) {
		$this->gr_cidade = $gr_cidade;
	}
	public function getGr_estado() {
		return $this->gr_estado;
	}

	public function setGr_estado($gr_estado) {
		$this->gr_estado = $gr_estado;
	}
	public function getGr_pais() {
		return $this->gr_pais;
	}

	public function setGr_pais($gr_pais) {
		$this->gr_pais = $gr_pais;
	}

	public function getGu_accept() {
		return $this->gu_accept;
	}

	public function setGu_accept($gu_accept) {
		$this->gu_accept = $gu_accept;
	}
	public function getGu_id() {
		return $this->gu_id;
	}

	public function setGu_id($gu_id) {
		$this->gu_id = $gu_id;
	}
	public function getGu_user_admin_id() {
		return $this->gu_user_admin_id;
	}

	public function setGu_user_admin_id($gu_user_admin_id) {
		$this->gu_user_admin_id = $gu_user_admin_id;
	}
	public function getGu_subusers_admin_id() {
		return $this->gu_subusers_admin_id;
	}

	public function setGu_subusers_admin_id($gu_subusers_admin_id) {
		$this->gu_subusers_admin_id = $gu_subusers_admin_id;
	}
	public function getGu_user_id() {
		return $this->gu_user_id;
	}

	public function setGu_user_id($gu_user_id) {
		$this->gu_user_id = $gu_user_id;
	}
	public function getGu_grupo_id() {
		return $this->gu_grupo_id;
	}

	public function setGu_grupo_id($gu_grupo_id) {
		$this->gu_grupo_id = $gu_grupo_id;
	}

	public function getGr_foto() {
		return $this->gr_foto;
	}

	public function setGr_foto($gr_foto) {
		$this->gr_foto = $gr_foto;
	}

	public function addGrupo() {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo (gr_nome, gr_descricao, gr_cidade, gr_estado, gr_pais, gr_foto, grcat_id) VALUES(:gr_nome, :gr_descricao, :gr_cidade, :gr_estado, :gr_pais, :gr_foto, :grcat_id) ", array(
			":gr_nome" => $this->getGr_nome(),
			":gr_descricao" => $this->getGr_descricao(),
			":gr_cidade" => $this->getGr_cidade(),
			":gr_estado" => $this->getGr_estado(),
			":gr_pais" => $this->getGr_pais(),
			":gr_foto" => $this->getGr_foto(),
			":grcat_id" => $this->getGrcat_id(),
		));

	}

	public static function getLastGrupo() {
		$banco = new Banco();

		return $banco->select("SELECT * FROM grupo GROUP BY gr_id DESC LIMIT 1");

	}

	public function addgrupo_usuario() {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo_usuario (gu_private, gu_accept, gu_user_admin_id, gu_user_id, gu_grupo_id) VALUES (:gu_private, :gu_accept, :gu_user_admin_id, :gu_user_id, :gu_grupo_id)  ",
			array(
				":gu_private" => $this->getGu_private(),
				":gu_accept" => $this->getGu_accept(),
				":gu_user_admin_id" => $this->getGu_user_admin_id(),
				":gu_user_id" => $this->getGu_user_id(),
				":gu_grupo_id" => $this->getGu_grupo_id(),
			));

	}

	public static function meusGrupos($us_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM `usuariogrupos` WHERE us_id = :us_id",
			array(
				":us_id" => $us_id,
			));
	}

	// UPDATE `usuario` SET `us_id`=[value-1],`us_email`=[value-2],`us_nome`=[value-3],`us_tipo_pessoa`=[value-4],`us_senha`=[value-5],`us_foto`=[value-6],`us_status_conta`=[value-7],`us_data_compra`=[value-8],`us_data_expiracao`=[value-9],`us_cpf_cnpj`=[value-10],`us_dataCadastro`=[value-11] WHERE 1

	public static function grupoUpdate($gr_id) {
		$banco = new Banco();

		return $banco->query("UPDATE  grupo  SET  gr_nome = :gr_nome, gr_descricao = :gr_descricao, gr_cidade = :gr_cidade, gr_estado = gr_estado, gr_foto = :gr_foto, grcat_id = :grcat_id WHERE gr_id = :gr_id",
			array(
				":gr_id" => $this->getGr_id(),
				":gr_nome" => $this->getGr_nome(),
				":gr_descricao" => $this->getGr_descricao(),
				":gr_cidade" => $this->getGr_cidade(),
				":gr_estado" => $this->getGr_estado(),
				":gr_foto" => $this->getGr_foto(),
				":grcat_id" => $this->getGrcat_id(),
			));
	}
}