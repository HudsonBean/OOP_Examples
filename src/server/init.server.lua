--//Services
local players = game:GetService("Players")

--//Modules
local playerHandler = require(game.ReplicatedStorage.Shared.PlayerHandler)

--//Variables

--//Functions
local function playerAdded(player)
    --[[
    This will run every single time a player joins the server.
    It will give the player that just joined or you may know it as the "LocalPlayer"
    Let's create whats known as an "abstract" player object
    It is abstract because it is not in our roblox "explorer" in studio
    but instead its in tables and code
    ]]
    local playerObject = playerHandler.new(player) -- This will return our player object
    playerObject:takeDamage(10) -- We have now dealt 10 damage to our player object
	-- Lets print our health
	print(playerObject.health)
    -- The result should be 90
    -- This is just a little bit you can do with classes and objects there will be lots of cool tutorials online to learn more
    -- Here are some I reccomend:
    --[[
        https://devforum.roblox.com/t/all-about-object-oriented-programming/8585
        https://www.youtube.com/watch?v=2TC-bx0YfGk&ab_channel=BRicey
        https://www.youtube.com/watch?v=UHACUEOepZQ&ab_channel=okeanskiy
    ]]
end

--//Connections
players.PlayerAdded:Connect(playerAdded)

--//Main