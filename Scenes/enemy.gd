extends Node2D

@onready var animated_sprite= $AnimatedSprite2D
@onready var weapon_area = $WeaponArea
@onready var collision_shape = $WeaponArea/CollisionShape2D

var time_passed = 0  # Variable to store the accumulated time
var enemy_hit = false
var current_chameleon_animation = 1

func _ready():
	weapon_area.connect("body_entered", Callable(self, "_on_weapon_hit"))

func _physics_process(delta):
	time_passed += delta  # Increment the time by the delta value
	
	if animated_sprite.is_playing():
		if animated_sprite.frame in range(1,6):	
			collision_shape.disabled = true
		elif animated_sprite.frame in range(6,8): # lang tunge
			collision_shape.shape = RectangleShape2D.new()
			collision_shape.shape.extents = Vector2(36, 7)
			collision_shape.position = Vector2(10, 0)
		elif animated_sprite.frame == 8: # mellemlang tunge
			collision_shape.shape = RectangleShape2D.new()
			collision_shape.shape.extents = Vector2(25,7)
			collision_shape.position = Vector2(10, 0)
		elif animated_sprite.frame == 9: # kort tunge
			collision_shape.shape = RectangleShape2D.new()
			collision_shape.shape.extents = Vector2(10,7)
			collision_shape.position = Vector2(10, 0)
		else: 
			collision_shape.disabled = true
	
	if time_passed >= 5:  # Check if 7 seconds have passed
		print("time passed")
		#enemy_hit = true
		time_passed = 0  # Reset the timer after performing the action
		play_hit()
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "play_idle"))
		_on_weapon_hit(weapon_area)

func play_idle():
	animated_sprite.play("chameleon_idle")

func play_hit():
	print("playhit")
	animated_sprite.play("chameleon_attack")
	set_physics_process(true)

	#animated_sprite.connect("animation_finished", Callable(self, "_on_hit_animation_finished"))

func _on_weapon_hit(area):
	Global.health -= 25
	print("ouch! Dit health er nu: " , Global.health, "/100")
	# her skal den trække fra health
