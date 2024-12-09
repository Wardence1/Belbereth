-- WINDOW
WINDOW_WIDTH = 1080
WINDOW_HEIGHT = 720
-- right panel
RIGHT_PANEL_WIDTH = 300
RIGHT_PANEL_HEIGHT = WINDOW_HEIGHT
-- bottom panel
BOTTOM_PANEL_WIDTH = WINDOW_WIDTH - RIGHT_PANEL_WIDTH
BOTTOM_PANEL_HEIGHT = 150

function love.conf (t)
    t.console = true
    t.window.width = WINDOW_WIDTH
    t.window.height = WINDOW_HEIGHT
    t.window.title = "Belbereth"
    t.window.display = 1
    t.fsaa = 0
end