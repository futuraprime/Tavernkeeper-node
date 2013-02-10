mongoose = require 'mongoose'

tavern = new mongoose.Schema
    'name' : String
    '_rooms' : [
        _id: Number
    ]
    '_heroes' : [
        _id: Number
    ]
    'room_limit' : Number

Tavern = module.exports = mongoose.model 'Tavern', tavern
