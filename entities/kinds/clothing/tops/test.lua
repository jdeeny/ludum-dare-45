local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestTop = class('TestTop', Pickup)

function TestTop:initialize()
  Pickup.initialize(self)
  self.props.name = "Test Top"
  self.drawable = gameWorld.assets.sprites.tree
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end


return TestTop
