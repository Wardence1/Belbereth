-- WINDOW
WINDOW_WIDTH = 1080
WINDOW_HEIGHT = 720
--SCALE = 2

function love.conf (t)
    t.console = true
    t.window.width = WINDOW_WIDTH
    t.window.height = WINDOW_HEIGHT
    t.window.title = "Belbereth"
    t.window.display = 1
    t.fsaa = 0
end