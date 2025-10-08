extends Control

@export var archer:TextureButton
@export var priest:TextureButton
@export var warrior:TextureButton

@export var char_pool:Array[Resource]


func _ready() -> void:
	pass


func archer_pressed() -> void:
	print("button pressed")
	global.selected_chars.append(char_pool[0])
	get_tree().change_scene_to_file("res://game/map/map.tscn")


func priest_pressed() -> void:
	global.selected_chars.append(char_pool[1])
	get_tree().change_scene_to_file("res://game/map/map.tscn")

func warrior_pressed() -> void:
	global.selected_chars.append(char_pool[2])
	get_tree().change_scene_to_file("res://game/map/map.tscn")
