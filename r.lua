local newImage = love.graphics.newImage
local newSound = function (filename) return love.audio.newSource(filename, "static") end
local heroSheet = newImage('assets/sprite/character.png')

R = {
	images = {
		background = newImage('assets/background.png'),
		handleBar = newImage('assets/gui/handle_bar.png'),
		handleHeadAttack = newImage('assets/gui/handle_head_attack.png'),
		handleHeadMove = newImage('assets/gui/handle_head_move.png'),
		handleHeadHeal = newImage('assets/gui/handle_head_heal.png'),
		handleHeadDefend = newImage('assets/gui/handle_head_defend.png'),
		handleHeadTalk = newImage('assets/gui/handle_head_talk.png'),
		highlightHead = newImage('assets/gui/highlight_head.png'),
		highlightBar = newImage('assets/gui/highlight_bar.png'),
		meter = newImage('assets/gui/meter.png'),
		goButtonOn = newImage('assets/gui/go_button_on.png'),
		goButtonOff = newImage('assets/gui/go_button_off.png'),
		retryButton = newImage('assets/gui/retry_button.png'),
		nextButton = newImage('assets/gui/next_button.png'),
		timeBar = newImage('assets/gui/time_bar.png'),
		monsters = {
			slime = newImage('assets/sprite/slime.png'),
			snake = newImage('assets/sprite/snake.png'),
			octopus = newImage('assets/sprite/octopus.png'),
		},
		hpMeter = newImage('assets/sprite/hp_meter.png'),
		diedLabel = newImage('assets/gui/died_label.png'),
		timeoutLabel = newImage('assets/gui/timeout_label.png'),
		passLabel = newImage('assets/gui/pass_label.png'),
		completeLabel = newImage('assets/gui/complete_label.png'),
		finishLine = newImage('assets/finish_line.png'),
	},
	anims = {
		hero = {
			talk = newAnimation(heroSheet, 48, 48, 0.2, {1, 2, 3}),
			move = newAnimation(heroSheet, 48, 48, 0.125, {4, 5, 6}),
			attack = newAnimation(heroSheet, 48, 48, 0.2, {7, 8, 9}),
			heal = newAnimation(heroSheet, 48, 48, 0.2, {10, 11, 12}),
			defend = newAnimation(heroSheet, 48, 48, 0.2, {13, 14, 15}),
		}
	},
	sounds = {
		sword = newSound('assets/sound/sword.ogg'),
		hit = newSound('assets/sound/hit.ogg'),
		die = newSound('assets/sound/die.ogg'),
	}
}
