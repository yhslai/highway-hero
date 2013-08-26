require 'lib/AnAL'
_ = require 'lib/underscore'
inspect = require 'lib/inspect'
beholder = require 'lib/beholder'
require 'classes'

HighwayHero = {
	level = 0,
	maxLevel = 9,
	currentScreen = nil,
	meter = nil,
	timer = nil,
	hero = nil,
}

local function init_level()
	beholder.trigger('new_action', Action.talk)
end

local function load_level(n, oldMeter)
	HighwayHero.level = n

	local screen = Screen()

	local level = Level(tostring(n))
	local handles = _.map(level.data.handles, function(x) return Handle(x.action, x.time) end)
	local meter = oldMeter or Meter(handles)
	HighwayHero.meter = meter
	screen:addEntity(meter)

	local goButton = Button({
		onPressed = function() beholder.trigger('hero_go') end,
		onImage = R.images.goButtonOn,
		offImage = R.images.goButtonOff,
		checkOn = function() return meter:isFilled() end,
		once = true,
	}, 38, 392)
	screen:addEntity(goButton)

	local timer = Timer()
	HighwayHero.timer = timer
	screen:addEntity(timer)

	local finishLine = FinishLine(level.data.length)
	screen:addEntity(finishLine)

	local monsters = _.map(level.data.monsters, function(x) return Monster(x.data, x.position) end)
	screen:addEntities(monsters)

	local hero = Hero()
	HighwayHero.hero = hero
	screen:addEntity(hero)

	screen:addEntity(ControlMenu())

	HighwayHero.currentScreen = screen

	init_level()
end

function love.load()
	require 'R'
	load_level(9)

	beholder.observe('retry_level', function()
		--print(HighwayHero.level)
		HighwayHero.currentScreen:onRemoved()
		load_level(HighwayHero.level, HighwayHero.meter)
	end)
	beholder.observe('next_level', function()
		print(HighwayHero.level % HighwayHero.maxLevel + 1)
		HighwayHero.currentScreen:onRemoved()
		load_level(HighwayHero.level % HighwayHero.maxLevel + 1)
	end)
end

function love.update(dt)
	HighwayHero.currentScreen:update(dt)
	HighwayHero.currentScreen:afterUpdate()
end

function love.draw()
    love.graphics.draw(R.images.background, 0, 0)
    love.graphics.draw(R.images.meter, 18, 20)
	HighwayHero.currentScreen:draw()
	love.graphics.setColor(0, 0, 0, 255)
	local font = love.graphics.newFont('assets/font/Krungthep.ttf', 32)
	love.graphics.setFont(font)
	love.graphics.print('Level ' .. HighwayHero.level, 495, 15)
	font = love.graphics.newFont('assets/font/Krungthep.ttf', 24)
	love.graphics.setFont(font)
	love.graphics.printf('' .. string.format('%2.1f', HighwayHero.timer:remainingTime()) .. 's', 515, 430, 100, 'right')
	love.graphics.setColor(255, 255, 255, 255)
end

function love.mousepressed(x, y, button)
	HighwayHero.currentScreen:onMousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
	HighwayHero.currentScreen:onMouseReleased(x, y, button)
end
