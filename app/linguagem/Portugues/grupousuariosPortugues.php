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

              <h4 class ="text-dark" align="center">  Meus grupos  </h4>
       
              {% for grupos in gruponome %}


              <a href="\meusgrupos\grupousuariosadmin\{{grupos.gr_id}}" style="display: inline;" class="btn btn-primary"> admin area</a> 
              <hr>
                          <h5 class ="text-danger" align="center">              {{  messagem('naoadmin') | raw }}
            </h5>
              cod grupo: {{grupos.gr_id}}
              <h3 class="mt-0 mb-1"> Grupo:{{grupos.gr_nome}}</h4>
                <h4 class="mt-0 mb-1"> Categoria:{{grupos.cg_nome}}</h4>
                <hr>
                {% endfor %}

                {% for meusGrupo in meusGrupos %}
                <section class="modal fade criargrupo-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <section class="modal-dialog modal-lg">
                    <section class="modal-content">
                      <section class="card-body">   
                        <section align="center">
                          <h5>Menssagem</h5>

                          {{meusGrupo.us_id}}
                         <form action="\grupo\privadochatStore" method="post">
                          <input type="hidden" name="pml_grupo_id"  value="{{grupo_id}}">
                          <input type="hidden" name="pml_pmdl_id" value="{{meusGrupo.pml_pmdl_id}}">
                          <input type="hidden" name="pml_user_remetente_id"  value="{{session_id}}">
                          <input type="hidden" name="pml_user_destinatario_id"  value="{{meusGrupo.us_id}}">  <input type="hidden" name="pml_user_remetente_nome"  value="{{meusGrupo.us_nome}}">
                          <input type="hidden" name="msn_type" value="1">

                              <input type="text"  class="form-control" name="msn_nome" placeholder="escreava a sua mensagem" />
                           <section class="button-group">
                             
                              <button  class="btn btn-primary" class="submit">Enviar</button> <br>
                           </section>
                        </form>

                      </section>

                      <h4 class="card-title" align="center">{{grupos.us_nome}}</h4>
                      <h5 class="list-inline" align="center" id="courses">   {{grupos.us_email}}                              
                      </h5>
                    </section>
                  </section>
                </section>
              </section>
              <section class="card"> 
                <section class="card-body">

                   {% if meusGrupo.adm_flag == 1 %}

                  <strong class="text-success"> Administrador</strong>

                  {% endif %}


                  {% if meusGrupo.gu_accept == 3 %}


                  <strong class="danger"> Esse usuario esta bloqueado.</strong>

                  {% endif %}

                  <ul class="list-unstyled" class="mr-1">
                    <li class="media my-4">
                      <section class="media-body"> 
                        cod usuario: {{meusGrupo.us_id}}

                        <h4 class="mt-0 mb-1"> {{meusGrupo.us_nome}}</h4>
                        <h5 class="mt-0 mb-1"> Email:{{meusGrupo.us_email}}</h5>

                        <section align="center" class="group-button">
             

                        </section>
                      </section>
                    </li>
                  </ul>
                </section>
              </section>
              <br>
              {% endfor %}
            </section>
          </article>
        </section>

      </section>
    </main>
    {{ include('layout/nav-dashboard-end.html') }}
    {{ include('layout/footer.html') }}
    <script src="../../assets/vendor/jquery/jquery.min.js"></script>
    <script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="../../assets/js/sb-admin-2.min.js"></script>
  </body>
  </html>
