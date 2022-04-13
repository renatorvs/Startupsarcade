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
	private $gr_private;
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
	public function getGr_private() {
		return $this->gr_private;
	}

	public function setGr_private($gr_private) {
		$this->gr_private = $gr_private;
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

		$banco->query("INSERT INTO grupo (gr_nome, gr_descricao, gr_cidade, gr_estado, gr_pais, gr_foto, grcat_id, gr_private) VALUES(:gr_nome, :gr_descricao, :gr_cidade, :gr_estado, :gr_pais, :gr_foto, :grcat_id, :gr_private) ", array(
			":gr_nome" => $this->getGr_nome(),
			":gr_descricao" => $this->getGr_descricao(),
			":gr_cidade" => $this->getGr_cidade(),
			":gr_estado" => $this->getGr_estado(),
			":gr_pais" => $this->getGr_pais(),
			":gr_foto" => $this->getGr_foto(),
			":gr_private" => $this->getGr_private(),
			":grcat_id" => $this->getGrcat_id(),
		));

	}

	public static function getLastGrupo() {
		$banco = new Banco();

		return $banco->select("SELECT * FROM grupo GROUP BY gr_id DESC LIMIT 1");

	}

	public function addgrupo_usuario() {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo_usuario (gu_accept, gu_user_id, gu_grupo_id) VALUES (:gu_accept, :gu_user_id, :gu_grupo_id) ",
			array(
				":gu_accept" => $this->getGu_accept(),
				":gu_user_id" => $this->getGu_user_id(),
				":gu_grupo_id" => $this->getGu_grupo_id(),
			));

	}

	public function grupo_admin($adm_user_id, $adm_sub_user_id, $adm_grupo_id, $adm_flag) {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo_admin( adm_user_id, adm_sub_user_id, adm_grupo_id, adm_flag) VALUES(:adm_user_id, :adm_sub_user_id, :adm_grupo_id, :adm_flag)",
			array(
				":adm_user_id" => $adm_user_id,
				":adm_sub_user_id" => $adm_sub_user_id,
				":adm_grupo_id" => $adm_grupo_id,
				":adm_flag" => $adm_flag,
			));

	}

	public static function desbloquear($gu_user_id, $gu_grupo_id) {

		$banco = new Banco();

		$banco->query("UPDATE grupo_usuario SET gu_accept = 2 where gu_user_id = :gu_user_id AND  gu_grupo_id = :gu_grupo_id ",
			array(
				":gu_user_id" => $gu_user_id,
				":gu_grupo_id" => $gu_grupo_id,
			));

	}
	public static function bloquear($gu_user_id, $gu_grupo_id) {

		$banco = new Banco();

		$banco->query("UPDATE grupo_usuario SET gu_accept = 3 WHERE gu_user_id = :gu_user_id AND  gu_grupo_id = :gu_grupo_id",
			array(
				":gu_user_id" => $gu_user_id,
				":gu_grupo_id" => $gu_grupo_id,
			));

	}

	public static function addusuarioadmin($adm_user_id, $adm_sub_user_id, $adm_grupo_id) {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo_admin( adm_user_id, adm_sub_user_id, adm_grupo_id) VALUES ( :adm_user_id, :adm_sub_user_id, :adm_grupo_id)",
			array(
				":adm_user_id" => $adm_user_id,
				":adm_sub_user_id" => $adm_sub_user_id,
				":adm_grupo_id" => $adm_grupo_id,
			));

	}

	public static function updateAdmin($adm_flag, $adm_sub_user_id, $adm_grupo_id) {

		$banco = new Banco();

		$banco->query("UPDATE grupo_admin SET adm_flag = :adm_flag  WHERE adm_sub_user_id = :adm_sub_user_id AND adm_grupo_id = :adm_grupo_id",
			array(
				":adm_flag" => $adm_flag,
				":adm_sub_user_id" => $adm_sub_user_id,
				":adm_grupo_id" => $adm_grupo_id,
			));

	}

	public static function deletegrupoadmin($adm_user_id, $adm_sub_user_id, $adm_grupo_id) {

		$banco = new Banco();

		$banco->query(" DELETE FROM grupo_admin WHERE  adm_grupo_id = :adm_grupo_id AND adm_user_id = :adm_user_id or adm_sub_user_id = :adm_sub_user_id  ",
			array(
				":adm_user_id" => $adm_user_id,
				":adm_sub_user_id" => $adm_sub_user_id,
				":adm_grupo_id" => $adm_grupo_id,
			));

	}

	public function addgrupoMembro() {

		$banco = new Banco();

		$banco->query("INSERT INTO grupo_usuario (gu_accept, gu_user_id, gu_grupo_id) VALUES (:gu_accept, :gu_user_id, :gu_grupo_id) ",
			array(
				":gu_accept" => $this->getGu_accept(),
				":gu_user_id" => $this->getGu_user_id(),
				":gu_grupo_id" => $this->getGu_grupo_id(),
			));

	}

	public static function meusGrupos($gu_user_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM `usuariogrupos` where gu_user_id = :gu_user_id and gu_accept = 2 GROUP BY gr_id, gr_nome ORDER BY gr_id ",
			array(
				":gu_user_id" => $gu_user_id,
			));
	}

	public static function getGruposAll($grcat_id, $gr_pais) {
		$banco = new Banco();

		return $banco->select("SELECT g.gr_id, g.gr_nome, g.gr_descricao, gr_cidade, g.gr_estado, g.gr_foto, g.grcat_id, g.gr_private, count(gu.gu_user_id) AS quantidade FROM grupo g LEFT JOIN grupo_usuario gu ON g.gr_id = gu.gu_grupo_id WHERE  grcat_id  = :grcat_id and   gr_pais = :gr_pais GROUP BY g.gr_id, g.gr_nome ORDER BY g.gr_id",
			array(
				":gr_pais" => $gr_pais,
				":grcat_id" => $grcat_id,
			));
	}

	public static function getGruposPlanosAll($gr_id, $gr_pais) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM dadosgrupo WHERE  gr_id  = :gr_id and   gr_pais = :gr_pais  GROUP BY gr_id",
			array(
				":gr_pais" => $gr_pais,
				":gr_id" => $gr_id,
			));
	}

	public static function checkgrupos($gu_user_id, $gr_id) {
		$banco = new Banco();

		return $banco->select("SELECT gr_id  FROM usuariogrupos WHERE  gr_id = :gr_id and gu_user_id = :gu_user_id  ",
			array(
				":gu_user_id" => $gu_user_id,
				":gr_id" => $gr_id,
			));
	}

	public static function meusGruposPendentes($gu_user_id) {
		$banco = new Banco();
		return $banco->select("SELECT * FROM usuariogrupospendentes  WHERE gu_user_id = :gu_user_id  and gu_accept = 1",
			array(
				":gu_user_id" => $gu_user_id,
			));
	}

	public static function meusGruposConvites($gu_user_id) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM usuariogrupospendentes WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos` WHERE gu_user_id = :gu_user_id and adm_flag = 1) and gu_accept = 1 group by us_id",
			array(
				":gu_user_id" => $gu_user_id,
			));
	}

	public static function updateconvite($gu_user_id, $gu_grupo_id) {
		$banco = new Banco();

		return $banco->query("UPDATE grupo_usuario SET gu_accept = 2   WHERE  gu_user_id = :gu_user_id  and  gu_grupo_id = :gu_grupo_id",
			array(
				":gu_grupo_id" => $gu_grupo_id,
				":gu_user_id" => $gu_user_id,
			));
	}

	public function grupoUpdate() {
		$banco = new Banco();

		return $banco->query("UPDATE  grupo  SET  gr_nome = :gr_nome, gr_descricao = :gr_descricao, gr_cidade = :gr_cidade, gr_estado = :gr_estado, gr_foto = :gr_foto, grcat_id = :grcat_id, gr_private = :gr_private WHERE gr_id = :gr_id", array(
			":gr_nome" => $this->getGr_nome(),
			":gr_descricao" => $this->getGr_descricao(),
			":gr_cidade" => $this->getGr_cidade(),
			":gr_estado" => $this->getGr_estado(),
			":gr_private" => $this->getGr_private(),
			":gr_foto" => $this->getGr_foto(),
			":grcat_id" => $this->getGrcat_id(),
			":gr_id" => $this->getGr_id(),
		));
	}

	public static function grupoDelete($gr_id) {
		$banco = new Banco();

		return $banco->query("DELETE FROM grupo WHERE  gr_id = :gr_id",
			array(
				":gr_id" => $gr_id,

			));
	}

	public static function grupoUsuarioDelete($gu_grupo_id) {
		$banco = new Banco();

		return $banco->query("DELETE FROM grupo_usuario WHERE  gu_grupo_id = :gu_grupo_id",
			array(
				":gu_grupo_id" => $gu_grupo_id,

			));
	}
	public static function grupoUsuarioSair($gu_grupo_id, $gu_user_id) {
		$banco = new Banco();

		return $banco->query("DELETE FROM grupo_usuario WHERE  gu_user_id = :gu_user_id and gu_grupo_id = :gu_grupo_id",
			array(
				":gu_grupo_id" => $gu_grupo_id,
				":gu_user_id" => $gu_user_id,

			));
	}

	public static function getGrupoCategoriaId($grcat_id, $session_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM  usuariogrupos  WHERE  grcat_id = :grcat_id    ", array(
			":grcat_id" => $grcat_id,

		));

	}

	public static function CategoriaGrupoLoad($gr_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM  grupocategorias  WHERE  gr_id  = :gr_id", array(
			":gr_id" => $gr_id,

		));

	}

	public static function getdadosGrupocategoria($grcat_id, $user_id) {

		$banco = new Banco();

		return $banco->select("SELECT * FROM  dadosGrupo  WHERE   grcat_id = :grcat_id AND gu_user_id = :gu_user_id ", array(
			":grcat_id" => $grcat_id,
			":gu_user_id" => $user_id,

		));

	}

	public static function updateGrupoView($gml_grupo_id, $gml_destinatario_id) {

		$banco = new Banco();

		return $banco->select("UPDATE grupo_mensagem_link SET gml_view = 1 WHERE gml_grupo_id = :gml_grupo_id AND  gml_destinatario_id = :gml_destinatario_id ", array(
			":gml_destinatario_id" => $gml_destinatario_id,
			":gml_grupo_id" => $gml_grupo_id,

		));

	}

	public static function updatePrivadoView($pml_grupo_id, $pml_user_destinatario_id) {

		$banco = new Banco();

		return $banco->select("UPDATE privado_mensagem_link SET pml_view = 1 WHERE pml_grupo_id = :pml_grupo_id AND  pml_user_destinatario_id = :pml_user_destinatario_id ", array(
			":pml_grupo_id" => $pml_grupo_id,
			":pml_user_destinatario_id" => $pml_user_destinatario_id,

		));

	}

	public static function cancelaPedidoGrupo($gu_user_id, $gu_grupo_id) {

		$banco = new Banco();

		return $banco->query("DELETE FROM grupo_usuario WHERE gu_user_id = :gu_user_id AND gu_grupo_id = :gu_grupo_id ", array(
			":gu_grupo_id" => $gu_grupo_id,
			":gu_user_id" => $gu_user_id,

		));

	}

}
