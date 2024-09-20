extends Area2D

# indgår i spikes
@onready var kill_enemy = $"."
@onready var collision_shape = $CollisionShape2D
@onready var weapon_collision = $"../WeaponArea/CollisionShape2D"
@onready var death_collision = $"../Death/CollisionShape2D2"

@onready var animated_sprite = $"../AnimatedSprite2D"

func _ready():
	collision_shape.connect("body_entered", Callable(self, "_on_Area2D_body_entered"))

func _on_Area2D_body_entered(body):
	print("entered: " + body)
	if body.is_in_group("player"):  # hvis kollisionen er med spilleren
		collision_shape.disabled = true
		weapon_collision.disabled = true
		death_collision.disabled = true
		animated_sprite.play("chameleon_hit")  # skift til collected animation
		
		animated_sprite.connect("animation_finished", Callable(self, "die"))


func die():
	print("good job")
	queue_free()
	#animation
	#clear
