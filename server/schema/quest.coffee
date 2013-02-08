mongoose = require 'mongoose'

quest = new mongoose.Schema
    'progress' : Number         # 0 to 100

Quest = module.exports = mongoose.model('Quest', quest)
