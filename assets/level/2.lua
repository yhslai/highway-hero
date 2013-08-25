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
	length = 12,
	handles = {
		{ action = "attack", time = 10 },
		{ action = "move", time = 5 }
	},
	monsters = {
		{ data = monster_data.slime, position = 7 },
		{ data = monster_data.snake, position = 3 },
	}
}
