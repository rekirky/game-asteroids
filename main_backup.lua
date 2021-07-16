-----------------------------------------------------------------------------------------
--
-- Star Explorer Game
--
-----------------------------------------------------------------------------------------



math.randomseed(os.time())



local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()

local background = display.newImageRect(backGroup, "background.png",800,1400)
background.x = display.contentCenterX
background.y = display.contentCenterY

ship = display.newImageRect(mainGroup,objectSheet,4,98,79)
ship.x = display.contentCenterX
ship.y = display.contentHeight -100
physics.addBody(ship,{radius=30,isSensor=true})
ship.myName = "ship"

livesText = display.newText(uiGroup,"Lives: " .. lives,200,80,native.systemFont,36)
scoreText = display.newText(uiGroup,"Score: " .. score,400,80,native.systemFont,36)

display.setStatusBar(display.HiddenStatusBar)

ship:addEventListener("tap",fireLaser)

ship:addEventListener("touch",dragShip)

gameLoopTimer = timer.performWithDelay(500,gameLoop,0)

Runtime:addEventListener( "collision", onCollision )