local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestHat = class('TestHat', Pickup)

function TestHat:initialize()
  self.name = "Test Hat"
  self.drawable = gameWorld.assets.sprites.tree
  Pickup.initialize(self)
  self.clothing = 'head'
end


return TestHat
