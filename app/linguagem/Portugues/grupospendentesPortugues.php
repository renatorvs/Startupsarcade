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
					Compartilhe ideias
					Tudo começa com uma ideia ! 



					<article class="card border-left-success shadow h-100 py-2">
						<section class="card-body">
							
							
							<hr>
							{% for meusGrupo in meusGrupos %}
							
							

							<section class="card"> 
								<section class="card-body">
									
									<ul class="list-unstyled" class="mr-1">
										<li class="media my-4">
											<figure>
												<img src="../../assets/img/outline-ballot-24px.svg" class="mr-1" >
											</figure>

											{{meusGrupo.gu_accept}}
											<section class="media-body"> 
												<h4 class="mt-0 mb-1"> {{meusGrupo.gr_nome}}</h4>
												<h5 class="mt-0 mb-1 text-primary">{{meusGrupo.cg_nome}}</h5>
												Membros(10) | {{meusGrupo.gr_cidade}}, {{meusGrupo.gr_estado}} {{meusGrupo.gr_pais}}<br>
												<a href="\meusgrupos\informacoes\{{meusGrupo.gr_id}}" class="text-primary">Grupo informaçoes</a>
											</a> 
										</section>
									</li>

								</ul>
								<section align="center" class="group-button">
									<form action="\Pedidogrupo\cancelarpedido" method="post">
										<input type="hidden" name="gr_private" value="{{meusGrupo.gr_private}}">
										<input type="hidden" name="gu_grupo_id" value="{{meusGrupo.gr_id}}">
										<input type="hidden" name="catgr_id" value="{{meusGrupo.catgr_id}}">
										<input type="hidden" name="redirect" value="1">
										<input type="hidden" name="gu_accept" value="3">
										<button type="submit"  class="btn btn-danger" >Cancelar pedido </button>
									</form>
								</section>
							</section>
						</section>
						<br>
						{% endfor %}
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
