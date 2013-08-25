require 'lib/AnAL'
_ = require 'lib/underscore'
inspect = require 'lib/inspect'
beholder = require 'lib/beholder'
require 'classes'

HighwayHero = {
	currentScreen = nil,
	meter = nil,
	timer = nil,
	hero = nil,
}

local function load_level(n)
	local screen = Screen()

	local level = Level(tostring(n))
	local handles = _.map(level.data.handles, function(x) return Handle(x.action, x.time) end)
	local meter = Meter(handles)
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

	local monsters = _.map(level.data.monsters, function(x) return Monster(x.data, x.position) end)
	screen:addEntities(monsters)

	local hero = Hero()
	HighwayHero.hero = hero
	screen:addEntity(hero)

	screen:addEntity(ControlMenu())

	HighwayHero.currentScreen = screen
end

local function init_level()
	beholder.trigger('new_action', Action.talk)
end

function love.load()
	require 'R'
	load_level(1)
	init_level()
end

function love.update(dt)
	HighwayHero.currentScreen:update(dt)
	HighwayHero.currentScreen:afterUpdate()
end

function love.draw()
    love.graphics.draw(R.images.background, 0, 0)
    love.graphics.draw(R.images.meter, 18, 20)
	HighwayHero.currentScreen:draw()
end

function love.mousepressed(x, y, button)
	HighwayHero.currentScreen:onMousePressed(x, y, button)
end

function love.mousereleased(x, y, button)
	HighwayHero.currentScreen:onMouseReleased(x, y, button)
end
