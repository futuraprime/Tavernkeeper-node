define [
    'backbone'
    'views/base_view'
    'jquery'
    'views/intro_view'
], (
    Backbone
    BaseView
    $
    IntroView
) ->
    class App extends BaseView
        constructor : ->
            super
            console.log 'starting app'

            @intro = new IntroView

            $ =>
                @render()

        render : ->
            $('body').empty().append(@el)
            @el.appendChild @intro.render()
