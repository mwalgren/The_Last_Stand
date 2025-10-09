extends Node2D



var owned_skills:Dictionary = {}
var active_skills:Array[skillConfig] = []
var cooldowns:Dictionary = {}




func _ready() -> void:
	pass


func learn_skill(config:skillConfig):
	print("DEFAULT SKILL LEARNED")
	var id = config.id
	if owned_skills.has(id):
		owned_skills[id]["rank"] += 1
		return
	owned_skills[id] = {"config":config,"rank":1}
	cooldowns[id] = 0.0

func equip_skill(config:skillConfig):
	if !owned_skills.has(config.id):
		learn_skill(config)
	if active_skills.has(config):return
	active_skills.append(config)


func tick_cooldown(delta):
	for id in cooldowns.keys():
		cooldowns[id] = max(0.0,cooldowns[id] - delta)
	
	
func set_cooldown(config:skillConfig):
	cooldowns[config.id] = config.cooldown
	print(cooldowns[config.id])


func ready_skills() -> skillConfig:
	for cfg in active_skills:
		if cooldowns.get(cfg.id, -123) <= 0.0:
			return cfg
	return null
