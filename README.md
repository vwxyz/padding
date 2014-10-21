padding
=======

zero padding for many files





##Install

```
npm install -g padding
```

##How to use

###as a cli tool

- Very easy to use
- move to target dir, and run `padding`.

```
cd /path/to/files // move to target directory
padding           // run command
```

###as a module


```
padding = require "padding"

padding.add "./lib/img", ->
	console.log "padding finished successfully"

```