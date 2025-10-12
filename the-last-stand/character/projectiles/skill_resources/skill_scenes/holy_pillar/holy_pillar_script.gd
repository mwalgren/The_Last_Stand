extends Node2D


@export var animSprite:AnimatedSprite2D
var dmg:int = 10
var target


func _ready() -> void:
	animSprite.play("activate")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.has_method("take_damage"):
			area.take_damage(dmg)


func set_target(t:Node2D):
	if t == null:return
	target = t
