extends Area3D

signal info_clicked(info_text, image_path)
@export var info_text: String
@export var image: Texture

func _ready():
	pass

func _input(event):
	if event is InputEventMouseMotion:
		return  # Ignore mouse motion events

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Perform a raycast from the camera
		var camera = get_viewport().get_camera_3d()
		if not camera:
			return  # No camera found in the viewport

		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000

		var ray_query = PhysicsRayQueryParameters3D.new()
		ray_query.collide_with_areas = true  # Ensure it collides with Area3D nodes
		ray_query.from = from
		ray_query.to = to
		
		



		var space_state = get_world_3d().direct_space_state
		var result = space_state.intersect_ray(ray_query)
		#print(result)

		if result and result.collider == self:
			# Infopoint was clicked
			_on_Infopoint_Clicked()
			print("infopoint clicked")

func _on_Infopoint_Clicked():
	if $"../../../Player".mouse_is_free == false:
		$"../../../Player".toggle_mouse_mode()
		$"../../../UIManager/DialogueManager/IMDG/Dialogue_IMDG".start()
	



func _on_dialogue_imdg_dialogue_ended():
	$"..".queue_free()
