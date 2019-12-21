lib = {}

lib.liste_sprites = {}

function lib.CreeSprite(pNomDossier,pNomImage, pX, pY,offSet, scaleX, scaleY)

  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprime = false
  sprite.image = love.graphics.newImage("images/"..pNomDossier.."/"..pNomImage..".png")
  sprite.l = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()

  table.insert(lib.liste_sprites, sprite)

  return sprite
end

function lib.init(level)
	
	local initCond = true

	if initCond == true then
		
    if level == 1 then

      recipe = {}
      recipe.blue = "car"
      recipe.brown = "book"
      recipe.green = "stick"
      recipe.pink = "ball"
      recipe.red = "deer"

    end

	end

  initCond = false

  return recipe

end

return lib