local class = require 'lib.middleclass'
local Pickup = require 'entities.pickup'

local x = {}

x.Top = class('Top', Pickup)
function x.Top:initialize(name, drawable)
  self.name = name
  self.drawable = drawable
  Pickup.initialize(self)
  self.clothing = 'top'
end

x.Bottom = class('Bottom', Pickup)
function x.Bottom:initialize(name, drawable)
  self.name = name
  self.drawable = drawable
  Pickup.initialize(self)
  self.clothing = 'bottom'
end

x.Head = class('Head', Pickup)
function x.Head:initialize(name, drawable)
  self.name = name
  self.drawable = drawable
  Pickup.initialize(self)
  self.clothing = 'head'
end

x.Undergarment = class('Undergarment', Pickup)
function x.Undergarment:initialize(name, drawable)
  self.name = name
  self.drawable = drawable
  Pickup.initialize(self)
  self.clothing = 'bottom'
end

x.Feet = class('Feet', Pickup)
function x.Feet:initialize(name, drawable)
  self.name = name
  self.drawable = drawable
  Pickup.initialize(self)
  self.clothing = 'feet'
end

return x
