extends Area2D

@onready var projFactory = get_tree().get_first_node_in_group("projectile_factory")
var target_pool:Array[Area2D]
signal enemy_in_range
signal enemy_out_range


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		enemy_in_range.emit()
		print("enemy in range")
		if !projFactory.current_target:
			projFactory.current_target = area
		else: 
			target_pool.append(area)


func _on_area_exited(area: Area2D) -> void:
	enemy_out_range.emit()
	if projFactory:
		if area == projFactory.current_target:
			if target_pool.size() > 0:
				projFactory.current_target = target_pool.pop_front()
