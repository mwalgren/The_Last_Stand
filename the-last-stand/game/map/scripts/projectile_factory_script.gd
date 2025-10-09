extends Node2D

var current_target = null


func _ready() -> void:
	pass

func _enter_tree() -> void:
	add_to_group("projectile_factory")


func spawn(config,target,origin):
	print("spawning attack")
	if target:
		print("TARGET FOUND IN SPAWN FUNC")
		var inst = config.projectile_scene.instantiate()
		inst.global_position = origin
		inst.set_target(target)
		add_child(inst)
