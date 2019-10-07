local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Pickup = class('Pickup', Entity)

function Pickup:initialize()
  self.props = self.props or {}
  self.kind = self.kind or "pickup"
  self.name = self.name or "Pickup"
  Entity.initialize(self)
end

---- SPAWN ----
function Pickup:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Pickup:update(dt)
end

return Pickup
