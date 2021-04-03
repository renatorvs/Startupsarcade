<?php
namespace app\linguagem;

use app\linguagem\ingles\EntrarIngles;
use app\linguagem\ingles\IndexIngles;
use app\linguagem\ingles\PerfilIngles;
use app\linguagem\portugues\EntrarPortugues;
use app\linguagem\portugues\IndexPortugues;
use app\linguagem\portugues\InscrevasePortugues;
use app\linguagem\portugues\PerfilPortugues;

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

	public static function getIdiomaPerfil() {
		if (getLanguage() == 1) {
			return new PerfilPortugues();
		} else {
			return new PerfilIngles();
		}
	}

	public static function getIdiomaCategoriaGrupo() {
		if (getLanguage() == 1) {
			return new IndexIngles();
		} else {
			return new InscrevasePortugues();
		}
	}

}