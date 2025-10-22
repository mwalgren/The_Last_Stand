extends Node2D





func critResolver(actor:Node,target:Node):
	const critFloor = 0.05
	const critCeiling = 0.75
	var critChance = clamp(actor.critChance, critFloor, critCeiling)
	var hitRoll = randf()
	var crit = critChance >= hitRoll
	
	if !is_instance_valid(target):
		print("CRIT FAILED : INSTANCE INVALID")
		return false
	

	if crit:
		print("CRIT SUCCESS")
		return true
	
	else:
		print("CRIT FAILED : ROLL CHECK")
		return false 
