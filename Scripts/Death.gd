extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	timer.start()
	die()
	print("you died womp womp")

func _on_timer_timeout():
	die()
	print("timer")

func _ready():
	if Global.health == 0:
		die()

func die():
	get_tree().reload_current_scene()
	print("antal nullll")
	Global.antal = 0
