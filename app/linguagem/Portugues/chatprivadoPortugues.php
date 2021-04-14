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
        <form action="/chatservico/chatservicostore" method="post">
          <section class="row form-group">
            <section class="col-md-12  col-md-12 ">
              <section class="mesgs container">
                <section class="card">
                  <section class="incoming_msg">
                    <section class="incoming_msg_img">
                     
                      <img src="../../../assets/img/padraoperfil.svg" style="padding:5px;margin:15px;" width="60" height="60" alt="sunil"> 
                      <!--  pmdl_prestador_foto -->
                      <img src="../../../assets/img/padraoperfil.svg" style="padding:5px;margin:10px;" width="60" height="60" alt="sunil">                     <!-- pmdl_cliente_foto -->
                    </section>
                    <section class="received_msg">
                      <section class="received_withd_msg">
                      
                      
                        <span class="time_date">  </span> 
                         </section> 
                      </section>
                    </section>
                  </section>
                </section>
                <br>  
                <span class="text-white">.</span>
                <br>         
                <!--  <form action="/chatvaga/chatvagastore" method="post"> -->
                  <section class="msg_history">
                  
                   <input type="hidden" name="pml_pedi_id"  value="{{pedidoMensagem.pml_pedi_id}}">
                   <input type="hidden" name="pml_pmdl_id" value="{{pedidoMensagem.pml_pmdl_id}}">
                   <input type="hidden" name="pml_user_destinatario_id"  value="{{pedidoMensagem.pml_user_destinatario_id}}">
                   <input type="hidden" name="pml_user_remetente_id"  value="{{session_id}}">
                   <input type="hidden" name="pml_user_remetente_id" value="{{session_id}}">
                   <input type="hidden" name="pml_user_destinatario_id"  value="{{pedidoMensagem.pml_user_remetente_id}}">
                   <input type="hidden" name="pml_pedi_id"  value="{{pedidoMensagem.pml_pedi_id}}">
                   <input type="hidden" name="pml_pmdl_id" value="{{pedidoMensagem.pml_pmdl_id}}">
                   <section class="outgoing_msg">
                    <section class="sent_msg">
                      <p></p>
                      <span class="time_date">  </span>  </section> 
                    </section>
                    




                    

                    


                    <section class="incoming_msg" >
                      <section class="received_msg">
                        <section class="received_withd_msg">
                          <p>dddddddddd</p>
                          <span class="time_date">sss   </span>  </section> 
                        </section>
                      </section>


                      
                      
                    </section>
                  </section>








                  <section class="type_msg" style="clear: both;">
                    <section class="input_msg_write">
                      <input type="text" class="write_msg" name="msn_nome" placeholder="Escreva aqui." />
                      <button class="msg_send_btn bg-white" type="submit"> 
                        <img src="../../assets/img/send-24px.svg"></i></button>
                      </section>
                    </section>
                    

                    
                  </form>
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
