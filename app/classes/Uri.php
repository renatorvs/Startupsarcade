<?php

namespace app\classes;

class Uri {

	public static function uri() {
		return parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
	}

	public static function encodeUrlFactorylink($arrayencode, $string){

		$url_encodeAll = array();

		$count_array = 0;
		
		if (strtolower($string) == "post"){
			foreach ($arrayencode as $post) {

				$newposttitulo = str_replace(" ","_", uri::tirarAcentos(strtolower(trim($post['post_titulo']))));
				$newpostid_encode =  base64_encode($newposttitulo . "_". trim($post['post_id'])) ;
				$newpostid = $newposttitulo . "_" . $newpostid_encode    ;


				$arrayencode[$count_array]['post_url'] = $newpostid;

				$count_array++;
			}
		} elseif (strtolower($string) == "grupo"){

			foreach ($arrayencode as $grupo) {

				$newposttitulo = str_replace(" ","_", uri::tirarAcentos(strtolower(trim($grupo['gr_nome']))));
				$newpostid_encode =  base64_encode($newposttitulo . "_". trim($grupo['gr_id'])) ;
				$newpostid = $newposttitulo . "_" . $newpostid_encode    ;


				$arrayencode[$count_array]['gr_url'] = $newpostid;

				$count_array++;
			}
		} elseif (strtolower($string) == "categoria"){
			foreach ($arrayencode as $grupo) {

				$newposttitulo = str_replace(" ","_", uri::tirarAcentos(strtolower(trim($grupo['gr_nome']))));
				$newpostid_encode =  base64_encode($newposttitulo . "_". trim($grupo['gr_id'])) ;
				$newpostid = $newposttitulo . "_" . $newpostid_encode    ;


				$arrayencode[$count_array]['gr_url'] = $newpostid;

				$count_array++;
			}
		}

		return $arrayencode;
	}

	
	public static function  decodeUrlFactorylink($encodepost_id){



		$decode_uri_space = explode("_", $encodepost_id) ;
		$explode_key_reverse  = array_reverse($decode_uri_space, false);

		$decode_uri =  base64_decode($explode_key_reverse[0]) ;
		$decode_uri_space2 = explode("_", $decode_uri) ;

		$decode_uri_reverse  = array_reverse($decode_uri_space2, false);
		return $decode_uri_reverse[0];
		


	}

	public  static function tirarAcentos($string){
		return preg_replace(array("/(á|à|ã|â|ä)/","/(Á|À|Ã|Â|Ä)/","/(é|è|ê|ë)/","/(É|È|Ê|Ë)/","/(í|ì|î|ï)/","/(Í|Ì|Î|Ï)/","/(ó|ò|õ|ô|ö)/","/(Ó|Ò|Õ|Ô|Ö)/","/(ú|ù|û|ü)/","/(Ú|Ù|Û|Ü)/","/(ñ)/","/(Ñ)/"),explode(" ","a A e E i I o O u U n N"),$string);
	}


}