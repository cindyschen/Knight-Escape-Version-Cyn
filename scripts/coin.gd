extends Area2D

@export var coin_id: String
@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var local_coin_manager: Node = %LocalCoinManager

func _on_body_entered(body: Node2D) -> void:
	local_coin_manager.add_point()
	GameManager.picked_coin(coin_id)
	animation_player.play("pickup")
