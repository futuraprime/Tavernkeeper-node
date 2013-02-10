mongoose = require 'mongoose'
Tavern = require './models/tavern'
Quest = require './models/quest'
Hero = require './models/hero'
Room = require './models/room'

database = module.exports = class Database    
    constructor: ->
        @connected = false

        mongoose.connect 'mongodb://localhost/tavernkeeper'
        @conn = mongoose.connection

        @conn.on 'error', console.error.bind console, 'connection error:'
        @conn.once 'open', =>
            @connected = true

            console.log 'connected to mongo'
