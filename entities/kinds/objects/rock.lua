local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Object = require 'entities.object'

local Rock = class('Rock', Object)

function Rock:initialize()
  self.props = {}
  self.props.name = "Rock"
  self.drawable = gameWorld.assets.sprites.rock
  self.props.shrink_hitbox = 0.5
  Object.initialize(self)
end


return Rock
