extends Area2D
# indgår i spikes
@onready var kill_enemy = $"."
@onready var collision_shape = $CollisionShape2D
@onready var weapon_collision = $"../WeaponArea/CollisionShape2D"
@onready var death_collision = $"../Death/CollisionShape2D2"
@onready var animated_sprite = $"../AnimatedSprite2D"
@onready var death = $"../Death"

func _ready():
	collision_shape.connect("body_entered", Callable(self, "_on_Area2D_body_entered"))

func _on_body_entered(body):
	print("JUVBIBBIIBI")
	Global.enemy_killed = true
	
	if body.is_in_group("player"):  # hvis kollisionen er med spilleren
		animated_sprite.play("chameleon_hit")  # skift til collected animation
		
		animated_sprite.connect("animation_finished", Callable(self, "_on_animation_finished"))

#@onready var enemy = $Game/Enemies/Enemy
@onready var enemy = $".."

func _on_animation_finished():
	print("good job")
	enemy.queue_free()
	#animation
	#clear

