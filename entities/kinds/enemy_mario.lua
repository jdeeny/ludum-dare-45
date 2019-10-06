local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Enemy = require 'entities.enemy'

local Mario = class('Mario', Enemy)

function Mario:initialize()
  Enemy.initialize(self)
  self.drawable = gameWorld.assets.sprites.badguy
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end

return Mario
