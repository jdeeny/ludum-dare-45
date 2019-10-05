local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Object = class('Object', Entity)

function Object:initialize()
  Entity.initialize(self)
end

---- SPAWN ----
function Object:spawn()
end


---- UPDATE ----
function Object:update(dt)
end

---- DRAW ----
function Object:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Object
