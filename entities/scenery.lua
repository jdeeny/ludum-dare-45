local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Scenery = class('Scenery', Entity)

function Scenery:initialize()
  self.props = self.props or {}
  self.props.kind = self.props.kind or "scenery"
  self.props.name = self.props.name or "Scenery"
  Entity.initialize(self)
end

---- SPAWN ----
function Scenery:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end

return Scenery
