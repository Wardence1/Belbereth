-- This acts as a mini terminal, allowing alerts to be displayed and player input

-- Includes
local rPan = require("src.panels.rightPanel")
local images = require("src.images")

local bPan = {}
bPan.width = WINDOW_WIDTH - rPan.width
bPan.height = 150
bPan.bThick = 3  -- Border thickness
bPan.buffer = {} -- This holds 4 lines of text to be displayed on the terminal
bPan.lines = 4   -- The amount of lines to be printed in the terminal

function bPan:draw()
    -- Draw a black rectangle to cut off the game
    love.graphics.setColor(0, 0, 0)
    love.graphics.rectangle("fill", 0, WINDOW_HEIGHT - self.height, self.width, self.height)
    -- draw the white border
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, (WINDOW_HEIGHT - self.height) - math.floor(self.bThick / 2), self.width,
        self.bThick)

    -- Draw the text
    love.graphics.setFont(images.tFont)
    for i = 1, self.lines do
        if self.buffer[i] ~= nil then
            love.graphics.print(self.buffer[i], 5 / 2,
                (i * (self.height / self.lines) + WINDOW_HEIGHT - self.height - 28))
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
