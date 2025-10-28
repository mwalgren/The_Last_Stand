extends Node2D

@export var upgrade_pool:Array[Resource]
@export var skill_pool:Array[Resource]
var taken_ids:Array[Resource]
var mods_by_id:Dictionary = {}



func _ready() -> void:
	mods_by_id.clear()
	for m in upgrade_pool:
		if m and m.id != "":
			mods_by_id[m.id] = m


func pick(n:int):
	var candidates: Array[Resource] = []
	for id in upgrade_pool:
		if !taken_ids.has(id):
			candidates.append(id)
	candidates.shuffle()
	return candidates.slice(0, min(n, candidates.size()))

func pick_skill(n:int):
	var skill_candidate : Array[Resource] = []
	for id in skill_pool:
		if !skill_pool.has(id):
			skill_candidate.append(id)
	skill_candidate.shuffle()
	return skill_candidate.slice(0,min(n,skill_candidate.size()))


func mark_taken(res):
	if res and not taken_ids.has(res):
		taken_ids.append(res)


func get_mod_by_id(_id:String):
	return mods_by_id.get(_id,null)
