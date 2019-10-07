local Collection = require 'entities.kinds.collection'
local kinds = require 'entities.kinds.clothing'
local Head = kinds.Head local Top = kinds.Top local Bottom = kinds.Bottom local Feet = kinds.Feet local Head = kinds.Head local Undergarment = kinds.Undergarment
local Scenery = require 'entities.scenery' local Object = require 'entities.object' local Enemy = require 'entities.enemy'

-- Define the entity kinds
local Entities = Collection:new()
Entities:add('scenery', Collection:new())
Entities:add('clothing', Collection:new())
Entities:add('objects', Collection:new())
Entities:add('enemies', Collection:new())
Entities:add('pickups', Collection:new())

Entities.clothing:add('head', Collection:new())
Entities.clothing:add('top', Collection:new())
Entities.clothing:add('bottom', Collection:new())
Entities.clothing:add('feet', Collection:new())
Entities.clothing:add('undergarment', Collection:new())

-- Make a shortcut to sprites
local sprites = gameWorld.assets.sprites

--------------------
-- Define Items Here


-- Scenery
local s = Entities.scenery
s:add('tree', Scenery:new('tree', sprites.scenery.tree))
s:add('tree2', Scenery:new('tree2', sprites.scenery.tree))


-- Enemies
local e = Entities.enemies
e:add('badguy', Enemy:new('badguy', sprites.enemies.badguy))


-- Objects
local o = Entities.objects
o:add('rock', Object:new('rock', sprites.objects.rock))


-- Clothing
local c = Entities.clothing
c.head:add('basic', Head:new('basic', sprites.clothing.head.basic))
c.head:add('basic2', Head:new('basic2', sprites.clothing.head.basic))

c.top:add('basic', Top:new('basic', sprites.clothing.top.basic))
c.top:add('basic2', Top:new('basic2', sprites.clothing.top.basic))

c.bottom:add('basic', Bottom:new('basic', sprites.clothing.bottom.basic))
c.bottom:add('basic2', Bottom:new('basic2', sprites.clothing.bottom.basic))

c.feet:add('basic', Feet:new('basic', sprites.clothing.feet.basic))
c.feet:add('basic2', Feet:new('basic2', sprites.clothing.feet.basic))

c.undergarment:add('basic', Undergarment:new('basic', sprites.clothing.undergarment.basic))
c.undergarment:add('basic2', Undergarment:new('basic2', sprites.clothing.undergarment.basic))




return Entities
