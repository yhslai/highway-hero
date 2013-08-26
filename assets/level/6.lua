local monster_data = {
	slime = {
		hp = 1,
		attack = 0.75,
		defence = 1,
		image = R.images.monsters.slime,
	},
	snake = {
		hp = 2,
		attack = 1.5,
		defence = 1,
		image = R.images.monsters.snake,
	},
	octopus = {
		hp = 4,
		attack = 0.5,
		defence = 1,
		image = R.images.monsters.octopus,
	},
}

return {
	length = 5,
	handles = {
		{ action = "heal", time = 1 },
		{ action = "attack", time = 5 },
		{ action = "move", time = 10 }
	},
	monsters = {
		{ data = monster_data.octopus, position = 3 },
		{ data = monster_data.octopus, position = 1.5 },
	}
}
