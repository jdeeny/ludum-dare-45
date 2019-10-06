local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Object = class('Object', Entity)

function Object:initialize()
  Entity.initialize(self)
  self.props.kind = "object"
  self.props.name = "Object"

end

---- SPAWN ----
function Object:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Object:update(dt)
end

return Object
