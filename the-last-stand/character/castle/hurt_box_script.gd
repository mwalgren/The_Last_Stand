extends Area2D


var hp:int 
var armor:int
@export var hpBar:ProgressBar

func _ready() -> void:
	add_to_group("castle")



func take_damage(dmg:int):
	hp -= dmg
	update_hp_bar(hp)
	if hp <= 0:
		death()

func death():
	get_parent().queue_free()
	#get_tree().change_scene_to_file()

func update_hp_bar(value):
	hpBar.value = value
