extends CharacterBody2D
class_name castle

var hp:int = 100
var armor:int = 100
@export var castleHP:ProgressBar
@export var caslteHurtBox:Area2D


func _ready() -> void:
	set_castle_data()


#quick and dirty for testing only
func set_castle_data():
	castleHP.max_value = hp
	castleHP.value = hp
