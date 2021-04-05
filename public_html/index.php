<?php

require '../bootstrap.php';

use app\classes\Bind;
use app\session\Session;
use core\Controller;
use core\Method;
use core\Parameters;

Session::start();

error_report();

$debug = null;

try {

	$controller = new Controller;

	$controller = $controller->load();

	$method = new Method;

	$method = $method->load($controller);

	$parameters = new Parameters;

	$parameters = $parameters->load();

	$controller->$method($parameters);

} catch (\Exception $e) {
	$debug = (object) Bind::get('config')->debug;
	echo $e->getTraceAsString();
	echo $e->getMessage();
}
