extends Node2D


var L = 2 #Example min value for level_bonuses


func hitResolver(actor:Node, target:Node):
	var level_bonus = clamp(actor.level - target.level, -L,+L)
	var accuracy_rating = max(0.0, actor.base_accuracy + actor.accuracy + level_bonus)
	var target_evasion_rating = target.base_evasion + target.evasion
	var hit_chance = clamp(accuracy_rating / (accuracy_rating + target_evasion_rating), 0.05,0.99)
	var hitRoll = randf()

	if !is_instance_valid(target):
		print("Miss: Target Instance Invalid")
		return false


	if target.team_id == actor.team_id:
		print("Miss: Shared Team_ID")
		return false

	var hit = hit_chance >= hitRoll

	if hit:
		print("Hit")
		return true

	else:
		print("Miss: Failed Hit Roll")
		return false
