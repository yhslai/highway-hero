local monster_data = {
	slime = {
		hp = 2,
		attack = 0.75,
		defence = 1,
		image = R.images.monsters.slime,
	},
	snake = {
		hp = 1,
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
	length = 7,
	handles = {
		{ action = "attack", time = 7 },
		{ action = "move", time = 10 }
	},
	monsters = {
		{ data = monster_data.slime, position = 3.5}
	}
}
