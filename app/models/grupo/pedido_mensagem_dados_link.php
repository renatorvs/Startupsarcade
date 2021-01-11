<?php
namespace app\models\usuario;
use app\models\Banco;

class pedido_mensagem_dados_link {

	private $pmdl_id;
	private $pmdl_cliente_foto;
	private $pmdl_cliente_nome;
	private $pmdl_prestador_foto;
	private $pmdl_prestador_nome;

	public function getPmdl_id() {
		return $this->pmdl_id;
	}

	public function setPmdl_id($pmdl_id) {
		$this->pmdl_id = $pmdl_id;
	}
	public function getPmdl_cliente_foto() {
		return $this->pmdl_cliente_foto;
	}

	public function setPmdl_cliente_foto($pmdl_cliente_foto) {
		$this->pmdl_cliente_foto = $pmdl_cliente_foto;
	}
	public function getPmdl_cliente_nome() {
		return $this->pmdl_cliente_nome;
	}

	public function setPmdl_cliente_nome($pmdl_cliente_nome) {
		$this->pmdl_cliente_nome = $pmdl_cliente_nome;
	}
	public function getPmdl_prestador_foto() {
		return $this->pmdl_prestador_foto;
	}

	public function setPmdl_prestador_foto($pmdl_prestador_foto) {
		$this->pmdl_prestador_foto = $pmdl_prestador_foto;
	}
	public function getPmdl_prestador_nome() {
		return $this->pmdl_prestador_nome;
	}

	public function setPmdl_prestador_nome($pmdl_prestador_nome) {
		$this->pmdl_prestador_nome = $pmdl_prestador_nome;
	}

	public static function addpedidoMensagemDados($pmdl_cliente_foto, $pmdl_cliente_nome, $pmdl_prestador_foto,
		$pmdl_prestador_nome) {
		$banco = new Banco();

		return $banco->query("INSERT INTO pedido_mensagem_dados_link(pmdl_cliente_foto, pmdl_cliente_nome, pmdl_prestador_foto, pmdl_prestador_nome) VALUES (:pmdl_cliente_foto, :pmdl_cliente_nome, :pmdl_prestador_foto, :pmdl_prestador_nome)", array(
			":pmdl_cliente_foto" => $pmdl_cliente_foto,
			":pmdl_cliente_nome" => $pmdl_cliente_nome,
			":pmdl_prestador_foto" => $pmdl_prestador_foto,
			":pmdl_prestador_nome" => $pmdl_prestador_nome,
		));

	}

	public static function getLastMensagemPedidoDados() {
		$banco = new Banco();

		return $banco->select("SELECT  pmdl_id FROM pedido_mensagem_dados_link ORDER BY pmdl_id DESC");

	}

}