define [
    'backbone'
    'models/Room'
    'collections/Rooms'
], (
    Backbone
    Room
    Rooms
) ->
    class Tavern extends Backbone.RelationalModel
        idAttribute: '_id'
        urlRoot : '/api/tavern'
        relations : [
            type : Backbone.HasMany
            key : 'rooms'
            relatedModel : Room
            collectionType : Rooms
            includeInJSON : true
        ]

    Tavern.setup()
