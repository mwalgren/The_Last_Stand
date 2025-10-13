extends Node2D


var playerToSpawn:player
@onready var player_default_spawn:Marker2D = $def_spawn
@onready var castle_default_spawn:Marker2D = $castle_spawn
@export var player_scene:PackedScene
@export var game_controller:Node2D
@export var player_castle:PackedScene


func _ready() -> void:
	add_to_group("player_factory")
	spawn_player()




func spawn_player():
	var player_inst = player_scene.instantiate()
	var castle_scene = player_castle.instantiate()
	add_child(player_inst)
	add_child(castle_scene)
	player_inst.set_character_data(global.selected_chars[0])
	castle_scene.global_position = castle_default_spawn.global_position
	game_controller.playerStats = player_inst.get_node("playerStats")
	player_inst.global_position = player_default_spawn.global_position
