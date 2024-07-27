# Roblox Functions Library
===========================

## Introduction
---------------

The Roblox Functions Library is a comprehensive collection of functions and utilities designed to simplify and enhance the development of Roblox games and scripts. This library provides a wide range of features and tools to help developers create more efficient, scalable, and maintainable code.

## Functions
-------------

### Player Functions

* `getPlayerRankInGroup(player, groupId)`: Returns the rank of a player in a specific group.
* `playerHasRankInGroup(player, groupId, rank)`: Checks if a player has a specific rank in a group.
* `playerHasRoleInGroup(player, groupId, role)`: Checks if a player has a specific role in a group.
* `getPlayersInGroup(groupId)`: Returns a list of players in a specific group.
* `getPlayersWithRankInGroup(groupId, rank)`: Returns a list of players with a specific rank in a group.
* `getPlayersWithRoleInGroup(groupId, role)`: Returns a list of players with a specific role in a group.
* `getNumPlayersInGroup(groupId)`: Returns the number of players in a specific group.
* `getNumPlayersWithRankInGroup(groupId, rank)`: Returns the number of players with a specific rank in a group.
* `getNumPlayersWithRoleInGroup(groupId, role)`: Returns the number of players with a specific role in a group.

### Team Functions

* `isPlayerOnTeam(player, team)`: Checks if a player is on a specific team.
* `getNumPlayersInTeam(team)`: Returns the number of players on a specific team.

### UNC Functions

### Drawing

* `drawing.new()`: Creates a new drawing object.

### WebSocket

* `websocket.connect(url)`: Connects to a WebSocket server at the specified URL.

### Cache

* `cache.get(key)`: Retrieves a value from the cache.
* `cache.set(key, value)`: Sets a value in the cache.

### Closures

* `closures.new(func)`: Creates a new closure.

### Console

* `console.print(message)`: Prints a message to the console.
* `console.warn(message)`: Prints a warning message to the console.
* `console.error(message)`: Prints an error message to the console.

### Crypt

* `crypt.sha256(str)`: Computes the SHA-256 hash of a string.

### Debug

* `debug.print(message)`: Prints a message to the debug console.
* `debug.warn(message)`: Prints a warning message to the debug console.
* `debug.error(message)`: Prints an error message to the debug console.

### Filesystem

* `filesystem.read(path)`: Reads a file from the filesystem.
* `filesystem.write(path, content)`: Writes a file to the filesystem.

### Input

* `input.getMousePosition()`: Returns the current mouse position.
* `input.getKeyboardInput()`: Returns the current keyboard input.

### Instances

* `instances.new(instanceType)`: Creates a new instance of the specified type.

### Metatable

* `metatable.new(metatable)`: Creates a new metatable.

### Misc

* `misc.delay(time)`: Delays execution for a specified amount of time.
* `misc.random(min, max)`: Returns a random number between the specified minimum and maximum values.

### Scripts

* `scripts.load(script)`: Loads a script.
* `scripts.unload(script)`: Unloads a script.

## Usage
-----

To use the Roblox Functions Library, simply require the script in your Roblox game or script:
```lua
local library = require(script.RobloxFunctionsLibrary)
local player = game.Players.LocalPlayer
local groupId = 123456
local rank = library.getPlayerRankInGroup(player, groupId)
print(rank)
```
