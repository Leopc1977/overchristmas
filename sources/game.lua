game = {}

myMap = require("map")
myPlayer = require("player")

function game.load()
	
	windowHeight = myMap.TILE_SIZE*myMap.MAP_WIDTH
	windowWidth = myMap.TILE_SIZE*myMap.MAP_HEIGHT
	print (windowHeight)
	print(windowWidth)

	myMap.load()
	myPlayer.load()

end

function game.update(dt)
	
	myMap.update()
	myPlayer.update()

end

function game.draw()
	
	myMap.draw()
	myPlayer.draw()

  local n
  for n=1,#liste_sprites do
    local s = liste_sprites[n]
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end

end

return game