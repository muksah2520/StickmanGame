extends Area2D

var speed = 2000
func _physics_process(delta: float) -> void:
	position+=transform.x*delta*speed
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player1"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/player_2_wins.tscn")
	elif body.is_in_group("player2"):
		get_tree().call_deferred("change_scene_to_file", "res://scenes/player_1_win.tscn")
	queue_free()
	
	
	
