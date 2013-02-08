mongoose = require 'mongoose'
Tavern = require './schema/tavern'
Quest = require './schema/quest'
Hero = require './schema/hero'
Room = require './schema/room'

database = module.exports = class Database    
    constructor: ->
        @connected = false

        mongoose.connect 'mongodb://localhost/tavernkeeper'
        @conn = mongoose.connection

        @conn.on 'error', console.error.bind console, 'connection error:'
        @conn.once 'open', =>
            @connected = true

            console.log 'connected to mongo'
