fs      = require "fs"
mlcs    = require "mlcs"

module.exports.add = (dirPath, cb)->
  minLength = 0
  maxLength = 0
  prefix    = ""
  width     = ""

  fs.readdir dirPath, (err, files)->
    if err then console.log err

    # filter out: dotfiles ex. .DS_Store
    files = files.filter (i)-> return (i[0] isnt ".")

    # get all suffixes
    suffixes = {}
    files.forEach (i)-> 
      suffix = i.split(".").pop()
      if  !(suffixes.hasOwnProperty suffix)
        suffixes["#{suffix}"] = 0
      else 
        suffixes["#{suffix}"] += 1

    # detect commonSuffix
    commonSuffix = {name:"none",counter:0}

    for name,counter of suffixes
      if counter > commonSuffix.counter
        commonSuffix.name = name
        commonSuffix.counter = counter

    # filter out: the file without common suffix
    files = files.filter (i)-> return  (i.search commonSuffix.name) isnt -1

    # detect longest common sequence and save as prefix
    prefix = mlcs files
    prefix = ""  if prefix is "."+ commonSuffix.name # filter out case like prefix = "jpg","txt"

    # detect max/min length of files
    files.forEach (i)->
      width = i.length
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

    # rename file with padding
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
