extends Label

func _process(delta):
	self.text = " Antal mønter: " + str(Global.antal) + " "
