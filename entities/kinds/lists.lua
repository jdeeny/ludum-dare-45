local Collection = require 'entities.kinds.collection'
local kinds = require 'entities.kinds.clothing'
local Head = kinds.Head local Top = kinds.Top local Bottom = kinds.Bottom local Feet = kinds.Feet local Head = kinds.Head local Undergarment = kinds.Undergarment
local Scenery = require 'entities.scenery' local Object = require 'entities.object' local Enemy = require 'entities.enemy'

-- Define the entity kinds
local Entities = Collection:new()
Entities:add(5, 'scenery', Collection:new())
Entities:add(5, 'clothing', Collection:new())
Entities:add(5, 'objects', Collection:new())
Entities:add(5, 'enemies', Collection:new())
Entities:add(5, 'pickups', Collection:new())

Entities.clothing:add(5, 'head', Collection:new())
Entities.clothing:add(5, 'top', Collection:new())
Entities.clothing:add(5, 'bottom', Collection:new())
Entities.clothing:add(5, 'feet', Collection:new())
Entities.clothing:add(5, 'undergarment', Collection:new())

-- Make a shortcut to sprites
local sprites = gameWorld.assets.sprites

--------------------
-- Define Items Here


-- Scenery
local s = Entities.scenery
s:add(5, 'tree', Scenery:new('tree', sprites.scenery.tree))
s:add(5, 'tree2', Scenery:new('tree2', sprites.scenery.tree))


-- Enemies
local e = Entities.enemies
e:add(5, 'badguy', Enemy:new('badguy', sprites.enemies.badguy))


-- Objects
local o = Entities.objects
o:add(5, 'rock', Object:new('rock', sprites.objects.rock))


-- Clothing
local c = Entities.clothing
c.head:add(5, 'basic', Head:new('basic', sprites.clothing.head.basic))
c.head:add(5, 'basic2', Head:new('basic2', sprites.clothing.head.basic))

c.top:add(5, 'basic', Top:new('basic', sprites.clothing.top.basic))
c.top:add(5, 'basic2', Top:new('basic2', sprites.clothing.top.basic))

c.bottom:add(5, 'basic', Bottom:new('basic', sprites.clothing.bottom.basic))
c.bottom:add(5, 'basic2', Bottom:new('basic2', sprites.clothing.bottom.basic))

c.feet:add(5, 'basic', Feet:new('basic', sprites.clothing.feet.basic))
c.feet:add(5, 'basic2', Feet:new('basic2', sprites.clothing.feet.basic))

c.undergarment:add(5, 'basic', Undergarment:new('basic', sprites.clothing.undergarment.basic))
c.undergarment:add(5, 'basic2', Undergarment:new('basic2', sprites.clothing.undergarment.basic))


return Entities
