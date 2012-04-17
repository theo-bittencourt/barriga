$ ->
  $("#mySlider").royalSlider ->
    directionNavAutoHide: true
  
  $("#historico-slider").royalSlider ->
    directionNavAutoHide: true    $("#ss-form input[type='submit']").click -> 
        if $("#ss-form").valid()
            $("#conteudo-esquerda-pedido, #conteudo-direita-pedido").fadeOut 200, ->
                $("#confirmacao-contato").fadeIn(200)