mongoose = require 'mongoose'
Room = './room'
Hero = './hero'

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

# need to figure out how to best calculate hero_limit

Tavern = module.exports = mongoose.model 'Tavern', tavern
