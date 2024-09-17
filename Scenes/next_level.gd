extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):  # hvis kollisionen er med spilleren
		$CollisionShape2D.disabled = true
		
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))

# når collected animationen er færdig: 
func _on_animation_finished():
	queue_free()  # collected animationen fjernes
