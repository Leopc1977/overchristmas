game = {}

myMap = require("map")
myPlayer = require("player")

function game.load()
	
	myMap.load()
	myPlayer.load()

end

function game.update(dt)
	
	myMap.update()
	myPlayer.update(dt)

end

function game.draw()
	
	myMap.draw()
	myPlayer.draw()

end

return game