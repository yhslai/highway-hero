require 'lib/class'

local Button = class(Entity)

function Button:__init(data, x, y)
	self._base.__init(self)

	self.onPressed = data.onPressed
	self.onReleased = data.onReleased
	self.onImage = data.onImage
	self.pressingImage = data.pressingImage
	self.offImage = data.offImage
	self.checkOn = data.checkOn

	self.x = x
	self.y = y
	self.status = 'off'
end

function Button:getImage()
	local image
	if self.status == 'on' then image = self.onImage
	elseif self.status == 'pressing' then image = self.pressingImage
	else image = self.offImage
	end

	return image
end

function Button:getRect()
	local image = self:getImage()
	if image then
		return Rect(self.x, self.y, image:getWidth(), image:getHeight())
	else
		return Rect(0, 0, 0, 0)
	end
end

function Button:draw()
	local image = self:getImage()
	if image then love.graphics.draw(image, self.x, self.y) end
end

function Button:update()
	if self.status == 'off' and self:checkOn() then
		self.status = 'on'
	elseif self.status == 'on' and not self:checkOn() then
		self.status = 'off'
	end
end

function Button:onMousePressed(x, y, button)
	if button == 'l' then
		if self.status == 'on' and self:getRect():contains(x, y) then
			if type(self.onPressed) == 'function' then
				self:onPressed()
				return true
			end
		end
	end
	return false
end

return Button
