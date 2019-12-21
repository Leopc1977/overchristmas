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

end

function game.update(dt)
	
	if myHome.cond == true then
		myHome.update()
	else
		player.update()
		map.update()
		print("trace map/update up")
	end

end

function game.draw()

	if myHome.cond == true then
		myHome.draw()
	else
		player.draw()
		map.draw()
	end

end

return game