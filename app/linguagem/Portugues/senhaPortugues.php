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
  <title> starstu Arcade | meus grupos</title>
  <link href="../../assets/css/layout/nav-dashbord.min.css" rel="stylesheet">
</head>
<body id="page-top">
 <header>
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



        <article class="card border-left-success shadow h-100 py-2">
          <section class="card-body">


            <h4 class ="text-dark" align="center">   Grupos  </h4>
            <h5 class ="text-danger" align="center">              {{  messagem('checkgrupo') | raw }}
            </h5>

            <h5 class ="text-success" align="center">              {{  messagem('conviteenviado') | raw }}
            </h5>

            <h5 class ="text-danger" align="center">              {{  messagem('checkbloqueado') | raw }}
            </h5>
            {% set counter = 0 %}

            {% for grupo in getdadosGrupocategoria %}
            {% set counter = ( counter | default(0) ) + 1 %}
            <section class="card">
              <section class="card-body">

                <ul class="list-unstyled" class="mr-1">
                  <li class="media my-4">
                    <figure>
                      <img src="../../assets/img/outline-ballot-24px.svg" class="mr-1" >
                    </figure>
                    <section class="media-body">
                      <h4 class="mt-0 mb-1"> {{grupo.gr_nome}}</h4>
                      <h5 class="mt-0 mb-1 text-primary">{{grupo.cg_nome}}</h5>
                      {% if grupo.gr_private == 1 %}
                      Grupo Privado |
                      {% endif %}
                      Membros(10) | {{grupo.gr_cidade}}, {{grupo.gr_estado}} ({{grupo.gr_pais}})<br>

                      {% if grupo.pn_id %}
                      <a href="\grupos\informacoes\{{grupo.gr_id}}" class="text-primary">Grupo informaçoes</a>
                      {% endif %}


                    </a>
                  </section>
                </li>
              </ul>

              <section align="center" class="group-button">
                <form action="\grupos\aderirgrupo" method="post">
                  <input type="hidden" name="gr_private" value="{{grupo.gr_private}}">
                  <input type="hidden" name="gu_grupo_id" value="{{grupo.gr_id}}">
                  <input type="hidden" name="catgr_id" value="{{catgr_id}}">

                  {% if grupo.gr_private == 0 %}
                  <input type="hidden" name="gu_accept" value="2">
                  {% endif %}


                  <input type="hidden" name="gu_accept" value="1">
                  <button class="btn btn-primary" type="submit"  >Aderir grupo</button>

                </form>
              </section>


btn_aderir_grupo = "Aderir grupo"
            </section>

          </section>
card_publicidade = "publicidade"
          <br>
          {% endfor %}
          {% if counter >= 3 %}
          {% set counter = 0 %}

