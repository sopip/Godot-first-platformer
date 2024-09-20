extends AnimatableBody2D
@onready var timer = $Timer
@onready var collision_shape_2d = $CollisionShape2D


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		timer.start()

func _on_timer_timeout():
	var tween = create_tween()
	tween.tween_property(self,"modulate:a",0,0.2) #modulate:a er transparency. kig inde under inspector-visibility-modulate ;p..... 0 er fordi den skal gå ned til værdi 0...... 0.4 er den tid den skal tage at komme ned til værdi 0
	

	collision_shape_2d.position = Vector2(-100000,10000) #flytter den et sted hen langt væk upsi hihi lidt dovent
	
