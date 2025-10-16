extends CharacterBody2D
class_name castle

var hp:int = 100
var armor:int = 100
@export var castleHP:ProgressBar
@export var castleHurtBox:Area2D


func _ready() -> void:
	set_castle_data()
	add_to_group("castle")


#quick and dirty for testing only
func set_castle_data():
	castleHP.max_value = hp
	castleHP.value = hp
	castleHurtBox.hp = hp
	castleHurtBox.armor = armor
