local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'


local Dude = class('Dude', Entity)

local MANNEQUIN = 1
local HAIR = 2
local UNDERWEAR = 3
local BOTTOM = 4
local TOP = 5
local HEAD = 6


function Dude:initialize()
  self.drawable = gameWorld.assets.sprites.snowman
  self.props = self.props or {}
  self.props.shrink_hitbox = 0.5
  self.props.speed = 300
  self.props.kind = self.props.kind or "player"
  self.props.name = self.props.name or "Dude"
  self.props.clothing = {}
  self.props.clothing[MANNEQUIN] = nil -- mannequin
  self.props.clothing[HAIR] = nil -- hair

  Entity.initialize(self)
end

---- SPAWN ----
function Dude:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Dude:update(dt)

  local DEADBAND = 0.1
  local move_x, move_y = gameWorld.playerInput:get('move')

  local dx = move_x > DEADBAND and self.props.speed or move_x < -DEADBAND and -self.props.speed or 0
  local dy = move_y > DEADBAND and self.props.speed or move_y < -DEADBAND and -self.props.speed or 0

  if math.abs(dx) >= 0.01 and math.abs(dy) >= 0.01 then
      -- 1/sqrt(2)
      -- this is to fixup diagonal movement but it doesn't seem correct!
      dx = dx * 0.7071
      dy = dy * 0.7071
  end

  self.dx = dx
  self.dy = dy

  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  local actualX, actualY, cols, len = self.bumpWorld:move(self, self.x, self.y, self:collisionFilter())
  self.x = actualX;
  self.y = actualY;

  -- deal with the collisions
  for i=1,len do
    local col = cols[i]
    local other = col.other
    local kind = other.props.kind

    --print('collided with ' .. tostring(cols[i].other.props.kind) .." "..cols[i].other.props.name)
    if kind == 'pickup' then
      print("pick it up")
      local clothing = other.props.clothing
      print(clothing)
      if clothing == 'head' then
        print("head")
        self.props.clothing[HEAD] = other
      elseif clothing == 'top' then
        print("top")
        self.props.clothing[TOP] = other
      elseif clothing == 'bottom' then
        print("bottom")
        self.props.clothing[BOTTOM] = other
      else
        print("Not recognized")
      end
      print("Remove from bumpworld")
      self.bumpWorld:remove(other)
    elseif kind == 'enemy' then
      print("ouch?")
    end
  end
end

function Dude:drawDoll(x, y)
  -- If no color specified, draw with all color values max
  if (self.drawColor == nil) then
    love.graphics.setColor(gameWorld.colors.white)
  else
    love.graphics.setColor(self.drawColor)
  end

  if self.drawable then
    for i, v in ipairs(self.props.clothing) do
      love.graphics.draw(v.drawable, x, y)
    end
  end
  love.graphics.setColor(gameWorld.colors.white)
end



function Dude:collisionFilter()
  local filter = function(item, other)
    if other.props.kind == 'enemy' then
      return 'touch'
    elseif other.props.kind == 'object' then
      return 'touch'
    elseif other.props.kind == 'pickup' then
      return 'cross'
    elseif other.props.kind == 'scenery' then
      return nil
    end

    return nil
  end

  return filter
end


return Dude
