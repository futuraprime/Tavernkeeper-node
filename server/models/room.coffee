mongoose = require 'mongoose'

# VERY BAD!
mongoose.Document.prototype._old_registerHooks = mongoose.Document.prototype._registerHooks
mongoose.Document.prototype._registerHooks = ->
  result = this._old_registerHooks()
  this.schema.after_load(this) if this.schema.after_load
  return result

room_types = require '../room-types'
_ = require 'underscore'

room = new mongoose.Schema
    'name' : String
    'type' : String

# Should install room_type data when loaded
# from database.
room.post('init', ->
  _.extend(this,room_types[this.type]))

# pre/post init callback only called when loading
# a document from the database; this is called
# when a new document is constructed
room.after_load = (r) -> 
  _.extend(r,room_types[r.type])

Room = module.exports = mongoose.model 'Room', room
Room.room_types = room_types