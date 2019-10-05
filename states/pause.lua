local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local Pause = class('Pause', Gamestate)

function Pause:initialize(name)
  Gamestate.initialize(self, name)
end

function Pause:draw()
end

function Pause:exit()
end

function Pause:update(dt)
end

return Pause
