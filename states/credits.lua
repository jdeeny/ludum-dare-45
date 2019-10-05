local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local Credits = class('Credits', Gamestate)

function Credits:initialize(name)
  Gamestate.initialize(self, name)
end


function Credits:enter()
end

function Credits:exit()
end

function Credits:update(dt)
end


function Credits:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
end
return Credits
