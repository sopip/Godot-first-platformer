extends Node2D

@onready var animated_sprite= $AnimatedSprite2D


var time_passed = 0  # Variable to store the accumulated time
var enemy_hit = false
var current_chameleon_animation = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	time_passed += delta  # Increment the time by the delta value

	if time_passed >= 5:  # Check if 7 seconds have passed
		print("time passed")
		enemy_hit = true
		time_passed = 0  # Reset the timer after performing the action
		play_hit()
		#$AnimatedSprite2D.connect("animation_finished", Callable(self, "hit2"))

func play_hit():
	print("playhit")
	current_chameleon_animation = 1
	var chameleon_animation = "chameleon" + str(current_chameleon_animation)
	animated_sprite.play(chameleon_animation)
	if not animated_sprite.is_connected("animation_finished", Callable(self, "_on_hit_animation_finished")):
		animated_sprite.connect("animation_finished", Callable(self, "_on_hit_animation_finished"))

	#animated_sprite.connect("animation_finished", Callable(self, "_on_hit_animation_finished"))

func _on_hit_animation_finished():
	print("animationfin")
	current_chameleon_animation +=1
	
	if current_chameleon_animation <= 3: # hvis der er flere animationer tilbage
		print(current_chameleon_animation)
		var chameleon_animation = "chameleon" + str(current_chameleon_animation)
		animated_sprite.play(chameleon_animation)
	else: 
		#animated_sprite.disconnect("animation_finished", Callable(self, "_on_hit_animation_finished"))
		enemy_hit = false
		 
