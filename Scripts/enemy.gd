extends Node2D

@onready var animated_sprite= $AnimatedSprite2D
@onready var weapon_area = $WeaponArea
@onready var collision_shape = $WeaponArea/CollisionShape2D

var enemy_hit = false

func _ready():
	#connect("body_entered", self, "_on_body_entered")
	weapon_area.connect("body_entered", Callable(self, "_on_Area2D_body_entered"))
	if collision_shape.shape == null:
		collision_shape.shape = RectangleShape2D.new()
	#print("Weapon Area Layer: ", weapon_area.collision_layer)
	#print("Weapon Area Mask: ", weapon_area.collision_mask)

func _physics_process(delta):
	#time_passed += delta  # Increment the time by the delta value
	play_hit()
	#print(time_passed)
	#if time_passed >= 5 and not enemy_hit:
	#	time_pass()
		#_on_weapon_hit(weapon_area)

func _on_Area2D_body_entered(body):
	print(body)
	print("body entered")
	
	if body.is_in_group("player"):
		print("body entered")
		Global.health -= 25

func play_hit(): # skal også fikses
	if Global.enemy_killed == false: # this is the culprit
		var die = $ded
		die.play()
		#print("playhit")
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
	else: 
		collision_shape.disabled = true
		#queue_free()
		#Global.enemy_killed = false
