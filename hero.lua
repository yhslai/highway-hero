require 'lib/class'

local Hero = class(Entity)

function Hero:__init()
	self._base.__init(self, 'hero')
	self.x = 320 - 24
	self.y = 240
	self.maxHp = 5
	self.position = 0
	self.bounceSpeed = 0
	self.tint = 0
	self.alpha = 1

	self.hp = self.maxHp
end

function Hero:registerObservers()
	beholder.observe('new_action', function(action)
		self.action = action
		self.anim = Action.toAnim(action)
		self.anim:seek(2)
		self.stats = Action.toStats(action)
	end)
	beholder.observe('collide', function(hero, monster)
		self.hp = self.hp - monster.attack / self.stats.defence
		self.bounceSpeed = 1.5 + self.stats.speed * 1.5
		self.tint = 1
	end)

end

function Hero:draw()
	love.graphics.setColor(255, (1-self.tint)*255, (1-self.tint)*255, self.alpha*255)
	self.anim:draw(self.x, self.y)
	love.graphics.setColor(255, 255, 255, 255)
	self:_drawHpMeter()
end

function Hero:_drawHpMeter()
	love.graphics.draw(R.images.hpMeter, self.x + 5, self.y + 50)
	love.graphics.setColor(255, 0, 0, 255)
	local width = math.max(0, self.hp / self.maxHp * 36)
	love.graphics.rectangle('fill', self.x + 6, self.y + 51, width, 6)
	love.graphics.setColor(255, 255, 255, 255)
end

function Hero:update(dt)
	if HighwayHero.timer.status == 'started' then
		if self.hp > 0 then
			self.anim:update(dt)
			self.position = self.position + (self.stats.speed - self.bounceSpeed) * 48 * dt
			self.bounceSpeed = self.bounceSpeed - self.stats.speed * dt * 4
			self.bounceSpeed = math.max(0, self.bounceSpeed)
			self.tint = self.tint - dt
			self.tint = math.max(0, self.tint)
			if self.action == Action.heal then
				self.hp = math.min(self.maxHp, self.hp + dt * 0.75)
			end
		else
			self.alpha = math.max(0, self.alpha - dt * 2)
			if self.alpha == 0 then
				beholder.trigger('gameover', 'die')
				self:removeSelf()
			end
		end
	end
end

return Hero
