-- This panel toggels between the player's stats and inventory

local rPan = {}
rPan.inventory = false -- If true the inventory will draw instead of the player stats
rPan.width = 300
rPan.height = WINDOW_HEIGHT
rPan.bThick = 3

function rPan:draw()
    -- Draw a black rectangle to cut off the game
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", WINDOW_WIDTH - self.width, WINDOW_HEIGHT - self.height, self.width, self.height)
    -- draw the white border
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", (WINDOW_WIDTH - self.width)-math.floor(self.bThick/2), WINDOW_HEIGHT - self.height, self.bThick, self.height)
end

return rPan
