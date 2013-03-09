assert = require("chai").assert
expect = require("chai").expect
helper = require '../../spec-helper'
Room = require '../../../server/models/room'

describe 'Room', ->
  it "can instantiate a room", ->
    room = new Room(name: "foo", type: "test_room_type_1")
    assert.equal('foo',room.name)
    
  it "can fold in properties from room type definition", ->
    Room.room_types.test_room_type_2 = { test_property: "test" }
    room = new Room(name: "foo", type: "test_room_type_2")
    assert.equal("test",room.test_property)
  
  it "can fold in properties when loading from database", (done) ->
    Room.room_types.test_room_3 = { test_property: "foo" }
    room = new Room(name: "bar", type: "test_room_3")
    room.save((err) ->
      Room.findById(room._id, (err,doc) ->
        assert.equal("foo",doc.test_property)
        done()
      )  
    )