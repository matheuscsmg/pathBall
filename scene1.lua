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

local background = display.newImage ("imagem/images.png" , 450 , 390)
--------------------------------------------------------------------------------
local vida1 = display.newImage("imagem/vida.png")
vida1.x = display.contentWidth/23
vida1.y = display.contentHeight/1.1
physics.addBody(vida1, "static", {bounce = 0.1,radius=15,friction = 1.0})

local vida2 = display.newImage("imagem/vida.png")
vida2.x = display.contentWidth/9
vida2.y = display.contentHeight/1.1
physics.addBody(vida2, "static", {bounce = 0.1,radius=15,friction = 1.0})

local vida3 = display.newImage("imagem/vida.png")
vida3.x = display.contentWidth/5.7
vida3.y = display.contentHeight/1.1
physics.addBody(vida3, "static", {bounce = 0.1,radius=15,friction = 1.0})

----------------------------------------------------------------------------------------------------------------------------
local cores = 11
local teste = 0
local scores = display.newText( "0",830, 660, native.systemFontBold, 50 )
scores:setFillColor( 100, 100, 100 )

local function contaVidas()
	if teste == 0 then
		vida1:removeSelf()
		teste= teste +1
	elseif (teste==1) then
		vida2:removeSelf()
		teste = teste+1
	elseif (teste==2) then
		vida3:removeSelf()
		teste = teste+1
	elseif (teste>2) then
		composer.gotoScene( "gameOver" )
		local background = display.newImage ("imagem/gameOver.png" , 475 , 359)

	end
end
------------------------------------------------------------------------------------------------------------------------
--criar paredes e limites na tela
local paredeEsquerda = display.newRect(0, 370, 0, display.contentHeight)
local paredeDireita = display.newRect(display.contentWidth,350,0,display.contentHeight)
local celling = display.newRect(480,0.2,display.contentWidth,0)

physics.addBody(paredeEsquerda, "static", {bounce = 0.1})
physics.addBody(paredeDireita, "static", {bounce = 0.1})
physics.addBody(celling, "static", {bounce = 0.1})


--esconde o status bar (barra de cima do celualr)
display.setStatusBar(display.HiddenStatusBar)

local saidaLado = display.newImage("imagem/saidaLaranja.png")
saidaLado.x = display.contentWidth
saidaLado.y = display.contentHeight/2
physics.addBody(saidaLado, "static", {bounce = 0.1,friction = 1.0})
saidaLado.myname="laranja"

local saidaLado2 = display.newImage("imagem/saidaLilaz.png")
saidaLado2.x = display.contentWidth
saidaLado2.y = display.contentHeight/2.9
physics.addBody(saidaLado2, "static", {bounce = 0.1,friction = 1.0})
saidaLado2.myname="lilaz"

local saidaLado3 = display.newImage("imagem/saidaRosa.png")
saidaLado3.x = display.contentWidth
saidaLado3.y = display.contentHeight/1.5
physics.addBody(saidaLado3, "static", {bounce = 0.1,friction = 1.0})
saidaLado3.myname="rosa"

local saidaLado4 = display.newImage("imagem/saidaMarron.png")
saidaLado4.x = display.contentWidth/40
saidaLado4.y = display.contentHeight/2.1
physics.addBody(saidaLado4, "static", {bounce = 0.1,friction = 1.0})
saidaLado4.myname="marron"

local saidaLado5 = display.newImage("imagem/saidaMarfin.png")
saidaLado5.x = display.contentWidth/40
saidaLado5.y = display.contentHeight/3.1
physics.addBody(saidaLado5, "static", {bounce = 0.1,friction = 1.0})
saidaLado5.myname="marfin"

local saidaLado6 = display.newImage("imagem/saidaGraviola.png")
saidaLado6.x = display.contentWidth/40
saidaLado6.y = display.contentHeight/1.6
physics.addBody(saidaLado6, "static", {bounce = 0.1,friction = 1.0})
saidaLado6.myname="graviola"

---------------------------------------------------------------------------------------------

local saida2 = display.newImage("imagem/saidaAzul.png")
saida2.x = display.contentWidth/2
saida2.y = display.contentHeight/12
physics.addBody(saida2, "static", {bounce = 0.1,friction = 1.0})
saida2.myname="azul"

local saida3 = display.newImage("imagem/saidaVerde.png")
saida3.x = display.contentWidth/2.7
saida3.y = display.contentHeight/12
physics.addBody(saida3, "static", {bounce = 0.1,friction = 1.0})
saida3.myname="verde"

local saida4 = display.newImage("imagem/saidaVermelho.png")
saida4.x = display.contentWidth/4
saida4.y = display.contentHeight/12
physics.addBody(saida4, "static", {bounce = 0.1,friction = 1.0})
saida4.myname="vermelho"

local saida5 = display.newImage("imagem/saidaAmarelo.png")
saida5.x = display.contentWidth/1.6
saida5.y = display.contentHeight/12
physics.addBody(saida5, "static", {bounce = 0.1,friction = 1.0})
saida5.myname="amarelo"

local saida6 = display.newImage("imagem/saidaCinza.png")
saida6.x = display.contentWidth/1.3
saida6.y = display.contentHeight/12
physics.addBody(saida6, "static", {bounce = 0.1,friction = 1.0})
saida6.myname="cinza"
saida6.numero=9

local mover = function(x,y,w,z,k)
	function swapPosition( imgA, imgB)
		tempX, tempY = imgA.x, imgA.y
		imgA.x, imgA.y = imgB.x, imgB.y
		imgB.x, imgB.y = tempX, tempY
	end
	function ponto_x1()
		transition.to( x, {time=5000, swapPosition( x, y), y=60, onComplete = ponto_x2})
	end

	function ponto_x2()
		transition.to( x, {time=2000, y=-629, onComplete = ponto_x1})
	end

	function ponto_x3()
		transition.to( y, {time=4000, y=60, onComplete = ponto_x4})
	end

	function ponto_x4()
		transition.to( y, {time=3000, y=-629, onComplete = ponto_x3})
	end

	function ponto_x5()
		transition.to( w, {time=2000, y=60, swapPosition( w,k), onComplete = ponto_x6})
	end

	function ponto_x6()
		transition.to( w, {time=6000, y=-629, onComplete = ponto_x5})
	end

	function ponto_x7()
		transition.to( z, {time=5000, y=60, swapPosition( z,x), onComplete = ponto_x8})
	end

	function ponto_x8()
		transition.to( z, {time=4200, y=-629, onComplete = ponto_x7})
	end

	function ponto_x9()
		transition.to( k, {time=2000, y=60,  onComplete = ponto_x10})
	end

	function ponto_x10()
		transition.to( k, {time=3000, y=-629, onComplete = ponto_x9})
	end

	ponto_x1()
	ponto_x3()
	ponto_x5()
	ponto_x7()
	ponto_x9()
end

mover(saida2,saida3,saida4,saida5,saida6)


local mover2 = function(x,y,z)

	function swapPosition( imgA, imgB)
		tempX, tempY = imgA.x, imgA.y
		imgA.x, imgA.y = imgB.x, imgB.y
		imgB.x, imgB.y = tempX, tempY
	end
	function ponto_x11()
		transition.to( x, {time=3000, swapPosition( x, y), x=60, onComplete = ponto_x22})
	end

	function ponto_x22()
		transition.to( x, {time=2000, x=-629, onComplete = ponto_x11})
	end

	function ponto_x33()
		transition.to( y, {time=4000, x=60, onComplete = ponto_x44})
	end

	function ponto_x44()
		transition.to( y, {time=3500, x=-629, onComplete = ponto_x33})
	end

	function ponto_x55()
		transition.to( z, {time=5000, swapPosition( y, z), x=60, onComplete = ponto_x66})
	end

	function ponto_x66()
		transition.to( z, {time=4500, x=-629, onComplete = ponto_x55})
	end

	ponto_x11()
	ponto_x33()
	ponto_x55()
end

local mover3 = function(x,y,z)

	function swapPosition( imgA, imgB)
		tempX, tempY = imgA.x, imgA.y
		imgA.x, imgA.y = imgB.x, imgB.y
		imgB.x, imgB.y = tempX, tempY
	end
	function ponto_x77()
		transition.to( x, {time=3000, swapPosition(x,y), x=910, onComplete = ponto_x88})
	end

	function ponto_x88()
		transition.to( x, {time=3500, x=1950, onComplete = ponto_x77})
	end

	function ponto_x99()
		transition.to( y, {time=4000, x=910, onComplete = ponto_x100})
	end

	function ponto_x100()
		transition.to( y, {time=2000, x=1950, onComplete = ponto_x99})
	end

	function ponto_x110()
		transition.to( z, {time=5000, swapPosition(y,z), x=910, onComplete = ponto_x120})
	end

	function ponto_x120()
		transition.to( z, {time=6000, x=1950, onComplete = ponto_x110})
	end

	ponto_x77()
	ponto_x99()
	ponto_x110()
end

mover2(saidaLado4,saidaLado5,saidaLado6)
mover3(saidaLado,saidaLado2,saidaLado3)



--------------------------------------------------------------------------------

local scene = composer.newScene( sceneName )
local pontos = 0


--local backgroundMusic = audio.loadStream("sounds/jogo.mp3")

--local backgroundMusicChannel = audio.play( backgroundMusic, { channel=15, loops=15, fadein=5000 } )
---------------------------------------------------------------------------------

function scene:create( event )

    local sceneGroup = self.view

    local target = display.newImage( "imagem/target.png" )
    target:scale( 0.25, 0.25 )

    function shootPlasma( event )
		local teste1

		local function bringToFront10( event )
		end
		local function bringToFront9( event )
		end

		local function trocarCores (objeto1)
			cores = objeto1
		end


				local sinal1 = display.newImage("imagem/circuloLilaz.png")
				sinal1.x = display.contentWidth/2
				sinal1.y = display.contentHeight/1.1
				physics.addBody(sinal1, "static", {bounce = 0.1,friction = 1.0})
				sinal1.myname="lilaz"
				sinal1.numero=1

				local sinal2 = display.newImage("imagem/circuloAzul.png")
				sinal2.x = display.contentWidth/2
				sinal2.y = display.contentHeight/1.1
				physics.addBody(sinal2, "static", {bounce = 0.1,friction = 1.0})
				sinal2.myname="azul"
				sinal2.numero=2

				local sinal3 = display.newImage("imagem/circuloAmarelo.png")
				sinal3.x = display.contentWidth/2
				sinal3.y = display.contentHeight/1.1
				physics.addBody(sinal3, "static", {bounce = 0.1,friction = 1.0})
				sinal3.myname="amarelo"
				sinal3.numero=3

				local sinal4 = display.newImage("imagem/circuloVerde.png")
				sinal4.x = display.contentWidth/2
				sinal4.y = display.contentHeight/1.1
				physics.addBody(sinal4, "static", {bounce = 0.1,friction = 1.0})
				sinal4.myname="verde"
				sinal4.numero=4

				local sinal5 = display.newImage("imagem/circuloVermelho.png")
				sinal5.x = display.contentWidth/2
				sinal5.y = display.contentHeight/1.1
				physics.addBody(sinal5, "static", {bounce = 0.1,friction = 1.0})
				sinal5.myname="vermelho"
				sinal5.numero=5

				local sinal6 = display.newImage("imagem/circuloMarfin.png")
				sinal6.x = display.contentWidth/2
				sinal6.y = display.contentHeight/1.1
				physics.addBody(sinal6, "static", {bounce = 0.1,friction = 1.0})
				sinal6.myname="marfin"
				sinal6.numero=6

				local sinal7 = display.newImage("imagem/circuloMarron.png")
				sinal7.x = display.contentWidth/2
				sinal7.y = display.contentHeight/1.1
				physics.addBody(sinal7, "static", {bounce = 0.1,friction = 1.0})
				sinal7.myname="marron"
				sinal7.numero=7

				local sinal8 = display.newImage("imagem/circuloRosa.png")
				sinal8.x = display.contentWidth/2
				sinal8.y = display.contentHeight/1.1
				physics.addBody(sinal8, "static", {bounce = 0.1,friction = 1.0})
				sinal8.myname="rosa"
				sinal8.numero = 8

				local sinal9 = display.newImage("imagem/circuloGraviola.png")
				sinal9.x = display.contentWidth/2
				sinal9.y = display.contentHeight/1.1
				physics.addBody(sinal9, "static", {bounce = 0.1,friction = 1.0})
				sinal9.myname="graviola"
				sinal9.numero= 9

				local sinal10 = display.newImage("imagem/circuloCinza.png")
				sinal10.x = display.contentWidth/2
				sinal10.y = display.contentHeight/1.1
				physics.addBody(sinal10, "static", {bounce = 0.1,friction = 1.0})
				sinal10.myname="cinza"
				sinal10.numero=10

				local sinal11 = display.newImage("imagem/circuloLaranja.png")
				sinal11.x = display.contentWidth/2
				sinal11.y = display.contentHeight/1.1
				physics.addBody(sinal11, "static", {bounce = 0.1,friction = 1.0})
				sinal11.myname="laranja"
				sinal11.numero=11

		local function plasmaTeste (objeto)
			local function onLocalCollision( self, event )
				if ( event.phase == "began" and cores == 11) then
					objeto:removeSelf()

				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision2( self, event )
				if ( event.phase == "began" and cores == 1) then
					objeto:removeSelf()
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision3( self, event )
				if ( event.phase == "began" and cores == 8) then
					objeto:removeSelf()

				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision4( self, event )
				if ( event.phase == "began" and cores == 7) then
					objeto:removeSelf()

				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision5( self, event )
				if ( event.phase == "began" and cores == 6) then
					objeto:removeSelf()

				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision6( self, event )
				if ( event.phase == "began" and cores == 9) then
					objeto:removeSelf()
					pontos = pontos + 10
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision7( self, event )
				if ( event.phase == "began" and cores == 2) then
					objeto:removeSelf()
					pontos = pontos + 10
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision8( self, event )
				if ( event.phase == "began" and cores == 4) then
					objeto:removeSelf()
					pontos = pontos + 10
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision9( self, event )
				if ( event.phase == "began" and cores == 5) then
					objeto:removeSelf()
					pontos = pontos + 10
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision10( self, event )
				if ( event.phase == "began" and cores == 3) then
					objeto:removeSelf()
					pontos = pontos + 10
				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision11( self, event )
				if ( event.phase == "began" and cores == 10) then
					objeto:removeSelf()
					pontos = pontos + 10

				else
					objeto:removeSelf()
					contaVidas()
				end
			end

			saidaLado.collision = onLocalCollision
			saidaLado:addEventListener( "collision" )

			saidaLado2.collision = onLocalCollision2
			saidaLado2:addEventListener( "collision" )

			saidaLado3.collision = onLocalCollision3
			saidaLado3:addEventListener( "collision" )

			saidaLado4.collision = onLocalCollision4
			saidaLado4:addEventListener( "collision" )

			saidaLado5.collision = onLocalCollision5
			saidaLado5:addEventListener( "collision" )

			saidaLado6.collision = onLocalCollision6
			saidaLado6:addEventListener( "collision" )

			saida2.collision = onLocalCollision7
			saida2:addEventListener( "collision" )

			saida3.collision = onLocalCollision8
			saida3:addEventListener( "collision" )

			saida4.collision = onLocalCollision9
			saida4:addEventListener( "collision" )

			saida5.collision = onLocalCollision10
			saida5:addEventListener( "collision" )

			saida6.collision = onLocalCollision11
			saida6:addEventListener( "collision" )
		end

		local vetor = {}
		vetor[0] = 0
		vetor[1] = 1
		vetor[2] = 2
		vetor[3] = 3
		vetor[4] = 4
		vetor[5] = 5
		vetor[6] = 6
		vetor[7] = 7
		vetor[8] = 8
		vetor[9] = 9
		vetor[10] = 10

		local index = math.random (0,10)
		teste1 = vetor[index]

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

            local showTarget = transition.to( target, { alpha=0.4, xScale=0.4, yScale=0.4, time=4000 } )
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

                local hideTarget = transition.to( target, { alpha=0, xScale=1.0, yScale=1.0, time=4000, onComplete=stopRotation } )

                if ( myLine ) then
                    myLine.parent:remove( myLine )
                end
				local plasma = display.newImage( "imagem/bola.png" )
				plasma.width = 65
				plasma.height = 65
				plasma.x = t.x
				plasma.y = t.y
				physics.addBody( plasma, {bounce = 0.9, radius = 25, friction = 3.0} )
				plasma:applyForce( 70*(t.x - event.x), 70*(t.y - event.y), t.x, t.y )


		local function matheus (event)

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

				local showTarget = transition.to( target, { alpha=0.4, xScale=0.4, yScale=0.4, time=4000 } )
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

					local hideTarget = transition.to( target, { alpha=0, xScale=1.0, yScale=1.0, time=4000, onComplete=stopRotation } )

					if ( myLine ) then
						myLine.parent:remove( myLine )
					end

					local plasma = display.newImage( "imagem/bola.png" )
					plasma.width = 65
					plasma.height = 65
					plasma.x = t.x
					plasma.y = t.y
					physics.addBody( plasma, {bounce = 0.9, radius = 25, friction = 3.0} )
					plasma:applyForce( 70*(t.x - event.x), 70*(t.y - event.y), t.x, t.y )


					local function onLocalCollision( self, event )
						if ( event.phase == "ended") then
							plasmaTeste(plasma)
						end
					end

				plasma.collision = onLocalCollision
				plasma:addEventListener( "collision" )
				end
			end
		end

				local function bringToFront3( event )
					if ( event.phase == "began" ) then
						sinal3:toFront()
						trocarCores (3)
						sinal3:addEventListener( "touch", matheus)
						sinal3:addEventListener( "touch", bringToFront10 )
					end
					return true
				end

				local function bringToFront5( event )
					if ( event.phase == "began" ) then
						sinal5:toFront()
						trocarCores (5)
						sinal5:addEventListener( "touch", matheus)
						sinal5:addEventListener( "touch", bringToFront3 )
					end
					return true
				end

				local function bringToFront4( event )
					if ( event.phase == "began" ) then
						sinal4:toFront()
						trocarCores (4)
						sinal4:addEventListener( "touch", matheus)
						sinal4:addEventListener( "touch", bringToFront5 )
					end
					return true
				end

				local function bringToFront8( event )
					if ( event.phase == "began" ) then
						sinal8:toFront()
						trocarCores (8)
						sinal8:addEventListener( "touch", matheus)
						sinal8:addEventListener( "touch", bringToFront4 )
					end
					return true
				end

				local function bringToFront2( event )
					if ( event.phase == "began" ) then
						sinal2:toFront()
						trocarCores (2)
						sinal2:addEventListener( "touch", matheus)
						sinal2:addEventListener( "touch", bringToFront8 )
					end
					return true
				end

				local function bringToFront7( event )
					if ( event.phase == "began" ) then
						sinal7:toFront()
						trocarCores (7)
						sinal7:addEventListener( "touch", matheus)
						sinal7:addEventListener( "touch", bringToFront2 )
					end
					return true
				end

				local function bringToFront1( event )
					if ( event.phase == "began" ) then
						sinal1:toFront()
						trocarCores (1)
						sinal1:addEventListener( "touch", matheus)
						sinal1:addEventListener( "touch", bringToFront7 )
					end
					return true
				end

				local function bringToFront6( event )
					if ( event.phase == "began" ) then
						sinal6:toFront()
						trocarCores (6)
						sinal6:addEventListener( "touch", matheus)
						sinal6:addEventListener ("touch" , bringToFront1 )
					end
					return true
				end

				function bringToFront9( event )
					if ( event.phase == "began" ) then
						sinal9:toFront()
						trocarCores (9)
						sinal9:addEventListener( "touch", matheus)
						sinal9:addEventListener ("touch" , bringToFront6 )
					end
					return true
				end

				function bringToFront10( event )
					if ( event.phase == "began") then
						sinal10:toFront()
						trocarCores (10)
						sinal10:addEventListener ("touch", matheus)
						sinal10:addEventListener( "touch", bringToFront9)
					end
					return true
				end



				if (teste1==0) then
					sinal11: addEventListener( "touch", matheus )
				end

				if (teste1==1) then
					sinal10:addEventListener("touch", bringToFront10)
				end

				if (teste1==2) then
					sinal9:addEventListener( "touch", matheus)
					sinal9:addEventListener("touch", bringToFront9)
				end

				if (teste1==3) then
					sinal8:addEventListener("touch", bringToFront8)
				end

				if (teste1==4) then
					sinal7:addEventListener("touch", bringToFront7)
				end

				if (teste1==5) then
					sinal6:addEventListener("touch", bringToFront6)
				end

				if (teste1==6) then
					sinal5:addEventListener("touch", bringToFront5)
				end

				if (teste1==7) then
					sinal4:addEventListener("touch", bringToFront4)
				end

				if (teste1==8) then
					sinal3:addEventListener("touch", bringToFront3)
				end

				if (teste1==9) then
					sinal2:addEventListener("touch", bringToFront2)
				end

				if (teste1==10) then
					sinal1:addEventListener("touch", bringToFront1)
				end
----------------------------------------------------------------------------------	--------------------------------------
			local function onLocalCollision( self, event )
				if ( event.phase == "began" and cores == 11) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision2( self, event )
				if ( event.phase == "began" and cores == 1) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision3( self, event )
				if ( event.phase == "began" and cores == 8) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision4( self, event )
				if ( event.phase == "began" and cores == 7) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision5( self, event )
				if ( event.phase == "began" and cores == 6) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision6( self, event )
				if ( event.phase == "began" and cores == 9) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision7( self, event )
				if ( event.phase == "began" and cores == 2) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision8( self, event )
				if ( event.phase == "began" and cores == 4) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision9( self, event )
				if ( event.phase == "began" and cores == 5) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision10( self, event )
				if ( event.phase == "began" and cores == 3) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			local function onLocalCollision11( self, event )
				if ( event.phase == "began" and cores == 10) then
					plasma:removeSelf()
					pontos = pontos + 10
				else
					plasma:removeSelf()
					contaVidas()
				end
			end

			saidaLado.collision = onLocalCollision
			saidaLado:addEventListener( "collision" )

			saidaLado2.collision = onLocalCollision2
			saidaLado2:addEventListener( "collision" )

			saidaLado3.collision = onLocalCollision3
			saidaLado3:addEventListener( "collision" )

			saidaLado4.collision = onLocalCollision4
			saidaLado4:addEventListener( "collision" )

			saidaLado5.collision = onLocalCollision5
			saidaLado5:addEventListener( "collision" )

			saidaLado6.collision = onLocalCollision6
			saidaLado6:addEventListener( "collision" )

			saida2.collision = onLocalCollision7
			saida2:addEventListener( "collision" )

			saida3.collision = onLocalCollision8
			saida3:addEventListener( "collision" )

			saida4.collision = onLocalCollision9
			saida4:addEventListener( "collision" )

			saida5.collision = onLocalCollision10
			saida5:addEventListener( "collision" )

			saida6.collision = onLocalCollision11
			saida6:addEventListener( "collision" )

			end
        end
		local function incrementaTexto (event)
			scores.text = math.floor (pontos)
		end
		Runtime:addEventListener( "enterFrame", incrementaTexto )
		return true
		-- Stop further propagation of touch event

    end

	local start = display.newImage("imagem/start.png")
	start.x = display.contentWidth/2
	start.y = display.contentHeight/1.1
	physics.addBody(start, "static", {bounce = 0.1,friction = 1.0})
	start.myname="start"
	start.numero=12

	start:addEventListener( "touch", shootPlasma)

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

end

---------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------


return scene
