-- Roblox Functions Library (Improved)
-- by Exunys (original) and Synx (improved)

-- Load the library
local library = {}

-- Error handling function
local function handleError(error)
    warn("Error in Roblox Functions Library: " .. tostring(error))
    return false
end

-- Loadstring function with error handling
local function loadstringWithErrors(code)
    local func, err = loadstring(code)
    if not func then
        handleError(err)
        return nil
    end
    return func
end

-- Load the library functions
library.load = function()
    local code = game:HttpGet("https://raw.githubusercontent.com/Exunys/Roblox-Functions-Library/main/Library.lua")
    if not code then
        handleError("Failed to load library code")
        return false
    end
    local func = loadstringWithErrors(code)
    if not func then
        return false
    end
    func()
    return true
end

-- Improved rejoin function with error handling
library.rejoin = function()
    local success, error = pcall(function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

-- Improved set mouse icon visibility function with error handling
library.setMouseIconVisibility = function(visible)
    local success, error = pcall(function()
        game:GetService("Players").LocalPlayer.PlayerGui:SetTopbarTransparency(visible and 0 or 1)
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

-- Get player by name function
library.getPlayerByName = function(name)
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name:lower() == name:lower() then
            return player
        end
    end
    return nil
end

-- Get character by player function
library.getCharacterByPlayer = function(player)
    return player.Character
end

-- Get humanoid by character function
library.getHumanoidByCharacter = function(character)
    return character:FindFirstChild("Humanoid")
end

-- Check if player is alive function
library.isPlayerAlive = function(player)
    local character = library.getCharacterByPlayer(player)
    if not character then
        return false
    end
    local humanoid = library.getHumanoidByCharacter(character)
    if not humanoid then
        return false
    end
    return humanoid.Health > 0
end

-- Check if player is dead function
library.isPlayerDead = function(player)
    return not library.isPlayerAlive(player)
end

-- Get player's team function
library.getPlayerTeam = function(player)
    return player.Team
end

-- Check if player is on a specific team function
library.isPlayerOnTeam = function(player, team)
    return library.getPlayerTeam(player) == team
end

-- Get player's rank in group function
library.getPlayerRankInGroup = function(player, groupId)
    local groupService = game:GetService("GroupService")
    local groupInfo = groupService:GetGroupInfoAsync(groupId)
    for _, member in pairs(groupInfo.Members) do
        if member.UserId == player.UserId then
            return member.Rank
        end
    end
    return nil
end

-- Check if player has a specific rank in group function
library.playerHasRankInGroup = function(player, groupId, rank)
    return library.getPlayerRankInGroup(player, groupId) == rank
end

-- Get player's role in group function
library.getPlayerRoleInGroup = function(player, groupId)
    local groupService = game:GetService("GroupService")
    local groupInfo = groupService:GetGroupInfoAsync(groupId)
    for _, member in pairs(groupInfo.Members) do
        if member.UserId == player.UserId then
            return member.Role
        end
    end
    return nil
end

-- Check if player has a specific role in group function
library.playerHasRoleInGroup = function(player, groupId, role)
    return library.getPlayerRoleInGroup(player, groupId) == role
end

-- Get all players in a specific team function
library.getPlayersInTeam = function(team)
    local players = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.isPlayerOnTeam(player, team) then
            table.insert(players, player)
        end
    end
    return players
end

-- Get all players in a specific group function
library.getPlayersInGroup = function(groupId)
    local players = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.getPlayerRankInGroup(player, groupId) then
            table.insert(players, player)
        end
    end
    return players
end

-- Get all players with a specific rank in a group function
library.getPlayersWithRankInGroup = function(groupId, rank)
    local players = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.playerHasRankInGroup(player, groupId, rank) then
            table.insert(players, player)
        end
    end
    return players
end

-- Get all players with a specific role in a group function
library.getPlayersWithRoleInGroup = function(groupId, role)
    local players = {}
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.playerHasRoleInGroup(player, groupId, role) then
            table.insert(players, player)
        end
    end
    return players
end

-- Get the number of players in a specific team function
library.getNumPlayersInTeam = function(team)
    local count = 0
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.isPlayerOnTeam(player, team) then
            count = count + 1
        end
    end
    return count
end

-- Get the number of players in a specific group function
library.getNumPlayersInGroup = function(groupId)
    local count = 0
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.getPlayerRankInGroup(player, groupId) then
            count = count + 1
        end
    end
    return count
end

-- Get the number of players with a specific rank in a group function
library.getNumPlayersWithRankInGroup = function(groupId, rank)
    local count = 0
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.playerHasRankInGroup(player, groupId, rank) then
            count = count + 1
        end
    end
    return count
end

-- Get the number of players with a specific role in a group function
library.getNumPlayersWithRoleInGroup = function(groupId, role)
    local count = 0
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if library.playerHasRoleInGroup(player, groupId, role) then
            count = count + 1
        end
    end
    return count
end

-- UNC Functions

-- Drawing
library.drawing = {}
library.drawing.new = function()
    local drawing = Drawing.new("Line")
    return drawing
end

-- WebSocket
library.websocket = {}
library.websocket.connect = function(url)
    local websocket = WebSocket.connect(url)
    return websocket
end

-- Cache
library.cache = {}
library.cache.get = function(key)
    local cache = game:GetService("HttpService"):JSONDecode(game:GetService("HttpService"):GetAsync("https://api.roblox.com/cache/" .. key))
    return cache
end

library.cache.set = function(key, value)
    local success, error = pcall(function()
        game:GetService("HttpService"):PostAsync("https://api.roblox.com/cache/" .. key, game:GetService("HttpService"):JSONEncode(value))
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

-- Closures
library.closures = {}
library.closures.new = function(func)
    local closure = closure.new(func)
    return closure
end

-- Console
library.console = {}
library.console.print = function(message)
    print(message)
end

library.console.warn = function(message)
    warn(message)
end

library.console.error = function(message)
    error(message)
end

-- Crypt
library.crypt = {}
library.crypt.sha256 = function(str)
    local hash = game:GetService("HttpService"):SHA256(str)
    return hash
end

-- Debug
library.debug = {}
library.debug.print = function(message)
    print(message)
end

library.debug.warn = function(message)
    warn(message)
end

library.debug.error = function(message)
    error(message)
end

-- Filesystem
library.filesystem = {}
library.filesystem.read = function(path)
    local file = game:GetService("HttpService"):GetAsync("https://api.roblox.com/filesystem/" .. path)
    return file
end

-- Filesystem
library.filesystem = {}
library.filesystem.read = function(path)
    local file = game:GetService("HttpService"):GetAsync("https://api.roblox.com/filesystem/".. path)
    return file
end

library.filesystem.write = function(path, content)
    local success, error = pcall(function()
        game:GetService("HttpService"):PostAsync("https://api.roblox.com/filesystem/".. path, game:GetService("HttpService"):JSONEncode(content))
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

-- Input
library.input = {}
library.input.getMousePosition = function()
    return game:GetService("UserInputService"):GetMouseLocation()
end

library.input.getKeyboardInput = function()
    return game:GetService("UserInputService"):GetKeyboardInput()
end

-- Instances
library.instances = {}
library.instances.new = function(instanceType)
    local instance = Instance.new(instanceType)
    return instance
end

-- Metatable
library.metatable = {}
library.metatable.new = function(metatable)
    local mt = metatable.new(metatable)
    return mt
end

-- Misc
library.misc = {}
library.misc.delay = function(time)
    wait(time)
end

library.misc.random = function(min, max)
    return math.random(min, max)
end

-- Scripts
library.scripts = {}
library.scripts.load = function(script)
    local success, error = pcall(function()
        script:Load()
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

library.scripts.unload = function(script)
    local success, error = pcall(function()
        script:Unload()
    end)
    if not success then
        handleError(error)
        return false
    end
    return true
end

-- Return the library
return library
