local class = require 'lib.middleclass'
local Entity = class('Entity')

function Entity:initialize()
  self.spin = self.spin or 0
  self:set(self.x or 0, self.y or 0, self.w or 1, self.h or 1)

  -- Entity state properties
  self.isActive = false

  -- Collision properties
  self.bumpWorld = nil
  self.props = self.props or {}               -- Init properties
  self.props = self.props  -- Store property info in rect
  self.kind = self.kind or "entity"

  -- Drawing properties
  self.debug_hitbox = true

  -- shrink hitbox
  if self.drawable then
    local shrink = self.shrink_hitbox or 1.0
    self:set(0, 0, self.drawable:getWidth() * shrink, self.drawable:getHeight() * shrink)
    self.offsetx = self.drawable:getWidth() * (1-shrink) /2
    self.offsety = self.drawable:getHeight() * (1-shrink) /2
  end
end



function Entity:addToWorld(bumpWorld)
  self.bumpWorld = bumpWorld
  self.bumpWorld:add(self, self.x, self.y, self.w, self.h)
end

function Entity:spawn(bumpWorld, x, y)
  self.x = x or 0
  self.y = y or 0
  self:addToWorld(bumpWorld)
end

function Entity:set(x, y, w, h)
  self.x = x
  self.y = y
  self.w = w
  self.h = h
end

function Entity:setPos(x, y)
  self:set(x, y, self.w, self.h)
end

function Entity:setSize(w, h)
  self:set(self.x, self.y, w, h)
end

function Entity:update(dt)
  self.bumpWorld:update(self, self.x, self.y)
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
    --love.graphics.draw(self.drawable, self.x - (self.offsetx or 0), self.y - (self.offsety or 0))
    love.graphics.draw(self.drawable, self.x - (self.offsetx or 0), self.y - (self.offsety or 0))
    if self.debug_hitbox then
      love.graphics.setColor(.8, .0, .8, .8)
      love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
      love.graphics.setColor(1,1,1,1)
    end
  end
  love.graphics.setColor(gameWorld.colors.white)
end

function Entity:clone()
  return require('lib.pl.tablex').deepcopy(self)
end

return Entity
