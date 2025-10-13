extends Node2D

var current_target = null


func _ready() -> void:
	pass

func _enter_tree() -> void:
	add_to_group("projectile_factory")


func spawn(config,target,origin):
	if target:
		var inst = config.projectile_scene.instantiate()
		inst.set_data(snapshot_final(config))
		inst.global_position = origin
		inst.set_target(target)
		add_child(inst)
	else:return


func snapshot_final(cfg:skillConfig):
	var s = weaponStats.new()

	#damage and mods 
	s.damage = cfg.damage
	#s.damage += m.damageMod

	#lifetime/how long things last on the scene + mods 
	s.lifetime = cfg.lifetime
	#s.lifetime += m.lifeTimeMod

	#projectile speed
	s.speed = cfg.speed
	#s.speed += m.speedMod
	
	return s
