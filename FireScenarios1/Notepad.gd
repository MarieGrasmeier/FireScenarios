extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_notepad_button_pressed():
	print("toggled notepad")
	visible = !visible
