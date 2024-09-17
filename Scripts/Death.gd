extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	timer.start()
	print("you died womp womp")

func _on_timer_timeout():
	print("henuuuuuu")
	get_tree().reload_current_scene() # ÆNDRE HER (EVENTUELT)

