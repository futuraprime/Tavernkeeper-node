define [
    'backbone'
], (
    Backbone
) ->
    class Tavern extends Backbone.Model
        idAttribute: '_id'
        urlRoot : '/api/tavern'
