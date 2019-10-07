local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestHat = class('TestHat', Pickup)

function TestHat:initialize()
  self.props = self.props or {}
  self.props.name = "Test Hat"
  self.drawable = gameWorld.assets.sprites.tree
  Pickup.initialize(self)
  self.props.clothing = 'head'
end


return TestHat
