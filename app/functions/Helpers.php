<?php
use app\classes\Flash;
use app\models\usuario\Notifications;

function debug($dump) {

	print "<code>DUMP:</code> ";
	print '<br>';

	var_dump($dump) . " ";
	print '<br>';

	print "<code>PRINT_r</code> ";
	print '<pre>';
	print_r($dump);
	print '</pre>';

	print '<br>';
	echo "<code>JSON_ENCODE</code> ";
	print '<br>';

	print_r(json_encode($dump));
	print '<br>';
	exit();

}

function checkParameter($metodoReturn) {

	if ($metodoReturn[0] == null) {
		redirecionar("/error/naoencontrado");
	}
}

function error_report() {

	return error_reporting(E_ALL ^ E_NOTICE);

}

function flash($messages) {
	return Flash::add($messages);
}

function toJson($data) {
	header('Content-Type: application/json');
	print_r(json_encode($data));
	exit();

}

function redirecionar($redirect) {
	header("Location:" . $redirect);
	exit();
}

function getNotificantionSeguir($sessionUsuario_id) {
	//debug($sessionUsuario_id);

	$get = Notifications::getNotificantionSeguir($sessionUsuario_id);

	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}
function getNotificantionShere($sessionUsuario_id) {
	$get = Notifications::getNotificantionShere($sessionUsuario_id);
	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}

function getNotificantionContratouServico($sessionUsuario_id) {
	$get = Notifications::getNotificantionContratouServico($sessionUsuario_id);
	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}

function getNotificantionMessagem($sessionUsuario_id) {
	$get = Notifications::getNotificantionMessagem($sessionUsuario_id);
	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}

function getNotificantionCandidatoVaga($sessionUsuario_id) {
	$get = Notifications::getNotificantionCandidatoVaga($sessionUsuario_id);
	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}

function getNotificantionEmpresaContacta($sessionUsuario_id) {
	$get = Notifications::getNotificantionEmpresaContacta($sessionUsuario_id);
	if ($get) {
		return $get;
	} else {
		return FALSE;
	}

}
