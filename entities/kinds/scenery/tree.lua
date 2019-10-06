local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Scenery = require 'entities.scenery'

local Tree = class('Tree', Scenery)

function Tree:initialize()
  Scenery.initialize(self)
  self.props.name = "Tree"
  self.drawable = gameWorld.assets.sprites.tree
  self.rect:set(100, 100, self.drawable:getWidth(), self.drawable:getHeight())
end


return Tree
