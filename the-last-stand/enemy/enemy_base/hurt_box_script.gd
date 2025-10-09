extends Area2D


@export var hpBar:ProgressBar


var hp:int
var armor:int
var dead:bool

func _ready() -> void:
	add_to_group("enemy")


func take_damage(dmg:int):
	if dead:return
	print("enemy taking damage")
	hp -= dmg
	update_hp_bar(hp)
	if hp <= 0 :
		monitoring = false
		dead = true
		death()

func update_hp_bar(newHpVal):
	if hpBar.value != newHpVal:
		hpBar.value = clamp(newHpVal,0,hpBar.max_value) 

func death():
	get_parent().queue_free()
