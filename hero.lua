require 'lib/class'

local Hero = class(Entity)

function Hero:__init()
	self._base.__init(self)
	self.x = 320 - 24
	self.y = 240
	self.position = 0
end

function Hero:registerObservers()
	beholder.observe('new_action', function(action)
		self.action = action
		self.anim = Action.toAnim(action)
	end)
end

function Hero:update(dt)
	self.anim:update(dt)
end

function Hero:draw()
	self.anim:draw(self.x, self.y)
end

return Hero
