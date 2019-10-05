local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Scenery = require 'entities.scenery'

local Tree = class('Tree', Scenery)

function Tree:initialize()
  Scenery.initialize(self)
end

---- SPAWN ----
function Tree:spawn()
end


---- UPDATE ----
function Tree:update(dt)
end

---- DRAW ----
function Tree:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Tree
