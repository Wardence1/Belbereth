local gameScene = {}

local dungGen = require("src.map.generation.dungGen")
local levelMan = require("src.map.levelMan")
local rPan = require("src.panels.rightPanel")
local terminal = require("src.panels.bottomPanel")
local camera = require("lib.camera")
local player = require("src.entities.player")
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
    -- Functions that update constantly
    rPan:update()

    -- Functions that update after a tick
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
    if rPan.active then
        camera:attach(0, 0, push:getWidth() - RIGHT_PANEL_WIDTH, push:getHeight() - BOTTOM_PANEL_HEIGHT)
    else
        -- The offset is so the player's y position on the camera stays the same
        camera:attach(0, -BOTTOM_PANEL_HEIGHT, push:getWidth(), push:getHeight() + BOTTOM_PANEL_HEIGHT)
    end

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
    local tick = false -- Is set to true if a pressed key sets the game to tick
    if not isrepeat then
        -- Move the player                  -- Nethack / Rouge controls
        -- cardinal directions
        if key == "k" then     -- up
            player.velY = player.velY - 1
            tick = true
        end
        if key == "j" then     -- down
            player.velY = player.velY + 1
            tick = true
        end
        if key == "h" then     -- left
            player.velX = player.velX - 1
            tick = true
        end
        if key == "l" then     -- right
            player.velX = player.velX + 1
            tick = true
        end
        -- diagnals
        if key == "y" then     -- up-left
            player.velY = player.velY - 1
            player.velX = player.velX - 1
            tick = true
        end
        if key == "u" then     -- up-right
            player.velY = player.velY - 1
            player.velX = player.velX + 1
            tick = true
        end
        if key == "b" then     -- down-left
            player.velY = player.velY + 1
            player.velX = player.velX - 1
            tick = true
        end
        if key == "n" then     -- down-right
            player.velY = player.velY + 1
            player.velX = player.velX + 1
            tick = true
        end


        -- Activate the inventory
        if key == "i" then
            rPan.inventory = true
            rPan.stats = false
        end
        -- Activate the stats
        if key == "s" then
            rPan.stats = true
            rPan.inventory = false
        end
        -- Disable the right panel
        if key == "escape" then
            rPan.stats = false
            rPan.inventory = false
        end

        -- rest ** tick the game
        if key == "." then
            tick = true
        end

        -- Add turn
        if tick then
            shouldUpdate = true
        end
    end
end

function gameScene:mousereleased(x, y, button)

end

return gameScene
