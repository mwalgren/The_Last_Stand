extends Node2D

@export var proj_origin_point:Marker2D


func get_origin(config:skillConfig):
	print("GETTING ORIGIN")
	match config.spawn_mode: 
		"at_target":
			pass
		"on_target":
			pass
		"at_teammate":
			pass
		"self":
			print("SELF ORIGIN POINT FOUND")
			return proj_origin_point.global_position
