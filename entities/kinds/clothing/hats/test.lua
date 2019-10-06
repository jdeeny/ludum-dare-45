local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestHat = class('TestHat', Pickup)

function TestHat:initialize()
  Pickup.initialize(self)
  self.props.name = "Test Hat"
  self.drawable = gameWorld.assets.sprites.tree
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end


return TestHat
