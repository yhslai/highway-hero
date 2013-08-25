require 'lib/class'

local Meter = class(Entity)

function Meter:__init(handles)
	Entity.__init(self)
	self.children = handles
end

-- Override Entity:draw to draw in reverse order
function Meter:draw()
	self:_sortHandles()
	for i, handle in ipairs(_.reverse(self.children)) do
		love.graphics.setColor(Action.toColor(handle.action))
		love.graphics.rectangle("fill", 41, handle.y+3, 22, 380 - handle.y - 3)
		love.graphics.setColor(255, 255, 255, 255)
		handle:draw()
	end
end

function Meter:_sortHandles()
	self.children = _.sort(self.children, function(a, b)
		if a.dragging.active then return true end
		if b.dragging.active then return false end
		return a:getTime() < b:getTime()
	end)
end

function Meter:isFilled()
	local times = _.map(self.children, function(h) return h:getTime() end)
	local maxTime = _.max(times)
	return maxTime == 10
end

return Meter
