local class = require 'lib.middleclass'
local baton = require 'lib.baton'

local Gamestate = class('Gamestate')

function Gamestate:initialize(name)
  self.name = name
end

-- Subclasses should replace these
function Gamestate:enter()
end
function Gamestate:exit()
end
function Gamestate:returnTo()
end
function Gamestate:draw()
end
function Gamestate:update(dt)
end

return Gamestate
