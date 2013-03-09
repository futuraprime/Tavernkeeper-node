assert = require("chai").assert
expect = require("chai").expect
helper = require '../../spec-helper'
Room = require '../../../server/models/room'

Room.room_types.test_room_type_1 = {
  heroes_allowed: 2
}

describe 'Room', ->
  it "can instantiate a room", ->
    room = new Room(name: "foo", type: "test_room_type_1")
    assert.equal('foo',room.name)
    
  it "can fold in properties from room type definition", ->
    Room.room_types.test_room_type_2 = {
      heroes_allowed: 2,
      test_property: "test"
    }
    room = new Room(name: "foo", type: "test_room_type_2")
    assert.equal("test",room.test_property)