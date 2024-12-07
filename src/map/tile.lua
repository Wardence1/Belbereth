local tile = {}
tile.__index = tile

tile.size = 32

function tile:new(terrain, objects, enemy)
    local inst = setmetatable({}, tile)

    -- Objects need to be a table 
    if objects == nil then
        objects = {}
    end

    -- Attributes
    inst.terrain = terrain -- "pit", "wall", "floor", ect.
    inst.objects = objects -- Table of objects on the tile
    inst.enemy = enemy -- The enemy standing on the tile

    return inst
end

return tile
