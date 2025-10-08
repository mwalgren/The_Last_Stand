extends CharacterBody2D
class_name player



@export var animSprite:AnimatedSprite2D
@export var hurtBox:Area2D
@export var meleeHitbox:Area2D
@export var enemyDetector:Area2D
@export var hpBar:ProgressBar


func _ready() -> void:
	add_to_group("player")




func set_character_data(charData:Resource):
	hurtBox.max_hp = charData.max_hp
	hurtBox.armor = charData.armor
	animSprite.sprite_frames = charData.sprite_frames
	animSprite.play("idle")
	hpBar.max_value = charData.max_hp
	hpBar.value = charData.max_hp
	if charData.char_type == "melee":
		meleeHitbox.monitoring = true
	else: 
		meleeHitbox.monitoring = false
		enemyDetector.scale *= 2


func _on_enemy_detector_enemy_in_range() -> void:
	animSprite.play("attack")


func _on_enemy_detector_enemy_out_range() -> void:
	animSprite.play("idle")
