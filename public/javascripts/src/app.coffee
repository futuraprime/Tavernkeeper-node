define [
    'backbone'
    'jquery'
    'models/Tavern'
    'views/intro_view'
    'views/tavern_view'
], (
    Backbone
    $
    Tavern
    IntroView
    TavernView
) ->
    class App extends Backbone.Router
        routes :
            'tavern/:id' : 'show_tavern'
            '*path' : 'startup'

        constructor : ->
            super
            console.log 'starting app'

        _clearPriorView : =>
            @view?.remove()

        startup : =>
            @_clearPriorView()
            console.log 'starting views'
            @view = new IntroView

        show_tavern : (id) =>
            @_clearPriorView()
            tavern = new Tavern
                _id : id
            tavern.fetch
                success : =>
                    @view = new TavernView tavern
                    @view.render()
