local class = require 'lib.middleclass'
local rect = require 'util.rect'
local Entity = class('Entity')

function Entity:initialize()
  -- Entity state properties
  self.isActive = false

  -- Collision properties
  self.bumpWorld = nil
  self.rect = rect:new()        -- Init rectangle
  self.props = {}               -- Init properties
  self.rect.props = self.props  -- Store property info in rect
  self.props.kind = "entity"

  -- Drawing properties
  self.drawStyle = 'fill'
  self.drawColor = nil

end

function Entity:addToWorld(bumpWorld)
  self.bumpWorld = bumpWorld
  self.bumpWorld:add(self.rect, self.rect.x, self.rect.y, self.rect.w, self.rect.h)
end

function Entity:spawn(bumpWorld, x, y)
  self.rect.x = x or 0
  self.rect.y = y or 0
  self:addToWorld(bumpWorld)
end


function Entity:update(dt)
  self.bumpWorld:update(self.rect, self.rect.x, self.rect.y)
end

function Entity:draw()
  -- If no color specified, draw with all color values max
  if (self.drawColor == nil) then
    love.graphics.setColor(gameWorld.colors.white)
  else
    love.graphics.setColor(self.drawColor)
  end

  -- Draw rectangle
  if self.drawable then
    love.graphics.draw(self.drawable, self.rect.x or 0 - self.rext.props.offsetx or 0, self.rect.y or 0 - self.rext.props.offsetx or 0)
  end
end

return Entity
