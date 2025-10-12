extends Node2D
class_name enemyFactory

@export var t1_enemy_pool:Array[Resource]
@export var enemy_scene:PackedScene
@export var spawn_timer:Timer
@export var spawn_loc:Marker2D

var difficulty:int



func _process(delta: float) -> void:
	pass


func _ready() -> void:
	add_to_group("enemy_factory")



func get_enemy():
	var enemy_spawned = t1_enemy_pool.pick_random()
	return enemy_spawned


func spawn_enemy(enemyToSpawn):
	var enemy_inst = enemy_scene.instantiate()
	enemy_inst.set_enemy_data(get_enemy())
	add_child(enemy_inst)
	enemy_inst.global_position = spawn_loc.global_position


func spawn_time():
		spawn_timer.wait_time = (10.0 - difficulty)
		spawn_timer.start()


func _on_timer_timeout() -> void:
	spawn_enemy(get_enemy())
