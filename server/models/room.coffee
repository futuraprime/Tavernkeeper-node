mongoose = require 'mongoose'

room = new mongoose.Schema
    'type' : String
    'heroes_allowed' : Number

Room = module.exports = mongoose.model 'Room', room
