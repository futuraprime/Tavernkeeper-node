assert = require("chai").assert
expect = require("chai").expect
helper = require '../../spec-helper'
Tavern = require '../../../server/models/tavern'

Room = require "../../../server/models/room"

describe "Tavern", ->
  it.skip "calculates hero limit from room limit", ->
    
    tavern = new Tavern(name: "foo")
    
    
#  it.skip "can add a room", ->
#    
#    
#    name: foo
#    rooms: [
#      {type: kitchen},
#      {type: bedroom}
#      ]
#      
#      rooms.