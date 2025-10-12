extends Node2D

@export var proj_origin_point:Marker2D


func get_origin(config:skillConfig, target):
	match config.spawn_mode: 
		"at_target":
				if target == null or !is_instance_valid(target):
					return null
				if target.has_node("at_target"):
					var ground_target = target.at_target
					return ground_target.global_position
				else: 
					print("nope") 
					return target.global_position
		"on_target":
			pass
		"at_teammate":
			pass
		"self":
			print("SELF ORIGIN POINT FOUND")
			return proj_origin_point.global_position
