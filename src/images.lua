local images = {}

function images:load()
    -- Dungeon
    images.dungeonGround = love.graphics.newImage("res/terrain/dungeons/ground.png")
    images.dungeonWall = love.graphics.newImage("res/terrain/dungeons/wall.png")
    -- Dwarvish Mines



    -- Enemies


    -- Objects


    -- Player
    images.player = love.graphics.newImage("res/entities/player.png")

    -- Fonts
    images.tFont = love.graphics.newFont("res/fonts/VT323-Regular.ttf", 24) -- terminal font
    images.tFont:setFilter("nearest", "nearest") -- WHYYYY
    images.titleFont = love.graphics.newFont("res/fonts/VT323-Regular.ttf", 32) -- Title for the inventory/stats panel
    images.titleFont:setFilter("nearest", "nearest")
end

return images