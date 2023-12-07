extends Node


var count: int = 0
var completed: bool = false

func _process(delta):
	if count > 4 and completed == false:
		on_360_completed()

func check():
	count += 1
	print("checkpoint entered", count)

func on_360_completed():
	completed = true
	$"../UIManager/DialogueManager/360_Completed/Dialogue_360_Completed".start()
	
	print("360 completed")	

func _on_checkpoint_body_entered(body):
	check()


func _on_checkpoint_2_body_entered(body):
	check()
	



func _on_checkpoint_3_body_entered(body):
	check()	


func _on_checkpoint_4_body_entered(body):
	check()




func _on_checkpoint_5_body_entered(body):
	check()
