extends Panel


@export var icon:TextureRect
@export var title:Label
@export var description:Label
@export var selectionButton:Button
var sb:StyleBoxFlat
var mod_id:String
var mod_res:Resource


signal selected_mod(id)






func set_data(resource:Resource):
	icon.texture = resource.iconTexture
	title.text = resource.title
	description.text = resource.description
	set_card_border(resource)
	mod_id = resource.id
	mod_res = resource


func set_card_border(resource):
	if resource.rarity == "Legendary":
		sb = StyleBoxFlat.new()
		sb.set_border_width_all(8)
		sb.set_corner_radius_all(8)
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.839, 0.412, 0.02, 1.0)
		add_theme_stylebox_override("panel", sb)
	elif resource.rarity == "Common":
		sb = StyleBoxFlat.new()
		sb.set_border_width_all(8)
		sb.set_corner_radius_all(8)
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.42, 0.42, 0.42, 1.0)
		add_theme_stylebox_override("panel", sb)
	elif resource.rarity == "Uncommon":
		sb = StyleBoxFlat.new()
		sb.set_border_width_all(8)
		sb.set_corner_radius_all(8)
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.183, 0.489, 0.314, 1.0)
		add_theme_stylebox_override("panel", sb)
	elif resource.rarity == "Rare":
		sb = StyleBoxFlat.new()
		sb.set_border_width_all(8)
		sb.set_corner_radius_all(8)
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.184, 0.075, 0.314, 1.0)
		add_theme_stylebox_override("panel", sb)


func _on_confirm_pressed() -> void:
	selected_mod.emit(mod_id)
	selectionButton.disabled = true
