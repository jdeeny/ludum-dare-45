local class = require 'lib.middleclass'
local bump = require("lib.bump")
local Gamestate = require 'states.gamestate'
local Camera = require 'lib.camera'
local Dude = require 'entities.dude'
--local Mario = require 'entities.kinds.enemy_mario'
--local Rock = require 'entities.kinds.object_rock'
--local Tree = require 'entities.kinds.scenery_tree'



local GamePlay = class('GamePlay', Gamestate)

-- this only happens once at the very beginning of the program
function GamePlay:initialize(name)
  Gamestate.initialize(self, name)
  self.entity_kinds = require('entities.kinds.lists')
  self.camera = Camera()
end

function uniform()
  return math.random() * math.random()
end

function GamePlay:new_location(entity)
  local x = 0
  local y = 0
  local w = entity.w
  if not w or w < 1 then w = 2 end
  local h = entity.h
  if not h or h < 1 then h = 2 end

  repeat
    x = math.random() * self.arena_w
    y = math.random() * self.arena_h
  until
    (
      (x > w / 2 ) and
      (x < self.arena_w - w / 2) and
      (y > h / 2) and
      (y < self.arena_h - h / 2) and
      self:isEmpty(x, y, w, h)
    )
  return x, y
end

function GamePlay:isEmpty(l, t, w, h)
  local items, len = self.bumpWorld:queryRect(l, t, w, h, self:collisionFilterEmptySpace())
  return len == 0
end

function GamePlay:collisionFilterEmptySpace()
  local filter = function(item, other)
    if other.props.kind == 'enemy' then
      return 'touch'
    elseif other.props.kind == 'object' then
      return 'touch'
    elseif other.props.kind == 'pickup' then
      return 'touch'
    elseif other.props.kind == 'scenery' then
      return nil
    end

    return nil
  end

  return filter
end

function GamePlay:spawn_surrounding_wall()
end

function GamePlay:spawn_player()
  self.player = Dude:new()
  print("player: "..self.player.w.." "..self.player.h)
  local x, y = self:new_location(self.player)
  print("XY: "..x.." "..y)
  self.player:spawn(self.bumpWorld, x, y)
  self.add_entity(self.player, 'foreground')
end

function GamePlay:spawn_enemy()
end

function GamePlay:spawn_background_fill()
end

function GamePlay:spawn_pickup()
end

function GamePlay:spawn_exit()
end

-- Happens when the state is first entered: Most init stuff goes here
function GamePlay:enter()
    self.entities = {}
    self.entities.background = {}
    self.entities.foreground = {}
    self.entities.ontop = {}

    self.arena_w = 5000
    self.arena_h = 5000
    self.area = self.arena_h * self.arena_w

    self.bumpWorld = bump.newWorld()

    -- Create a wall around the outside
    self:spawn_surrounding_wall()

    -- Create Background scenery
    self:spawn_background_fill()

    -- Create a dude in a random location
    self:spawn_player()

    -- Create the exit
    self:spawn_exit()

    -- Create building clusters
    local max = 100;
    repeat
      self:spawn_building()
      max = max - 1
    until (max == 0 or uniform() < 0.1)

    -- Add Objects on top of that
    max = 100;
    repeat
      self:spawn_objects()
      max = max - 1
    until (max == 0 or uniform() < 0.1)

    -- Add in pickups
    max = 100;
    repeat
      self:spawn_building()
      max = max - 1
    until (max == 0 or uniform() < 0.1)

    -- Add in enemies
    max = 100;
    repeat
      self:spawn_enemy()
      max = max - 1
    until (max == 0 or uniform() < 0.1)



--    self.mario = self.entity_kinds.enemies.mario:new()
--    self.mario:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)
--
--    self.rock = self.entity_kinds.objects.rock:new()
--    self.rock:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)
--
--    self.tree = self.entity_kinds.scenery.tree:new()
--    self.tree:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)
--
--    self.pants = self.entity_kinds.clothing.bottoms.test:new()
--    self.pants:spawn(self.bumpWorld, love.math.random() * 500., love.math.random() * 500.)
--
--
--    self.entities[#self.entities+1] = self.mario
--    self.entities[#self.entities+1] = self.rock
--    self.entities[#self.entities+1] = self.tree
    self.entities[#self.entities+1] = self.player
--    self.entities[#self.entities+1] = self.pants
end

function GamePlay:exit()
end

function GamePlay:update(dt)
  self.camera:update(dt)
  self.camera:follow(self.player.x, self.player.y)

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
  self.camera:attach()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(gameWorld.colors.black)

  -- draw Background
  for i, e in ipairs(self.entities.background) do
    e:draw()
  end
  -- draw foreground
  for i, e in ipairs(self.entities.foreground) do
    e:draw()
  end
  -- draw ontop
  for i, e in ipairs(self.entities.ontop) do
    e:draw()
  end

  self.camera:detach()
  self.camera:draw()
end


function GamePlay:HandleInput()
--  if gameWorld.playerInput:pressed('pause') then
--    gameWorld.gameState:pushState('pause')
--  end
end


return GamePlay
