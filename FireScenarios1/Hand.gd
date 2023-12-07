extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = get_viewport().size.x / 2
	position.y = get_viewport().size.y / 2
# Connect the size_changed signal of the viewport to a method in this script using Callable
	get_viewport().connect("size_changed", Callable(self, "_on_viewport_size_changed"))

	

func _on_viewport_size_changed():
	# This method will be called whenever the viewport's size changes
	position.x = get_viewport().size.x / 2
	position.y = get_viewport().size.y / 2


