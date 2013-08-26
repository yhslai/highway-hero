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
	length = 6.5,
	handles = {
		{ action = "attack", time = 0 },
		{ action = "move", time = 2 },
		{ action = "heal", time = 5 },
		{ action = "defend", time = 8 },
		{ action = "attack", time = 10 },
	},
	monsters = {
		{ data = monster_data.snake, position = 6 },
		{ data = monster_data.slime, position = 3 },
		{ data = monster_data.octopus, position = 1 },
	}
}
