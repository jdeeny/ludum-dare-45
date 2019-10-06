local class = require 'lib.middleclass'
local bump = require("lib.bump")
local Gamestate = require 'states.gamestate'

local Dude = require 'entities.dude'
local Mario = require 'entities.kinds.enemy_mario'
local Rock = require 'entities.kinds.object_rock'
local Tree = require 'entities.kinds.scenery_tree'



local Viewer = class('Viewer', Gamestate)

-- this only happens once at the very beginning of the program
function Viewer:initialize(name)
  Gamestate.initialize(self, name)
end

-- Happens when the state is first entered: Most init stuff goes here
function Viewer:enter()
end

function Viewer:exit()
end

function Viewer:update(dt)
  self:HandleInput()
end


function Viewer:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(gameWorld.colors.black)

  -- show screen stuff
  -- show selected item
  -- show selected item info
end


function Viewer:HandleInput()
  -- handle advancing
  -- handle exit
end


return Viewer
