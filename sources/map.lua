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

map.Map.toy = {
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,7,8,9,10,0,0,0,0,0,0,0},
  {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
}

function map.load()
	

print("Loading")
  map.Texture = {}
  map.Texture[0] = nil
  map.Texture[1] = love.graphics.newImage("images/map/floor.png")

  --TOY
  map.Texture[2] = love.graphics.newImage("images/objects/tableVGUn.png")
  map.Texture[3] = love.graphics.newImage("images/objects/tableVGDeux.png") 
  map.Texture[4] = love.graphics.newImage("images/objects/tableVGTrois.png") 
  map.Texture[5] = love.graphics.newImage("images/objects/tableVGQuatre.png") 
  map.Texture[6] = love.graphics.newImage("images/objects/tableH.png") 

  --GIFT
  map.Texture[7] = love.graphics.newImage("images/objects/tableHUn.png") -- deposer toy et créer cadeau
  map.Texture[8] = love.graphics.newImage("images/objects/tableHDeux.png") -- deposer toy et créer cadeau
  map.Texture[9] = love.graphics.newImage("images/objects/tableHTrois.png") -- deposer toy et créer cadeau

map.tileTypes = {}

  map.tileTypes[1] = "floor"

  -- TOY
  map.tileTypes[2] = "tableVGUnToy"
  map.tileTypes[3] = "tableVGDeuxToy"
  map.tileTypes[4] = "tableVGTroisToy"
  map.tileTypes[5] = "tableVGQuatreToy"
  map.tileTypes[6] = "horizontalToy"

--GIFT
  map.tileTypes[7] = "tableHUnGift"
  map.tileTypes[8] = "tableHDeuxGift"
  map.tileTypes[9] = "tableHTroisGift"

print("finish")

end

function map.update()
	
  
	
end

function map.isSolid(pID)
  tileType = map.tileTypes[pID]
  --TOY
  if tileType == "tableVGUnToy" or
     tileType == "tableVGDeuxToy" or
     tileType == "tableVGTroisToy" or
     tileType == "tableVGQuatreToy" or
     tileType == "horizontalToy" or
  --GIFT
     tileType == "tableHUnGift" or
     tileType == "tableHDeuxGift" or
     tileType == "tableHTroisGift" then

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
       id = map.Map.toy[l][c]
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