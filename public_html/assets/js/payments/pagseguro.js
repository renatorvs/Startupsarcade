//SE NÃO GERAR O ID DA SESSÃO E SETAR ESSE ID NO setSessionId NADA VAI FUNCIONAR
//DEVE-SE GERAR A IDENTIFICAÇÃO DO USUÁRIO TAMBÉM
//SE FOR CARTÃO DE CRÉDITO DEVE-SE GERAR O TOKEN DO CARTÃO

// $("#sessaoCad").click(function(){ //recebe codigo da dessão e seta o sessão id

//         $.ajax({
//             url : getUrl() + '/PedidoPlanos/iniciaPagamento',
//             type : 'post',
//             dataTyp : 'json',
//             async : false,
//             timeout: 20000,
//             success: function(data){
//                 $(".retornoTeste").html(data);
//                 PagSeguroDirectPayment.setSessionId(data);
//             }
//         });

//     });
 function mudaHTML(){




      var valorFinal =  document.getElementById('valorFinal').value;
      console.log(valorFinal);


     // alert(valorFinal);
     var select =  document.getElementById('parcelas');
     var parcelas = select.options[select.selectedIndex].value;

     var arredondaParcela = valorFinal/parcelas;

     valorParcelas =Math.round(arredondaParcela);
     if(valorParcelas == "Infinity"){
        valorParcelas = 0;
    }

    $('#valorParcelas').val(valorParcelas) ;

}

//Gerando uma sessão = CREDENCIAL
  $(document).ready( function(){//recebe codigo da dessão e seta o sessão id

        $.ajax({
            url :  '/PedidoPlanos/iniciaPagamento',
            type : 'post',
            success: function(data){
                $("#credencial").val(data);

                PagSeguroDirectPayment.setSessionId(data);
            }
        });

    

});

  $("#cadCNPJ").focus(function(){ //gera identificação do usuário
PagSeguroDirectPayment.onSenderHashReady(function(response){
    
  

    if(response.status == 'error') {
        console.log(response.message);
        return false;
    }


    var hash = response.senderHash; //Hash estará disponível nesta variável.

        identificador = PagSeguroDirectPayment.onSenderHashReady();
          $("#cadCNPJ").val("hash usuario:" + hash);
});

       
    });


$("#valorParcelas").click(function(){
  
       var valorTotal = $("#valorTotal").val();
        var parcelas = $("#parcelas").val();

        PagSeguroDirectPayment.getInstallments({
            amount: valorTotal,
            maxInstallmentNoInterest: parcelas,

            success: function(response){ console.log(response);},
            error: function(response){ console.log(response); }
        });

});


 $('#numCartao').keyup(function () {
    var numCartao = $(this).val();
    var qntNumero = numCartao.length;

    console.log(numCartao);

    if (qntNumero == 6) {
        PagSeguroDirectPayment.getBrand({
            cardBin: numCartao,
            success: function (retorno) {
                //console.log(retorno);
                $('#msg').empty();
                var imgBand = retorno.brand.name;
                $('.bandeira-cartao').html("<img src='https://stc.pagseguro.uol.com.br/public/img/payment-methods-flags/42x20/" + imgBand + ".png'>");
            },
            error: function (retorno) {
             
                $('.bandeira-cartao').empty();
                $('#msg').html("Cartão inválido");
            },
           
        }); 
    }
});

	






	  


$("#cvv").keyup(function(){  //criar token

       
    var  numCartao = $("#numCartao").val();
     var  cvvCartao = $("#cvv").val();
     var expiracaoMes = $("#pagamentoMes").val();
     var expiracaoAno = $("#pagamentoAno").val();
         
        PagSeguroDirectPayment.createCardToken({

            cardNumber: numCartao,
            brand:bandeira,
            cvv: cvvCartao,
            expirationMonth: expiracaoMes,
            expirationYear: expiracaoAno,

            success: function(response){  $(".tokenPagamentoCartao").val(response['card']['token']);
                     $("#tokenPagamentoCartao").val(response['card']['token']);

          },
            error: function(response){ console.log(response); }
       });


    });



$("#meios").click(function(){ //meios de pagamento disponíveis

       PagSeguroDirectPayment.getPaymentMethods({
        amount: 500.00,
        success: function (retorno) {
            //console.log(retorno);
            $('.meio-pag').append("<div>Cartão de Crédito</div>");
            $.each(retorno.paymentMethods.CREDIT_CARD.options, function (i, obj) {
                //$('.meio-pag').append("<span>"+ obj.name +"</span>");
                //$('.meio-pag').append("<span><img src='https://stc.pagseguro.uol.com.br" + obj.images.SMALL.path + "'>"+ obj.name +"</span>");
                $('.meio-pag').append("<span class='img-band'><img src='https://stc.pagseguro.uol.com.br" + obj.images.SMALL.path + "'></span>");
            });

            $('.meio-pag').append("<div>Boleto</div>");
            $('.meio-pag').append("<span class='img-band'><img src='https://stc.pagseguro.uol.com.br" + retorno.paymentMethods.BOLETO.options.BOLETO.images.SMALL.path + "'><span>");

            $('.meio-pag').append("<div>Débito Online</div>");
            $.each(retorno.paymentMethods.ONLINE_DEBIT.options, function (i, obj) {
                $('.meio-pag').append("<span class='img-band'><img src='https://stc.pagseguro.uol.com.br" + obj.images.SMALL.path + "'></span>");
            });
        },
        error: function (retorno) {
            // Callback para chamadas que falharam.
        },
        complete: function (retorno) {
            // Callback para todas chamadas.
        }
    });

    });



	

//   $('#submit').click(function(){
//    if($('#myMessage').val() == ''){
//       alert('Input can not be left blank');
//    }
// });

// 	  function getCardValues() {
//                 let card = {};
//                 card.cardNumber = $('input[name="cardNumber"]').val();
//                 card.cardNumber = card.cardNumber.replaceAll("-", "");
//                 card.brand = $('select[name="cardFlag"]').val();
//                 card.cvv = $('input[name="cardCode"]').val();
//                 card.expiration = $('input[name="cardValidate"]').val();
//                 card.installments = $('select[name="installments"]').val();

//                 if (card.expiration) {
//                     let split = card.expiration.toString().split("/");
//                     card.expirationMonth = split[0];
//                     card.expirationYear = split[1];
//                 }

//                 return card;
// }


// Obrigado por ajudar @AbrahimPatrick alem disso, verifique a seção de implementação javascript da Wiki:

// https://github.com/artistas/laravel-pagseguro/wiki/1.1.-Implementa%C3%A7%C3%A3o-Javascript

// Eu linko o manual de integração do pagseguro neste lugar:
// http://download.uol.com.br/pagseguro/docs/pagseguro-checkout-transparente.pdf

// Neste manual, tem a seção Obter token do cartão de crédito na página 10, entre outras seções que podem ser úteis também, dependendo de como quiser fazer a sua tela de pagamento.