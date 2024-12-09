-- This acts as a mini terminal, allowing alerts to be displayed and player input

-- Includes
local images = require("src.images")

local bPan = {}
bPan.bThick = 3  -- Border thickness
bPan.buffer = {} -- This holds 4 lines of text to be displayed on the terminal
bPan.lines = 4   -- The amount of lines to be printed in the terminal
bPan.sideOff = 7 -- How far away the text is from the left side of the terminal

function bPan:draw()
    -- Draw a black rectangle to cut off the game
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, WINDOW_HEIGHT - BOTTOM_PANEL_HEIGHT, BOTTOM_PANEL_WIDTH, BOTTOM_PANEL_HEIGHT)
    -- draw the white border
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, (WINDOW_HEIGHT - BOTTOM_PANEL_HEIGHT) - math.floor(self.bThick / 2),
        BOTTOM_PANEL_WIDTH,
        self.bThick)

    -- Draw the text
    love.graphics.setFont(images.tFont)
    for i = 1, self.lines do
        if self.buffer[i] ~= nil then
            love.graphics.print(self.buffer[i], self.sideOff,
                (i * (BOTTOM_PANEL_HEIGHT / self.lines) + WINDOW_HEIGHT - BOTTOM_PANEL_HEIGHT - 28))
        end
    end
end

function bPan:write(text)
    -- Errors
    if type(text) ~= "string" then
        error("Only strings are allowed to be written on the terminal.")
    end
    if #text >= 75 then
        error(text .. ", is too long to be properly displayed within the terminal.")
    end

    -- Inserting the text and moving all other lines back
    table.insert(self.buffer, text)

    if #self.buffer > 4 then
        table.remove(self.buffer, 1)
    end
end

return bPan
