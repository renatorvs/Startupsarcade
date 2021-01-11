<?php
namespace app\validate;

class Data {

	public static function dataformat($data) {
		return date("d/m/Y", strtotime($data));
	}
// exemplo de utilização:
	// data('2017-05-04');

}
