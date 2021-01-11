<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\empresa\Competencias;
use app\models\empresa\Competencias_categoria;
use app\session\Session;
use app\validate\Validate;

class AdmincompetenciasController extends ContainerController {

	public function show() {
		$this->view([
			'title' => 'Competencias',
			'getcompetenciasCategorias' => Competencias::getcompetenciasCategorias(),

		], 'admin.vercompetencias');

	}

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$this->view([
			'title' => 'Competencias',
			'getCompetenciaCategoria' => Competencias_categoria::getCompetenciaCategoria(),

		], 'admin.admincompetencias');
	}

	public function addcompetencia() {
		if (!Session::get("ADMIN_SESSION")) {redirecionar("/adminlogin/admin");}

		$val = Validate::validate(['comp_nome' => 'string', 'compcate_id' => 'integer']);
		$compentencias = new Competencias();
		$compentencias->setComp_nome($val->comp_nome);
		$compentencias->setCompcate_id($val->compcate_id);
		$compentencias->addCompetencias();

		redirecionar("/admincompetencias/create");
	}

	public function addcompetenciacategoria() {
		if (!Session::get("ADMIN_SESSION")) {redirecionar("/adminlogin/admin");}

		$val = Validate::validate(['compcat_nome' => 'string']);

		$conpcat = new Competencias_categoria();
		$conpcat->setCompcat_nome($val->compcat_nome);
		$conpcat->addCompetenciaCategoria();

		redirecionar("/admincompetencias/create");

	}

	public function destroycompetenciacategoria() {
		if (!Session::get("ADMIN_SESSION")) {redirecionar("/adminlogin/admin");}

		$val = Validate::validate(['compcat_nome' => 'string']);

		$conpcat = new Competencias_categoria();
		$conpcat->setCompcat_nome($val->compcat_nome);
		$conpcat->addCompetenciaCategoria();

		redirecionar("/admincompetencias/create");

	}
}