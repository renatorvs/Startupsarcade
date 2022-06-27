<?php
namespace app\controllers\admin;

use app\controllers\ContainerController;
use app\models\admin\Blog;
use app\models\admin\Publicidade;
use app\models\grupo\categoriaGrupo;
use app\session\Session;
use app\validate\Validate;

class AdminpublicidadeController extends ContainerController {

	public function show() {
		$this->view([
			'admin_id' => Session::get("ADMIN_SESSION"),
			'title' => 'Competencias',
			'getcompetenciasCategorias' => Competencias::getcompetenciasCategorias(),

		], 'admin.vercompetencias');

	}

	public function create() {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		$getPublicidadeAll = Publicidade::getPublicidadeAdmin();
		$categoriaGrupoPublicidade = categoriaGrupo::categoriaGrupoPublicidade();
		//debug($getPublicidadeAll);
		$getpost = Blog::getPostPublicidade(Session::get('PAIS_ID'));

		$this->view([
			'pais_id' => Session::get("PAIS_ID"),
			'getpost' => $getpost,
			'getPublicidadeAll' => $getPublicidadeAll,
			'categoriaGrupoPublicidade' => $categoriaGrupoPublicidade,
		], 'admin.adminpublicidade');
	}
	public function delete($request) {

		if (!Session::get("ADMIN_SESSION")) {
			redirecionar("/adminlogin/admin");
		}

		Publicidade::deletePublicidade($request->parameter);

		redirecionar("/Adminpublicidade/create");

	}

	public function addcompetencia() {
		if (!Session::get("ADMIN_SESSION")) {redirecionar("/adminlogin/admin");}

		$val = Validate::validate(['comp_nome' => 'string', 'compcate_id' => 'integer']);
		$compentencias = new Competencias();
		$compentencias->setCompcate_id($val->compcate_id);
		$compentencias->addCompetencias();

		redirecionar("/admincompetencias/create");
	}

	public function addpublicidade() {

		$val = Validate::validate([
			'pu_produto' => 'string',
			'pu_link' => 'string',
			'pu_categoria_id' => 'integer',
			'pu_pais' => 'integer',
			'pu_preco' => 'string',
			'pu_parcela' => 'string',
			'pu_src' => 'string',

		]);

		$publicidade = new Publicidade($val->pu_produto, $val->pu_link, $val->pu_src, $val->pu_categoria_id, $val->pu_pais, $val->pu_preco, $val->pu_parcela);
		$publicidade->add();
		redirecionar("/adminpublicidade/create");

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