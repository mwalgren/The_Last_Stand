extends CharacterBody2D
class_name player



@export var animSprite:AnimatedSprite2D
@export var hurtBox:Area2D
@export var meleeHitbox:Area2D
@export var enemyDetector:Area2D
@export var skillBook:Node2D
@export var origin_emitter:Node2D
@onready var projectile_factory = get_tree().get_first_node_in_group("projectile_factory")
@export var playerStats:Node2D
@export var modBank:Node2D



func _process(delta: float) -> void:
	skillBook.tick_cooldown(delta)
	var cfg = skillBook.ready_skills()
	if !cfg:return

	var target = projectile_factory.current_target

	if !is_instance_valid(projectile_factory.current_target):
		projectile_factory.current_target = null; return

	var origin = origin_emitter.get_origin(cfg,target)
	if origin == null:
		return

	skillBook.set_cooldown(cfg)
	projectile_factory.spawn(cfg, target, origin)

func _ready() -> void:
	add_to_group("player")


func set_character_data(charData:Resource):
	hurtBox.max_hp = charData.max_hp
	hurtBox.armor = charData.armor
	animSprite.sprite_frames = charData.sprite_frames
	animSprite.play("idle")
	skillBook.learn_skill(charData.default_skill)
	skillBook.equip_skill(charData.default_skill)
	if charData.char_type == "melee":
		meleeHitbox.monitoring = true
	else: 
		meleeHitbox.monitoring = false
		enemyDetector.scale *= 2



func apply_mod(mod:Resource):
	modBank.add_mod(mod)


func get_level():
	return playerStats.level
