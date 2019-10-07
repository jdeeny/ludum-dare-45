local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Object = class('Object', Entity)

function Object:initialize(name, drawable)
  self.kind = self.kind or "object"
  self.name = name or "Object"
  self.drawable = drawable
  Entity.initialize(self)
end

---- SPAWN ----
function Object:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Object:update(dt)
end

return Object
