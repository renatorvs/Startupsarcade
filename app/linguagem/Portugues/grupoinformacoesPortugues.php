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
<body id="page-top">    <header>
      {% if pais_id == 1 %}
                      {{ include('layout/nav-header-portugues.html') }}
                {% else %}
                    {{ include('layout/nav-header-ingles.html') }}
                {% endif %}

  </header>
  <main>
      {% if pais_id == 1 %}
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
            <section class="modal fade criargrupo-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
            <h4 class ="text-dark" align="center">   Plano de negocios </h4>
           
             <button  type="button" class="btn btn-info" data-toggle="modal" data-target=".criargrupo-lg">info</button>             
            <hr>

           
       
          <section class="card"> 
            <section class="card-body">

              <ul class="list-unstyled" class="mr-1">
                <li class="media my-4">
                 
                  <section class="media-body"> 
                            

Compreensao de mercado: <br>
R:<br>

Compreensão de mercado:<br>
R:<br>




Acompanhamento:<br>
R:<br>

Estrategias de venda:<br>
R:<br>

Projecao financeira:<br>
R:<br>

Evita perda de capital:<br>
R:<br>


Captaçãode fundos de investimento:<br>
R:<br>

Publico alvo:<br>
R:<br>
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