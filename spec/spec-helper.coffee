assert = require "assert"
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