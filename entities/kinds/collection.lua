local class = require 'lib.middleclass'

local Collection = class('Collection')

function Collection:initialize()
  self.items = {}
  self.count = 0
end

function Collection:add(rank, name, kind)
  for i=1,rank do
    self.items[#self.items + 1] = kind
    self.count = self.count + 1
  end
  self[name] = kind
end

function Collection:random()
  local item = self.items[math.random(#self.items)]
  if item.random then
    print("inner")
    return item:random()
  else
    print("item")
    return item:clone()
  end
end

return Collection
