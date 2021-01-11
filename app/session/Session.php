<?php

namespace app\session;

class Session {

	private static $_sessionStarted = false;

	public static function start() {
		if (self::$_sessionStarted == false) {
			session_start();
			self::$_sessionStarted = true;
		}
	}

	public static function set($chave, $valor) {
		$_SESSION[$chave] = $valor;
	}

	public static function get($chave) {
		if (isset($_SESSION[$chave])) {
			return $_SESSION[$chave];
		} else {
			return FALSE;
		}
	}

	public static function sessionDebug() {
		print '<pre>';
		print_r($_SESSION);
		print '</pre>';
	}

	public static function sessionDestroy() {
		session_destroy();
		session_unset();
	}

}