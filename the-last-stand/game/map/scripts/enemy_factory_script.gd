extends Node2D
class_name enemyFactory

@export var t1_enemy_pool:Array[Resource]
@export var enemy_scene:PackedScene
@export var spawn_timer:Timer
@export var spawn_pool:Array[Marker2D]
@export var gameController:Node2D
@export var pathGoal:Node

var difficulty:int



func _process(delta: float) -> void:
	pass


func _ready() -> void:
	add_to_group("enemy_factory")



func get_enemy():
	var enemy_spawned = t1_enemy_pool.pick_random()
	return enemy_spawned


func spawn_enemy(enemyToSpawn):
	if gameController.CURRENT_STATE == gameController.GAMESTATE.ACTIVE:
		var enemy_inst = enemy_scene.instantiate()
		enemy_inst.set_enemy_data(get_enemy())
		enemy_inst.goal = pathGoal
		enemy_inst.agent.target_position = pathGoal.global_position
		enemy_inst.agent.target_desired_distance = 32.0
		enemy_inst.agent.avoidance_enabled = true
		add_child(enemy_inst)
		var randSpawn = spawn_pool.pick_random()
		enemy_inst.global_position = randSpawn.global_position
	
		var enemy_hurtbox = enemy_inst.get_node("hurtBox")
		enemy_hurtbox.enemyDied.connect(gameController.on_enemy_death, CONNECT_ONE_SHOT)

func spawn_time():
	if gameController.CURRENT_STATE == gameController.GAMESTATE.ACTIVE:
		spawn_timer.wait_time = (10.0 - difficulty)
		spawn_timer.start()


func _on_timer_timeout() -> void:
	spawn_enemy(get_enemy())
