define [
    'backbone'
], (
    Backbone
) ->
    class Tavern extends Backbone.Model
        idAttribute: '_id'
        url : '/api/tavern'
