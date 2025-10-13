extends Node2D

@export var label:Label
@export var state_timer:Timer
@export var enemy_factory:Node2D
@onready var playerStats:Node2D

var CURRENT_STATE = null
var NEXT_STATE = null
var WAVE_COUNT = 0

enum GAMESTATE {MENU, PREP, COUNTDOWN, SPAWNING, ACTIVE, BOSS, WAVE_CLEARED, REWARDS, INTERMISSION}


func _ready() -> void:
	enemy_factory.difficulty = WAVE_COUNT

func _set_state(next):
	_enter_state(next)


func _enter_state(state):
	CURRENT_STATE = state
	match state:
		GAMESTATE.MENU:
			label.text = "MENU"
		GAMESTATE.PREP:
			state_timer.wait_time = 10.00
			state_timer.start()
			label.text = "PREP"
			NEXT_STATE = GAMESTATE.COUNTDOWN
		GAMESTATE.COUNTDOWN:
			state_timer.wait_time = 3.00
			state_timer.start()
			label.text = "COUNTDOWN"
			NEXT_STATE = GAMESTATE.ACTIVE
		GAMESTATE.ACTIVE:
			state_timer.wait_time = 90.00
			state_timer.start()
			enemy_factory.spawn_time()
			label.text = "ACTIVE"
			NEXT_STATE = GAMESTATE.WAVE_CLEARED
		GAMESTATE.WAVE_CLEARED:
			state_timer.wait_time = 10.00
			state_timer.start()
			label.text = "WAVE_CLEARED"
			WAVE_COUNT += 1
			NEXT_STATE = GAMESTATE.REWARDS
		GAMESTATE.REWARDS:
			state_timer.wait_time = 30.00
			state_timer.start()
			label.text = "REWARDS"
			NEXT_STATE = GAMESTATE.INTERMISSION
		GAMESTATE.BOSS:
			label.text = CURRENT_STATE
		GAMESTATE.INTERMISSION:
			state_timer.wait_time = 10.00
			state_timer.start()
			label.text = "INTERMISSION"
			NEXT_STATE = GAMESTATE.COUNTDOWN


func _on_timer_timeout() -> void:
	_set_state(NEXT_STATE)


func on_enemy_death(xp:int):
	print("on enemy death triggered")
	if playerStats:
		playerStats.gainXP(xp)


func on_level_up():
	pass
