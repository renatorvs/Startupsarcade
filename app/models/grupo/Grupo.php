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

		$banco->query("INSERT INTO grupo (gr_nome, gr_descricao, gr_cidade, gr_estado, gr_pais, gr_foto) VALUES(:gr_nome, :gr_descricao, :gr_cidade, :gr_estado, :gr_pais, :gr_foto) ", array(
			":gr_nome" => $this->getGr_nome(),
			":gr_descricao" => $this->getGr_descricao(),
			":gr_cidade" => $this->getGr_cidade(),
			":gr_estado" => $this->getGr_estado(),
			":gr_pais" => $this->getGr_pais(),
			":gr_foto" => $this->getGr_foto(),
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
}