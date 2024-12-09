-- Capitilizes the first letter of a string
local function capFirst(str)
    return str:gsub("^%l", string.upper)
end

return capFirst