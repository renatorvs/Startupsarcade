<?php

namespace core;

use app\classes\Uri;
use app\exceptions\ControllerNotExistException;

class Controller {

	public $uri;
	private $controller;
	private $namespace;
	private $folders = [
		'app\controllers\admin',
		'app\controllers\grupo',
		'app\controllers\index',
		'app\controllers\testeAjax',

		'app\controllers\usuario\usuarioAjax',
		'app\controllers\admin\adminAjax',
		'app\controllers\empresa\juridicaAjax',
		'app\controllers\candidato\fisicaAjax',
	];

	public function __construct() {
		$this->uri = Uri::uri();
	}

	public function load() {
		if ($this->isHome()) {
			return $this->controllerHome();
		}
		return $this->controllerNotHome();
	}

	private function controllerHome() {
		if (!$this->controllerExist('PublicController')) {
			throw new ControllerNotExistException("Esse controller não existe controllerHome");
		}

		return $this->instantiateController();
	}

	private function controllerNotHome() {

		$controller = $this->getControllerNotHome();

		if (!$this->controllerExist($controller)) {
			throw new ControllerNotExistException("Esse controller não existe controllerNotHome : {$controller} ");
		}

		return $this->instantiateController();

	}

	private function getControllerNotHome() {

		if (substr_count($this->uri, '/') > 1) {
			list($controller, $method) = array_values(array_filter(explode('/', $this->uri)));
			return ucfirst($controller) . 'Controller';
		}

		return ucfirst(ltrim($this->uri, '/')) . 'Controller';

	}

	private function isHome() {

		return ($this->uri == '/');
	}

	private function controllerExist($controller) {
		$controllerExist = false;

		foreach ($this->folders as $folder) {
			if (class_exists($folder . '\\' . $controller)) {
				$controllerExist = true;
				$this->namespace = $folder;
				$this->controller = $controller;
			}
		}

		return $controllerExist;

	}

	private function instantiateController() {
		$controller = $this->namespace . '\\' . $this->controller;
		return new $controller;
	}

}