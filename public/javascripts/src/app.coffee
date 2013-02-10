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
    class App extends Backbone.Router
        constructor : ->
            super
            console.log 'starting app'

            $ @startup

        startup : =>
            console.log 'starting views'
            @intro = new IntroView


