local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Dude = class('Dude', Entity)

function Dude:initialize()
  Entity.initialize(self)
  self.drawable = gameWorld.assets.sprites.snowman
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
  self.speed = 10
end

---- SPAWN ----
function Dude:spawn(bumpWorld)
  Entity.spawn(self, bumpWorld)
end


---- UPDATE ----
function Dude:update(dt)
  Entity.update(self, dt)

  local DEADBAND = 0.1
  local move_x, move_y = gameWorld.playerInput:get('move')

  local dx = move_x > DEADBAND and self.speed or move_x < -DEADBAND and -self.speed or 0
  local dy = move_y > DEADBAND and self.speed or move_y < -DEADBAND and -self.speed or 0

  if math.abs(dx) >= 0.01 and math.abs(dy) >= 0.01 then
      -- 1/sqrt(2)
      -- this is to fixup diagonal movement but it doesn't seem correct!
      dx = dx * 0.7071
      dy = dy * 0.7071
  end
  self.rect.x = self.rect.x + dx
  self.rect.y = self.rect.y + dy
end

return Dude
