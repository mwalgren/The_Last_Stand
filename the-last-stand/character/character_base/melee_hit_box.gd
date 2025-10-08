extends Area2D

@export var dmg:int




func _ready() -> void:
	pass




func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.has_method("take_damage"):
			area.take_damage(dmg)
