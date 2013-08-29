require 'lib/class'

local Minimap = class(Entity)

function Minimap:__init(length, monsters)
	self._base.__init(self)

	self.length = length
	self.monsters = monsters
end

function Minimap:draw()
	love.graphics.setColor(59, 35, 20, 255)
	love.graphics.rectangle('fill', 509, 56, 90+2, self.length * 10+8+2)
	love.graphics.setColor(95, 146, 50, 255)
	love.graphics.rectangle('fill', 510, 57, 90, self.length * 10+8)
	love.graphics.setColor(249, 174, 93, 255)
	love.graphics.rectangle('fill', 550, 57, 10, self.length * 10+8)
	love.graphics.setColor(255, 255, 255, 255)

	for i, m in ipairs(self.monsters) do
		if m.hp > 0 then
			if m.maxHp == 1 then
				love.graphics.setColor(79, 190, 237, 255)
			elseif m.maxHp == 2 then
				love.graphics.setColor(0, 0, 0, 255)
			elseif m.maxHp == 4 then
				love.graphics.setColor(239, 65, 54, 255)
			end
			love.graphics.circle('fill', 555, 60+(self.length-m.position/48)*10, 5, 10)
		end
	end
	love.graphics.setColor(166, 168, 171, 255)
	love.graphics.circle('fill', 555, 60+(self.length-HighwayHero.hero.position/48)*10, 5, 10)
	love.graphics.setColor(255, 255, 255, 255)
end

return Minimap
