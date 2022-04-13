<?php
namespace app\linguagem;
use app\session\Session;

class Linguagem {

	public static function getIdiomaSession() {
		unset($_SESSION['PAIS_ID']);

		if (getLanguage() == 1) {
			//session_destroy();
			Session::set("PAIS_ID", 1);
			return "portugues";
		} else if (getLanguage() == 2) {
			//session_destroy();
			Session::set("PAIS_ID", 2);
			return "ingles";
		} else {
			Session::set("PAIS_ID", 0);
			return "Não esta pegando nenhum idioma ";
			new Exception("Error Processing Request: Não esta pegando nenhum idioma ", 0);

		}

	}

	public static function getEntrar() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\\entrar" . $idioma;
		return new $class();
	}

	public static function getIdiomaindex() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\index" . $idioma;
		return new $class();
	}

	public static function getInscrevase() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\\usuarioincrevase" . $idioma;
		return new $class();
	}

	public static function getPerfil() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\perfil" . $idioma;
		return new $class();
	}

	public static function getIdiomaCategoriaGrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\categoriaGrupo" . $idioma;
		return new $class();
	}
	public static function grupoCategorias() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupocategorias" . $idioma;
		return new $class();
	}

	public static function getartigointerior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogartigointerno" . $idioma;
		return new $class();
	}
	public static function getartigoexterior() {
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

	public static function getbloginterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\bloginterior" . $idioma;
		return new $class();
	}

	public static function getblogexterior() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\blogexterior" . $idioma;
		return new $class();
	}

	public static function getacademy() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\academy" . $idioma;
		return new $class();
	}
	public static function getacademycategoria() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\academycategoria" . $idioma;
		return new $class();
	}
	public static function getacademyartigo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\academyartigo" . $idioma;
		return new $class();
	}

	public static function getchatgrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\chatgrupo" . $idioma;
		return new $class();
	}

	public static function getduvidascategoria() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\duvidascategoria" . $idioma;
		return new $class();
	}

	public static function getduvidas() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\duvidas" . $idioma;
		return new $class();
	}

	public static function geterror() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\error" . $idioma;
		return new $class();
	}

	public static function getGrupoInformacoes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupoinformacoes" . $idioma;
		return new $class();
	}

	public static function getmeusgrupoInformacoes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\meusgrupoInformacoes" . $idioma;
		return new $class();
	}

	public static function getGrupo() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupo" . $idioma;
		return new $class();
	}

	public static function getgrupoconvites() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\gruposconvites" . $idioma;
		return new $class();
	}

	public static function getGruposPendentes() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\gruposPendentes" . $idioma;
		return new $class();
	}

	public static function getgrupousuariosadmin() {
		$idioma = Linguagem::getIdiomaSession();
		$class = "app\linguagem\\" . $idioma . "\grupousuariosadmin" . $idioma;
		return new $class();

	}

	public static function getgrupousuarios() {
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

	public static function getstatistics() {
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