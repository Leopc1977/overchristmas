player = {}

myMap = require ("map")

player.walk = {}
player.walk[1] = love.graphics.newImage("images/sprite/Walk (1).png")

dt = 1/60

windowWidth = 1152
windowHeight = 704

function player.load()

player.x = 100
player.y = 100
player.width = player.walk[1]:getWidth()
player.height = player.walk[1]:getHeight()
player.scaleX = 0.15
player.scaleY = 0.15

end

function player.update()

	player.oldX = player.x
	player.oldY = player.y

	  	if love.keyboard.isDown("up") then
	  		player.y = player.y - 400 * dt
		end

	  	if love.keyboard.isDown("down") then
	  		player.y = player.y + 400 * dt
		end  

		if love.keyboard.isDown("right") then
	  		player.x = player.x + 400 * dt
		end

		if love.keyboard.isDown("left") then
	  		player.x = player.x - 400 * dt
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

	local x = love.mouse.getX()
	local y = love.mouse.getY()
	local col = math.floor(player.x/myMap.TILE_SIZE) + 1
	local lig = math.floor(player.y/myMap.TILE_SIZE) + 1

	if col>0 and col<=map.MAP_WIDTH and lig>0 and lig<=map.MAP_HEIGHT then
		id = map.Map.floor[lig][col]
		love.graphics.print("ID:"..tostring(id),1,1)
	end

    --[[if myMap.isSolid(id) then
        print("collision avec une tuile solide !!")
    	player.x = player.oldX
        player.y = player.oldY 
    end]]--

end

function player.draw()

	love.graphics.draw(player.walk[1], player.x, player.y,0,player.scaleX, player.scaleY)--,player.width/2,player.height/2)
	love.graphics.print(player.x,1,10)
	love.graphics.print(player.y,1,20)
end

return player