<?php
namespace app\models\usuario;

use app\models\Banco;

class Notifications {
//USUARIO

	public static function getNotificantionShere($shere_autor_user_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM notifications_shere  WHERE shere_autor_user_id = :shere_autor_user_id ORDER BY shere_id DESC ", array(
			":shere_autor_user_id" => $shere_autor_user_id,

		));
	}
//EMPRESA
	public static function getNotificantionCandidatoVaga($emp_id) {
		$banco = new Banco();

		return $banco->select(" SELECT *  FROM notifications_candidatovaga  WHERE cvlemp_id = :cvlemp_id ", array(
			":cvlemp_id" => $emp_id,

		));
	}

	//CANDIDATO
	public static function getNotificantionEmpresaContacta($cand_usuario) {
		$banco = new Banco();

		return $banco->select("SELECT * FROM vaga_contactar_candidato  WHERE vcc_cand_usuario_id = :vcc_cand_usuario_id GROUP BY vcc_vaga_id DESC ", array(
			":vcc_cand_usuario_id" => $cand_usuario,

		));
	}

//USUARIO
	public static function getNotificantionSeguir($us_seguindo_id_usuario) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM usuarios_seguidores WHERE us_seguindo_id_usuario  = :us_seguindo_id_usuario ", array(
			":us_seguindo_id_usuario" => $us_seguindo_id_usuario,

		));
	}

//USUARIO

	public static function getNotificantionContratouServico($emp_cand_id) {
		$banco = new Banco();

		return $banco->select(" SELECT * FROM notifications_servicos  WHERE pedi_prestador_user_id = :pedi_prestador_user_id ", array(
			":pedi_prestador_user_id" => $emp_cand_id,

		));
	}

//USUARIO

	public static function getNotificantionMessagem($sessionUser_id) {
		$banco = new Banco();

		return $banco->select(" SELECT us_usuario_id, us_usuario_nome   FROM usuarios_seguidores  WHERE us_seguindo_id_usuario = :us_seguindo_id_usuario ", array(
			":us_seguindo_id_usuario" => $us_seguindo_id_usuario,

		));
	}

}