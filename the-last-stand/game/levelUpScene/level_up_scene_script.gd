extends CanvasLayer


@export var container:HBoxContainer
@export var skillCard:PackedScene


func _ready() -> void:
	pass


func show_options(options:Array):
	for i in options.size():
		var card_inst = skillCard.instantiate()
		card_inst.set_data(options[i])
		container.add_child(card_inst)
