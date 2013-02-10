define [
    'backbone'
], (
    Backbone
) ->
    class Tavern extends Backbone.Model
        url : '/api/tavern'
