extends Label

func _process(delta):
	self.text = " Antal frugter: " + str(Global.antal) + " "
