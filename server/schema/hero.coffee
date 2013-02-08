mongoose = require 'mongoose'

hero = new mongoose.Schema
    'level' : Number
    'current_quest_id' : Number

Hero = module.exports = mongoose.model 'Hero', hero
