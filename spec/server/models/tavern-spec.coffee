assert = require("chai").assert
expect = require("chai").expect
helper = require '../../spec-helper'
Tavern = require '../../../server/models/tavern'
Room = Tavern.Room

describe "Tavern", ->
  it "calculates hero limit from room limit", (done) ->
    Room.room_types.test_1 = { heroes_allowed: 1 }
    Room.room_types.test_2 = { heroes_allowed: 3 }
    
    room1 = new Room(name: "room1", type: "test_1")
    room2 = new Room(name: "room2", type: "test_1")
    room3 = new Room(name: "room3", type: "test_2")
    
    room1.save((err) ->
      room2.save((err) ->
        room3.save((err) ->
          tavern = new Tavern(name: "bar", rooms: [room1._id,room2._id,room3._id])
          tavern.save((err) ->
            Tavern.findById(tavern._id).populate('rooms').exec((err,t) ->
              assert.equal(5,t.heroes_allowed())
              done())))))
