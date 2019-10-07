local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Pickup = class('Pickup', Entity)

function Pickup:initialize(name, drawable)
  self.kind = self.kind or "pickup"
  self.name = name or "Pickup"
  self.drawable = drawable
  Entity.initialize(self, name, drawable)
end

---- SPAWN ----
function Pickup:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Pickup:update(dt)
end

return Pickup
