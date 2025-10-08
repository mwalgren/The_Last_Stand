extends Area2D


@export var hp:int
@export var armor:int
@export var max_hp:int


func _ready() -> void:
	add_to_group("player_hitbox")


func take_damage(dmg:int):
	var finalDmg = min(0, dmg-armor)
	hp -= finalDmg
	if hp <= 0:
		death()


func death():
	queue_free()
