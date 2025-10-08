extends CharacterBody2D
class_name enemy

@export var enemy_sprite:AnimatedSprite2D
@export var hurtBox:Area2D



func _ready() -> void:
	enemy_sprite.play("idle")

func set_enemy_data(enemyData:Resource):
	enemy_sprite.sprite_frames = enemyData.sprite_frames
	hurtBox.hp = enemyData.hp
	hurtBox.armor = enemyData.armor
