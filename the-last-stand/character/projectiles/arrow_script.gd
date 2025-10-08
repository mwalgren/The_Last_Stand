extends Path2D

@export var hitBox:Area2D
@export var sprite:Sprite2D
@export var pathFollow:PathFollow2D

var dmg:int
var target_pos
var starting_pos:Vector2
var target:Node2D
var speed:int = 25


func _physics_process(delta: float) -> void:
	if target:
		var p1 := to_local(target.global_position)
		curve.set_point_position(1,p1)
		pathFollow.progress += speed * delta


func set_target(target:Node2D):
	if target:
		var target_pos_translated = to_local(target.global_position)
		var starting_pos_translated = to_local(starting_pos)
		curve.add_point(starting_pos_translated)
		curve.add_point(target_pos_translated)
		curve.set_point_in(0,Vector2(0,-50))
		curve.set_point_out(1,Vector2(0,-50))
		pathFollow.progress = 0.0



func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.has_method("take_damage"):
			area.take_damage(dmg)
