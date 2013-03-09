mongoose = require 'mongoose'

# VERY BAD!
old_registerHooks = mongoose.Document.prototype._registerHooks
mongoose.Document.prototype._registerHooks = ->
  result = old_registerHooks()
  this.schema.after_load(this) if this.schema.after_load
  return result

room_types = require '../room-types'
_ = require 'underscore'

room_types['test_room_type_2'] = {
  max_heroes: 2,
  test_property: "test"
}

room = new mongoose.Schema
    'name' : String
    'type' : String
    'heroes_allowed' : Number

# pre/post callback onlyt calls when loading
# a document from the database; this is called
# when a new document is constructed
room.after_load = (r) -> 
  _.extend(r,room_types[r.type])

Room = module.exports = mongoose.model 'Room', room
Room.room_types = room_types
