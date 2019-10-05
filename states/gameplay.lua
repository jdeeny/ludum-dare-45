local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'

local Dude = require 'entities.dude'
local Mario = require 'entities.kinds.enemy_mario'
local Rock = require 'entities.kinds.object_rock'
local Tree = require 'entities.kinds.scenery_tree'



local GamePlay = class('GamePlay', Gamestate)

-- this only happens once at the very beginning of the program
function GamePlay:initialize(name)
  Gamestate.initialize(self, name)
end

-- Happens when the state is first entered: Most init stuff goes here
function GamePlay:enter()
    -- Create a dude
    self.player = Dude:new()
    --self.player:addToWorld()
    self.player:spawn()

    self.mario = Mario:new()
    self.mario:spawn()

    self.rock = Rock:new()
    self.rock:spawn()

    self.tree = Tree:new()
    self.tree:spawn()

end

function GamePlay:exit()
end

function GamePlay:update(dt)
  self:HandleInput()
  if self.player.isActive then self.player:update(dt) end
end


function GamePlay:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
  self.player:draw()
end


function GamePlay:HandleInput()
--  if gameWorld.playerInput:pressed('pause') then
--    gameWorld.gameState:pushState('pause')
--  end
end


return GamePlay
