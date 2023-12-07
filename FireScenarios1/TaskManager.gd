extends Node

var count: int
var completed := false
signal on_360completed
# Called when the node enters the scene tree for the first time.
func _ready():
	$"../UIManager/CanvasLayer/Score".text = "score: " + str(count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("task completed: ", count)
	if count > 2 and completed == false:
		$"../UIManager/DialogueManager/Decision/Dialogue_Decision".start()
		completed = true
		print("Assessment completed!")

func task_completed():
	count += 1
	$"../UIManager/CanvasLayer/Score".text = "score: " + str(count)





func _on_dialogue_box_dialogue_ended():
	$"../General Alarm".play()


func _on_dialogue_ab_dialogue_ended():
	task_completed()


func _on_dialogue_imdg_dialogue_ended():
	task_completed()


func _on_dialogue_360_completed_dialogue_ended():
	task_completed()


func _on_dialogue_decision_dialogue_ended():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_tree().change_scene_to_file("res://scenes/EndScene.tscn")
