---------------------------------------------------------------------------------
--
-- scene.lua
--
---------------------------------------------------------------------------------
local physics = require('physics') -- Box2D physics
local widget = require('widget') -- Buttons
local physics = require("physics")
--sounds.playStream('game_music')
physics.start()
physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")


system.activate("multitouch")
local sceneName = ...

local composer = require( "composer" )

local scene = composer.newScene( sceneName )


local playBtn

local function onPlayBtnRelease()

  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "menu", "fade", 100 )
  composer.removeHidden()

  return true
end



function scene:create( event )

    local sceneGroup = self.view
	local background = display.newImage ("imagem/parede2.png" , 250 , 370)


  -- create a widget button (which will loads game.lua on release)
	playBtn = widget.newButton{
		defaultFile="imagem/backV.png",
		width=350, height=190,
		onRelease = onPlayBtnRelease
	}
	playBtn.x = display.contentWidth*0.8
	playBtn.y = display.contentHeight - 50

  sceneGroup:insert( background )
  sceneGroup:insert( playBtn )

  --sceneGroup:insert( volumeBtn )
end

function scene:show( event )
  local sceneGroup = self.view
  local phase = event.phase

  if phase == "will" then

  elseif phase == "did" then

  end
end

function scene:hide( event )
  local sceneGroup = self.view
  local phase = event.phase

  if event.phase == "will" then

  elseif phase == "did" then

  end
end

function scene:destroy( event )
  local sceneGroup = self.view

  if playBtn then
    playBtn:removeSelf()  -- widgets must be manually removed
    playBtn = nil
  end

end
---------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
---------------------------------------------------------------------------------


return scene
