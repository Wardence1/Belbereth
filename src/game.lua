local game = {}

-- Includes
local push = require("lib.push")
local sceneMan = require("lib.sceneMan")
local images = require("src.images")

function game:load()
    images:load()
    --love.graphics.scale(SCALE, SCALE)
    push:setupScreen(WINDOW_WIDTH, WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {fullscreen = false})

    -- Scenes
    sceneMan:newScene("game", require("src.scenes.gameScene"))

    -- Push starting scene
    sceneMan:push("game")
end

function game:update(dt)
    sceneMan:event("update", dt)
end

function game:draw()
    push:start()
    sceneMan:event("draw")
    push:finish()
end

return game