local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Dude = class('Dude', Entity)

function Dude:initialize()
  Entity.initialize(self)
end

---- SPAWN ----
function Dude:spawn()
end


---- UPDATE ----
function Dude:update(dt)
end

---- DRAW ----
function Dude:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Dude
