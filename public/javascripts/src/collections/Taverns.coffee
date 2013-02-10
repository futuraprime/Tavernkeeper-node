define [
    'backbone'
    'models/Tavern'
], (
    Backbone
    Tavern
) ->
    class Taverns extends Backbone.Collection
        model : Tavern
        url : '/api/tavern'
