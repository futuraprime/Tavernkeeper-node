mongoose = require 'mongoose'
conn = mongoose.connect('mongodb://localhost/tavernkeeper_test') 

# Clear the test database for next time
after ->
  conn.connection.db.dropDatabase

#assert = require("chai").assert
#expect = require("chai").expect

#request = require "request"
#
#class Requester
#  get: (path, callback) ->
#    request "http://localhost:13339#{path}", callback
#
#  post: (path, body, callback) ->
#    request.post {url: "http://localhost:13339#{path}", body: body}, callback
#
#exports.withServer = (callback) ->
#  asyncSpecWait()
#
#  {app} = require "../lib/app.coffee"
#
#  stopServer = ->
#    app.close()
#    asyncSpecDone()
#
#  app.listen 13339
#
#  callback new Requester, stopServer