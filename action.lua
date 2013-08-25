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

function Action.toAnim(action)
	local animLookup = {
		[Action.attack] = R.anims.hero.attack,
		[Action.move] = R.anims.hero.move,
		[Action.defend] = R.anims.hero.defend,
		[Action.heal] = R.anims.hero.heal,
		[Action.talk] = R.anims.hero.talk
	}

	return animLookup[action]
end

function Action.toStats(action)
	local statsLookup = {
		[Action.attack] = { attack = 1, defence = 1, speed = 1.5 },
		[Action.move] = { attack = 0.75, defence = 0.75, speed = 2.5 },
		[Action.defend] = { attack = 0.75, defence = 2, speed = 1 },
		[Action.heal] = { attack = 0.5, defence = 0.5, speed = 1 },
		[Action.talk] = { attack = 0.5, defence = 0.5, speed = 1.5 },
	}

	return statsLookup[action]
end

return Action
