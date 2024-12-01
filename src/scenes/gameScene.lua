local gameScene = {}

local dungGen = require("src.map.dungGen")
local levelMan = require("src.map.levelMan")

function gameScene:load(...)
    dungGen:generateDungeonLevel()
end

function gameScene:delete(...)

end

function gameScene:update(dt)

end

function gameScene:draw()
    -- Top left game window
    levelMan:draw()

    -- Rightside stats/inventory


    -- Bottom event log
end

function gameScene:keypressed(key, scancode, isrepeat)

end

function gameScene:mousereleased(x, y, button)

end

return gameScene
