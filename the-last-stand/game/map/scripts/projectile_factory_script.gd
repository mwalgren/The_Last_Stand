extends Node2D

var current_target = null


func _ready() -> void:
	pass

func _enter_tree() -> void:
	add_to_group("projectile_factory")


func fire_projectile(target):
	if target:
		pass
