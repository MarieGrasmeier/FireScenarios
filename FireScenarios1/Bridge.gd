extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_bridge_button_button_down():
	show() 


func _on_close_button_down():
	hide()
