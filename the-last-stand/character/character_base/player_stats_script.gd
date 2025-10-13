extends Node2D



var level:int = 1
var xp:float = 0 
var xpToLevel:float = 20



func gainXP(xpToGain):
	print("gained ", xpToGain, " xp!")
	xp += xpToGain
	if xp > xpToLevel:
		levelUp()


func levelUp():
	level += 1 
	xp = 0
	xpToLevel *= 1.25
