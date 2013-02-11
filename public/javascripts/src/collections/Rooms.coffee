define [
    'backbone'
    'models/Room'
], (
    Backbone
    Room
) ->
    class Rooms extends Backbone.Collection
        model: Room
        url : '/api/rooms/'
