<?php

return [
	"database" => [
		'host' => 'localhost',
		'dbname' => 'startuparcade',
		'username' => 'root',
		'password' => '',
		// 'dbname' => 'onclic96_onclickup',
		// 'username' => 'onclic96',
		// 'password' => 'S9osuiH608',

		'charset' => 'utf8',
		'options' => [
			PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
			PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
		],
	],

	"email" => ['nato.re.vieira@gmail.com',

	],

	"debug" => [
		'status' => true,

	],

	"pagseguro" => [
		'urlSandbox' => true,
		'urlProducao' => true,

	],
];