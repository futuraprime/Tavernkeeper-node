mongoose = require 'mongoose'
Room = './room'
Hero = './hero'

tavern = new mongoose.Schema
    'name' : String
    '_rooms' : [
        type: mongoose.Schema.Types.ObjectId
        ref: 'Room'
    ]
    '_heroes' : [
        type : mongoose.Schema.Types.ObjectId
        ref : 'Hero'
    ]
    'room_limit' : Number

Tavern = module.exports = mongoose.model 'Tavern', tavern
