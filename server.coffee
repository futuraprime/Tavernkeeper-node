express = require 'express'
http = require 'http'
path = require 'path'
stylus = require 'stylus'
nib = require 'nib'
Database = require './server/database'

Tavern = require './models/tavern'
Quest = require './models/quest'
Hero = require './models/hero'
Room = require './models/room'

class Server
    stylusCompiled = (str, path) ->
        stylus(str).set('filename', path).set('compress', true).use(nib())

    constructor: ->
        @app = app = express()

        app.configure ->
            app.set 'port', 13337
            app.set 'views', "#{__dirname}/server/views"
            app.set 'view engine', 'jade'

            app.use express.bodyParser()
            app.use express.methodOverride()
            app.use app.router 
            app.use stylus.middleware
                src: "#{__dirname}/public"
                compile: stylusCompiled
            app.use express.static path.join __dirname, 'public'

        app.configure 'development', ->
            app.use express.logger 'dev'
            app.use express.errorHandler()

        @database = new Database()

        @setupRoutes()

    setupRoutes : ->
        @app.get '/', (req, res) ->
            res.render 'index'

    start : ->
        @server = http.createServer(@app).listen @app.get('port'), =>
            console.log "Express server listening on port #{@app.get 'port'}"

    stop : ->
        @server.close()

server = module.exports = new Server

if require.main is module
    server.start()
