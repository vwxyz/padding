fs      = require "fs"

module.exports.add = (dirPath, cb)->
  minLength = 0
  maxLength = 0
  prefix    = ""
  width     = ""

  fs.readdir dirPath, (err, files)->
    if err then console.log err
    # make dotfiles not-supported explicitly
    files = files.filter (i)->
      return (i[0] isnt ".")
    files.forEach (i)->
      width = i.length
      prefix = i.split(/[0-9]/)[0]

      #detect in minLength

      if minLength is 0
        minLength = width 
      else
        if minLength > width
          minLength = width
      if maxLength is 0
        maxLength = width
      else
        if maxLength < width
          maxLength = width
    files.map (i)->
      oldPath = "#{dirPath}/#{i}"
      padding = ""
      width   = i.length
      diff  = maxLength - width
      args    = []
      while diff > 0
        padding += "0"
        diff--
      # in case like 1.jpg, 111.jpg, 23.jpg, etc..
      if prefix.length is 0
        args.push i
        args.push padding+i
      # in case like file1.jpg, file111.jpg, file23.jpg, etc..
      else
        args.push prefix
        args.push prefix+padding
      fs.renameSync(
        oldPath
        oldPath.replace args[0], args[1]
      )
    cb()

module.exports.remove = (dirPath)->
  console.log "padding.remove"
