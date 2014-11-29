#= require bootstrap-dropdown
#= require jquery.easing.1.3.min
#= require jquery.validate.min
#= require jquery.form
#= require jquery.maskedinput-1.3.min
#= require css3-mediaqueries
#= require royal-slider-8.1.min

$ ->

    # Ativa item do menu referente à página atual
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


    $("#home-slider").royalSlider
        slideshowAutoStart: true
        slideshowEnabled: true
        slideshowPauseOnHover: true
        slideshowDelay: 5000
        slideTransitionSpeed: 1500
        slideTransitionEasing: "easeInOutSine"
        afterSlideChange: ->
            currentSlide = this.currentSlideId
            legenda = $(".legenda-home")
            if currentSlide is 0
                legenda.addClass("legenda-quadro")
                legenda.find(".texto-legenda").text("")
            else
                legenda.removeClass("legenda-quadro")
                texto_legenda = $(".royalSlide").eq(currentSlide).attr("data-legenda-texto")
                $(".legenda-home .texto-legenda").text(texto_legenda)


    $("#mySlider").royalSlider
      slideTransitionSpeed: 1500
      slideTransitionEasing: "easeInOutSine"

    $("#historico-slider").royalSlider
      slideTransitionSpeed: 1500
      slideTransitionEasing: "easeInOutSine"


    # jQuery.validator.addMethod( "telefone", ( (value, element) -> @optional(element) || /.+{10,15}/.test(value) ), "Please specify the correct domain for your documents" )

    $("#ss-form input[name='entry.1000004']").mask( "(99) 9999-9999" )

    $("#ss-form").validate {
        rules: {
            "entry.1000000": { required: true }                # Nome
            "entry.1000001": { required: true, email: true }   # Email
            "entry.1000003": {  }                              # Telefone
            "entry.1000002": { required: true }                # Pedido
        }
        messages: {
            "entry.1000000": "Informe seu nome"
            "entry.1000001": "Informe seu email"
            "entry.1000003": { required: "Informe seu email", telefone: "Incorreto" }
            "entry.1000002": { required: "Informe seu pedido" }
        }
        # submitHandler: ->
        # $(event.target).ajaxSubmit()
    }

    $("#ss-form input[type='submit']").click ->
        if $("#ss-form").valid()
            $("#conteudo-esquerda-pedido, #conteudo-direita-pedido").fadeOut 200, ->
                $("#confirmacao-pedido").fadeIn(200)


