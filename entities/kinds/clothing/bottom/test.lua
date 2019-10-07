local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local TestBottom = class('TestBottom', Pickup)

function TestBottom:initialize()
  self.name = "Test Bot"
  self.drawable = gameWorld.assets.sprites.tree
  Pickup.initialize(self)
  self.clothing = 'bottom'
end


return TestBottom
