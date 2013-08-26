require 'lib/class'

local Level = class()

function Level:__init(level_name)
	self.data = require('./assets/level/' .. level_name)
end

return Level
