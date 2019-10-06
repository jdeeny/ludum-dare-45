local class = require 'lib.middleclass'
local bump = require("lib.bump")
local Gamestate = require 'states.gamestate'

local Dude = require 'entities.dude'
--local Mario = require 'entities.kinds.enemy_mario'
--local Rock = require 'entities.kinds.object_rock'
--local Tree = require 'entities.kinds.scenery_tree'



local GamePlay = class('GamePlay', Gamestate)

-- this only happens once at the very beginning of the program
function GamePlay:initialize(name)
  Gamestate.initialize(self, name)
  self.entity_kinds = require('entities.kinds.lists')
end

-- Happens when the state is first entered: Most init stuff goes here
function GamePlay:enter()
    self.entities = {}

    self.bumpWorld = bump.newWorld()

    -- Create a dude
    self.player = Dude:new()
    self.player:spawn(self.bumpWorld, 0, 0)

    self.mario = self.entity_kinds.enemies.mario:new()
    self.mario:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)

    self.rock = self.entity_kinds.objects.rock:new()
    self.rock:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)

    self.tree = self.entity_kinds.scenery.tree:new()
    self.tree:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)

    self.entities[#self.entities+1] = self.mario
    self.entities[#self.entities+1] = self.rock
    self.entities[#self.entities+1] = self.tree
    self.entities[#self.entities+1] = self.player
end

function GamePlay:exit()
end

function GamePlay:update(dt)
  self:HandleInput()

  --local items, len = self.bumpWorld:getItems()
  --for i, item in ipairs(items) do
  --  print(item)
  --end

  for i,e in ipairs(self.entities) do
    e:update(dt)
  end

end


function GamePlay:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(gameWorld.colors.black)
  for i, e in ipairs(self.entities) do
    e:draw()
  end

end


function GamePlay:HandleInput()
--  if gameWorld.playerInput:pressed('pause') then
--    gameWorld.gameState:pushState('pause')
--  end
end


return GamePlay
