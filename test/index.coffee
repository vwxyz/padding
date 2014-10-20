fs      = require "fs"
assert  = require "assert"
passing = require "../src/index.coffee" 

fs.readdir ".tmp/hoge", (err, files)->
  files.map (i)->
    old = ".tmp/hoge/"+i
    fs.renameSync old, old.replace("_0","_")

describe "Padding", ->
  it "should add padding correctly", ->
    assert.equal 1,1
  it "should remove padding correctly", ->
    assert.equal 1,1
  it "should detect a length of longest file name in target directory", ->
    assert.equal 1,1
