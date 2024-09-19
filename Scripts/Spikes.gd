extends Node2D

func _on_body_entered(body):
	if body.is_in_group("player"):
		Global.prev_health = Global.health
		Global.health -= 25
		Global.hiit = true
		print("ouch! Dit health er nu: " , Global.health, "/100")
