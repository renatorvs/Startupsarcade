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

              <h4 class ="text-dark" align="center"> administradores    </h4>

              <hr>
              {% for grupos in gruponome %}

              cod grupo: {{grupos.gr_id}}
              <h3 class="mt-0 mb-1"> Grupo:{{grupos.gr_nome}}</h4>
                <h4 class="mt-0 mb-1"> Categoria:{{grupos.cg_nome}}</h4>
                <hr>
                {% endfor %}

                {% for meusGrupo in meusGrupos %}
                <center> {{  messagem('admin') | raw }} </center> 
               <section class="modal fade criargrupo-{{meusGrupo.us_id}}-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <section class="modal-dialog modal-lg">
                  <section class="modal-content">
                    <section class="card-body">   
                      <section align="center">

                        {% if grupos.us_foto != null  %}


                        <img class="img-thumbnail" src="../../assets/user_images/{{meusGrupo.us_foto}}" width="150" height="150">

                        {% else %}
                        <img class="img-thumbnail " src="../../assets/user_images/padraoperfil.svg" alt="foto_perfil" width="150" height="150">
                        {% endif %}
                      </section>

                      <h4 class="card-title" align="center">{{meusGrupo.us_nome}}</h4>
                      <h5 class="list-inline" align="center" id="courses">   {{meusGrupo.us_email}}                              
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
                    <br>

                    <ul class="list-unstyled" class="mr-1">
                      <li class="media my-4">
                        <section class="media-body"> 
                          cod usuario: {{meusGrupo.us_id}}

                          <h4 class="mt-0 mb-1"> {{meusGrupo.us_nome}}</h4>
                          <h5 class="mt-0 mb-1"> Email:{{meusGrupo.us_email}}</h5>

                          <section align="center" class="group-button">

                            <form action="\meusgrupos\admin" method="post" style="display: inline;">
                              <input type="hidden" name="gu_grupo_id" value="{{meusGrupo.gr_id}}">
                              <input type="hidden" name="adm_user_id" value="{{meusGrupo.adm_user_id}}">
                              <input type="hidden" name="adm_sub_user_id" value="{{meusGrupo.gu_user_id}}">
                              {% if meusGrupo.adm_flag == 1 %}
                              <input type="hidden" name="admin" value="1">
                              {% else %}
                              <input type="hidden" name="admin" value="0">
                              {% endif %}

                              
                              <input type="hidden" name="admin_id"  value="{{meusGrupo.admin_id}}">

                              <button type="submit"  class="btn btn-success" >aaa admin </button>
                            </form>


                            {% if meusGrupo.adm_sub_user_id != meusGrupo.us_id or meusGrupo.us_id != meusGrupo.adm_user_id %}


                            <form action="\meusgrupos\grupoDeleteUsuarioSair" method="post" style="display: inline;">
                              <input type="hidden" name="gu_grupo_id" value="{{meusGrupo.gr_id}}">
                              <input type="hidden" name="us_id" value="{{meusGrupo.us_id}}">


                              <button type="submit"  class="btn btn-danger" >excluir </button>
                            </form>
                            {% endif %}

                            {% if meusGrupo.adm_sub_user_id != meusGrupo.us_id or meusGrupo.us_id != usuario_id %}
                            {% if meusGrupo.gu_accept == 2 %}
                            <form action="\meusgrupos\bloquear" method="post" style="display: inline;">
                              <input type="hidden" name="gu_grupo_id" value="{{meusGrupo.gr_id}}">
                              <input type="hidden" name="adm_sub_user_id" value="{{meusGrupo.gu_user_id}}">
                              {% if meusGrupo.adm_user_id != meusGrupo.us_id %}

                              <button type="submit"  class="btn btn-warning" >bloquear</button>
                              {% endif %}

                            </form> 
                            {% elseif meusGrupo.gu_accept == 3 %}

                            <form action="\meusgrupos\desbloquear" method="post" style="display: inline;">
                              <input type="hidden" name="gu_grupo_id" value="{{meusGrupo.gr_id}}">
                              <input type="hidden" name="adm_sub_user_id" value="{{meusGrupo.gu_user_id}}">
                              {% if meusGrupo.adm_user_id != meusGrupo.us_id %}
                              <button type="submit"  class="btn btn-warning" >desbloquear</button>
                              {% endif %}
                              {% endif %}
                              {% endif %}



                            </form>


                            <button  class="btn btn-info" data-toggle="modal" data-target=".criargrupo-{{meusGrupo.us_id}}-lg" style="display: inline;">perfil</button>

                          </section>
                        </section>
                      </li>
                    </ul>


                    <section align="center" class="group-button">



                    </section>
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
