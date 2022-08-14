extends Area2D

# Projectile speed variables
var speed := 200
var velocity := Vector2.ZERO

# Every frame, move right by speed
func _process(delta):
	position.x += speed * delta
	
	# If off-screen, delete self
	if (position.x > 200):
		queue_free()
