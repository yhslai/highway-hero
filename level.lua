require 'lib/class'
require 'lib/json'

local Level = class()

function Level:__init(level_name)
	self.data = dofile('assets/level/' .. level_name .. '.lua')
end

return Level
