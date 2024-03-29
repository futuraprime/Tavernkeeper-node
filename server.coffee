express = require 'express'
http = require 'http'
path = require 'path'
stylus = require 'stylus'
nib = require 'nib'
Database = require './server/database'

Tavern = require './server/models/tavern'
Quest = require './server/models/quest'
Hero = require './server/models/hero'
Room = require './server/models/room'

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

        # taverns!
        @app.get '/api/tavern', (req, res) ->
            Tavern.find (err, taverns) ->
                res.send taverns

        @app.get '/api/tavern/:id', (req, res) ->
            Tavern.findById(req.params.id)
            .populate('heroes')
            .populate('rooms')
            .exec (err, tavern) ->
                console.log 'got tavern #{tavern.name}' unless err
                res.send tavern

        @app.post '/api/tavern', (req, res) ->
            tavern = new Tavern(name: req.body.name)
            tavern.save (err) ->
                console.log 'new tavern created' unless err
            res.send tavern

        @app.put '/api/tavern/:id', (req, res) ->
            Tavern.findById req.params.id, (err, tavern) ->
                tavern.name = req.body.name
                tavern.heroes = req.body.heroes
                tavern.rooms = req.body.rooms
                tavern.save (err) ->
                    console.log 'updated tavern #{tavern.name}' unless err

        @app.delete '/api/tavern/:id', (req, res) ->
            Tavern.findById req.params.id, (err, tavern) ->
                tavern.remove (err) ->
                    console.log 'removed tavern' unless (err)

        # heroes
        @app.get '/api/hero', (req, res) ->
            Hero.find (err, heroes) ->
                res.send heroes

        @app.get '/api/room', (req, res) ->
            Room.find (err, rooms) ->
                res.send rooms

        @app.get '/api/quest', (req, res) ->
            Quest.find (err, quests) ->
                res.send quests

    start : ->
        @server = http.createServer(@app).listen @app.get('port'), =>
            console.log "Express server listening on port #{@app.get 'port'}"

    stop : ->
        @server.close()

server = module.exports = new Server

if require.main is module
    server.start()
