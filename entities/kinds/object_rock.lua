local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Object = require 'entities.object'

local Rock = class('Rock', Object)

function Rock:initialize()
  Object.initialize(self)
end

---- SPAWN ----
function Rock:spawn()
end


---- UPDATE ----
function Rock:update(dt)
end

---- DRAW ----
function Rock:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Rock
