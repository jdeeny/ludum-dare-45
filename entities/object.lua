local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Object = class('Object', Entity)

function Object:initialize()
  self.props = self.props or {}
  self.props.kind = self.props.kind or "object"
  self.props.name = self.props.name or "Object"
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
