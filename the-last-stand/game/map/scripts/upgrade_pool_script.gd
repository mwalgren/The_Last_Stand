extends Node2D

@export var upgrade_pool:Array[Resource]
var taken_ids:Array[Resource]



func pick(n:int):
	var candidates: Array[Resource]
	for id in upgrade_pool:
		if !taken_ids.has(id):
			candidates.append(id)
	candidates.shuffle()
	return candidates.slice(0, min(n, candidates.size()))
