local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Object = require 'entities.object'

local Rock = class('Rock', Object)

function Rock:initialize()
  Object.initialize(self)
    self.drawable = gameWorld.assets.sprites.rock
end


return Rock
