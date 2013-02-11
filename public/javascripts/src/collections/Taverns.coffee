define [
    'backbone'
    'models/CollectableTavern'
], (
    Backbone
    Tavern
) ->
    class Taverns extends Backbone.Collection
        model : Tavern
        url : '/api/tavern'
