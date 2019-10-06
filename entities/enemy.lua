local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Enemy = class('Enemy', Entity)

function Enemy:initialize()
  Entity.initialize(self)
  self.props.kind = "enemy"
end

---- SPAWN ----
function Enemy:spawn(bumpWorld, x, y)
  Entity.spawn(self, bumpWorld, x, y)
end


---- UPDATE ----
function Enemy:update(dt)
end

return Enemy
