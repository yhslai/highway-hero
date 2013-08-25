local heroSheet = love.graphics.newImage('assets/sprite/character.png')

R = {
	images = {
		background = love.graphics.newImage('assets/background.png'),
		handleBar = love.graphics.newImage('assets/gui/handle_bar.png'),
		handleHeadAttack = love.graphics.newImage('assets/gui/handle_head_attack.png'),
		handleHeadMove = love.graphics.newImage('assets/gui/handle_head_move.png'),
		handleHeadHeal = love.graphics.newImage('assets/gui/handle_head_heal.png'),
		handleHeadDefend = love.graphics.newImage('assets/gui/handle_head_defend.png'),
		handleHeadTalk = love.graphics.newImage('assets/gui/handle_head_talk.png'),
		highlightHead = love.graphics.newImage('assets/gui/highlight_head.png'),
		highlightBar = love.graphics.newImage('assets/gui/highlight_bar.png'),
		meter = love.graphics.newImage('assets/gui/meter.png'),
		goButtonOn = love.graphics.newImage('assets/gui/go_button_on.png'),
		goButtonOff = love.graphics.newImage('assets/gui/go_button_off.png'),
		timeBar = love.graphics.newImage('assets/gui/time_bar.png'),
		monsters = {
			slime = love.graphics.newImage('assets/sprite/slime.png'),
			snake = love.graphics.newImage('assets/sprite/snake.png'),
			octopus = love.graphics.newImage('assets/sprite/octopus.png'),
		},
	},
	anims = {
		hero = {
			talk = newAnimation(heroSheet, 48, 48, 0.25, {1, 2, 3}),
			move = newAnimation(heroSheet, 48, 48, 0.125, {4, 5, 6}),
			attack = newAnimation(heroSheet, 48, 48, 0.25, {7, 8, 9}),
			heal = newAnimation(heroSheet, 48, 48, 0.25, {10, 11, 12}),
			defend = newAnimation(heroSheet, 48, 48, 0.25, {13, 14, 15}),
		}
	}
}
