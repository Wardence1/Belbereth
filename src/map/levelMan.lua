local levelMan = {}

-- Includes
local images = require("src.images")
local tile = require("src.map.tile")

-- Bottom Floor
MAX_FLOOR = 20

-- Amount of tiles in the level
LEVEL_WIDTH = 60
LEVEL_HEIGHT = 24

-- Current level
levelMan.current = 1

-- Current area
levelMan.area = "dungeons"

-- Stores all levels
levelMan.levels = {}

-- Adds a created level to a chosen dungeon floor
function levelMan:addLevel(level, floor)
    -- map contains a bunch of tables for each row of tiles
    self.levels[floor] = level
end

-- Draw ground, walls, pits, ect.
local function drawTerrain(currTile, x, y)
    local area = levelMan.levels[levelMan.current].area
    local currTerr = currTile.terrain -- current terrain

    if area == "dungeons" then
        if currTerr == "ground" then
            love.graphics.draw(images.dungeonGround, x, y)
        elseif currTerr == "wall" then
            love.graphics.draw(images.dungeonWall, x, y)
        else
            error(currTerr .. " isn't a valid terrain.")
        end
    elseif area == "dwarvish-mines" then

    else
        error(area .. " is not a valid area.")
    end
end

function levelMan:draw()
    for i = 1, LEVEL_HEIGHT, 1 do
        for j = 1, LEVEL_WIDTH, 1 do
            local currTile = self.levels[self.current].map[i][j]

            if currTile ~= nil then
                drawTerrain(currTile, (j * tile.size) - tile.size, (i * tile.size) - tile.size)
            end

            -- Draw objects on the tiles


            -- Draw enemies on the tiles
        end
    end
end

return levelMan
