-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")
-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

myGame = require("game")
myMap = require("map")

windowWidth = myMap.TILE_SIZE*myMap.MAP_WIDTH
windowHeight = myMap.TILE_SIZE*myMap.MAP_HEIGHT

function love.load()

	love.window.setMode(windowWidth, windowHeight)
	myGame.load()

end


function love.update()
	
	myGame.update()

end


function love.draw()
	
	myGame.draw()

end