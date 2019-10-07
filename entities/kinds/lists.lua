local Enemies = {}
Enemies.mario = require('entities.kinds.enemies.mario')

local Scenery = {}
Scenery.tree = require('entities.kinds.scenery.tree')

local Objects = {}
Objects.rock = require('entities.kinds.objects.rock')

local Hats = {}
Hats.test = require('entities.kinds.clothing.head.test')

local Tops = {}
Tops.test = require('entities.kinds.clothing.top.test')

local Bottoms = {}
Bottoms.test = require('entities.kinds.clothing.bottom.test')


local Clothing = {}
Clothing.hats = Hats
Clothing.tops = Tops
Clothing.bottoms = Bottoms



local Entities = {}
Entities.enemies = Enemies
Entities.scenery = Scenery
Entities.objects = Objects
Entities.clothing = Clothing

return Entities
