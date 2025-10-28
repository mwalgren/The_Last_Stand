extends Node2D

@export var label:Label
@export var state_timer:Timer
@export var enemy_factory:Node2D
@onready var playerStats:Node2D
@export var upgradePanel:CanvasLayer
@export var levelUpScene:PackedScene
@export var upgradePool:Node2D
@onready var playerInst = get_tree().get_first_node_in_group("player")

var upgradeScene

signal learn_skill(skill:Resource)

var CURRENT_STATE = null
var NEXT_STATE = null
var WAVE_COUNT = 0

enum GAMESTATE {MENU, PREP, COUNTDOWN, SPAWNING, ACTIVE, BOSS, WAVE_CLEARED, REWARDS, INTERMISSION}


func _ready() -> void:
	pass


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
			enemy_factory.difficulty = WAVE_COUNT
			get_tree().paused = false
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
			NEXT_STATE = GAMESTATE.PREP
		GAMESTATE.BOSS:
			label.text = CURRENT_STATE
		GAMESTATE.INTERMISSION:
			get_tree().paused = true
			state_timer.wait_time = 20.00
			state_timer.start()
			label.text = "INTERMISSION"
			NEXT_STATE = GAMESTATE.ACTIVE


func _on_timer_timeout() -> void:
	_set_state(NEXT_STATE)


func on_enemy_death(xp:int):
	print("on enemy death triggered")
	if playerStats:
		playerStats.gainXP(xp)
		if playerStats.xp >= playerStats.xpToLevel:
			on_level_up()



func on_level_up():
	_set_state(GAMESTATE.INTERMISSION)
	upgradeScene = levelUpScene.instantiate()
	upgradeScene.process_mode = Node.PROCESS_MODE_WHEN_PAUSED

	#var lvl = playerInst.get_level()
	#if (lvl % 2) == 0 and lvl < 10:
		#upgradeScene.show_skills(upgradePool.pick_skill(3))
		#upgradePanel.add_child(upgradeScene)
		#upgradeScene.skill_selected.connect(equip_player_skill, CONNECT_ONE_SHOT)
	#else:
	upgradeScene.show_options(upgradePool.pick(3))
	upgradePanel.add_child(upgradeScene)
	upgradeScene.add_mod.connect(apply_mod, CONNECT_ONE_SHOT)


func apply_mod(mod_id:String):
	var mod = upgradePool.get_mod_by_id(mod_id)
	print(mod)
	if mod: 
		playerInst.apply_mod(mod)
		print("applied mod", mod)
	if is_instance_valid(upgradeScene):
		upgradeScene.queue_free()
		upgradeScene = null
	_set_state(GAMESTATE.ACTIVE)


func equip_player_skill(resource):
	if resource:
		playerInst.skillBook.equip_skill(resource)
		upgradePool.mark_taken(resource)
	if is_instance_valid(upgradeScene):
		upgradeScene.queue_free()
		upgradeScene = null
	_set_state(GAMESTATE.ACTIVE)
