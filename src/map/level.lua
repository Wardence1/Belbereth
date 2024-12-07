local level = {}
level.__index = level

function level:new(area)
    local inst = setmetatable({}, level)

    inst.map = {}

    -- Add tables for every row
    for i = 0, LEVEL_HEIGHT do
        inst.map[i] = {}
    end

    -- Sets the area the player is in, Examples: "dungeons", "dwarvish-mines", ect.
    if area == "dungeons" or area == "dwarvish-mines" then
        self.area = area
    else
        error(area .. " is not a valid area.")
    end

    return inst
end

function level:addTile(tile, tileX, tileY)
    if tileY > LEVEL_HEIGHT or tileY <= 0 then
        error("Tile y position: " .. tileY .. " not in valid range.")
    elseif tileX <= 0 or tileX > LEVEL_WIDTH then
        error("Row length: " .. tileX .. " not in valid range.")
    else
        self.map[tileY][tileX] = tile
    end
end

function level:addRow(row, column)
    for i = 1, LEVEL_WIDTH do
        self:addTile(row[i], i, column)
    end
end

return level
