extends Area2D

var speed = 2000
func _physics_process(delta: float) -> void:
	position+=transform.x*delta*speed
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.queue_free()
	queue_free()
	
	
	
