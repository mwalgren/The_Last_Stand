extends Node2D



var level:int = 1
var xp:float = 0 
var xpToLevel:float = 20


signal leveledUp(level)


func gainXP(xpToGain):
	print("gained ", xpToGain, " xp!")
	xp += xpToGain
	if xp > xpToLevel:
		levelUp()


func levelUp():
	leveledUp.emit(level)
	level += 1 
	xp = 0
	xpToLevel *= 1.25
