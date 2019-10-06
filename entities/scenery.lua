local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Scenery = class('Scenery', Entity)

function Scenery:initialize()
  Entity.initialize(self)
  self.props.kind = "scenery"
  self.props.name = "Scenery"

end

---- SPAWN ----
function Scenery:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end

return Scenery
