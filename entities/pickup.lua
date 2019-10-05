local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Pickup = class('Pickup', Entity)

function Pickup:initialize()
  Entity.initialize(self)
end

---- SPAWN ----
function Pickup:spawn()
end


---- UPDATE ----
function Pickup:update(dt)
end

---- DRAW ----
function Pickup:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Pickup
