<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="description" content="chat servico">
  <meta name="keywords" content="chat servico">
  <meta name="author" content="onclickup">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> onclickup | chat servico</title>
  <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap-reboot.css">
  <link rel="stylesheet" href="../../assets/css/layout/chat2.css">
  <link rel="stylesheet" href="../../assets/css/layout/layout.css">
  <link rel="stylesheet" href="../../assets/css/layout/footer.css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="../../assets/css/layout/nav-dashbord.min.css" rel="stylesheet">
  <link href="../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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

    <section class="container">


<div id="frame">
 
  <div class="content">
    <div class="contact-profile">
    
                          <img src="../../assets/user_images/{{fotogrupo}}" width="50" height="50">
      <p>{{nomgrupo}} </p>
      <div class="social-media">
        <i class="fa fa-facebook" aria-hidden="true"></i>
        <i class="fa fa-twitter" aria-hidden="true"></i>
         <i class="fa fa-instagram" aria-hidden="true"></i>
      </div>
    </div>
    <div class="messages">
      <ul>
      {% for mensagem in  chatGrupoMensagem %}  
        {% if mensagem.gml_remetente_id == usuario_id %}
          <li class="replies">
            <p><strong class="text-black">Você</strong><br>{{mensagem.msn_nome}}</p>
          </li>
        {%  else %}
          <li class="sent">
            <p> <strong>{{mensagem.mdl_nome}}</strong> <br>{{mensagem.msn_nome}}</p>
          </li>
        {% endif %}
      {% endfor %}
      
      </ul>
    </div>
    <form action="\grupo\grupochatStore" method="post">
      <input type="hidden" name="gml_grupo_id"  value="{{gml_grupo_id}}">
       <input type="hidden" name="pml_pmdl_id" value="{{pedidoMensagem.pml_pmdl_id}}">
      <input type="hidden" name="pml_user_remetente_id"  value="{{session_id}}">
         <input type="hidden" name="msn_type" value="1">
    <div class="message-input">
      <div class="wrap">

      <input type="text" name="msn_nome" placeholder="escreava a sua mensagem" />
      <button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
      </div>
    </div>
    </form>
  </div>
</div>







</section>

</main>
{{ include('layout/nav-dashboard-end.html') }}
{{ include('layout/footer.html') }}
<!-- Bootstrap core JavaScript-->
<script src="../../assets/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="../../assets/js/demo/chart-area-demo.js"></script>
<script src="../../assets/js/demo/chart-pie-demo.js"></script>

<!-- Bootstrap core JavaScript-->
<script src="../../assets/vendor/jquery/jquery.min.js"></script>
<script src="../../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../../assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../../assets/js/sb-admin-2.min.js"></script>

</body>



</html>
