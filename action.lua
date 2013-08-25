local Action = {
	attack = 'attack',
	move = 'move',
	defend = 'defend',
	heal = 'heal',
	talk = 'talk'
}

function Action.fromString(str)
	return str
end

function Action.toHandleHead(action)
	local headLookup = {
		[Action.attack] = R.images.handleHeadAttack,
		[Action.move] = R.images.handleHeadMove,
		[Action.defend] = R.images.handleHeadDefend,
		[Action.heal] = R.images.handleHeadHeal,
		[Action.talk] = R.images.handleHeadTalk,
	}

	return headLookup[action]
end

function Action.toColor(action)
	local colorLookup = {
		[Action.attack] = {119, 206, 238, 255},
		[Action.move] = {249, 240, 111, 255},
		[Action.defend] = {204, 163, 204, 255},
		[Action.heal] = {250, 175, 64, 255},
		[Action.talk] = {51, 255, 194, 255},
	}

	return colorLookup[action]
end

return Action
