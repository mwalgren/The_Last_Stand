extends Panel


@export var icon:TextureRect
@export var title:Label
@export var description:Label
var sb:StyleBoxFlat

func set_data(resource:Resource):
	icon.texture = resource.iconTexture
	title.text = resource.title
	description.text = resource.description
	set_card_border(resource)


func set_card_border(resource):
	if resource.rarity == "Legendary":
		sb = StyleBoxFlat.new()
		sb.border_width_all = 3
		sb.corner_radius_all = 8
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.839, 0.412, 0.02, 1.0)
		add_theme_stylebox_override("panel", sb)
	elif resource.rarity == "Common":
		sb = StyleBoxFlat.new()
		sb.border_width_all = 3
		sb.corner_radius_all = 8
		sb.bg_color = Color(0,0,0,0)
		sb.border_color = Color(0.42, 0.42, 0.42, 1.0)
		add_theme_stylebox_override("panel", sb)
