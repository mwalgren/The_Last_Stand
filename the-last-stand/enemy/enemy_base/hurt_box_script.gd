extends Area2D





var hp:int
var armor:int


func _ready() -> void:
	add_to_group("enemy")


func take_damage(dmg:int):
	hp -= dmg
	if hp <= 0 :
		death()


func death():
	queue_free()
