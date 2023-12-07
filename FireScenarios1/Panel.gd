extends Panel

signal panel_visibility_changed(is_visible)

var label_node: Label
var texture_rect_node: TextureRect
@onready var info_point = $"../../../InfoPointsContainer/Info1/Area3D"


func _ready():
	label_node = get_node("Label")
	texture_rect_node = get_node("TextureRect")
	info_point.connect("info_clicked", Callable(self, "_on_info_clicked"))

	hide()  # Initially hidden

func update_info(text: String, image: Texture):
	label_node.text = text
	texture_rect_node.texture = image  # Use the passed Texture object
	show()
	emit_signal("panel_visibility_changed", true)

	

func _on_close_button_pressed():
	hide()
	
func _on_info_clicked(info_text, image_path):
	update_info(info_text, image_path)


func _on_button_button_down():
	hide() # Replace with function body.
