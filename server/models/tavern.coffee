mongoose = require 'mongoose'
Room = require './room'
Hero = require './hero'

tavern = new mongoose.Schema
    'name' : String
    'rooms' : [
        type: mongoose.Schema.Types.ObjectId
        ref: 'Room'
    ]
    'heroes' : [
        type : mongoose.Schema.Types.ObjectId
        ref : 'Hero'
    ]
    'room_limit' : Number

tavern.methods.heroes_allowed = ->
  this.rooms.reduce(((acc,room) -> acc + room.heroes_allowed),0)

# need to figure out how to best calculate hero_limit

Tavern = module.exports = mongoose.model 'Tavern', tavern
Tavern.Room = Room
