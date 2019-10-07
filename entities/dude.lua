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
  self.drawable = gameWorld.assets.sprites.enemies.npc1
  self.shrink_hitbox = 0.7
  self.speed = 800
  self.kind = "player"
  self.name = "Dude"
  self.clothing = {}
  self.clothing[MANNEQUIN] = nil--gameWorld.gameplay.entity_kinds.mannequin.Character1
  self.clothing[HAIR] = nil -- hair

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

  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
  local actualX, actualY, cols, len = self.bumpWorld:move(self, self.x, self.y, self:collisionFilter())
  self.x = actualX;
  self.y = actualY;

  -- deal with the collisions
  for i=1,len do
    local col = cols[i]
    local other = col.other
    local kind = other.kind

    print('collided with ' .. tostring(cols[i].other.kind) .." "..cols[i].other.name)
    if kind == 'pickup' or kind == 'clothing' then
      print("pick it up")
      local clothing = other.clothing
      print(clothing)
      if clothing == 'head' then
        print("head")
        self.clothing[HEAD] = other
      elseif clothing == 'top' then
        print("top")
        self.clothing[TOP] = other
      elseif clothing == 'bottom' then
        print("bottom")
        self.clothing[BOTTOM] = other
      else
        print("Not recognized")
      end
      print("Remove from bumpworld")
      --self.bumpWorld:remove(other)
      if other then gameWorld.gameplay:remove_entity(other) end
    elseif kind == 'enemy' then
      print("ouch?")
    end
  end
end

function Dude:draw(x,y)
  Entity.draw(self,x,y)
  --self:drawDoll(x, y)
end

function Dude:drawDoll(x, y)
  -- If no color specified, draw with all color values max
  if (self.drawColor == nil) then
    love.graphics.setColor(gameWorld.colors.white)
  else
    love.graphics.setColor(self.drawColor)
  end

  love.graphics.draw(gameWorld.assets.sprites.mannequin.Character1, x, y)

  if self.drawable then
    print("Draw")
    for i, v in pairs(self.clothing) do
      print("Draw "..i)
      if v.drawable then
        --love.graphics.draw(self.drawable, self.x - (self.offsetx or 0), self.y - (self.offsety or 0))
        love.graphics.draw(v.drawable, x, y)
      end

    end
  end
  love.graphics.setColor(gameWorld.colors.white)
end



function Dude:collisionFilter()
  local filter = function(item, other)
    if other.kind == 'enemy' then
      return 'touch'
    elseif other.kind == 'object' then
      return 'touch'
    elseif other.kind == 'pickup' then
      return 'cross'
    elseif other.kind == 'scenery' then
      return nil
    end

    return nil
  end

  return filter
end


return Dude
