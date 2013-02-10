mongoose = require 'mongoose'

room = new mongoose.Schema
    'name' : String
    'type' : String
    'heroes_allowed' : Number

Room = module.exports = mongoose.model 'Room', room
