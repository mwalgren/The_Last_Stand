extends Area2D



var dmg:int
var is_in_range:bool
signal player_in_range
signal player_out_of_range




func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("castle"):
		player_in_range.emit()
		print("player in range")
		if area.has_method("take_damage"):
			area.take_damage(dmg)
	if area.is_in_group("goal_radius"):
		pass


func _on_area_exited(area: Area2D) -> void:
	print("player out of range")
	player_out_of_range.emit()
