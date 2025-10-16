extends CharacterBody2D
class_name enemy

@export var enemy_sprite:AnimatedSprite2D
@export var hurtBox:Area2D
@export var hpBar:ProgressBar
@export var at_target:Marker2D
@export var agent:NavigationAgent2D
@export var pathTimer:Timer
@export var hitBox:Area2D

var goal:Node2D = null
var movement_speed = 100
var moving:bool

enum STATE {MOVING, ATTACKING, IDLE}
var current_state = null



func _ready() -> void:
	add_to_group("enemy")
	set_anim_state(STATE.IDLE)

func set_enemy_data(enemyData:Resource):
	enemy_sprite.sprite_frames = enemyData.sprite_frames
	hurtBox.hp = enemyData.hp
	hurtBox.armor = enemyData.armor
	hpBar.max_value = enemyData.hp
	hpBar.value = enemyData.hp
	hurtBox.xpToGive = enemyData.baseXP
	hitBox.dmg = enemyData.dmg
	hitBox.attack_speed = enemyData.attack_speed



func _physics_process(delta: float) -> void:
	var target_pos = agent.get_next_path_position()
	var dir = (target_pos - global_position)
	
	if current_state == STATE.ATTACKING:
		velocity = Vector2.ZERO
		return
	
	if !agent.is_navigation_finished():
		moving = true
		set_anim_state(STATE.MOVING)

	if dir.length() < 1.0 or agent.is_navigation_finished():
		dir = (goal.global_position - global_position)


	dir = dir.normalized()
	velocity = dir * movement_speed
	move_and_slide()


func _on_hit_box_player_in_range() -> void:
	moving = false


func set_anim_state(state:STATE):

	match state:
		STATE.MOVING:
			current_state = STATE.MOVING
			enemy_sprite.play("walk")
		STATE.ATTACKING:
			current_state = STATE.ATTACKING
			enemy_sprite.play("attack")
			print("bingus gaming")
		STATE.IDLE:
			current_state = STATE.IDLE
			enemy_sprite.play("idle")


func _on_hit_box_start_attack_anim() -> void:
	set_anim_state(STATE.ATTACKING)
