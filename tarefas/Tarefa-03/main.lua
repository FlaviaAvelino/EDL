larguraTela = love.graphics.getWidth()
alturaTela = love.graphics.getHeight()

function love.load()

--Fonte
 love.graphics.setFont(love.graphics.newFont(40))

--Fonte
 
 --Background
 fundo = love.graphics.newImage("imagens/flamengo.png")
 fundoDois = love.graphics.newImage("imagens/flamengo.png")
	
	planoDeFundo ={
		x = 0,
		y = 0,
		y2 = 0 - fundo:getHeight(),
		vel = 0
	}
 --Background
 
 --Musica
	musica = love.audio.newSource("sons/hino-Flamengo.wav")
	musica: play()
	musica:setLooping( true )
 
 --Musica
end

function love.update(dt)


end

function love.draw()

   --Background
	love.graphics.draw( fundo, planoDeFundo.y)
	love.graphics.draw(fundoDois, planoDeFundo.x, planoDeFundo.y2)
	--Background

	
	--Frase
	 love.graphics.print("O MELHOR DO MUNDO", 100, 100)
	
end
