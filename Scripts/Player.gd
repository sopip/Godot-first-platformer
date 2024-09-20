extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const DOUBLETAP_DELAY = .25

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


# double jump
var debug_flappybird = true

var jump_count = 0
var max_jumps = 2


@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	pass
	#add_to_group("player")

func _physics_process(delta):
	var ouch = $ouch
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if is_on_floor():
		jump_count = 0
	
	# hopper
	if Input.is_action_just_pressed("w") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept"):
		if debug_flappybird == false and jump_count < max_jumps:
			velocity.y = JUMP_VELOCITY
			jump_count += 1
		elif debug_flappybird == true: 
			velocity.y = JUMP_VELOCITY
	
	# tjekker for flip retning
	var direction = 0

	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("a"):
		direction -= 1  # Move left
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("d"):
		direction += 1  # Move right
	#var direction = Input.get_axis("a" or "ui_left", "d" or "ui-right")
	
	# flipper sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if Global.hiit == false: # eventuelt?
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else: 
			if velocity.y < 0:
				animated_sprite.play("jump")
			else: 
				animated_sprite.play("fall")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Global.hiit == true:
		animated_sprite.play("hit")
		ouch.play()
		$AnimatedSprite2D.connect("animation_finished", Callable(self, "hitfalse"))
	
	#print(global_position)
	move_and_slide()

func hitfalse():
	Global.hiit = false
