local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local Ending = class('Ending', Gamestate)

function Ending:initialize(name)
  Gamestate.initialize(self, name)
end


function Ending:enter()
end

function Ending:exit()
end

function Ending:update(dt)
end


function Ending:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
end
return Ending
