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
e:add('npc1', Enemy:new('npc1', sprites.enemies.npc1))
e:add('npc2', Enemy:new('npc2', sprites.enemies.npc2))
e:add('manhole', Enemy:new('manhole'), sprites.npc.manhole)

-- Objects
local o = Entities.objects
o:add('mailbox', Object:new('mailbox', sprites.objects.mailbox))
o:add('trashcan', Object:new('transcan', sprites.objects.trashcan))


-- Clothing
local c = Entities.clothing
c.head:add('sunglasses', Head:new('sunglasses', sprites.clothing.head.Head1))
c.head:add('lampshade', Head:new('lampshade', sprites.clothing.head.Head2))

c.top:add('top-1', Top:new('top-1', sprites.clothing.top.Top1))
c.top:add('top-2', Top:new('top-2', sprites.clothing.top.Top2))

c.bottom:add('bottom1', Bottom:new('bottom1', sprites.clothing.bottom.Bottom1))
c.bottom:add('bottom2', Bottom:new('bottom2', sprites.clothing.bottom.Bottom2))

c.feet:add('feet', Feet:new('feet', sprites.clothing.feet.Feet1))

c.undergarment:add('underwear-1', Undergarment:new('underwear-1', sprites.clothing.undergarment.Underwear1))

--c.mannequin:add('mannequin', Mannequin:new('mannequin'), sprites.mannequin.Character1)


return Entities
