extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# This function is called for input events
#func _input_event(camera, event, click_position, click_normal, shape_idx):
#	print("Input event received:", event)
#	
#	if event is InputEventMouseButton:
#		print(event.button_index)
#		if event.button_index == MOUSE_BUTTON_LEFT && event.pressed:
#			# Handle the left mouse button click
#			print("Area3D clicked!")
#			$"../../UIManager/DialogueManager/AB".start()

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
	
	if $"../../Player".mouse_is_free == false:
		$"../../Player".toggle_mouse_mode()
		$"../../UIManager/DialogueManager/AB/Dialogue_AB".start()
	






func _on_dialogue_ab_dialogue_ended():
	print("Destroy AB called")
	$"..".queue_free()
