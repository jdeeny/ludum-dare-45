local class = require 'lib.middleclass'
local Gamestate = require 'states.gamestate'
local suit = require 'lib.suit'
local input = {text = ""}

local Title = class('Title', Gamestate)

function Title:initialize(name)
  Gamestate.initialize(self, name)
end


function Title:enter()
end

function Title:exit()
end

function Title:update(dt)
  -- put the layout origin at position (100,100)
  	-- the layout will grow down and to the right from this point
  	suit.layout:reset(100,100)

  	-- put an input widget at the layout origin, with a cell size of 200 by 30 pixels
  	suit.Input(input, suit.layout:row(200,30))

  	-- put a label that displays the text below the first cell
  	-- the cell size is the same as the last one (200x30 px)
  	-- the label text will be aligned to the left
  	suit.Label("Hello, "..input.text, {align = "left"}, suit.layout:row())

  	-- put an empty cell that has the same size as the last cell (200x30 px)
  	suit.layout:row()

  	-- put a button of size 200x30 px in the cell below
  	-- if the button is pressed, quit the game
  	if suit.Button("Close", suit.layout:row()).hit then
  		love.event.quit()
  	end


  if (gameWorld.playerInput:pressed('fire') or gameWorld.playerInput:pressed('sel')) then
    gameWorld.gameState:setState('gameplay')
  end



end


function Title:draw()
  love.graphics.setColor(gameWorld.colors.white)
  love.graphics.clear(1.0, 1.0, 1.0, 1.0)
  suit.draw()
end
return Title
