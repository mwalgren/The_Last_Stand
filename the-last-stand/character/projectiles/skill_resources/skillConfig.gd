extends Resource
class_name skillConfig



@export var projectile_scene:PackedScene
@export var sprite_frames:SpriteFrames
@export var id:String
@export var damage_type:String #fire, physical, lightning
@export var lifetime:float #how long projectile will live before que free
@export var max_range:float #max dist
@export var movement_type:String #spawn_on, fire_towards
@export var target_mode:String #single, aoe, self
@export var explode_on:String #impact, timeout, manual
@export var cooldown:float
@export var spawn_mode:String
@export var rank:int
@export var speed:float
@export var damage:float
@export var size:float
