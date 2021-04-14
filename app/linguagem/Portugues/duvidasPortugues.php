 <!DOCTYPE html>
 <html lang="pt-br">
 <head>
  <meta charset="UTF-8">
  <meta name="description" content="Duvidas">
  <meta name="keywords" content="Duvidas">
  <meta name="author" content="onclickup">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Onclickup | Duvidas </title>
  <link rel="stylesheet" href="../assets/css/bootstrap/bootstrap-reboot.css">
  <link rel="stylesheet" href="../assets/css/layout/adddica.css">
  <link rel="stylesheet" href="../assets/css/layout/layout.css">
  <link rel="stylesheet" href="../assets/css/layout/footer.css">
  <link href="../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <link href="../assets/css/layout/nav-dashbord.min.css" rel="stylesheet">
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
  

  <section class="main-experi">
    <nav class="nav d-flex justify-content-between">  
     {% for duvidaempresa in  getduvidaempresacategoria %}           
     <a class="p-2 text-muted" href="/duvidascategoria/show/{{duvidaempresa.duvcat_id}}"> {{duvidaempresa.duvcat_nome|e}}</a>
     {% endfor %}
   </nav>
   <hr >
   {% if admin_session  %}
   <a href="/adminaddduvidas/create" class="btn btn-outline-secondary btn-sm"> Adicionar duvida </a>
   {% endif %}
   <br>
   <section class="row">
    <h5 class="text-dark mt-4"> Duvidas frequentes</h5>
    <section class="col-xl-12 col-md-12 mb-4">
      {% for duvidas in  getduvidasempresa %}           
      <section id="accordion">
        <article class="card border-left-dark" >
          <section class="card-header" id="headingOne">
            <h5 class="mb-0">
              <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne{{ duvidas.duv_id}}" aria-expanded="false" aria-controls="collapseOne">
               <span class="text-dark"> {{ duvidas.duv_pergunta}} ?</span>
             </button>
           </h5>

           {% if pais_id == 1  %} <br>
           <strong>BR</strong>
           {% else %}
           <strong>USA</strong>
           {% endif %}
           <hr>

           {% if admin_session  %}
           <a class="btn btn-outline-secondary btn-sm" href="/duvidas/destroy/{{duvidas.duv_id}}"> excluir</a>
           {% endif %}
         </section>
         <section id="collapseOne{{ duvidas.duv_id}}" class="collapse " aria-labelledby="headingOne" data-parent="#accordion">
          <section class="card-body">
           {{ duvidas.duv_resposta}}
         </section>
       </section>
     </article>
   </section>
   {% endfor %}
 </section>
 
</section>
</main>
{{ include('layout/nav-dashboard-end.html') }}
{{ include('layout/footer.html') }}
<script src="../assets/vendor/chart.js/Chart.min.js"></script>
<script src="../assets/js/demo/chart-area-demo.js"></script>
<script src="../assets/js/demo/chart-pie-demo.js"></script>
<script src="../assets/vendor/jquery/jquery.min.js"></script>
<script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="../assets/js/sb-admin-2.min.js"></script>
</body>
</html>