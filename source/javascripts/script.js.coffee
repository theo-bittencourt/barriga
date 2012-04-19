#= require bootstrap-dropdown

$ ->
    
    current_url_path = window.location.pathname

    @active_current_menu_item = (element) ->
        $(".menu-item a").removeClass('active')
        element.parent('a').addClass("active")
    
    if /produtos/.exec(current_url_path)
        @active_current_menu_item($(".menu-item span:contains('produtos')"))
    if /pedidos/.exec(current_url_path)
        @active_current_menu_item($(".menu-item span:contains('pedidos')"))
    if /historico/.exec(current_url_path)
        @active_current_menu_item($(".menu-item span:contains('histórico')"))
    if /creditos/.exec(current_url_path)
        @active_current_menu_item($(".menu-item span:contains('créditos')"))
    
    
    
    $("#mySlider").royalSlider ->
        directionNavAutoHide: true
    
    $("#historico-slider").royalSlider ->
        directionNavAutoHide: true
    
    
    # jQuery.validator.addMethod( "telefone", ( (value, element) -> @optional(element) || /.+{10,15}/.test(value) ), "Please specify the correct domain for your documents" )
    
    $("#ss-form input[name='entry.3.single']").mask( "(99) 9999-9999" )
    
    $("#ss-form").validate {
        rules: { 
            "entry.0.single": { required: true }                # Nome
            "entry.1.single": { required: true, email: true }   # Email
            "entry.3.single": {  }                              # Telefone
            "entry.2.single": { required: true }                # Pedido
        }
        messages: {
            "entry.0.single": "Informe seu nome"
            "entry.1.single": "Informe seu email"
            "entry.3.single": { required: "Informe seu email", telefone: "Incorreto" }
            "entry.2.single": { required: "Informe seu pedido" }
        }
        # submitHandler: ->
        # $(event.target).ajaxSubmit()
    }
    
    $("#ss-form input[type='submit']").click -> 
        if $("#ss-form").valid()
            $("#conteudo-esquerda-pedido, #conteudo-direita-pedido").fadeOut 200, ->
                $("#confirmacao-pedido").fadeIn(200)

      