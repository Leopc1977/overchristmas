player = {}

myCollisions = require("collisions")
myMap = require ("map")
myLib = require("lib")
myGameRessources = require("gameRessources")

--METTRE DANS RESSOURCES
player.walk = {}
player.walk[1] = love.graphics.newImage("images/sprite/Walk (1).png")
player.x = 100
player.y = 100
player.width = player.walk[1]:getWidth()
player.height = player.walk[1]:getHeight()
player.scaleX = 0.15
player.scaleY = 0.15

dt = 1/60

windowWidth = 1152
windowHeight = 704

buttonState = "" -- a supprimer peut etre 

player.state = {}
player.state.toy = false
player.state.gift = false
player.state.normal = true

drawCond = {}
drawCond.toy = false
drawCond.gift = false

--player param
local col = math.floor(player.x/myMap.TILE_SIZE) + 1
local lig = math.floor(player.y/myMap.TILE_SIZE) + 1
local id = map.Map.toy[lig][col]

-- A SUPPRIMER LOG
nbGift = 0

function player.load()



end

function player.update()

	player.oldX = player.x
	player.oldY = player.y

	  	if love.keyboard.isDown("up") or love.keyboard.isDown("z") or love.keyboard.isDown("w") then
	  		player.y = player.y - 400 * dt
	  		buttonState = "up"
		end

	  	if love.keyboard.isDown("down") or love.keyboard.isDown("s") or love.keyboard.isDown("s")then
	  		player.y = player.y + 400 * dt
	  		buttonState = "down"
		end  

		if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
	  		player.x = player.x + 400 * dt
	  		buttonState = "right"
		end

		if love.keyboard.isDown("left") or love.keyboard.isDown("q") or love.keyboard.isDown("a") then
	  		player.x = player.x - 400 * dt
	  		buttonState = "left"
		end

	player.x = math.floor(player.x)
	player.y = math.floor(player.y)

	if player.x < 0 then
		player.x = windowHeight
	end
	if player.x > windowHeight then
		player.x = 0
	end
	if player.y < 0 then
		player.y = windowWidth
	end
	if player.y > windowWidth then
		player.y = 0
	end

	local col = math.floor(player.x/myMap.TILE_SIZE) + 1
	local lig = math.floor(player.y/myMap.TILE_SIZE) + 1
	player.id = map.Map.toy[lig][col]

	--TOY
	if player.id == 2 or
		player.id == 3 or
		player.id == 3 or
		player.id == 5 or
		player.id == 6 then
				player.state.toy = true --etat -> jouet
				drawCond.toy = true -- dessine jouet
				print("trace toy")
	end

	if player.id == 7 or
		player.id == 8 or 
		player.id == 9 then
			player.state.gift = true
			drawCond.gift = true
			print("trace gift")
	end

end

function player.draw()

	love.graphics.draw(player.walk[1], player.x, player.y,0,player.scaleX, player.scaleY,player.width/2,player.height/2)

	--player param
	local col = math.floor(player.x/myMap.TILE_SIZE) + 1
	local lig = math.floor(player.y/myMap.TILE_SIZE) + 1
	local id = map.Map.toy[lig][col]
	love.graphics.print("ID:"..tostring(id),1,1)

	love.graphics.print(player.x,1,10)
	love.graphics.print(player.y,1,20)

	--mouse param
	x, y = love.mouse.getPosition()
	local col = math.floor(x/myMap.TILE_SIZE) + 1
	local lig = math.floor(y/myMap.TILE_SIZE) + 1

	if col>0 and col<=map.MAP_WIDTH and lig>0 and lig<=map.MAP_HEIGHT then
		local id = map.Map.toy[lig][col]
		love.graphics.print("ID:"..tostring(id),50,1)
		love.graphics.print("x:"..tostring(x),50,20)
		love.graphics.print("y:"..tostring(y),50,30)
	end

	if drawCond.toy == true then
		love.graphics.draw(love.graphics.newImage("images/objects/voiture.png"), player.x,player.y,0, gameRessources.scaleX, gameRessources.scaleY)
	end

	if drawCond.gift == true then
		love.graphics.draw(myGameRessources.gift.blue.img,player.x,player.y,0,gameRessources.scaleX,gameRessources.scaleY)
	end		

end

return player