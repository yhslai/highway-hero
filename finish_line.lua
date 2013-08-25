require 'lib/class'

FinishLine = class(Entity)

function FinishLine:__init(position)
	self._base.__init(self)

	self.x = 320 - 59
	self.position = position * 48
	self.image = R.images.finishLine
end

function FinishLine:draw()
	love.graphics.draw(self.image, self.x, self:_screenY())
end

function FinishLine:update(dt)
	if self:_distance() < 12 then
		beholder.trigger('passed_level')
	end
end

function FinishLine:_distance()
	local hero = HighwayHero.hero
	return self.position - hero.position
end

function FinishLine:_screenY()
	return 240 - self:_distance()
end

return FinishLine
