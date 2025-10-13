extends Control


@export var label:Label
@export var charIcon:TextureRect
@export var xpBar:ProgressBar






func set_panel_data(stats:Resource):
	label.text = stats.name
	charIcon.texture = stats.icon

func update_panel_data(value):
	pass
