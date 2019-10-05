local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Entity = require 'entities.entity'
local rect = require 'util.rect'

local Enemy = class('Enemy', Entity)

function Enemy:initialize()
  Entity.initialize(self)
end

---- SPAWN ----
function Enemy:spawn()
end


---- UPDATE ----
function Enemy:update(dt)
end

---- DRAW ----
function Enemy:draw()
  love.graphics.setColor(1.0, 1.0, 1.0, 1.0)

end


return Enemy
