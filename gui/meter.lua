require 'lib/class'

local Meter = class(Entity)

function Meter.timeToY(time)
	return 20 + (10 - time) * 360 / 10
end

function Meter.yToTime(y)
	return (10 - (y - 20) * 10 / 360)
end

function Meter:__init(handles)
	Entity.__init(self)
	self.children = handles
	self.controllable = true
end

function Meter:registerObservers()
	beholder.observe('hero_go', function() self.controllable = false end)
	beholder.observe('retry_level', function()
		self.controllable = true
		for i, handle in ipairs(self.children) do
			handle:unactivate()
		end
	end)
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
	self:_drawTimeBar()
end

function Meter:update()
	self._base.update(self)

	local timer = HighwayHero.timer
	local found = false
	for i, handle in ipairs(self.children) do
		if timer.status == 'started' then
			if found or handle:getTime() <= timer.time then
				handle:unactivate()
			else
				handle:activate()
				found = true
			end
		end
	end
end

function Meter:_sortHandles()
	self.children = _.sort(self.children, function(a, b)
		if a.dragging.active then return true end
		if b.dragging.active then return false end
		return a:getTime() < b:getTime()
	end)
end

function Meter:_drawTimeBar()
	local timer = HighwayHero.timer
	if timer.status == 'started' then
		local y = Meter.timeToY(timer.time)
		love.graphics.draw(R.images.timeBar, 35.5, y / 360 * 355 - 5)
	end
end

function Meter:isFilled()
	local times = _.map(self.children, function(h) return h:getTime() end)
	local maxTime = _.max(times)
	return maxTime == 10
end

function Meter:onMousePressed(x, y, button)
	if self.controllable then
		self._base.onMousePressed(self, x, y, button)
	end
end

return Meter
