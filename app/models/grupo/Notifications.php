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
	// // SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE adm_sub_user_id = :adm_sub_user_id  and adm_user_id != :adm_sub_user_id and and accept = 2

	// notifica os Usuarios bloqueado
	// // SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE us_id=  :us_id  and accept = 3

	// notifica que o usuario foi aprovado no grupo;
	// //SELECT us_id, us_nome,  gr_id, gr_nome   FROM usuariogrupos WHERE us_id=  :us_id and us_id=  :us_id  and accept = 2

	public static function getNotificantionGrupo($us_id) {
		$banco = new Banco();

		$query_1 = $banco->select("SELECT us_id, us_nome,  gr_id, gr_nome   FROM usuariogrupos WHERE us_id =  :us_id  and gu_accept = 2", array(
			":us_id" => $us_id,

		));

		$query_2 = $banco->select("SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE us_id=  :us_id  and gu_accept = 3 group by gr_id DESC", array(
			":us_id" => $us_id,

		));

		$query_3 = $banco->select("SELECT * FROM usuariogrupos WHERE gu_accept = 1 and adm_flag = 1 group by gr_id", array(
			":us_id" => $us_id,

		));

		//$query_4 = $banco->select("SELECT us_id, us_nome,  gr_nome   FROM usuariogrupos WHERE adm_flag = 2  and gu_accept = 2", array(
		//	":adm_sub_user_id" => $us_id,

		//));

		return $result = array_merge($query_1);

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