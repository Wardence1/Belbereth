-- This panel toggels between the player's stats and inventory

-- includes
local images = require("src.images")
local player = require("src.entities.player")
local capFirst = require("src.helpers.capFirst")

local rPan = {}
rPan.inventory = false -- If true the inventory will draw
rPan.stats = false     -- If true player stats will draw
rPan.active = false    -- Is true if anything is displaying on the right panel
rPan.bThick = 3        -- Border thickness
rPan.sideOff = 7       -- How far away the text is from the left side of the panel
rPan.spaceAm = 20      -- Amount of space between each stat

-- Only needed to set self.active accordingly
function rPan:update()
    if self.inventory or self.stats then
        self.active = true
    else
        self.active = false
    end
end

function rPan:draw()
    if self.active then
        -- Draw a black rectangle to cut off the game
        love.graphics.setColor(0, 0, 0)
        love.graphics.rectangle("fill", WINDOW_WIDTH - RIGHT_PANEL_WIDTH, WINDOW_HEIGHT - RIGHT_PANEL_HEIGHT,
            RIGHT_PANEL_WIDTH, RIGHT_PANEL_HEIGHT)
        -- draw the white border
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", (WINDOW_WIDTH - RIGHT_PANEL_WIDTH) - math.floor(self.bThick / 2),
            WINDOW_HEIGHT - RIGHT_PANEL_HEIGHT, self.bThick, RIGHT_PANEL_HEIGHT)
    end
    love.graphics.setFont(images.tFont)

    -- Draw the inventory
    if self.inventory then
        -- Title
        -- white box behind title
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", WINDOW_WIDTH - RIGHT_PANEL_WIDTH, WINDOW_HEIGHT - RIGHT_PANEL_HEIGHT,
            RIGHT_PANEL_WIDTH, images.titleFont:getHeight("Inventory:") * 2)
        love.graphics.setFont(images.titleFont)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("Inventory:",
            WINDOW_WIDTH - RIGHT_PANEL_WIDTH + (RIGHT_PANEL_WIDTH / 2) - (images.titleFont:getWidth("Inventory:") / 2),
            self.spaceAm - 5)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(images.tFont)
    elseif self.stats then
        -- Title
        -- white box behind title
        love.graphics.setColor(1, 1, 1)
        love.graphics.rectangle("fill", WINDOW_WIDTH - RIGHT_PANEL_WIDTH, WINDOW_HEIGHT - RIGHT_PANEL_HEIGHT,
            RIGHT_PANEL_WIDTH, images.titleFont:getHeight("Status:") * 2)

        love.graphics.setFont(images.titleFont)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print("Stats:",
            WINDOW_WIDTH - RIGHT_PANEL_WIDTH + (RIGHT_PANEL_WIDTH / 2) - (images.titleFont:getWidth("Stats:") / 2),
            self.spaceAm - 5)
        love.graphics.setColor(1, 1, 1)

        love.graphics.setFont(images.tFont)

        -- name
        love.graphics.print(player.name .. " the " .. capFirst(player.class),
            WINDOW_WIDTH - RIGHT_PANEL_WIDTH + self.sideOff, images.titleFont:getHeight("Status:") + self.spaceAm * 2)

        -- hp
        love.graphics.print("HP: " .. player.hp, WINDOW_WIDTH - RIGHT_PANEL_WIDTH + self.sideOff,
            images.titleFont:getHeight("Status:") + self.spaceAm * 4)
        -- money
        love.graphics.print("Money: " .. player.money, WINDOW_WIDTH - RIGHT_PANEL_WIDTH + self.sideOff,
            images.titleFont:getHeight("Status:") + self.spaceAm * 5)

        -- str
        love.graphics.print("Strength: " .. player.str, WINDOW_WIDTH - RIGHT_PANEL_WIDTH + self.sideOff,
            images.titleFont:getHeight("Status:") + self.spaceAm * 7)
        -- def
        love.graphics.print("Defense: " .. player.def, WINDOW_WIDTH - RIGHT_PANEL_WIDTH + self.sideOff,
            images.titleFont:getHeight("Status:") + self.spaceAm * 8)
    end
end

return rPan
