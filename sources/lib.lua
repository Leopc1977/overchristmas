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

return lib