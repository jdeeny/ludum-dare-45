local class = require 'lib.middleclass'
local anim8 = require 'lib.anim8'
local Scenery = require 'entities.scenery'

local Tree = class('Tree', Scenery)

function Tree:initialize()
  Scenery.initialize(self)
end


return Tree
