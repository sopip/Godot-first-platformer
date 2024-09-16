extends Area2D
var antal = 0 #bruh idk

func _on_body_entered(body):
	print("jubi du har samlet " , antal , " mønter")
	antal += 1
	queue_free()
