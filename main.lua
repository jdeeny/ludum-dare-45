local class = require 'lib.middleclass'
local cargo = require 'lib.cargo'
flux = require 'lib.flux'
--require 'lib.pl'    -- provides on-demand lading on the penlight sublibraries

-- Should be the only global
gameWorld = {}

function love.load()
  gameWorld.random = love.math.newRandomGenerator()
  gameWorld.random:setSeed(os.time())
  math.randomseed(os.time())

--  gameWorld.settings = require('ui.settings'):new()
--  gameWorld.settings:load()
--  gameWorld.settings:save()
  gameWorld.colors = require('conf.colors')
  gameWorld.assets = cargo.init('assets')
  love.graphics.setFont(gameWorld.assets.fonts.generic(20))

--  gameWorld.sound = require('ui.sound'):new()
--
  gameWorld.playerInput = require('conf.controls')
  gameWorld.gameState = require('states.manager'):new()
--  gameWorld.playerData = require('player.playerdata'):new()
--  gameWorld.playerData:reset()
  gameWorld.gameState:setState('splash')
  gameWorld.debug = require('util.debug'):new()
end

function love.update(dt)
  flux.update(dt)
  gameWorld.gameState:update(dt)
--  gameWorld.sound:update(dt)
  gameWorld.playerInput:update()  -- update the input immediately so everything else can use the up to date info
  if gameWorld.debug then gameWorld.debug:update(dt) end
end

function love.draw()
  gameWorld.gameState:draw()
  if gameWorld.debug then gameWorld.debug:draw() end
end

function love.quit()
end

function love.focus(f)
--  if not f and gameWorld.gameState:getCurrent() == 'gameplay' then
--    gameWorld.gameState:pushState('pause')
--  end
end
