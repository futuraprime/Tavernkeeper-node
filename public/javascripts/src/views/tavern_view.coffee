define [
    'backbone'
    'models/Room'
    'collections/Rooms'
    'views/base_view'
    'jade!tmpl/tavern'
], (
    Backbone
    Room
    Rooms
    BaseView
    template
) ->
    class TavernView extends BaseView
        events : 
            'click .create-room' : 'createRoom'

        constructor : (@model) ->
            super
            @listenTo @model, 'change', @render
            @model.fetch()

        render : =>
            @$el.html template @model.toJSON()
            document.body.appendChild @el

        createRoom : =>
            room = Rooms.create
                name : "ROOOOM"
                type : "Roomy Room"
                heroes_allowed : 2
            room.save()
