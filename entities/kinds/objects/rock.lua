local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Object = require 'entities.object'

local Rock = class('Rock', Object)

function Rock:initialize()
  Object.initialize(self)
  self.props.name = "Rock"
  self.drawable = gameWorld.assets.sprites.rock
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end


return Rock
