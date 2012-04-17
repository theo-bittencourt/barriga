#= require bootstrap-dropdown

$ ->
    $("#mySlider").royalSlider ->
        directionNavAutoHide: true
    
    $("#historico-slider").royalSlider ->
        directionNavAutoHide: true
    
    
    # jQuery.validator.addMethod( "telefone", ( (value, element) -> @optional(element) || /.+{10,15}/.test(value) ), "Please specify the correct domain for your documents" )
    $("#ss-form input[name='entry.3.single']").mask( "(99) 9999-9999" )
        if $("#ss-form").valid()
            $("#conteudo-esquerda-pedido, #conteudo-direita-pedido").fadeOut 200, ->
                $("#confirmacao-contato").fadeIn(200)