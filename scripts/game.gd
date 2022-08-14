extends Node2D

# If the player presses the exit action, exit the game
func _process(delta):
	if (Input.is_action_pressed("exit")):
		get_tree().quit()
