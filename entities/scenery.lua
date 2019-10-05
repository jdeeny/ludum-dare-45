local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Scenery = class('Scenery', Entity)

function Scenery:initialize()
  Entity.initialize(self)
end

---- SPAWN ----
function Scenery:spawn(bumpWorld)
  Entity.spawn(self, bumpWorld)
end

---- UPDATE ----
function Scenery:update(dt)
end

---- DRAW ----
function Scenery:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
end


return Scenery
