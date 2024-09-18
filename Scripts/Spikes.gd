extends Node2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("ouch")
		Global.prev_health = Global.health
		Global.health -= 10
		print(Global.health)
