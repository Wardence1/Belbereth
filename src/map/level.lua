local level = {}
level.__index = level

function level:new(area)
    local inst = setmetatable({}, level)

    inst.map = {}

    -- Sets the area the player is in, Examples: "dungeons", "dwarvish-mines", ect.
    if area == "dungeons" or area == "dwarvish-mines" then
        self.area = area
    else
        error(area .. " is not a valid area.")
    end

    return inst
end

function level:addRow(row, column)
    if column > LEVEL_HEIGHT or column < 0 then
        error("Column length: " .. column .. "not in valid range.")
    elseif #row < LEVEL_WIDTH or #row > LEVEL_WIDTH then
        error("Row length: " .. #row .. " not in valid range.")
    else
        self.map[column] = row
    end
end

return level
