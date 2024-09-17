extends Area2D

func _on_body_entered(body):
	print("ouch")
	Global.prev_health = Global.health
	Global.health -= 10
