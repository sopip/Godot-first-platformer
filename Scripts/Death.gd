extends Area2D
# indgår i spikes

@onready var timer = $Timer

func _on_body_entered(body):
	timer.start()
	die()
	print("you died womp womp")

func _on_timer_timeout():
	die()
	print("timer")

func _process(delta):
	if Global.health == 0:
		die()

func die():
	var ded = $playerDies
	ded.play()
	get_tree().reload_current_scene()
	print("antal nullll")
	Global.antal = 0
	Global.health = 100
	print("Dit health er nu: " , Global.health, "/100")
