local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local GamePlay = class('GamePlay', Gamestate)

function GamePlay:initialize(name)
  Gamestate.initialize(self, name)
end


function GamePlay:enter()
end

function GamePlay:exit()
end

function GamePlay:update(dt)
end


function GamePlay:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
end
return GamePlay
