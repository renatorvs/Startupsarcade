<?php
namespace app\models\grupo;

use app\models\Banco;

class Notifications {
//USUARIO

	public static function getNotificantionShere($shere_autor_user_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM notifications_shere  WHERE shere_autor_user_id = :shere_autor_user_id ORDER BY shere_id DESC ", array(
			":shere_autor_user_id" => $shere_autor_user_id,

		));
	}

	// notificação responsavel por trazer os usarios que se cadastraram
	// // SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE adm_sub_user_id = :adm_sub_user_id  and accept = 1

	// notifica os Usuarios bloqueado
	// // SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE us_id=  :us_id  and accept = 3

	// notifica que o usuario foi aprovado no grupo;
	// //SELECT us_id, us_nome,  gr_id, gr_nome   FROM usuariogrupos WHERE us_id=  :us_id and us_id=  :us_id  and accept = 2

	public static function getNotificantionGrupo($us_id) {
		$banco = new Banco();

		$query_1 = $banco->select("SELECT us_id, us_nome,  gr_id, gr_nome   FROM usuariogrupos WHERE us_id=  :us_id  and gu_accept = 2", array(
			":us_id" => $us_id,

		));

		$query_2 = $banco->select("SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE us_id=  :us_id  and gu_accept = 3", array(
			":us_id" => $us_id,

		));

		$query_3 = $banco->select("SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE adm_sub_user_id=  :adm_sub_user_id  and gu_accept = 2", array(
			":adm_sub_user_id" => $us_id,

		));

		return $result = array_merge($query_1, $query_2, $query_3);

	}

	//CANDIDATO
	public static function getNotificantionEmpresaContacta($cand_usuario) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM vaga_contactar_candidato  WHERE vcc_cand_usuario_id = :vcc_cand_usuario_id GROUP BY vcc_vaga_id DESC ", array(
			":vcc_cand_usuario_id" => $cand_usuario,

		));
	}

	public static function getNotificantionSeguir($us_seguindo_id_usuario) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM usuarios_seguidores WHERE us_seguindo_id_usuario  = :us_seguindo_id_usuario ", array(
			":us_seguindo_id_usuario" => $us_seguindo_id_usuario,

		));
	}

	public static function getNotificantionContratouServico($emp_cand_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM notifications_servicos  WHERE pedi_prestador_user_id = :pedi_prestador_user_id ", array(
			":pedi_prestador_user_id" => $emp_cand_id,

		));
	}

	public static function getNotificantionMessagem($gml_remetente_id) {
		$banco = new Banco();
		return $banco->select(" SELECT * FROM usuario_notificantions_mensagem  WHERE gml_remetente_id != :gml_remetente_id ", array(
			":gml_remetente_id" => $gml_remetente_id,

		));
	}

}