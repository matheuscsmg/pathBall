
-----------------------------------------------------------------------------------------
--
-- game.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


local widget = require "widget"

local backgroundMusic = audio.loadStream("sounds/Bounce_Ball.mp3")

local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=-1, fadein=5000 } )

--------------------------------------------

local playBtn

local function onPlayBtnRelease()

  -- go to game.lua scene [ joguim rodando]
  audio.stop()
  composer.gotoScene( "scene1", "fade", 100 )
  composer.removeHidden()

  return true
end


local sobreBtn
local function onSobreBtnRelease()

  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "instructions", "fade", 100 )
  composer.removeHidden()

  return true
end


local recBtn
local function onRecBtnRelease()
  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "credits", "fade", 100 )
  composer.removeHidden()

  return true
end





function scene:create( event )
  local sceneGroup = self.view
  local background = display.newImage ("imagem/images.png" , 450 , 390)
  local background2 = display.newImage ("imagem/FirstScreen.png" , 479, 300	)

  -- create a widget button (which will loads game.lua on release)
  playBtn = widget.newButton{
    defaultFile="imagem/bt_play2.png",
    width=300, height=150,
    onRelease = onPlayBtnRelease
  }
  playBtn.x = display.contentWidth*0.2
  playBtn.y = display.contentHeight - 70

  -- create a widget button (which will loads recordes.lua on release)
  recBtn = widget.newButton{
    defaultFile="imagem/bt_recordes2.png",
    width=300, height=150,
    onRelease = onRecBtnRelease  -- event listener function
  }
  recBtn.x = display.contentWidth*0.8
  recBtn.y = display.contentHeight - 70

      -- create a widget button (which will loads sobre.lua on release)
  sobreBtn = widget.newButton{
    defaultFile="imagem/bt_sobre2.png",
    width=300, height=150,
    onRelease = onSobreBtnRelease  -- event listener function
  }
  sobreBtn.x = display.contentWidth*0.5
  sobreBtn.y = display.contentHeight - 70


  sceneGroup:insert( background )
  sceneGroup:insert( background2 )
  sceneGroup:insert( sobreBtn )
  sceneGroup:insert( playBtn )
  sceneGroup:insert( recBtn )
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

  if credBtn then
    credBtn:removeSelf()  -- widgets must be manually removed
    credBtn = nil
  end

  if recBtn then
	recBtn:removeSelf()
	recBtn = nil
   end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
