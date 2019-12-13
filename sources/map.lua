map = {}

map.MAP_WIDTH = 18
map.MAP_HEIGHT = 11
map.TILE_SIZE = 16*4
map.TILE_WIDTH = 16
map.TILE_HEIGHT = 16

map.Map = {}
map.Map.floor = {
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
  {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
}

function map.load()
	

print("Loading")
  map.Texture = {}
  map.Texture[0] = nil
  map.Texture[1] = love.graphics.newImage("images/map/floor.png")

print("finish")

map.tileTypes = {}
map.tileTypes[1] = "floor"

print("finish")

end

function map.update()
	

	
end

--[[function map.isSolid(pID)
  local tileType = map.tileTypes[pID]
  if tileType == "coinHG" or
     tileType == "coinHD" or
     tileType == "coinBD" or
     tileType == "coinBG" then
    return true
  end
  
  return false
end]]--

function map.draw()
	
  for l=1,myMap.MAP_HEIGHT do
    for c=1,myMap.MAP_WIDTH do
       id = map.Map.floor[l][c]
      local tex = map.Texture[id]
      if tex ~= nil then
      love.graphics.draw(tex,(c-1)*myMap.TILE_SIZE,(l-1)*myMap.TILE_SIZE,0,4,4)
      end
    end
  end

	local x = love.mouse.getX()
	local y = love.mouse.getY()
	local col = math.floor(x/myMap.TILE_SIZE) + 1
	local lig = math.floor(y/myMap.TILE_SIZE) + 1


	if col>0 and col<=map.MAP_WIDTH and lig>0 and lig<=map.MAP_HEIGHT then
		id = map.Map.floor[lig][col]
		love.graphics.print("ID:"..tostring(id),1,1)
	end

end

return map