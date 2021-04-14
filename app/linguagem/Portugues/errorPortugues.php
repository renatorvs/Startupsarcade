  <!DOCTYPE>

  <html lang="pt-br">

  <head>
    <meta charset="UTF-8">
    <meta name="description" content="Página solicitada não encontrada">
    <meta name="keywords" content="Página solicitada não encontrada">
     <meta name="onclikcup" content="erros">
         <title> onclickup | erro</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../../assets/css/bootstrap/bootstrap-reboot.css">
    <link rel="stylesheet" href="../../../assets/css/layout/adddica.css">
    <link rel="stylesheet" href="../../../assets/css/layout/layout.css">
    <link rel="stylesheet" href="../../../assets/css/layout/footer.css">
    <link href="../../../assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <link href="../../../assets/css/layout/nav-dashbord.min.css" rel="stylesheet">
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
            <section class="container">
                <section class="row">
                    <section class="col-md-12">
                        <article> class="error-template" >
                            <h1>
                            Oops!</h1>
                            <h2>
                            404 Não encontrado </h2>
                            <section class="error-details">
                                Desculpe, ocorreu um erro. Página solicitada não encontrada!
                            </section>
                            <section class="error-actions">
                                <a href="/error/perfiluser" class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-home"></span>
                                ir para perfil </a><a  class="btn btn-default btn-sm"><span class="glyphicon glyphicon-envelope"></span> ir para o suporte </a>
                            </section>
                            <img src="../../../assets/Logotipo/logoEmPe.svg" class="w-50" >
                        </article>
                    </section>
                </section>
            </section>
        </section>
    </main>
    {{ include('layout/nav-dashboard-end.html') }}
    {{ include('layout/footer.html') }}
    <!-- Page level plugins -->
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