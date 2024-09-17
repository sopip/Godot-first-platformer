extends Area2D

var collected = false

func _ready():
	$AnimatedSprite2D.play("banan") # her kan man ændre mønten 

func _on_body_entered(body):
	
	# print("hello")
	
	if body.is_in_group("player") and not collected:  # hvis kollisionen er med spilleren
		collected = true
		$CollisionShape2D.disabled = true
		
		$AnimatedSprite2D.play("collected")  # skift til collected animation
		
		Global.antal += 1
		print("jubi du har samlet " , Global.antal , " mønter")
		
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))

# når collected animationen er færdig: 
func _on_animation_finished():
	queue_free()  # collected animationen fjernes

