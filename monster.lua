require 'lib/class'

Monster = class(Entity)

function Monster:__init(data, position)
	self._base.__init(self)

	self.maxHp = data.hp
	self.attack = data.attack
	self.defence = data.defence
	self.image = data.image
	self.position = position * 48

	self.hp = self.maxHp
end

function Monster:draw()
	love.graphics.draw(self.image, 320 - 24, 240 - self:_distance())
end

function Monster:update(dt)
	if self:_distance() < 36 then
		beholder.trigger('collide', hero, self)
	end
end

function Monster:_distance()
	local hero = HighwayHero.hero
	return self.position - hero.position
end

return Monster
