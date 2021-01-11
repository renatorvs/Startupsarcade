<?php

namespace app\validate;

class Validate {

	public static function request() {

		$request = $_SERVER['REQUEST_METHOD'];

		if ($request == 'POST') {
			return $_POST;
		} else {
			return $_GET;
		}
	}

	public function isEmpty() {
		$request = request();

		$empty = FALSE;
		foreach ($request as $key => $value) {

			if (empty($request[$key])) {
				$empty = TRUE;
			}
		}

		return $empty;

	}

	public static function getPasswordVerify($password, $hash) {

		return password_verify($password, $hash);
	}

	public static function getPasswordHash($password) {
		$options = [
			'cost' => 12,
		];

		return password_hash($password, PASSWORD_BCRYPT, $options);
	}

	public static function Validate(array $fields) {

		$validate = [];
		$request = self::request();

		foreach ($fields as $field => $type) {

			switch ($type) {
			case 'string':

				$validate[$field] = filter_var($request[$field], FILTER_SANITIZE_STRING);

				break;

			case 'integer':

				$validate[$field] = filter_var($request[$field], FILTER_SANITIZE_NUMBER_INT);

				break;

			case 'email':

				$validate[$field] = filter_var($request[$field], FILTER_SANITIZE_EMAIL);

				break;
			case 'password':

				$validate[$field] = filter_var(self::getPasswordHash($request[$field]));

				break;

			case 'date':

				$validate[$field] = filter_var($request[$field] = date("d-m-y"));

				break;

			}

		}

		return (object) $validate;
	}

}