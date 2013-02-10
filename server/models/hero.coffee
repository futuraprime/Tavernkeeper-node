mongoose = require 'mongoose'
Quest = require './quest'

hero = new mongoose.Schema
    'name' : String
    'level' : Number
    '_quest' :
        type : mongoose.Schema.Types.ObjectId
        ref : 'Quest'

Hero = module.exports = mongoose.model 'Hero', hero
