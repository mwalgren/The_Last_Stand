extends Node2D


var playerToSpawn:player
@onready var player_default_spawn:Marker2D = $def_spawn
@export var player_scene:PackedScene


func _ready() -> void:
	add_to_group("player_factory")
	spawn_player()




func spawn_player():
	var player_inst = player_scene.instantiate()
	add_child(player_inst)
	player_inst.set_character_data(global.selected_chars[0])
	player_inst.global_position = player_default_spawn.global_position
