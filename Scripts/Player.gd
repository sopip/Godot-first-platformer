extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0

const DOUBLETAP_DELAY = .25
var doubletap_time = DOUBLETAP_DELAY
var last_keycode = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D


func _process(delta):
	doubletap_time -= delta

func _input(event):
	if event is InputEventKey and event.is_pressed():
		if last_keycode == event.keycode and doubletap_time >= 0: 
		#	print("DOUBLETAP: ", String.chr(event.keycode))
			last_keycode = 0
		else:
			last_keycode = event.keycode
		doubletap_time = DOUBLETAP_DELAY

func _ready():
	add_to_group("player")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("w") or Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# tjekker for flip retning
	var direction = Input.get_axis("a", "d")
	
	# flipper sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else: 
		animated_sprite.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Global.hiit == true:
		Global.hiit = false
		animated_sprite.play("hit")
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "_on_animation_finished"))
	move_and_slide()

func _on_animation_finished():
	queue_free()  # collected animationen fjernes

