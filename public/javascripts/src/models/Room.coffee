define [
    'backbone'
], (
    Backbone
) -> 
    class Room extends Backbone.RelationalModel
        idAttribute : '_id'

    Room.setup()
