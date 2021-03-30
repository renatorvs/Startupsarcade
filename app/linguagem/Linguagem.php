<?php
namespace app\linguagem;

use app\linguagem\portugues\EntrarIngles;
use app\linguagem\portugues\EntrarPortugues;
use app\linguagem\portugues\IndexIngles;
use app\linguagem\portugues\IndexPortugues;
use app\linguagem\portugues\InscrevasePortugues;

class Linguagem {

	public static function getIdiomaSession() {
		if (getLanguage() == 1) {
			Session::set("PAIS_ID", 1);
		} else {
			Session::set("PAIS_ID", 2);
		}
	}

	public static function getIdiomaEntrar() {
		if (getLanguage() == 1) {
			return new EntrarIngles();
		} else {
			return new EntrarPortugues();
		}
	}

	public static function getIdiomaindex() {
		if (getLanguage() == 1) {
			return new IndexIngles();
		} else {
			return new IndexPortugues();
		}
	}

	public static function getIdiomaInscrevase() {
		if (getLanguage() == 1) {
			return new IndexIngles();
		} else {
			return new InscrevasePortugues();
		}
	}

}