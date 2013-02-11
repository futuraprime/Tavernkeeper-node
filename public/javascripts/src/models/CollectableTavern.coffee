define [
    'backbone'
], (
    Backbone
) ->
    class CollectableTavern extends Backbone.RelationalModel
        idAttribute: '_id'
