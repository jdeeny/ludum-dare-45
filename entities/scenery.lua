local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Scenery = class('Scenery', Entity)

function Scenery:initialize()
  self.props = self.props or {}
  self.kind = self.kind or "scenery"
  self.name = self.name or "Scenery"
  Entity.initialize(self)
end

---- SPAWN ----
function Scenery:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end

return Scenery
