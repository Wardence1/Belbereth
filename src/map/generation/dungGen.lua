-- TUT this is for you

-- dungGen stands for dungeon generation btw

local dungGen = {}

-- Includes
local levelMan = require("src.map.levelMan")
local level = require("src.map.level")
local tile = require("src.map.tile")
local player = require("src.entities.player")


-- This only generates floor one for now
function dungGen:generateDungeonLevel()
    local thisLevel = level:new("dungeons")

    -- Creates a row full of walls
    local wallRow = {}
    for i = 1, LEVEL_WIDTH, 1 do
        wallRow[i] = tile:new("wall", nil, nil)
    end

    -- Top
    thisLevel:addRow(wallRow, 1)

    -- Middle
    -- create the middle row
    local middleRow = {}
    for i = 1, LEVEL_WIDTH, 1 do
        if i == 1 or i == LEVEL_WIDTH then
            middleRow[i] = tile:new("wall", nil, nil)
        else
            middleRow[i] = tile:new("ground", nil, nil)
        end
    end
    -- add it to the level
    for i = 2, LEVEL_HEIGHT - 1, 1 do
        thisLevel:addRow(middleRow, i)
    end

    -- bottom
    thisLevel:addRow(wallRow, LEVEL_HEIGHT)

    -- Empty cube
    thisLevel:addTile(nil, 6, 8)
    thisLevel:addTile(nil, 7, 8)
    thisLevel:addTile(nil, 6, 9)
    thisLevel:addTile(nil, 7, 9)

    -- Spawn the player
    player:spawn(1, 1, "tourist")

    -- Add the created level to the first floor
    levelMan:addLevel(thisLevel, 1)
end

return dungGen
