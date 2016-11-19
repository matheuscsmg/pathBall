---------------------------------------------------------------------------------
--
-- scene.lua

local widget = require('widget') -- Buttons



system.activate("multitouch")
local sceneName = ...

local composer = require( "composer" )

local scene = composer.newScene( sceneName )


local playBtn4

local function onPlayBtnRelease()

  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "menu", "fade", 100 )
  composer.removeHidden()

  return true
end



function scene:create( event )

    local sceneGroup = self.view
	local background4 = display.newImage ("imagem/parede2.png" , 475 , 359)


  -- create a widget button (which will loads game.lua on release)
	playBtn4 = widget.newButton{
		defaultFile="imagem/backA.png",
		width=270, height=120,
		onRelease = onPlayBtnRelease
	}
	playBtn4.x = display.contentWidth*0.87
	playBtn4.y = display.contentHeight - 45

  sceneGroup:insert( background4 )
  sceneGroup:insert( playBtn4 )

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

  if playBtn4 then
    playBtn4:removeSelf()  -- widgets must be manually removed
    playBtn4 = nil
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
