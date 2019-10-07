local class = require 'lib.middleclass'

local Collection = class('Collection')

function Collection:initialize()
  self.items = {}
  self.count = 0
end

function Collection:add(name, kind)
  self.items[#self.items + 1] = kind
  self[name] = kind
  self.count = self.count + 1
end

function Collection:random()
  local item = self.items[random(#self.items)]
  if item.random then
    return item:random()
  else
    return item
  end
end

return Collection
