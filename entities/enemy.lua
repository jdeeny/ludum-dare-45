local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'

local Enemy = class('Enemy', Entity)

function Enemy:initialize()
  self.props = self.props or {}
  self.props.kind = self.props.kind or "enemy"
  self.props.name = self.props.name or "Enemy"
  Entity.initialize(self)
end

---- SPAWN ----
function Enemy:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Enemy:update(dt)
end

return Enemy
