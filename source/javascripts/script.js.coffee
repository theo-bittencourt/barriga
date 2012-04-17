#= require bootstrap-dropdown

$ ->
    $("#mySlider").royalSlider ->
        directionNavAutoHide: true
    
    $("#historico-slider").royalSlider ->
        directionNavAutoHide: true
    
    
        if $("#ss-form").valid()
            $("#conteudo-esquerda-pedido, #conteudo-direita-pedido").fadeOut 200, ->
                $("#confirmacao-contato").fadeIn(200)