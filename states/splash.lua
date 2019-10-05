local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'
local Splash = class('Splash', Gamestate)

function Splash:initialize(name)
  Gamestate.initialize(self, name)
  self.forcewatch_time = 0.0
  self.fade = 0.0
end

function Splash:enter()
  self.forcewatch_time = love.timer.getTime() + 0.125
  self.fade = 1.0
  flux.to(self, 1.0, { fade = 0.0 }):ease("quadinout")
end

function Splash:draw()
  love.graphics.setColor(gameWorld.colors.white)
  --love.graphics.draw(gameWorld.assets.splash.splash)
  if self.fade > 0 then
    love.graphics.setColor(0.0, 0.0, 0.0, self.fade)
    love.graphics.rectangle('fill', 0, 0, 1280, 720)
  end
end

function Splash:update()
  if (gameWorld.playerInput:pressed('fire') or gameWorld.playerInput:pressed('sel')) then
--     and love.timer.getTime() > self.forcewatch_time and self.fade == 0
--  then
    --flux.to(self, 1.2, { fade = 0.1 }):ease("quadinout"):after(0.2, {}):oncomplete( function() gameWorld.gameState:setState('title') end )
    gameWorld.gameState:setState('title')
  end
end

return Splash
