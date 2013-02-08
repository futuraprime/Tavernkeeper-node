mongoose = require 'mongoose'

tavern = new mongoose.Schema
    'rooms' : Number
    'heroes' : [
        _id: Number
    ]
    'room_limit' : Number

Tavern = module.exports = mongoose.model 'Tavern', tavern
