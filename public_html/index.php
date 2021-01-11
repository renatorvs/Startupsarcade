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

	//phpinfo();

	$controller = new Controller;

	$controller = $controller->load();

	//debug($controller);

	$method = new Method;

	$method = $method->load($controller);

	//adebug($method);

	$parameters = new Parameters;

	$parameters = $parameters->load();

	$controller->$method($parameters);

	//$modo = new Modo::status($prod);

} catch (\Exception $e) {

	$debug = (object) Bind::get('config')->debug;

	echo $e->getTraceAsString();

	echo $e->getMessage();

}

// --
// -- Estrutura para vista `notification_mensagem_vaga`
// --
// DROP VIEW IF EXISTS `notification_mensagem_vaga`;

// CREATE ALGORITHM=UNDEFINED DEFINER=`cpses_onyfdxx4c9`@`localhost` SQL SECURITY DEFINER VIEW `notification_mensagem_vaga`  AS  select `vml`.`vml_id` AS `vml_id`,`vml`.`vml_user_remetente_id` AS `vml_user_remetente_id`,`vml`.`vml_user_destinatario_id` AS `vml_user_destinatario_id`,`vml`.`vml_user_nome` AS `vml_user_nome`,`vml`.`vml_vaga_id` AS `vml_vaga_id`,`vml`.`vml_msn_id` AS `vml_msn_id`,`vml`.`vml_view` AS `vml_view`,`vml`.`vml_date` AS `vml_date`,`v`.`vag_id` AS `vag_id`,`v`.`vag_preRequisitos` AS `vag_preRequisitos`,`v`.`vag_beneficios` AS `vag_beneficios`,`v`.`vag_salario` AS `vag_salario`,`v`.`vag_quantidade` AS `vag_quantidade`,`v`.`vagstatus_id` AS `vagstatus_id`,`v`.`postvaga_id` AS `postvaga_id`,`v`.`tivaga_id` AS `tivaga_id`,`v`.`vagesco_id` AS `vagesco_id`,`p`.`post_id` AS `post_id`,`p`.`post_titulo` AS `post_titulo`,`p`.`post_subtitulo` AS `post_subtitulo`,`p`.`post_description` AS `post_description`,`p`.`postcat_id` AS `postcat_id`,`p`.`tipo_post_id` AS `tipo_post_id`,`p`.`userpost_id` AS `userpost_id`,`p`.`post_ender_id` AS `post_ender_id` from ((`vaga_mensagem_link` `vml` join `vaga` `v` on(`vml`.`vml_vaga_id` = `v`.`vag_id`)) join `post` `p` on(`v`.`postvaga_id` = `p`.`post_id`)) ;

// -- --------------------------------------------------------
