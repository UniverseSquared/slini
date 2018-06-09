# SLINI

A small and simple INI parser made for lua and [LÖVE](https://love2d.org) projects.

# Usage

To use slini, require it in your project:
```lua
local slini = require("slini")
...
data = slini.load("test.ini")
```

There are a few functions that you can use:

* `slini.parse(data)` - Parses ini data from a string
* `slini.load(filePath)` - Loads ini data from a file
* `slini.serialize(data)` - Serializes parsed ini data to a string
* `slini.save(filePath)` - Saves parsed ini data to a file

# Example

To parse an ini file, named `test.ini` with the contents:
```ini
[options]
port=1234
ip=192.168.1.1
```

You would use the following code:
```lua
local slini = require("slini")

data = slini.load("test.ini")
```

`data` would be a table with the contents:
```lua
{
	options = {
		port = 1234,
		ip = "192.168.1.1"
	}
}
```
