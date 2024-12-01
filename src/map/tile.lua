local tile = {}
tile.__index = tile

tile.size = 32

function tile:new(terrain, objects, enemies)
    local inst = setmetatable({}, tile)

    -- Enemies and objects need to be a table 
    if enemies == nil then
        enemies = {}
    end
    if objects == nil then
        objects = {}
    end

    -- Attributes
    inst.terrain = terrain -- "pit", "wall", "floor", ect.
    inst.objects = objects -- Table of objects on that specific tile
    inst.enemies = enemies -- Table of the enemies standing on that tile

    return inst
end

return tile
