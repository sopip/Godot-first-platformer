extends Area2D

const FILE_BEGIN = "res://Scenes/Level"

func _on_body_entered(body):
	$CollisionShape2D.disabled = false
	# print("hello")
	
	
	if body.is_in_group("player"):  # hvis kollisionen er med spilleren
		# print("hello")
		var current_scene_file = get_tree().current_scene.scene_file_path
		var next_level_number = current_scene_file.to_int() + 1
		
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		
		print(next_level_path)
		get_tree().change_scene_to_file(next_level_path)
		

