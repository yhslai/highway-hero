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
	length = 10,
	handles = {
		{ action = "attack", time = 10 },
		{ action = "heal", time = 6.6 },
		{ action = "move", time = 3.3 },
	},
	monsters = {
		{ data = monster_data.slime, position = 3 },
		{ data = monster_data.octopus, position = 6 },
	}
}
