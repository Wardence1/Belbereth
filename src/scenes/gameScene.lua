local gameScene = {}

local dungGen = require("src.map.generation.dungGen")
local levelMan = require("src.map.levelMan")
local rPan = require("src.panels.rightPanel")
local terminal = require("src.panels.bottomPanel")
local camera = require("lib.camera")
local player = require("src.entities.player")
local tile = require("src.map.tile")
local push = require("lib.push")

local shouldUpdate = false -- When true the whole game will update one tick
local ticks = 0

function gameScene:load(...)
    -- Generate the dungeon
    dungGen:generateDungeonLevel()
    -- Make sure the player's spawned in
    if not player.tileX or not player.tileY then error("The player wasn't spawned during generation.") end

    -- Greeting
    terminal:write("Welcome to Belbereth, this is the terminal.")
end

function gameScene:delete(...)

end

function gameScene:update(dt)
    if shouldUpdate then
        -- Update everything
        player:update()

        ticks = ticks + 1
        shouldUpdate = false
    end
end

function gameScene:draw()
    -- GAME
    -- Setup the camera
    camera:attach(0, 0, push:getWidth() - rPan.width, push:getHeight() - terminal.height)

    -- Top left game window
    levelMan:draw()
    -- Draw the player over the tiles
    player:draw()

    -- Detach the camera before drawing the gui
    camera:detach()

    -- GUI
    -- Rightside stats/inventory
    rPan:draw()

    -- Bottom terminal
    terminal:draw()
end

function gameScene:keypressed(key, scancode, isrepeat)
    -- CONTROLS
    if not isrepeat then
        -- Move the player
        -- cardinal directions
        if key == "w" then -- up
            player.velY = player.velY - 1
        end
        if key == "s" then -- down
            player.velY = player.velY + 1
        end
        if key == "a" then -- left
            player.velX = player.velX - 1
        end
        if key == "d" then -- right
            player.velX = player.velX + 1
        end
        -- diagnals

        if key == "q" then -- up-left
            player.velY = player.velY - 1
            player.velX = player.velX - 1
        end
        if key == "e" then -- up-right
            player.velY = player.velY - 1
            player.velX = player.velX + 1
        end
        if key == "z" then -- down-left
        player.velY = player.velY + 1
            player.velX = player.velX - 1
        end
        if key == "c" then -- down-right
            player.velY = player.velY + 1
            player.velX = player.velX + 1
        end


        -- Toggle the inventory
        if key == "i" then
            rPan.inventory = not rPan.inventory
        end

        -- Add turn
        if key == "w" or key == "a" or key == "s" or key == "d" or
        key == "q" or key == "e" or key == "z" or key == "c" or
        key == "." then
            shouldUpdate = true
        end
    end
end

function gameScene:mousereleased(x, y, button)

end

return gameScene
