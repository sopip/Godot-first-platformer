extends Label

func _process(delta):
	self.text = " Antal død: " + str(Global.hjerter) + "/3 "
