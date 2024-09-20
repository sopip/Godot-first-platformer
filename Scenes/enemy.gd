extends Node2D

@onready var animated_sprite= $AnimatedSprite2D
@onready var weapon_area = $WeaponArea
@onready var collision_shape = $WeaponArea/CollisionShape2D

var time_passed = 0  # Variable to store the accumulated time
var enemy_hit = false
var current_chameleon_animation = 1

func _ready():
	#connect("body_entered", self, "_on_body_entered")
	weapon_area.connect("body_entered", Callable(self, "_on_Area2D_body_entered"))
	if collision_shape.shape == null:
		collision_shape.shape = RectangleShape2D.new()

func _physics_process(delta):
	time_passed += delta  # Increment the time by the delta value
	
	if time_passed >= 5 and not enemy_hit:  # Check if 7 seconds have passed
		#print("time passed")
		#enemy_hit = true
		play_hit()		
		time_passed = 0  # Reset the timer after performing the action
		#_on_weapon_hit(weapon_area)

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		print("body entered")

func play_idle():
	animated_sprite.play("chameleon_idle")

<<<<<<< Updated upstream
func play_hit():
	var die = $ded
	die.play()
=======
func play_hit(): # skal også fikses
>>>>>>> Stashed changes
	print("playhit")
	animated_sprite.play("chameleon_attack")
	
	if animated_sprite.is_playing():
		if animated_sprite.frame in range(1,6):
			collision_shape.disabled = true
		elif animated_sprite.frame in range(6,8): # lang tunge
			collision_shape.disabled = false
			var shape = collision_shape.shape as RectangleShape2D
			shape.extents = Vector2(36, 7)
			collision_shape.position = Vector2(10, 0)
		elif animated_sprite.frame == 8: # mellemlang tunge
			collision_shape.disabled = false
			var shape = collision_shape.shape as RectangleShape2D
			shape.extents = Vector2(25,7)
			collision_shape.position = Vector2(10, 0)
		elif animated_sprite.frame == 9: # kort tunge
			collision_shape.disabled = false
			var shape = collision_shape.shape as RectangleShape2D
			shape.extents = Vector2(10,7)
			collision_shape.position = Vector2(10, 0)
		else: 
			collision_shape.disabled = true
	animated_sprite.connect("animation_finished", Callable(self, "play_idle"))
	
	#set_physics_process(true) # skal fikses

	#animated_sprite.connect("animation_finished", Callable(self, "_on_hit_animation_finished"))

func _on_weapon_hit():
	#Global.health -= 25
	print("weapon hit")
	# her skal den trække fra health
