map = {}

myLib = require("lib")

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

map.Map.table = {
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,4,0,0,4,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
}

function map.load()
	

print("Loading")
  map.Texture = {}
  map.Texture[0] = nil
  map.Texture[1] = love.graphics.newImage("images/map/floor.png")
  map.Texture[2] = love.graphics.newImage("images/objects/tableVG.png")
  map.Texture[3] = love.graphics.newImage("images/objects/tableVD.png")
  map.Texture[4] = love.graphics.newImage("images/objects/tableH.png")
  map.Texture[5] = love.graphics.newImage("images/objects/tableVGQuatre.png")

map.tileTypes = {}
map.tileTypes[1] = "floor"
map.tileTypes[2] = "tableVGUn"
map.tileTypes[3] = "tableVGDeux"
map.tileTypes[4] = "tableVGTrois"
map.tileTypes[5] = "tableVGQuatre"

print("finish")

end

function map.update()
	

	
end

function map.isSolid(pID)
  tileType = map.tileTypes[pID]
  if tileType == "tableVGUn" or
     tileType == "tableVGDeux" or
     tileType == "tableVGTrois" or
     tileType == "tableVGQuatre" then
    return true, tileType
  end
  
  return false
end

function map.draw()
	
--floor
  for l=1,myMap.MAP_HEIGHT do
    for c=1,myMap.MAP_WIDTH do
       id = map.Map.floor[l][c]
      local tex = map.Texture[id]
      if tex ~= nil then
      love.graphics.draw(tex,(c-1)*myMap.TILE_SIZE,(l-1)*myMap.TILE_SIZE,0,4,4)
      end
    end
  end

--table
  for l=1,myMap.MAP_HEIGHT do
    for c=1,myMap.MAP_WIDTH do
       id = map.Map.table[l][c]
     myMap.x = (c-1)*myMap.TILE_SIZE
     myMap.y = (l-1)*myMap.TILE_SIZE
      local tex = map.Texture[id]
      if tex ~= nil then
      love.graphics.draw(tex,myMap.x,myMap.y,0,5,5)
      end
    end
  end

end

return map