<?php
namespace app\linguagem;
use app\session\Session;

class Linguagem {

	public static function getIdiomaSession() {
		unset($_SESSION['PAIS_ID']);

		if (getLanguage() == 1) {
			Session::set("PAIS_ID", 1);
			return "Portugues";
		} else if (getLanguage() == 2) {
			Session::set("PAIS_ID", 2);
			return "Ingles";
		} else {
			Session::set("PAIS_ID", 0);
			return "Não esta pegando nenhum idioma ";
			new Exception("Error Processing Request: Não esta pegando nenhum idioma ", 0);

		}

	}

	public static function getIdiomaEntrar() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\Entrar" . $idioma;
		return new $class();
	}

	public static function getIdiomaindex() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\Index" . $idioma;
		return new $class();
	}

	public static function getIdiomaInscrevase() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\Inscrevase" . $idioma;
		return new $class();
	}

	public static function getIdiomaPerfil() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\Perfil" . $idioma;
		return new $class();
	}

	public static function getIdiomaCategoriaGrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\CategoriaGrupo" . $idioma;
		return new $class();
	}

	public static function getIdiomaBlogArtigoInterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogartigointerno" . $idioma;
		return new $class();
	}
	public static function getIdiomaBlogArtigoExterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogartigoexterior" . $idioma;
		return new $class();
	}

	public static function getBlogCategoriaInterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogcategoriainterior" . $idioma;
		return new $class();
	}
	public static function getBlogCategoriaExterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogcategoriaexterior" . $idioma;
		return new $class();
	}

	public static function getBlogInterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\bloginterior" . $idioma;
		return new $class();
	}

	public static function getBlogExterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogexterior" . $idioma;
		return new $class();
	}

	public static function getChatGrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\chatgrupo" . $idioma;
		return new $class();
	}

	public static function getDuvidasCategoria() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\duvidascategoria" . $idioma;
		return new $class();
	}

	public static function getDuvidas() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\duvidas" . $idioma;
		return new $class();
	}

	public static function getError() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\error" . $idioma;
		return new $class();
	}

	public static function getGrupoInformacoes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupoinformacoes" . $idioma;
		return new $class();
	}

	public static function getGrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupo" . $idioma;
		return new $class();
	}

	public static function getGrupoconvites() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\gruposconvites" . $idioma;
		return new $class();
	}

	public static function getGruposPendentes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\GruposPendentes" . $idioma;
		return new $class();
	}

	public static function getGrupoUsuariosAdmin() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\Grupousuariosadmin" . $idioma;
		return new $class();

	}

	public static function getGrupoUsuarios() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupousuarios" . $idioma;
		return new $class();
	}

	public static function getLearningArtigo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\learningartigo" . $idioma;
		return new $class();
	}

	public static function getLearning() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\learning" . $idioma;
		return new $class();
	}

	public static function getMeuGrupoInformacoes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\meugrupoinformacoes" . $idioma;
		return new $class();
	}

	public static function getMeusGrupos() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\meusgrupos" . $idioma;
		return new $class();
	}

	public static function getStatistics() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\statistics" . $idioma;
		return new $class();
	}

	public static function getBlogArtigoExterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogartigoexterior" . $idioma;
		return new $class();
	}

	public static function getTermos() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\\termos" . $idioma;
		return new $class();
	}

}