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

end

return game