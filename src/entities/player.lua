-- includes
local images = require("src.images")
local tile = require("src.map.tile")
local camera = require("lib.camera")
local levelMan = require("src.map.levelMan")
local terminal = require("src.panels.bottomPanel")

local player = {}

-- Initial varaibles
player.velX = 0
player.velY = 0

-- Only called when the game starts
function player:spawn(tileX, tileY, class)
    self.tileX = tileX
    self.tileY = tileY

    -- Focus the camera on the player
    camera:lookAt((player.tileX * tile.size) + tile.size / 2, (player.tileY * tile.size) + tile.size / 2)

    -- Give the player their class specific items ** NOT IMPLEMENTED
end

-- Should be called when the player changes floors and moves
function player:moveTo(tileX, tileY)
    self.tileX = tileX
    self.tileY = tileY
end

function player:update()
    -- I have to add an offset to the player due to the map being one off. Arrays started at 1, so the map starts at 1 ):
    local nextTile = levelMan.levels[levelMan.current].map[(self.tileY + self.velY)+1][(self.tileX + self.velX)+1]

    -- Move the player based on velocity if there's not a wall in the way
    if nextTile ~= nil then
        if nextTile.terrain ~= "wall" then
            player:moveTo(self.tileX + self.velX, self.tileY + self.velY)
        end
    end

    -- Set the x and y velocity to 0
    self.velX, self.velY = 0, 0

    -- Focus the camera on the player
    camera:lookAt((player.tileX * tile.size) + tile.size / 2, (player.tileY * tile.size) + tile.size / 2)
end

function player:draw()
    love.graphics.draw(images.player, self.tileX * tile.size, self.tileY * tile.size)
end

return player
