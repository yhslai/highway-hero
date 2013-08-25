require 'lib/class'

Monster = class(Entity)

function Monster:__init(data, position)
	self._base.__init(self)

	self.x = 320 - 24
	self.maxHp = data.hp
	self.attack = data.attack
	self.defence = data.defence
	self.image = data.image
	self.position = position * 48
	self.tint = 0
	self.alpha = 1

	self.hp = self.maxHp
end

function Monster:registerObservers()
	beholder.observe('collide', function(hero, monster)
		if monster == self then
			self.hp = self.hp - hero.stats.attack / self.defence
			self.tint = 1
		end
	end)
end

function Monster:draw()
	love.graphics.setColor(255, (1-self.tint)*255, (1-self.tint)*255, self.alpha*255)
	love.graphics.draw(self.image, self.x, self:_screenY())
	love.graphics.setColor(255, 255, 255, 255)
	self:_drawHpMeter()
end

function Monster:_drawHpMeter()
	love.graphics.draw(R.images.hpMeter, self.x + 5, self:_screenY() - 10)
	love.graphics.setColor(255, 0, 0, 255)
	local width = math.max(0, self.hp / self.maxHp * 36)
	love.graphics.rectangle('fill', self.x + 6, self:_screenY() - 9, width, 6)
	love.graphics.setColor(255, 255, 255, 255)
end

function Monster:update(dt)
	self.tint = self.tint - dt
	self.tint = math.max(0, self.tint)
	if self:_distance() < 36 and self.hp > 0 then
		beholder.trigger('collide', HighwayHero.hero, self)
	end
	if self.hp <= 0 then
		self.alpha = self.alpha - dt * 2
		if self.alpha < 0 then self:removeSelf() end
	end
end

function Monster:_distance()
	local hero = HighwayHero.hero
	return self.position - hero.position
end

function Monster:_screenY()
	return 240 - self:_distance()
end

return Monster
