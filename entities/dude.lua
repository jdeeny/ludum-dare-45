local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Dude = class('Dude', Entity)

function Dude:initialize()
  Entity.initialize(self)
  self.props.name = "Dude"

  self.drawable = gameWorld.assets.sprites.snowman
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
  self.speed = 300
  self.props.kind = "player"
end

---- SPAWN ----
function Dude:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Dude:update(dt)

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

  self.dx = dx
  self.dy = dy

  self.rect.x = self.rect.x + self.dx * dt
  self.rect.y = self.rect.y + self.dy * dt
  local actualX, actualY, cols, len = self.bumpWorld:move(self.rect, self.rect.x, self.rect.y, self:collisionFilter())
  self.rect.x = actualX;
  self.rect.y = actualY;

  -- deal with the collisions
  for i=1,len do
    print('collided with ' .. tostring(cols[i].other.props.kind) .." "..cols[i].other.props.name)
  end
--self.bumpWorld:update(self.rect, self.rect.x, self.rect.y)
end


function Dude:collisionFilter()
  local filter = function(item, other)
    if other.props.kind == 'enemy' then
      return 'touch'
    elseif other.props.kind == 'object' then
      return 'touch'
    end

    return nil
  end

  return filter
end


return Dude
