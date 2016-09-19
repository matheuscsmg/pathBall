-- main.lua
--
-----------------------------------------------------------------------------------------
local composer = require('composer') -- Scene management
local physics = require('physics') -- Box2D physics
local widget = require('widget') -- Buttons


local sceneName = "main.lua"
-- Load scene with same root filename as this file
local scene = composer.newScene( sceneName )
-- Your code here
local physics = require("physics")
--sounds.playStream('game_music')


-- Load scene with same root filename as this file

-- require the composer library

physics.start()

physics.setGravity(0, 9.8)
--physics.setDrawMode("hybrid")
--physics.setDrawMode("hybrid")

system.activate("multitouch")

local background = display.newImage('imagem/parede.png', 490, 349)
local canhao = display.newImage("imagem/canhao.png")
canhao.x = display.contentWidth/12
canhao.y = display.contentHeight/1.4
physics.addBody(canhao, "static", {bounce = 0.1,radius=35,friction = 1.0})



-- require the composer library
function scene:create( event )
    local sceneGroup = self.view

    local target = display.newImage( "imagem/target.png" )
    target:scale( 0.25, 0.25 )
--     -- Shoot the  ball, using a visible force vector
    function shootPlasma( event )

        local t = event.target
        local phase = event.phase
        local startRotation -- fwd decl

        if "began" == phase then
            display.getCurrentStage():setFocus( t )
            t.isFocus = true

            target.x = t.x
            target.y = t.y

            startRotation = function()
                target.rotation = target.rotation + 4
            end

            Runtime:addEventListener( "enterFrame", startRotation )

            local showTarget = transition.to( target, { alpha=0.4, xScale=0.4, yScale=0.4, time=200 } )
            myLine = nil

        elseif t.isFocus then

            if "moved" == phase then

                if ( myLine ) then
                    myLine.parent:remove( myLine ) -- erase previous line, if any
                end
                myLine = display.newLine( t.x,t.y, event.x,event.y )
                myLine:setStrokeColor( 1, 1, 1, 50/255 )
                myLine.strokeWidth = 15

            elseif "ended" == phase or "cancelled" == phase then

                display.getCurrentStage():setFocus( nil )
                t.isFocus = false

                local stopRotation = function()
                    Runtime:removeEventListener( "enterFrame", startRotation )
                end

                local hideTarget = transition.to( target, { alpha=0, xScale=1.0, yScale=1.0, time=200, onComplete=stopRotation } )

                if ( myLine ) then
                    myLine.parent:remove( myLine )
                end

                local plasma = display.newImage( "imagem/bola.png" )
                plasma.width = 80
                plasma.height = 80
                plasma.x = t.x
                plasma.y = t.y
                physics.addBody( plasma, { density=3, friction=1.0, bounce=.2, radius=40 } )
                plasma:applyForce( 70*(t.x - event.x), 70*(t.y - event.y), t.x, t.y )
			end

        end
        return true -- Stop further propagation of touch event
    end

	local teste = self:getObjectByName("background")
	local gameGroup = self:getObjectByName( "imagem" )
	local ufo = self:getObjectByName( "canhao" )

	ufo:addEventListener( "touch", shootPlasma )


end


function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if phase == "will" then
        -- Called when the scene is still off screen and is about to move on screen

    elseif phase == "did" then
        -- Called when the scene is now on screen
        --
        -- INSERT code here to make the scene come alive
        -- e.g. start timers, begin animation, play audio, etc

        -- we obtain the object by id from the scene's object hierarchy


    end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if event.phase == "will" then
        -- Called when the scene is on screen and is about to move off screen
        --
        -- INSERT code here to pause the scene
        -- e.g. stop timers, stop animation, unload sounds, etc.)
    elseif phase == "did" then
        -- Called when the scene is now off screen

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )


--adicionar imagem de fundo

local teto = display.newImage("imagem/teto.png")
teto.x = display.contentWidth/2
teto.y = display.contentHeight/25
physics.addBody(teto, "static", {bounce = 0.1,friction = 1.0})

local base = display.newImage("imagem/base.png")
base.x = display.contentWidth/12
base.y = display.contentHeight/1.1
physics.addBody(base, "static", {bounce = 0.1,friction = 1.0})


local vida1 = display.newImage("imagem/vida.png")
vida1.x = display.contentWidth/23
vida1.y = display.contentHeight/25
physics.addBody(vida1, "static", {bounce = 0.1,radius=15,friction = 1.0})

local vida2 = display.newImage("imagem/vida.png")
vida2.x = display.contentWidth/9
vida2.y = display.contentHeight/25
physics.addBody(vida2, "static", {bounce = 0.1,radius=15,friction = 1.0})

local vida3 = display.newImage("imagem/vida.png")
vida3.x = display.contentWidth/5.7
vida3.y = display.contentHeight/25
physics.addBody(vida3, "static", {bounce = 0.1,radius=15,friction = 1.0})

local estrela = display.newImage("imagem/estrela.png")
estrela.x = display.contentWidth/5
estrela.y = display.contentHeight/4
physics.addBody(estrela, "static", {bounce = 0.1,radius=15,friction = 1.0})

local estrela2 = display.newImage("imagem/estrela2.png")
estrela2.x = display.contentWidth/1.5
estrela2.y = display.contentHeight/1.4
physics.addBody(estrela2, "static", {bounce = 0.1,radius=1,friction = 1.0})

local scores = display.newText( "SCORES: 000",705, 29, native.systemFontBold, 39 )
scores:setFillColor( 0, 0, 0 )

transition.to(estrela, {time = 7000, rotation = 360, iterations = 100, transition = easing.continuousLoop})
transition.to(estrela2, {time = 7000, rotation = 360, iterations = 100, transition = easing.continuousLoop})


--fazer o fundo se mover
--function scrollFundo(self,event)
	--if self.x < -1300 then
		--self.x = 1300
	--else
	--self.x = self.x-3
	--end
--end
--background.enterFrame = scrollFundo
--Runtime:addEventListener("enterFrame", background)



local bola = display.newImage("imagem/bola.png" , 100, 100)
bola.x = display.contentWidth/2
physics.addBody(bola, {bounce = 0.9, radius = 25, friction = 3.0})


--criar paredes e limites na tela
local paredeEsquerda = display.newRect(0, 370, 0, display.contentHeight)
local paredeDireita = display.newRect(display.contentWidth,350,0,display.contentHeight)
local celling = display.newRect(480,0.2,display.contentWidth,0)

physics.addBody(paredeEsquerda, "static", {bounce = 0.1})
physics.addBody(paredeDireita, "static", {bounce = 0.1})
physics.addBody(celling, "static", {bounce = 0.1})


--esconde o status bar (barra de cima do celualr)
display.setStatusBar(display.HiddenStatusBar)

function moverBola(event)
	local bola = event.target
	bola:applyLinearImpulse(-0.1, -0.10, bola.x, bola.y)
end

bola:addEventListener("touch", moverBola)


--esconde o status bar (barra de cima do celualr)
display.setStatusBar(display.HiddenStatusBar)

--Função que faz a bola se movimentar
function moverBola(event)
	local bola = event.target
	bola:applyLinearImpulse(-0.2, -0.2, event.x, event.y)
end

bola:addEventListener("touch", moverBola)



local nuvem1 =  display.newImage("imagem/nuvem.png")
nuvem1.x=800
nuvem1.y=90

local nuvem2 =  display.newImage("imagem/nuvem.png")
nuvem2.x=300
nuvem2.y=100

local nuvem3 =  display.newImage("imagem/nuvem.png")
nuvem3.x=530
nuvem3.y=70

function scrollnuvem(self,event)
 if self.x< -1090 then
	self.x = 1090
 else
	self.x = self.x - 3
 end

end

nuvem1.enterFrame = scrollnuvem
Runtime:addEventListener("enterFrame", nuvem1)


nuvem2.enterFrame = scrollnuvem
Runtime:addEventListener("enterFrame", nuvem2)


nuvem3.enterFrame = scrollnuvem
Runtime:addEventListener("enterFrame", nuvem3)





local caixa = display.newImage("imagem/caixa.png")
caixa.x = display.contentWidth/1.2
caixa.y = display.contentHeight/1.1
physics.addBody(caixa, "static", {bounce = 0.1,friction = 1.0})

local botaoMenu = display.newImage("imagem/botaoMenu.png")
botaoMenu.x = display.contentWidth/1.9
botaoMenu.y = display.contentHeight/1.03
physics.addBody(botaoMenu, "static", {bounce = 0.1,friction = 1.0})

local botaoPause = display.newImage("imagem/botaoPause.png")
botaoPause.x = display.contentWidth/2.4
botaoPause.y = display.contentHeight/1.03
physics.addBody(botaoPause, "static", {bounce = 0.1,friction = 1.0})

local botaoPlay = display.newImage("imagem/botaoPlay.png")
botaoPlay.x = display.contentWidth/3.3
botaoPlay.y = display.contentHeight/1.03
physics.addBody(botaoPlay, "static", {bounce = 0.1,friction = 1.0})


local botaoShot = display.newImage("imagem/botaoShot.png")
botaoShot.x = display.contentWidth/12
botaoShot.y = display.contentHeight/1.1
physics.addBody(botaoShot, "static", {bounce = 0.1,radius = 75,friction = 1.0})


local saida = display.newImage("imagem/saida.png")
saida.x = display.contentWidth/1.05
saida.y = display.contentHeight/4
physics.addBody(saida, "static", {bounce = 0.1,friction = 1.0})

local dobra = display.newImage("imagem/dobra.png")
local dobra2 = display.newImage("imagem/dobra2.png")
local barra4= display.newImage("imagem/barra.png")
local barraPe= display.newImage("imagem/barraPe.png")
local barraPe2= display.newImage("imagem/barraPe.png")

--mover peça tocando na tela


local function barra4T (event)
 if(event.phase == "moved") then
   barra4.x = event.x
   barra4.y = event.y
 end
end
barra4:addEventListener("touch", barra4T)


local function dobraT (event)
 if(event.phase == "moved") then
   dobra.x = event.x
   dobra.y = event.y
 end
end
dobra:addEventListener("touch", dobraT)

local function dobra2T (event)
 if(event.phase == "moved") then
   dobra2.x = event.x
   dobra2.y = event.y
 end
end
dobra2:addEventListener("touch", dobra2T)

local function barraPeT (event)
 if(event.phase == "moved") then
   barraPe.x = event.x
   barraPe.y = event.y
 end
end
barraPe:addEventListener("touch", barraPeT)

local function barraPe2T (event)
 if(event.phase == "moved") then
   barraPe2.x = event.x
   barraPe2.y = event.y
 end
end
barraPe2:addEventListener("touch", barraPe2T)




--mover peça tocando na tela
--local curva = display.newImage("curva2.png", 66,92)
--curva.x=100
--curva.y=125

--local function onTouch(event)
 --if(event.phase == "ended") then
   --curva.x = event.x
   --curva.y = event.y
 --end

--end
--Runtime:addEventListener("touch", onTouch)

--physics.addBody(curva, "static", {bounce = 0.1, friction = 1.0})
--curva.x = display.contentWidth

physics.addBody(dobra,"static", {bounce = 0.1})
dobra.x = display.contentWidth/1.04
dobra.y = display.contentHeight/1.1

physics.addBody(dobra2, "static", {bounce = 0.1, friction = 1.0})
dobra2.x = display.contentWidth/1.2
dobra2.y = display.contentHeight/1.09

physics.addBody(barra4,"static", {bounce = 0.1})
barra4.x = display.contentWidth/1.2
barra4.y = display.contentHeight/1.2

physics.addBody(barraPe,"static", {bounce = 0.1})
barraPe.x = display.contentWidth/1.4
barraPe.y = display.contentHeight/1.1

physics.addBody(barraPe2,"static", {bounce = 0.1})
barraPe2.x = display.contentWidth/1.5
barraPe2.y = display.contentHeight/1.1




local function atirar (event)
--set up some references and other variables
	local ox, oy = math.abs(display.screenOriginX), math.abs(display.screenOriginY)
	local cw, ch = display.contentWidth, display.contentHeight


	local prediction = display.newGroup() ; prediction.alpha = 0.2
	local line



	local function getTrajectoryPoint( startingPosition, startingVelocity, n )

	--velocity and gravity are given per second but we want time step values here
		local t = 1/display.fps --seconds per time step at 60fps
		local stepVelocity = { x=t*startingVelocity.x, y=t*startingVelocity.y }  --b2Vec2 stepVelocity = t * startingVelocity
		local stepGravity = { x=t*0, y=t*9.8 }  --b2Vec2 stepGravity = t * t * m_world
		return {
			x = startingPosition.x + n * stepVelocity.x + 0.25 * (n*n+n) * stepGravity.x,
			y = startingPosition.y + n * stepVelocity.y + 0.25 * (n*n+n) * stepGravity.y
		}  --startingPosition + n * stepVelocity + 0.25 * (n*n+n) * stepGravity
	end



	local function updatePrediction( event )

		display.remove( prediction )  --remove dot group
		prediction = display.newGroup() ; prediction.alpha = 0.2  --now recreate it

		local startingVelocity = { x=event.x-event.xStart, y=event.y-event.yStart }

		for i = 1,180 do --for (int i = 0; i < 180; i++)
			local s = { x=event.xStart, y=event.yStart }
			local trajectoryPosition = getTrajectoryPoint( s, startingVelocity, i ) -- b2Vec2 trajectoryPosition = getTrajectoryPoint( startingPosition, startingVelocity, i )
			local circ = display.newCircle( prediction, trajectoryPosition.x, trajectoryPosition.y, 5 )
		end
	end



	local function fireProj( event )

		if ( event.xStart < -ox+44 or event.xStart > display.contentWidth+ox-44
			or event.yStart < -oy+44 or event.yStart > display.contentHeight+oy-44 ) then
			display.remove( prediction )
			return
		end

		local proj = display.newImage("imagem/bola.png" , 100, 100)
		proj.x = display.contentWidth/2
		physics.addBody(proj, {bounce = 0.9, radius = 25, friction = 3.0})
		proj.x, proj.y = event.xStart, event.yStart
		local vx, vy = event.x-event.xStart, event.y-event.yStart
		proj:setLinearVelocity( vx,vy )

	end



	local function screenTouch( event )


	local eventX, eventY = event.x, event.y

		if ( event.phase == "began" ) then
			line = display.newLine( eventX, eventY, eventX, eventY )
			line.width = 4 ; line.alpha = 0.6
		elseif ( event.phase == "moved" ) then
			display.remove( line )
			line = display.newLine( event.xStart, event.yStart, eventX, eventY )
			line.width = 4 ; line.alpha = 0.6
			updatePrediction( event )
		else
			display.remove( line )
			updatePrediction( event )
			fireProj( event )
		end
		return true

	end

	Runtime:addEventListener( "touch", screenTouch )
end

canhao:addEventListener("touch", atirar)
