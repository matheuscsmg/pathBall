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

local widget = require "widget"

local backgroundMusic = audio.loadStream("sounds/gameOver.wav")

local backgroundMusicChannel = audio.play( backgroundMusic, { channel=1, loops=0, fadein=100 } )

--------------------------------------------

local playBtn

local function onPlayBtnRelease()

  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "menu", "fade", 100 )
  composer.removeHidden()

  return true
end



local recBtn
local function onRecBtnRelease()
  -- go to game.lua scene [ joguim rodando]
  composer.gotoScene( "menu", "fade", 100 )
  composer.removeHidden()

  return true
end





function scene:create( event )
  local sceneGroup = self.view
  local background = display.newImage ("imagem/images2.jpg" , 450 , 390)
  local background2 = display.newImage ("imagem/gameOver.png" , 479, 300	)

  -- create a widget button (which will loads game.lua on release)
  playBtn = widget.newButton{
    defaultFile="imagem/replay.png",
    width=300, height=150,
    onRelease = onPlayBtnRelease
  }
  playBtn.x = display.contentWidth*0.2
  playBtn.y = display.contentHeight - 70

  -- create a widget button (which will loads recordes.lua on release)
  recBtn = widget.newButton{
    defaultFile="imagem/exit.png",
    width=300, height=150,
    onRelease = onRecBtnRelease  -- event listener function
  }
  recBtn.x = display.contentWidth*0.8
  recBtn.y = display.contentHeight - 70

  sceneGroup:insert( background )
  sceneGroup:insert( background2 )
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

  if credBtn then
    credBtn:removeSelf()  -- widgets must be manually removed
    credBtn = nil
  end

  if playBtn then
    playBtn:removeSelf()  -- widgets must be manually removed
    playBtn = nil
  end

  if recBtn then
    recBtn:removeSelf()  -- widgets must be manually removed
    recdBtn = nil
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
