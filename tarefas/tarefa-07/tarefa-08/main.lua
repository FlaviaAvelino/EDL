larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

function love.load()
	--Cupcake
	imgCupcake = love.graphics.newImage("imagens/fadacupcake.png")
	
	cupcake = {
		posX = larguraTela / 2,
		posY = alturaTela / 2,
		velocidade = 200
	}
	--Cupcake
	
	--Tiros
	atira = true
	delayTiro = 0.1
	tempoateAtirar = delayTiro
	tiros = {}
	imgTiro = love.graphics.newImage("imagens/bullet.png")
	--Tiros
	
	--Inimigos
	delayInimigo = 0.6
	tempoCriarInimigo = delayInimigo
	imgInimigo = love.graphics.newImage("imagens/inimigo.png")
	inimigos = {}
	--Inimigos
	
	--Vidas e pontuação
	estaVivo = true
	pontos = 0
	--Vidas e pontuação
	
	--Background
	fundo = love.graphics.newImage("imagens/background.png")
	fundoDois = love.graphics.newImage("imagens/background.png")
	
	
	planoDeFundo ={
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 0
	}
	--Background
	
	--Sons do jogo
	somDoTiro = love.audio.newSource("sons/sombala.wav", "static")
	musica = love.audio.newSource("sons/musicajogo.wav")
	musica: play()
	musica:setLooping( true )
	--Sons do jogo
	
	--Tela Inicial
	abreTela = false
	telaTitulo = love.graphics.newImage("imagens/TelaInicial.png")
	inOutX = 0
	inOutY = 0 
	--Tela Inicial
	
	--Cookie--
	cookie = love.graphics.newImage("imagens/cookie.png")
end

--TAREFA-08: Aqui está sendo utilizado o conceito de co rotina e de
--closure para fazer um objeto fazer um movimento retangular na tela, 
--neste caso a imagem de um cookie foi inserida no jogo.

function new (x,y,vx)
    local me; me = {
        move = function (dx,dy)
             x = x + dx
             y = y + dy
             return x, y
        end,
        get = function ()
             return x, y
        end,
		
		-- Tarefa 08 corotina--
        co = coroutine.create(function (dt)
            while true do
                if(x < 200 and y == 50) then
                    me.move(vx*dt, 0)
                end
                if(x == 200 and y < 150) then
                    me.move(0, vx*dt)
                end
                if(x > 100 and y == 150) then
                    me.move(vx*dt*(-1), 0)
                end
                if(x == 100 and y > 50) then
                    me.move(0, vx*dt*(-1)) 
                end 

		if(x > 200) then
			x=200
		end
		if(x < 100) then
			x=100
		end
		if(y > 150) then
			y=150
		end
		if(y < 50) then
			y=50
		end
                dt = coroutine.yield()
            end
        end),
    }
    return me
end

local o1 = new(0,  290,  100) -- Tarefa08



function love.update( dt )

	movimentos (dt)
	atirar(dt)
	inimigo(dt)
	colisoes()
	reset()
	planoDeFundoScrolling(dt)
	iniciajogo(dt)
	coroutine.resume(o1.co, dt) --Tarefa08
	
	
	
end


function love.draw()

	--Background
	love.graphics.draw( fundo, planoDeFundo.y)
	love.graphics.draw(fundoDois, planoDeFundo.x, planoDeFundo.y2)
	--Background
	
	--Tiros
	for i, tiro in ipairs( tiros ) do
		love.graphics.draw( tiro.img, tiro.x, tiro.y, 0, 1, 1, imgTiro:getWidth() / 2, imgTiro:getHeight())
	end
	--Tiros	
	
	--Inimigos 
	for i, inimigo in ipairs( inimigos ) do
		love.graphics.draw( inimigo.img, inimigo.x, inimigo.y)
	end
	--Inimigos
	
	--Score
	love.graphics.print('Pontuacao: ' .. tostring(pontos), 10, 10)
	--Score
	
	-- Game over e reset
	if estaVivo then
		love.graphics.draw( imgCupcake, cupcake.posX, cupcake.posY, 0, 1, 1, imgCupcake:getWidth() / 2, imgCupcake:getHeight() / 2 )
	else
		love.graphics.draw(telaTitulo, inOutX, inOutY )
	end
	
	-- Game over e reset
	
	
	local x,y = o1.get()
	love.graphics.draw(cookie, x, y,cookie.x,cookie.y)
	
	end

function atirar (dt)
	tempoateAtirar = tempoateAtirar - ( 1 * dt)
	if tempoateAtirar < 0 then
		atira = true
	end
	
	if estaVivo then
		if love.keyboard.isDown("space") and atira then
			novoTiro = { x = cupcake.posX, y = cupcake.posY, img = imgTiro}
			table.insert(tiros, novoTiro)
			somDoTiro: stop()
			somDoTiro: play()
			atira = false
			tempoateAtirar = delayTiro	
		end
	
	end
	for i, tiro in ipairs( tiros ) do
		tiro.y = tiro.y - ( 500 * dt )
		if tiro.y < 0 then
			table.remove(tiros, i )
		
		end 
	end

end
function movimentos (dt)
if love.keyboard.isDown( "right" )then
		if cupcake.posX < (larguraTela - imgCupcake:getWidth() / 2 ) then
		   cupcake.posX = cupcake.posX + cupcake.velocidade * dt
		end
	end
	
	if love.keyboard.isDown( "left" )then
		if cupcake.posX > (0 + imgCupcake:getWidth() / 2 ) then
			cupcake.posX = cupcake.posX - cupcake.velocidade * dt
		end
	end
	
	if love.keyboard.isDown( "up" )then
		if cupcake.posY > (0 + imgCupcake:getHeight() / 2 ) then
			cupcake.posY = cupcake.posY - cupcake.velocidade * dt
		end
	end
	
	if love.keyboard.isDown( "down" )then
		if cupcake.posY < (alturaTela - imgCupcake:getHeight() / 2 ) then
			cupcake.posY = cupcake.posY + cupcake.velocidade * dt
		end	
	end

end
function inimigo(dt)
	tempoCriarInimigo = tempoCriarInimigo - ( 1 * dt )
		if tempoCriarInimigo < 0 then
			tempoCriarInimigo = delayInimigo
			numeroAleatorio = math.random (10, love.graphics.getWidth() - ((imgInimigo:getWidth() / 2) + 10))
			novoInimigo = { x = numeroAleatorio, y = -imgInimigo:getWidth(), img = imgInimigo}
			table.insert(inimigos, novoInimigo)
		end
		
	for i, inimigo in ipairs( inimigos ) do 
		inimigo.y = inimigo.y + (200 * dt)
		if inimigo.y > 850 then
			table.remove(inimigos, i)
		end
	end
end
function colisoes()
	for i, inimigo in ipairs ( inimigos ) do
		for j, tiro in ipairs (tiros) do
			if checaColisao( inimigo.x, inimigo.y, imgInimigo:getWidth(), imgInimigo:getHeight(), tiro.x, tiro.y, imgTiro:getWidth(), imgTiro:getHeight())then
				table.remove( tiros, j )
				table.remove (inimigos, i)
				pontos = pontos + 1
			end 
		end 
		if checaColisao( inimigo.x, inimigo.y, imgInimigo:getWidth(), imgInimigo:getHeight(), cupcake.posX - (imgCupcake:getWidth() / 2), cupcake.posY, imgCupcake: getWidth(), imgCupcake:getHeight()) and estaVivo then
			table.remove(inimigos, i)
			estaVivo = false
			abreTela = false
		end
		
	end
end

function checaColisao(x1, y1, w1, h1, x2, y2, w2, h2)

	return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1 

end

function reset()
	if not estaVivo and love.keyboard.isDown('return') then
		tiros ={}
		inimigos = {}
		atira = tempoateAtirar
		tempoCriarInimigo = delayInimigo
	 
		cupcake.posX = larguraTela / 2
		cupcake.posY = alturaTela / 2 
		
		pontos = 0
		abreTela = true
		
		
	end

end

function planoDeFundoScrolling(dt)

	planoDeFundo.y = planoDeFundo.y + planoDeFundo.vel * dt
	planoDeFundo.y2 = planoDeFundo.y2 + planoDeFundo.vel * dt
	
	if planoDeFundo.y > alturaTela then
		planoDeFundo.y = planoDeFundo.y2 - fundoDois:getHeight()
	end
	if planoDeFundo.y2 > alturaTela then
		planoDeFundo.y2 = planoDeFundo.y - fundo:getHeight()
	end
	
end

function iniciajogo(dt)
	if abreTela and not estaVivo then
	
	
		inOutX = inOutX +600 * dt
		if inOutX >481 then
			inOutY = -701
			inOutX = 0
			estaVivo = true
		end
	elseif not abreTela then
		estaVivo = false
		inOutY = inOutY + 600 * dt
		if inOutY > 0 then
			inOutY = 0
		
		end
	end

end
