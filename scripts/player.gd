extends KinematicBody2D

# Player movement variables
var speed := 50
var velocity := Vector2.ZERO

# Player firing variables
var can_fire := true
var fire_cooldown := 0.2
var fire_timer : Timer
# Player firing references
const player_bullet = preload("res://scenes/player_projectile.tscn")
onready var bullets = $"../Bullets"

# On node ready
func _ready():
	fire_timer = Timer.new()
	fire_timer.wait_time = fire_cooldown
	fire_timer.connect("timeout", self, "fire_delay")
	self.add_child(fire_timer)

# On each frame
func _process(delta):
	move()
	fire()

# Handle player movement and boundary checking
func move():
	var vert_move := (Input.get_action_strength("down") - Input.get_action_strength("up"))
	velocity.y = vert_move * speed
	velocity = move_and_slide(velocity)
	
	# Boundary Check
	transform.origin.y = min(transform.origin.y, 136)
	transform.origin.y = max(transform.origin.y, 24)

# Handle player firing
func fire():
	if (Input.is_action_pressed("fire") and can_fire):
		var bullet = player_bullet.instance()
		bullet.translate(transform.origin + Vector2(11, 0))
		bullets.add_child(bullet)
		can_fire = false
		fire_timer.start()

# Reset Player fire delay
func fire_delay():
	can_fire = true
