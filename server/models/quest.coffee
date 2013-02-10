mongoose = require 'mongoose'

quest = new mongoose.Schema
    'name' : String
    'progress' : Number         # 0 to 100

Quest = module.exports = mongoose.model('Quest', quest)
