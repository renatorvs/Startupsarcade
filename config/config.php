<?php

return [
	"database" => [
		'host' => 'localhost',
		'dbname' => 'startuparcade',
		'username' => 'root',
		'password' => '',
		// 'dbname' => 'start277_startupsarcade',
		// 'username' => 'start277',
		// 'password' => 'mx52QVl06z',

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

	'charset' => 'utf8',
	'options' => [
		PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
		PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_OBJ,
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