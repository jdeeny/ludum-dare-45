local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestTop = class('TestTop', Pickup)

function TestTop:initialize()
  self.props = self.props or {}
  self.props.name = "Test Top"
  self.drawable = gameWorld.assets.sprites.tree
  Pickup.initialize(self)
  self.props.clothing = 'top'
end


return TestTop
