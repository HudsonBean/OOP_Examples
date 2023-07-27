--//Services

--//Modules

--//Variables
-- We will store all our player objects in this folder indexed by the player
local playerObjects = { }

--//Functions

--//Connections

--//Main

-- TO LEARN MORE ABOUT OOP THIS POST IS THE BEST https://devforum.roblox.com/t/all-about-object-oriented-programming/8585

local PlayerHandler = { }
-- You will learn about this when you start learning oop its interesting
-- the ".__index" is known as a "metatable" they perform special functions on tables
PlayerHandler.__index = PlayerHandler

function PlayerHandler.new(player: Player)
    -- Creates a new abstract player object
    local data = { }
    setmetatable(data, PlayerHandler)

    -- Again you will learn about setmetatable and what that table does in the post
    -- The data table will house our variables and functions for our player object

    -- This refers to the player object we passed in
    -- The "_" before the variable name just means that this is a "hidden" property
    -- It shouldnt be used outside of this script
    data._playerObject = player
    data.name = player.Name
    data.character = player.Character or player.CharacterAdded:Wait()
    data.health = 100 -- This is a custom property dont get it confused with the Humanoid.Health
    data.mana = 100 -- This is one of the many reasons objects are cool we can define custom properties

    -- Add our new player object to our player objects table
    -- Notice the "[player]" that means whenever we pass in the actual player object it will return our data
    playerObjects[player] = data

    return data
end

-- Now we will create some custom functions for each of our player objects
function PlayerHandler:takeDamage(x: number)
    -- This function will be called maybe when we detect an enemy has hit our player
    -- WOAH new word "self"
    -- The self refers to the object we have
    -- We are accessing our health variable we declared earlier and changing it
    self.health = self.health - x
    return self.health -- This will return the current health
end

function PlayerHandler:dealDamage(x: number, enemyPlayer: Player)
    -- Here we will damage an enemy player using their player object
    local enemyPlayerObject = playerObjects[enemyPlayer]
    -- We have now gotten their player object and we know they should have a "takeDamage" function cuz we made it
    -- So lets call that now
    enemyPlayerObject:takeDamage(x) -- We call their takeDamage function with the ammount of damage we dealt
    return enemyPlayerObject.health -- Lets return their health
end

return PlayerHandler