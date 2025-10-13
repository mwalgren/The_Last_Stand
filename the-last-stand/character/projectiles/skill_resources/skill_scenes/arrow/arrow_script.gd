extends Path2D

@export var hitBox:Area2D
@export var sprite:Sprite2D
@export var pathFollow:PathFollow2D

var dmg:float
var target_pos
var starting_pos:Vector2
var target:Node2D
var speed:float
var lifetime:float



func _ready() -> void:
	add_to_group("player_weapon")

func _physics_process(delta: float) -> void:
	if target and is_instance_valid(target):
		var prev := pathFollow.progress
		curve.set_point_position(1, to_local(target.global_position))
		pathFollow.progress = prev              # keep our place after the curve changed
	pathFollow.progress += speed * delta


func set_target(t:Node2D):
	if t == null:return
	target = t
	if target:
		curve.clear_points()
		#var starting_pos_translated = global_position
		var target_pos_translated = to_local(target.global_position)
		curve.add_point(Vector2.ZERO)
		curve.add_point(target_pos_translated)
		curve.set_point_out(0,Vector2(0,-100))
		curve.set_point_in(1,Vector2(0,-100))
		pathFollow.progress = 0.0



func _on_hit_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.has_method("take_damage"):
			area.take_damage(dmg)
			queue_free()


func set_data(stats:Resource):
	dmg = stats.damage
	lifetime = stats.lifetime
	speed = stats.speed
	
	var timer := get_tree().create_timer(lifetime)
	timer.timeout.connect(func():queue_free());
