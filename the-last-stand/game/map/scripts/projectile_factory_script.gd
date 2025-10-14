extends Node2D

var current_target = null


func _ready() -> void:
	pass

func _enter_tree() -> void:
	add_to_group("projectile_factory")


func spawn(config,target,origin):
	if target:
		var inst = config.projectile_scene.instantiate()
		add_child(inst)
		inst.global_position = origin
		inst.set_target(target)
		inst.set_data(snapshot_final(config))
	else:return


func snapshot_final(cfg:skillConfig):
	var s = weaponStats.new()
	var m = get_tree().get_first_node_in_group("modBank")
	var ms = m.get_totals()
	
	#damage and mods 
	s.damage = cfg.damage
	s.damage += ms.flat_damage

	#lifetime/how long things last on the scene + mods 
	s.lifetime = cfg.lifetime
	s.lifetime += ms.flat_lifetime

	#projectile speed
	s.speed = cfg.speed
	s.speed += ms.flat_speed
	
	var base_mult = cfg.size
	s.size_mult = base_mult * ms.size_mult
	
	return s
