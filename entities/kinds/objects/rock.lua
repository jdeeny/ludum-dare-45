local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Object = require 'entities.object'

local Rock = class('Rock', Object)

function Rock:initialize()
  self.name = "Rock"
  self.drawable = gameWorld.assets.sprites.rock
  self.shrink_hitbox = 0.9
  Object.initialize(self)
end


return Rock
