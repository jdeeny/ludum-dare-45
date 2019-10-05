local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local Title = class('Title', Gamestate)

function Title:initialize(name)
  Gamestate.initialize(self, name)
end


function Title:enter()
end

function Title:exit()
end

function Title:update(dt)
end


function Title:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
end
return Title
