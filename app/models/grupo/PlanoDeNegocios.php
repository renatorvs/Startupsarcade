<?php

namespace app\models\grupo;
use app\models\Banco;

class PlanoDeNegocios {
	private $pn_id;
	private $pn_compreensao_de_mercado;
	private $pn_acompanhamento;
	private $pn_estrategias_de_venda;
	private $pn_projecao_financeira;
	private $pn_evitar_perda_de_capital;
	private $pn_captacao_fundos_investimento;
	private $pn_grupo_id;
	private $pn_publico_alvo;

	public function getpn_Publico_alvo() {
		return $this->pn_publico_alvo;
	}

	public function setpn_Publico_alvo($pn_publico_alvo) {
		$this->pn_publico_alvo = $pn_publico_alvo;
	}

	public function getPn_id() {
		return $this->pn_id;
	}

	public function setPn_id($pn_id) {
		$this->pn_id = $pn_id;
	}
	public function getPn_compreensao_de_mercado() {
		return $this->pn_compreensao_de_mercado;
	}

	public function setPn_compreensao_de_mercado($pn_compreensao_de_mercado) {
		$this->pn_compreensao_de_mercado = $pn_compreensao_de_mercado;
	}
	public function getPn_acompanhamento() {
		return $this->pn_acompanhamento;
	}

	public function setPn_acompanhamento($pn_acompanhamento) {
		$this->pn_acompanhamento = $pn_acompanhamento;
	}
	public function getPn_estrategias_de_venda() {
		return $this->pn_estrategias_de_venda;
	}

	public function setPn_estrategias_de_venda($pn_estrategias_de_venda) {
		$this->pn_estrategias_de_venda = $pn_estrategias_de_venda;
	}
	public function getPn_projecao_financeira() {
		return $this->pn_projecao_financeira;
	}

	public function setPn_projecao_financeira($pn_projecao_financeira) {
		$this->pn_projecao_financeira = $pn_projecao_financeira;
	}
	public function getPn_evitar_perda_de_capital() {
		return $this->pn_evitar_perda_de_capital;
	}

	public function setPn_evitar_perda_de_capital($pn_evitar_perda_de_capital) {
		$this->pn_evitar_perda_de_capital = $pn_evitar_perda_de_capital;
	}
	public function getPn_captacao_fundos_investimento() {
		return $this->pn_captacao_fundos_investimento;
	}

	public function setPn_captacao_fundos_investimento($pn_captacao_fundos_investimento) {
		$this->pn_captacao_fundos_investimento = $pn_captacao_fundos_investimento;
	}

	public function getPn_grupo_id() {
		return $this->pn_grupo_id;
	}

	public function setPn_grupo_id($pn_grupo_id) {
		$this->pn_grupo_id = $pn_grupo_id;
	}

	public function addPlanoDeNegocios() {
		$banco = new Banco();

		return $banco->query("INSERT INTO plano_de_negocios(pn_compreensao_de_mercado, pn_acompanhamento,pn_estrategias_de_venda,pn_projecao_financeira, pn_captacao_fundos_investimento, pn_grupo_id, pn_publico_alvo) VALUES  ( :pn_compreensao_de_mercado, :pn_acompanhamento, :pn_estrategias_de_venda, :pn_projecao_financeira, :pn_captacao_fundos_investimento, :pn_grupo_id, :pn_publico_alvo) ", array(
			":pn_grupo_id" => $this->getPn_grupo_id(),
			":pn_compreensao_de_mercado" => $this->getPn_compreensao_de_mercado(),
			":pn_acompanhamento" => $this->getPn_acompanhamento(),
			":pn_estrategias_de_venda" => $this->getPn_estrategias_de_venda(),
			":pn_projecao_financeira" => $this->getPn_projecao_financeira(),
			":pn_captacao_fundos_investimento" => $this->getPn_captacao_fundos_investimento(),
			":pn_publico_alvo" => $this->getPn_publico_alvo(),
		));

	}

	public function updateplanoDeNegocios() {
		$banco = new Banco();

		return $banco->query("UPDATE plano_de_negocios  SET  pn_compreensao_de_mercado = :pn_compreensao_de_mercado, pn_acompanhamento = :pn_acompanhamento, pn_estrategias_de_venda = :pn_estrategias_de_venda, pn_projecao_financeira = :pn_projecao_financeira, pn_captacao_fundos_investimento = :pn_captacao_fundos_investimento, pn_grupo_id = :pn_grupo_id, pn_publico_alvo = :pn_publico_alvo WHERE pn_id = :pn_id ", array(
			":pn_id" => $this->getPn_id(),
			":pn_grupo_id" => $this->getPn_grupo_id(),
			":pn_compreensao_de_mercado" => $this->getPn_compreensao_de_mercado(),
			":pn_acompanhamento" => $this->getPn_acompanhamento(),
			":pn_estrategias_de_venda" => $this->getPn_estrategias_de_venda(),
			":pn_projecao_financeira" => $this->getPn_projecao_financeira(),
			":pn_captacao_fundos_investimento" => $this->getPn_captacao_fundos_investimento(),
			":pn_publico_alvo" => $this->getPn_publico_alvo(),
		));

	}

	public static function getpropostaGrupo($gr_id) {
		$banco = new Banco();

		return $banco->select("SELECT * from  plano_de_negocios WHERE pn_grupo_id = :pn_grupo_id", array(
			":pn_grupo_id" => $gr_id,
		));

	}

	public static function getPlanoDeNegocios($pn_grupo_id) {
		$banco = new Banco();

		return $banco->select("SELECT * from  plano_de_negocios  WHERE pn_grupo_id = :pn_grupo_id ", array(
			":pn_grupo_id" => $pn_grupo_id,
		));

	}

}
