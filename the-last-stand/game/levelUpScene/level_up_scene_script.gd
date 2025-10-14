extends CanvasLayer


@export var container:HBoxContainer
@export var skillCard:PackedScene
signal add_mod(mod_id:String)

func _ready() -> void:
	pass


func show_options(options:Array):
	for c in container.get_children():
		c.queue_free()
	
	for i in options.size():
		var card_inst = skillCard.instantiate()
		card_inst.selected_mod.connect(on_mod_selected, CONNECT_ONE_SHOT)
		card_inst.set_data(options[i])
		container.add_child(card_inst)



func on_mod_selected(mod_id:String):
	add_mod.emit(mod_id)
