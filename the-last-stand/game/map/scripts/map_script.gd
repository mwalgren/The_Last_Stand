extends Node2D


@onready var gameController: Node2D = $gameController


func _ready() -> void:
	gameController._set_state(gameController.GAMESTATE.PREP)
