player = {}

myMap = require ("map")
myLib = require("lib")

player.walk = {}
player.walk[1] = love.graphics.newImage("images/sprite/Walk (1).png")

dt = 1/60

windowWidth = 1152
windowHeight = 704

buttonState = ""

myGameRessources = require("gameRessources")

function player.load()

player.x = 100
player.y = 100
player.width = player.walk[1]:getWidth()
player.height = player.walk[1]:getHeight()
player.scaleX = 0.15
player.scaleY = 0.15
player.state = "walk"

--myLib.CreeSprite("sprite","Walk (1)", player.x,player.y )

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

    if myMap.isSolid(id) then

        print("collision avec une tuile solide !!")
	     if tileType == "tableVGUn" or
	     tileType == "tableVGDeux" or
	     tileType == "tableVGTrois" or
	     tileType == "tableVGQuatre" then
	     if player.state ~= "keep" then
	     	myLib.CreeSprite(objects,myLib.giftBlue, pX, pY)
	     end

    end
end

end

function player.draw()

	--love.graphics.draw(player.walk[1], player.x, player.y,0,player.scaleX, player.scaleY,player.width/2,player.height/2)

	love.graphics.print(player.x,1,10)
	love.graphics.print(player.y,1,20)

	x, y = love.mouse.getPosition( )
	local col = math.floor(x/myMap.TILE_SIZE) + 1
	local lig = math.floor(y/myMap.TILE_SIZE) + 1

	if col>0 and col<=map.MAP_WIDTH and lig>0 and lig<=map.MAP_HEIGHT then
		id = map.Map.table[lig][col]
		love.graphics.print("ID:"..tostring(id),1,1)
		love.graphics.print("x:"..tostring(x),1,30)
		love.graphics.print("y:"..tostring(y),1,40)
	end

  	for n=1,#myLib.liste_sprites do
  	  local s = lib.liste_sprites[n]
   	 love.graphics.draw(s.image, s.x, s.y, 0, player.scaleX, player.scaleY, s.l/2, s.h/2)
 	 end

end

return player