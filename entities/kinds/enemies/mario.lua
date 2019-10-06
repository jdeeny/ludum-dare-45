local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Enemy = require 'entities.enemy'

local Mario = class('Mario', Enemy)

function Mario:initialize()
  self.props = self.props or {}
  self.props.name = "Mario"
  self.drawable = gameWorld.assets.sprites.badguy
  self.props.shrink_hitbox = 0.7
  Enemy.initialize(self)
end

return Mario
