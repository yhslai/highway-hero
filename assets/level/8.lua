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
	length = 8,
	handles = {
		{ action = "attack", time = 1 },
		{ action = "defend", time = 4 },
		{ action = "move", time = 7 },
		{ action = "heal", time = 10 },
	},
	monsters = {
		{ data = monster_data.slime, position = 6 },
		{ data = monster_data.slime, position = 5 },
		{ data = monster_data.snake, position = 4 },
		{ data = monster_data.slime, position = 2 },
		{ data = monster_data.slime, position = 1 },
	}
}
