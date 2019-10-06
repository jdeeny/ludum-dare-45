local class = require 'lib.middleclass'
local rect = require 'util.rect'
local Entity = class('Entity')

function Entity:initialize()
  -- Entity state properties
  self.isActive = false

  -- Collision properties
  self.bumpWorld = nil
  self.rect = rect:new()        -- Init rectangle
  self.props = self.props or {}               -- Init properties
  self.rect.props = self.props  -- Store property info in rect
  self.props.kind = self.props.kind or "entity"

  -- Drawing properties
  self.props.debug_hitbox = true

  -- shrink hitbox
  if self.drawable then
    local shrink = self.props.shrink_hitbox or 1.0
    self.rect:set(0, 0, self.drawable:getWidth() * shrink, self.drawable:getHeight() * shrink)
    self.props.offsetx = self.drawable:getWidth() * (1-shrink) /2
    self.props.offsety = self.drawable:getHeight() * (1-shrink) /2
  end
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
    --love.graphics.draw(self.drawable, self.rect.x - (self.props.offsetx or 0), self.rect.y - (self.props.offsety or 0))
    love.graphics.draw(self.drawable, self.rect.x - (self.props.offsetx or 0), self.rect.y - (self.props.offsety or 0))
    if self.props.debug_hitbox then
      love.graphics.setColor(.8, .0, .8, .8)
      love.graphics.rectangle('line', self.rect.x, self.rect.y, self.rect.w, self.rect.h)
      love.graphics.setColor(1,1,1,1)
    end
  end
end

return Entity
