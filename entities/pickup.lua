local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Pickup = class('Pickup', Entity)

function Pickup:initialize()
  Entity.initialize(self)
  self.props.kind = "pickup"
end

---- SPAWN ----
function Pickup:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Pickup:update(dt)
end

return Pickup
