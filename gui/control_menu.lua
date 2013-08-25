require 'lib/class'

ControlMenu = class(Entity)

function ControlMenu:__init()
	self._base.__init(self)

	self.retryButton = Button({
		onPressed = function() beholder.trigger('retry_level') end,
		onImage = R.images.retryButton,
	}, 38, 392)
	self.nextButton = Button({
		onPressed = function() beholder.trigger('next_level') end,
		onImage = R.images.nextButton,
	}, 38, 392)
	self.diedLabel = Button({
		onImage = R.images.diedLabel
	}, 200, 192)
	self.timeoutLabel = Button({
		onImage = R.images.timeoutLabel
	}, 200, 192)
	self.passLabel = Button({
		onImage = R.images.passLabel
	}, 200, 192)
	self.completeLabel = Button({
		onImage = R.images.completeLabel
	}, 140, 120)

	self.retryButton:hide()
	self.nextButton:hide()
	self.diedLabel:hide()
	self.timeoutLabel:hide()
	self.passLabel:hide()
	self.completeLabel:hide()

	table.insert(self.children, self.retryButton)
	table.insert(self.children, self.nextButton)
	table.insert(self.children, self.diedLabel)
	table.insert(self.children, self.timeoutLabel)
	table.insert(self.children, self.passLabel)
	table.insert(self.children, self.completeLabel)
end


function ControlMenu:registerObservers()
	beholder.observe('gameover', function(reason)
		self.retryButton:show()
		if reason == 'die' then self.diedLabel:show() end
		if reason == 'timeout' then self.timeoutLabel:show() end
	end)
	beholder.observe('passed_level', function()
		if HighwayHero.level == HighwayHero.maxLevel then
			self.completeLabel:show()
		else
			self.passLabel:show()
		end
		self.nextButton:show()
	end)
end

return ControlMenu
