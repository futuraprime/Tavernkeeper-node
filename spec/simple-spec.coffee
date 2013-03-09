#assert = require "assert"
assert = require("chai").assert
expect = require("chai").expect

helper = require './spec-helper'

describe 'Test', ->
  it 'can add', ->
    expect(1+1).to.equal(2)
    assert.equal(1+1,2)

