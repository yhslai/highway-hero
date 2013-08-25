require 'lib/class'
require 'lib/json'

local Level = class()

function Level:__init(level_name)
	self.data = json.decode(
	love.filesystem.read('assets/level/' .. level_name .. '.json'))
end

return Level
