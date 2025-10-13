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
		inst.set_data(snapshot_final(config))
		inst.global_position = origin
		inst.set_target(target)
		add_child(inst)
	else:return


func snapshot_final(cfg:skillConfig):
	var s = weaponStats.new()
	s.damage = cfg.damage #* damage_multi
	s.lifetime = cfg.lifetime
	s.speed = cfg.speed
	return s
