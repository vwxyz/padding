fs      = require "fs"
path    = require "path"
assert  = require "assert"
touch   = require "touch"
mkdirp  = require "mkdirp"
padding = require "../src/index.coffee"



describe "Padding", ->
  tempDir = "#{__dirname}/.tmp"
  describe '#add(dir,callback)', ->
    it "should add padding correctly in files which have a prefix like 'sample1.jpg', 'sample11.jpg',...", ->
      arr = ["sample1.jpg", "sample11.jpg", "sample120.jpg", "sample4000.jpg"]
      arr.forEach (i)->
        touch "#{tempDir}/#{i}"
      padding.add tempDir,->
        fs.readdir tempDir, (err,files)->
          assert.deepEqual(
            files
            [ 'sample0001.jpg','sample0011.jpg','sample0120.jpg','sample4000.jpg' ]
          ) 
    it 'should add padding correctly in files without any prefixes: 1.jpg, 10.jpg, 200.jpg', ->
      arr = ["1.jpg", "11.jpg", "120.jpg", "4000.jpg"]
      arr.forEach (i)->
        touch "#{tempDir}/#{i}"
      padding.add tempDir,->
        fs.readdir tempDir, (err,files)->
          assert.deepEqual(
            files
            [ '0001.jpg','0011.jpg','0120.jpg','4000.jpg' ]
          ) 

      
  afterEach (done)->
    fs.readdir tempDir, (err,files)->
      files.forEach (i)->
        console.log "removing #{i}"
        fs.unlink path.join(tempDir,i), (err)->
          if err
            console.log err
      done()
  after ->
    #console.log "after:"
    fs.readdir tempDir, (err,files)->
      console.log err if err


