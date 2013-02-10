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
    class App
        constructor : ->
            console.log 'starting app'

            @intro = new IntroView

            $ @startup

        startup : =>
            console.log 'starting up'
            @intro.render()

