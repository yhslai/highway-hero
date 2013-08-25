require 'classes'
_ = require 'lib/underscore'
inspect = require 'lib/inspect'
beholder = require 'lib/beholder'

HighwayHero = {
	currentScreen = Screen(),
	meter = nil,
}

local function hero_go()
	print("go")
end

local function load_level(n)
	local level = Level(tostring(n))
	local handles = _.map(level.data.handles, function(x) return Handle(x.action, x.time) end)
	local meter = Meter(handles)
	HighwayHero.meter = meter
	HighwayHero.currentScreen:addEntity(meter)

	local go_button = Button({
		onPressed = hero_go,
		onImage = R.images.go_button_on,
		offImage = R.images.go_button_off,
		checkOn = function() return meter:isFilled() end
	}, 38, 395)
	HighwayHero.currentScreen:addEntity(go_button)
end

function love.load()
	require 'R'
	load_level(1)
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
