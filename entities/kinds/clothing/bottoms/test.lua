local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestBottom = class('TestBottom', Pickup)

function TestBottom:initialize()
  Pickup.initialize(self)
  self.props.name = "Test Bottom"
  self.drawable = gameWorld.assets.sprites.tree
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end


return TestBottom
