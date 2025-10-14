extends Node2D

var global_mods: Array[modStats]




func _ready() -> void:
	add_to_group("modBank")


func add_mod(mod:Resource):
	var m = mod as modStats
	if m == null:
		return
	global_mods.append(m)



func get_totals() -> Dictionary:
	var t = {
		"flat_damage" : 0.0,
		"flat_speed" : 0.0,
		"flat_lifetime" : 0.0,
		"size_mult": 1.0,
	}
	for m: modStats in global_mods:
		t.flat_damage += m.damageMod
		t.flat_speed += m.speedMod
		t.flat_lifetime += m.lifeTimeMod
		t.size_mult += max(0.0,m.size)
	return t
