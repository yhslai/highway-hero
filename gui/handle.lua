require 'lib/class'

local Handle = class(Entity)

function Handle:__init(action, time)
	Entity.__init(self)
	self.action = Action.fromString(action)
	self.headImage = Action.toHandleHead(action)
	self.x = 40
	self.y = Meter.timeToY(time)
	self.dragging = {
		active = false,
		offsetX = 0,
		offsetY = 0,
	}
	self.active = false
end

function Handle:getTime()
	return Meter.yToTime(self.y)
end

function Handle:draw()
	love.graphics.draw(R.images.handleBar, self.x, self.y)
	love.graphics.draw(self.headImage, self.x + 50, self.y)
	if self.active then
		love.graphics.draw(R.images.highlightHead, self.x + 50 - 7, self.y - 7)
		love.graphics.draw(R.images.highlightBar, self.x, self.y - 6)
	end
end

function Handle:update()
	if self.dragging.active then
		local y = love.mouse.getY() - self.dragging.offsetY
		local time = Meter.yToTime(y)
		if time < 0 then
			self.dragging.offsetY = love.mouse.getY() - Meter.timeToY(0)
			self.y = Meter.timeToY(0)
		elseif time > 10 then
			self.dragging.offsetY = love.mouse.getY() - Meter.timeToY(10)
			self.y = Meter.timeToY(10)
		else
			self.y = y
		end
	end
end

-- Override Entity:onMousePressed
function Handle:onMousePressed(x, y, button)
	if button == 'l' then
		if self:_hoverBar(x, y) or self:_hoverHead(x, y) then
			self.dragging.active = true
			self.dragging.offsetX = x - self.x
			self.dragging.offsetY = y - self.y
			print("Dragging!")
			return true
		end
	end

	return false
end

function Handle:onMouseReleased(x, y, button)
	if button == 'l' then self.dragging.active = false end
	return false
end

function Handle:_hoverBar(x, y)
	local image = R.images.handleBar
	return Rect(self.x, self.y, image:getWidth(), image:getHeight()):contains(x, y)
end

function Handle:_hoverHead(x, y)
	return Rect(self.x+50, self.y, self.headImage:getWidth(), self.headImage:getHeight())
		   :contains(x, y)
end

function Handle:activate()
	if not self.active then
		self.active = true
		beholder.trigger('new_action', self.action)
	end
end

function Handle:unactivate()
	self.active = false
end

return Handle
