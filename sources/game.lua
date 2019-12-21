game = {}

myMap = require("map")
myPlayer = require("player")
myLib = require("lib")
myHome = require("home")

function game.load()
	
	windowHeight = myMap.TILE_SIZE*myMap.MAP_WIDTH
	windowWidth = myMap.TILE_SIZE*myMap.MAP_HEIGHT
	print (windowHeight)
	print(windowWidth)

	myMap.load()
	myPlayer.load()

	myHome.load()

	--myLib.init(1)

end

function game.update(dt)
	
	myHome.update()

end

function game.draw()

	myHome.draw()

end

return game