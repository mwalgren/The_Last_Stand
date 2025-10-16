extends Area2D



var dmg:int
var attack_speed:float
var is_in_range:bool
var attack_ready:bool = false

var target

@export var attack_timer:Timer

signal player_in_range
signal start_attack_anim



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("castle"):
		player_in_range.emit()
		attack_timer.wait_time = attack_speed
		attack_timer.start()
		target = area



func _on_timer_timeout() -> void:
	start_attack_anim.emit()
	attack_tick()


func attack_tick():
	print("attack ticking")
	if is_instance_valid(target) and target.has_method("take_damage"):
		target.take_damage(dmg)
	else: 
		attack_timer.stop()
