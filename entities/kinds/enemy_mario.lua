local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Enemy = require 'entities.enemy'

local Mario = class('Mario', Enemy)

function Mario:initialize()
  Enemy.initialize(self)
end

---- SPAWN ----
function Mario:spawn()
end


---- UPDATE ----
function Mario:update(dt)
end

---- DRAW ----
function Mario:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Mario
