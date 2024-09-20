extends Area2D
var collected = false

func _ready():
	$AnimatedSprite2D.play("banan") # her kan man ændre mønten 
	print(global_position)

func _on_body_entered(body):
	if body.is_in_group("player") and not collected:  # hvis kollisionen er med spilleren
		collected = true
		$CollisionShape2D.disabled = true
	
		$AnimatedSprite2D.play("collected")  # skift til collected animation
		$collectFruit.play() #Spiller lyden til når man samler en frugt
		
		Global.antal += 1
		print("jubi du har samlet " , Global.antal , " frugter")
		
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))

# når collected animationen er færdig: 
func _on_animation_finished():
	queue_free()  # collected animationen fjernes

