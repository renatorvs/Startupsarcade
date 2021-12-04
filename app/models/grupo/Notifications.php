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

	public static function getNotificantionGrupo($gu_user_id) {
		$banco = new Banco();

		$query_1 = $banco->select("SELECT `us_id`, `us_nome`, `gr_id`,`gr_nome`,`gr_foto`,`gu_accept`,`gu_user_id`,`adm_flag`, `adm_user_id` FROM usuariogrupospendentes
			WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos`
	 		WHERE gu_user_id = :gu_user_id and adm_flag = 1) and gu_accept = 1 GROUP BY us_id
	 		union all SELECT `us_id`, `us_nome`, `gr_id`,`gr_nome`,`gr_foto`,`gu_accept`,`gu_user_id`,`adm_flag`, `adm_user_id` FROM usuariogrupospendentes
	 		WHERE gr_id IN (SELECT gr_id FROM `usuariogrupos`
	 		WHERE gu_user_id = :gu_user_id ) and `gu_accept` = 2 GROUP BY us_id, gr_id ORDER by gu_user_id, gr_nome, us_id ASC", array(

			":gu_user_id" => $gu_user_id,

		));

		return $query_1;

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