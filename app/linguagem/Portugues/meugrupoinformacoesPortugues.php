
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="description" content="Empresa vagas">
<meta name="keywords" content="Empresa vagas">
<meta name="author" content="onclickup">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap-reboot.css">
<link rel="stylesheet" href="../../assets/css/layout/layout.css">
<link rel="stylesheet" href="../../assets/css/layout/footer.css">
<link href="../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<title> SA | meus grupos</title>
<link href="../../assets/css/layout/nav-dashbord.min.css" rel="stylesheet">
</head>
<body id="page-top"> 
  <header>
                {% if pais_id %}
                      {{ include('layout/nav-header-portugues.html') }}
                {% else %}
                    {{ include('layout/nav-header-ingles.html') }}
                {% endif %}

  </header>
  <main>
     {% if pais_id %}
        {{ include('layout/nav-dashboard-portugues.html') }}
      {% else %}
          {{ include('layout/nav-dashboard-ingles.html') }}
      {% endif %}
  <section class="main-experi" >
    <hr class="m-1">  
    <section class="row">
      <section class="col-xl-12 col-md-12 mb-4">
        Compartilhe ideias
        Tudo começa com uma ideia ! 
     


        <article class="card border-left-success shadow h-100 py-2">
          <section class="card-body">
            <section class="modal fade info-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
              <section class="modal-dialog modal-lg">
                <section class="modal-content">
                  <section class="card-body">   
                    <h4 align="center"  class="text-primary">O que  é plano de negocios ?.? </h4>
              <br>    
              <hr>
Compreensao de mercado :<br>
Proporciona uma visão clara e objetiva da empresa e do setor, identifica forças, oportunidades, fraquezas e ameaças para o empreendimento.​

<br><br>
Acompanhamento:<br>
Documento centrando todas as estratégias e estudos realizados, facilitando o acompanhamento e direcionamento da empresa.<br>
<br>

Estrategias de venda:<br>
Defini as melhoes estratégias de comunicação com o público alvo, identifica possíveis direções que a empresa deve seguir.​
<br> <br>

Projecao financeira: <br>
Define as projeções financeiras do empreendimento, determinando tempo de retorno do investimento e estrutura financeira da empresa.<br><br>


Evita perda de capital:<br>
Evita chances de investimentos em negócios não viáveis bem como em produtos e/ou serviços que não possuem demanda do mercado. <br><br>


Captacao fundos de  investimento: <br>
Oferece respaldo de confiança, facilitando a captação de potenciais investidores e parceiros estratégicos.<br><br>
                  </section>
                </section>
              </section>
            </section>

  <section class="modal fade proposta-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <section class="modal-dialog modal-lg">
                  <section class="modal-content">
                    <section class="card-body">   
                      <form class="needs-validation" action="/MeusGrupos/meusgruposinfostore" enctype="multipart/form-data" method ="post">
                                <h5>Proposta para grupo: {{grupo_nome}}</h5>
                                <h5>Categoria:  {{cg_nome}}</h6>
                                  <hr>

                        <section class="form-row">
                        </h4>
                        <section class="col-md-6 mb-3">
                          <label for="validationCustom01">Compreensao de mercado</label>
                          <input type="text" name="pn_compreensao_de_mercado" class="form-control" id="validationCustom01" placeholder="compreensao de mercado" required>
                          <section class="invalid-feedback">
                            Compreensao de mercado !
                          </section>  
                        </section>
                        <section class="col-md-6 mb-3">

                          <label for="pn_acompanhamento">Acompanhamento </label>
                          <input type="text" name="pn_acompanhamento"  class="form-control" id="acompanhamento" placeholder="acompanhamento" required>
                          <section class="invalid-feedback">
                            acompanhamento invalido !
                          </section>  
                        </section>
                        <section class="col-md-6 mb-3">
                          <label for="pn_estrategias_de_venda">Estrategias de venda </label>
                          <input type="text" name="pn_estrategias_de_venda"   class="form-control" id="pn_estrategias_de_venda" placeholder="Estrategias_de_venda"  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section>


                         <section class="col-md-6 mb-3">
                          <label for="pn_projecao_financeira">Projecao financeiro </label>
                          <input type="text" name="pn_projecao_financeira"   class="form-control" id="pn_projecao_financeira" placeholder="Estrategias_de_venda"  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section> 
                        <section class="col-md-6 mb-3">
                          <label for="pn_captacao_fundos_investimento">Captacao fundos investimento </label>
                          <input type="text" name="pn_captacao_fundos_investimento"   class="form-control" id="pn_captacao_fundos_investimento" placeholder="Captacao fundos investimento "  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section>

 <section class="col-md-6 mb-3">
                          <label for=" Publico alvo"> Publico alvdddo </label>
                          <input type="text" name="pn_publico alvo"   class="form-control" id=" Publico alvo" placeholder=" Publico alvo"  required>
                          <section class="invalid-feedback">
                            Por favor, informe o  Publico alvo.
                          </section>
                        </section>
                   
                             <input type="hidden" name="pn_grupo_id" value="{{grupo_id}}">

                      

                      </section>


                      <button class="btn btn-primary" type="submit">Criar proposta</button>
                    </form>
                  </section>
                </section>
              </section>        
                </section> 

   
                <section class="modal fade editar-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <section class="modal-dialog modal-lg">
                  <section class="modal-content">
                    <section class="card-body">   
                      <form class="needs-validation" action="/MeusGrupos/meusgruposinfoupdate" enctype="multipart/form-data" method ="post">                                            
                                                                <h5 align="center">Edição</h5>
                                                                <h5>Proposta para grupo: {{grupo_nome}}</h5>
                                                                <h5>Categoria: {{cg_nome}}</h6>
                                                                  <hr>

                                                                  



                        <section class="form-row">
                        </h4>
                        <section class="col-md-6 mb-3">
                          <label for="validationCustom01">Compreensao de mercado</label>
                          <input type="text" name="pn_compreensao_de_mercado" class="form-control" id="validationCustom01" placeholder="compreensao de mercado" value="{{pn_compreensao_de_mercado}}" required>
                          <section class="invalid-feedback">
                            Compreensao de mercado !
                          </section>  
                        </section>
                        <section class="col-md-6 mb-3">

                          <label for="acompanhamento">Acompanhamento </label>
                          <input type="text" name="pn_acompanhamento"  value="{{pn_acompanhamento}}"  class="form-control" id="acompanhamento" placeholder="acompanhamento" required>
                          <section class="invalid-feedback">
                            acompanhamento invalido !
                          </section>  
                        </section>
                        <section class="col-md-6 mb-3">
                          <label for="pn_estrategias_de_venda">Estrategias de venda </label>
                          <input type="text" name="pn_estrategias_de_venda"  VALUE="{{pn_estrategias_de_venda}}" class="form-control" id="pn_estrategias_de_venda" placeholder="Estrategias_de_venda"  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section>


                         <section class="col-md-6 mb-3">
                          <label for="pn_projecao_financeira">Projecao financeiro </label>
                          <input type="text" name="pn_projecao_financeira"  value="{{pn_projecao_financeira}}"   class="form-control" id="pn_projecao_financeira" placeholder="Estrategias_de_venda"  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section> 
                        <section class="col-md-6 mb-3">
                          <label for="pn_captacao_fundos_investimento">Captacao fundos investimento </label>
                          <input type="text" name="pn_captacao_fundos_investimento"  value="{{pn_captacao_fundos_investimento}}" class="form-control" id="pn_captacao_fundos_investimento" placeholder="Captacao fundos investimento "  required>
                          <section class="invalid-feedback">
                            Por favor, informe a Estrategias de renda/venda.
                          </section>
                        </section> 
                       <section class="col-md-6 mb-3">
                          <label for=" Publico alvo"> Publico alvo </label>
                          <input type="text" name="pn_publico alvo"  value="{{pn_publico_alvo}}" class="form-control" id=" Publico alvo" placeholder=" Publico alvo"  required>
                          <section class="invalid-feedback">
                            Por favor, informe o  Publico alvo.
                          </section>
                        </section>

                   
                             <input type="hidden" name="pn_id" value="{{pn_id}}">
                             <input type="hidden" name="pn_grupo_id" value="{{pn_grupo_id}}">
  
                      {{pn_id}}

                      </section>


                      <button class="btn btn-primary" type="submit">Criar proposta</button>
                    </form>
                  </section>
                </section>
              </section>        
                </section>


            <h4 class ="text-dark" align="center">   Plano de negocios </h4>
           
             <button  type="button" class="btn btn-info" data-toggle="modal" data-target=".info-lg">info</button>  
             <a  href="/meusgrupos/grupousuarios/{{grupo_id}}" class="btn btn-primary" style="display: inline;" >usuarios</a>  
            <hr>

           
       
          <section class="card"> 
            <section class="card-body">

              <ul class="list-unstyled" class="mr-1">
                <li class="media my-4">
                 
                  <section class="media-body"> 

                             
                      {% if haplanoDeNegocios %}



Compreensão de mercado:<br>
R: {{pn_compreensao_de_mercado}}
<br>

Acompanhamento:<br>
R: {{pn_acompanhamento}}
<br>

Estrategias de venda:<br>
R: {{pn_estrategias_de_venda}}
<br>

Projecao financeira:<br>
R: {{pn_projecao_financeira}} 
<br>

Captação de fundos de investimento:<br>
R: {{pn_captacao_fundos_investimento}}
<br>

Publico alvo:<br>
R: {{pn_publico_alvo}}
<br>
                                <section align="center" class="group-button">
                                             <button  type="button" class="btn btn-primary" data-toggle="modal" data-target=".editar-lg">editar</button>                

                                </section>
                      {% else %}

                       <section align="center" class="group-button">
                       <button  type="button" class="btn btn-primary" data-toggle="modal" data-target=".proposta-lg">Criar proposta</button>
                                </section>
                      {%endif %}


                </section>
              </li>
            </ul>
         
          </section>
        </section>
        <br>
      </section>
    </article>
  </section>
</section> 

</section>
</main>
{{ include('layout/nav-dashboard-end.html') }}
{{ include('layout/footer.html') }}
<script src="../../assets/vendor/chart.js/Chart.min.js"></script>
<script src="../../assets/js/demo/chart-area-demo.js"></script>
<script src="../../assets/js/demo/chart-pie-demo.js"></script>
<script src="../../assets/vendor/jquery/jquery.min.js"></script>
<script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="../../assets/js/sb-admin-2.min.js"></script>
</body>
</html>
