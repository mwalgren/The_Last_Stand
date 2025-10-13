extends Resource
class_name modStats


@export var damageMod:float
@export var speedMod:float
@export var lifeTimeMod:float
@export var onHit:bool
@export var onHitType:String
@export var rarity:String


func upgrade_stats(currStats:modStats, upgradeStatMods:modStats):
	currStats.damageMod += upgradeStatMods.damageMod
	currStats.speedMod += upgradeStatMods.speedMod
	currStats.lifeTimeMod += upgradeStatMods.lifeTimeMod
	currStats.onHit = upgradeStatMods.onHit
	currStats.onHitType = upgradeStatMods.onHitType
