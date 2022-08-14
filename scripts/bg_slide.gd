extends Sprite

var speed := 20 # Speed of the background element

# Every frame, move left by speed
func _process(delta):
	translate(Vector2.LEFT * speed * delta)
	
	# If off-screen, delete self
	if (position.x < -100):
		queue_free()
