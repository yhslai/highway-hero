require 'lib/class'

local Rect = class()

function Rect:__init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
end

function Rect:contains(x, y)
	return x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height
end

function Rect:__tostring()
	return '{Rect => x: ' .. self.x .. ', y: ' .. self.y ..
		   ', width: ' .. self.width .. ', height: ' .. self.height .. '}'
end

return Rect
