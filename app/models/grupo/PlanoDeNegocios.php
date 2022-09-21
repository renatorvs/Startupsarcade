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

	private $pn_cv_proposta_valor;
	private $pn_cv_segmentacao;
	private $pn_cv_canais;
	private $pn_cv_relacionamento;
	private $pn_cv_receitas;
	private $pn_cv_recursos;
	private $pn_cv_atividades;
	private $pn_cv_parcerias;
	private $pn_cv_estrutura_de_custos;

	public function getPn_cv_proposta_valor() {
		return $this->pn_cv_proposta_valor;
	}

	public function setPn_cv_proposta_valor($pn_cv_proposta_valor) {
		$this->pn_cv_proposta_valor = $pn_cv_proposta_valor;
	}
	public function getPn_cv_segmentacao() {
		return $this->pn_cv_segmentacao;
	}

	public function setPn_cv_segmentacao($pn_cv_segmentacao) {
		$this->pn_cv_segmentacao = $pn_cv_segmentacao;
	}
	public function getPn_cv_canais() {
		return $this->pn_cv_canais;
	}

	public function setPn_cv_canais($pn_cv_canais) {
		$this->pn_cv_canais = $pn_cv_canais;
	}
	public function getPn_cv_relacionamento() {
		return $this->pn_cv_relacionamento;
	}

	public function setPn_cv_relacionamento($pn_cv_relacionamento) {
		$this->pn_cv_relacionamento = $pn_cv_relacionamento;
	}
	public function getPn_cv_receitas() {
		return $this->pn_cv_receitas;
	}

	public function setPn_cv_receitas($pn_cv_receitas) {
		$this->pn_cv_receitas = $pn_cv_receitas;
	}
	public function getPn_cv_recursos() {
		return $this->pn_cv_recursos;
	}

	public function setPn_cv_recursos($pn_cv_recursos) {
		$this->pn_cv_recursos = $pn_cv_recursos;
	}
	public function getPn_cv_atividades() {
		return $this->pn_cv_atividades;
	}

	public function setPn_cv_atividades($pn_cv_atividades) {
		$this->pn_cv_atividades = $pn_cv_atividades;
	}
	public function getPn_cv_parcerias() {
		return $this->pn_cv_parcerias;
	}

	public function setPn_cv_parcerias($pn_cv_parcerias) {
		$this->pn_cv_parcerias = $pn_cv_parcerias;
	}
	public function getPn_cv_estrutura_de_custos() {
		return $this->pn_cv_estrutura_de_custos;
	}

	public function setPn_cv_estrutura_de_custos($pn_cv_estrutura_de_custos) {
		$this->pn_cv_estrutura_de_custos = $pn_cv_estrutura_de_custos;
	}

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

		return $banco->query("INSERT INTO plano_de_negocios(pn_cv_proposta_valor, pn_cv_segmentacao, pn_cv_canais, pn_cv_relacionamento, pn_cv_receitas, pn_cv_recursos, pn_cv_atividades, pn_cv_parcerias, pn_cv_estrutura_de_custos, pn_grupo_id) VALUES (:pn_cv_proposta_valor, :pn_cv_segmentacao, :pn_cv_canais, :pn_cv_relacionamento, :pn_cv_receitas, :pn_cv_recursos, :pn_cv_atividades, :pn_cv_parcerias, :pn_cv_estrutura_de_custos, :pn_grupo_id) ", array(

			":pn_cv_proposta_valor" => $this->getPn_cv_proposta_valor(),
			":pn_cv_segmentacao" => $this->getPn_cv_segmentacao(),
			":pn_cv_canais" => $this->getPn_cv_canais(),
			":pn_cv_relacionamento" => $this->getPn_cv_relacionamento(),
			":pn_cv_receitas" => $this->getPn_cv_receitas(),
			":pn_cv_recursos" => $this->getPn_cv_recursos(),
			":pn_cv_atividades" => $this->getPn_cv_atividades(),
			":pn_cv_parcerias" => $this->getPn_cv_parcerias(),
			":pn_cv_estrutura_de_custos" => $this->getPn_cv_estrutura_de_custos(),
			":pn_grupo_id" => $this->getPn_grupo_id(),
		));

	}


	public function updateplanoDeNegocios() {
		$banco = new Banco();

		return $banco->query("UPDATE plano_de_negocios SET pn_cv_proposta_valor = :pn_cv_proposta_valor,pn_cv_segmentacao = :pn_cv_segmentacao,pn_cv_canais = :pn_cv_canais,pn_cv_relacionamento = :pn_cv_relacionamento,pn_cv_receitas = :pn_cv_receitas,pn_cv_recursos = :pn_cv_recursos,pn_cv_atividades = :pn_cv_atividades,pn_cv_parcerias = :pn_cv_parcerias,pn_cv_estrutura_de_custos = :pn_cv_estrutura_de_custos WHERE pn_id = :pn_id ", array(

			":pn_cv_proposta_valor" => $this->getPn_cv_proposta_valor(),
			":pn_cv_segmentacao" => $this->getPn_cv_segmentacao(),
			":pn_cv_canais" => $this->getPn_cv_canais(),
			":pn_cv_relacionamento" => $this->getPn_cv_relacionamento(),
			":pn_cv_receitas" => $this->getPn_cv_receitas(),
			":pn_cv_recursos" => $this->getPn_cv_recursos(),
			":pn_cv_atividades" => $this->getPn_cv_atividades(),
			":pn_cv_parcerias" => $this->getPn_cv_parcerias(),
			":pn_cv_estrutura_de_custos" => $this->getPn_cv_estrutura_de_custos(),
			":pn_grupo_id" => $this->getPn_grupo_id(),
			":pn_id" => $this->getPn_id(),
		));

	}
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
