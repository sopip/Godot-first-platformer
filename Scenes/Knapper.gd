extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	Global.hjerter = 0

func _on_quit_pressed():
	get_tree().quit()

