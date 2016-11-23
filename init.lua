local prefix = {"alt"}

local log = hs.logger.new('','debug')
log.i('Initializing')

-- Set grid size.
hs.grid.GRIDWIDTH  = 4
hs.grid.GRIDHEIGHT = 6
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0
hs.window.animationDuration = 0.3 

hs.hotkey.bind(prefix, 'R', hs.reload)
hs.hotkey.bind(prefix, 'z', hs.grid.maximizeWindow)
hs.hotkey.bind(prefix, 'F', function()
  hs.window.frontmostWindow():toggleFullScreen()
end)

hs.hotkey.bind(prefix, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(prefix, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(prefix, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(prefix, 'L', hs.grid.pushWindowRight)

hs.hotkey.bind(prefix, "`", function()
  local win = hs.window.frontmostWindow()
  win:centerOnScreen(win:screen():previous(), true)
end)

hs.hotkey.bind(prefix, "1", function()
  local win = hs.window.frontmostWindow()
  win:centerOnScreen(win:screen():next(), true)
end)

hs.hotkey.bind(prefix, "e", function()
  local win = hs.window.frontmostWindow()
  win:centerOnScreen(win:screen())
end)

incratio = 0.1
hs.hotkey.bind(prefix, "o", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.w = math.min(max.w, f.w * (1 - incratio))
  f.h = math.min(max.h, f.h * (1 - incratio))
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "i", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = win:screen():frame()
  f.w = math.min(max.w, f.w * (1 + incratio))
  f.h = math.min(max.h, f.h * (1 + incratio))
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "Left", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "Right", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.w / 2
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "Up", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "Down", function()
  local win = hs.window.frontmostWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.h / 2
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(prefix, "w", function()
  hs.hints.windowHints()
end)


local app_map = {
    ["C"] = "CLion",
    ["T"] = "Terminal",
    ["B"] = "Safari"
}

local function bind_app()
    for key, app in pairs(app_map) do
        hs.hotkey.bind(prefix, key,
            function()
                hs.application.open(app)
            end
        )
    end
end

bind_app()

hs.alert.show("Hammerspoon, at your service.", 1)

