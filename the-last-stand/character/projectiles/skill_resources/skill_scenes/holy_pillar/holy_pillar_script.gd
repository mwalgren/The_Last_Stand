extends Node2D
class_name ground_projectile


@export var animSprite:AnimatedSprite2D
var dmg:float 
var target
var lifetime:float
@onready var base_scale := self.scale


func _ready() -> void:
	animSprite.play("activate")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.has_method("take_damage"):
			area.take_damage(dmg)


func set_target(t:Node2D):
	if t == null:return
	target = t


func set_data(stats:Resource):
	dmg = stats.damage
	lifetime = stats.lifetime
	var mult = (stats.size_mult)
	self.scale = base_scale * mult
	
	if !is_inside_tree():
		await ready

	if !is_inside_tree(): await ready
	var timer := get_tree().create_timer(lifetime)
	timer.timeout.connect(func():queue_free());
