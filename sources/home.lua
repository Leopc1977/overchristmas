home = {}

home.cond = true
windowHeight = myMap.TILE_SIZE*myMap.MAP_WIDTH
windowWidth = myMap.TILE_SIZE*myMap.MAP_HEIGHT

play = {}
quit = {}

play.img = love.graphics.newImage("images/home/play.png")
play.x = windowHeight/2
play.y = windowWidth/2
play.width = play.img:getWidth()
play.height = play.img:getHeight()

quit.img = love.graphics.newImage("images/home/quit.png")
quit.x = windowHeight/2
quit.y = windowWidth/2
quit.width = quit.img:getWidth()
quit.height = quit.img:getHeight()

function home.load()

	selectCurrent = {}
	selectCurrent.state = "play"
	selectCurrent.img = love.graphics.newImage("images/home/select.png")
	selectCurrent.width = selectCurrent.img:getWidth()
	selectCurrent.height = selectCurrent.img:getHeight()
	selectCurrent.x =  380
	selectCurrent.y = windowWidth/2

	love.keyboard.setKeyRepeat(false)

end

function home.update()

	if selectCurrent.state == "play" then
		selectCurrent.y =  play.y
		--print("play")
	end
	if selectCurrent.state == "quit" then
		selectCurrent.y = quit.x
	end
	
	if selectCurrent.state == "play" and love.keyboard.isDown("return") then
		home.cond = false
	end
	if selectCurrent.state == "quit" and love.keyboard.isDown("return") then
		love.event.quit()
	end



end

function home.draw()
	
	love.graphics.setBackgroundColor( 1, 1, 1 )

	love.graphics.draw(play.img, play.x, play.y,0,5,5,play.width/2,play.height/2)

	love.graphics.draw(quit.img, quit.x, quit.x,0,5,5,quit.width/2, quit.height/2)

	love.graphics.setColor(0,0,0)
	love.graphics.line(windowHeight/2,0,windowHeight/2,windowHeight)
	love.graphics.line(0,windowWidth/2,windowHeight,windowWidth/2)

	love.graphics.draw(selectCurrent.img, selectCurrent.x, selectCurrent.y,0,2,2,selectCurrent.width/2,selectCurrent.height/2)

	x, y = love.mouse.getPosition()
	love.graphics.print("x:"..tostring(x),50,20)
	love.graphics.print("y:"..tostring(y),50,30)

end

function love.keypressed( key, scancode, isrepeat )

	if key == "down" then

		if selectCurrent.state == "play" then
			selectCurrent.state = "quit"
			return
			print("down")
		end
		if selectCurrent.state == "quit" then
			selectCurrent.state = "play"
			return
			print("down")
		end

	end

	if key == "up" then

		if selectCurrent.state == "play" then
			selectCurrent.state = "quit"
			print("up")
		end
		if selectCurrent.state == "quit" then
			selectCurrent.state = "play"
			print("up")
		end
	end

end

return home