extends Node2D

# Background elements
const Star = preload("res://scenes/star_bg.tscn")
const Planets = [preload("res://scenes/alien_bg.tscn"),
		preload("res://scenes/cookie_bg.tscn"),
		preload("res://scenes/earth_bg.tscn"),
		preload("res://scenes/moon_bg.tscn")]

# Background element timers
var star_timer : Timer
var star_delay := 0.3 # Time between stars
var planet_timer : Timer
var planet_delay := 30 # Time between planets

func _ready():
	randomize()
	# Star timer
	star_timer = Timer.new()
	star_timer.wait_time = star_delay
	star_timer.connect("timeout", self, "spawn_star")
	self.add_child(star_timer)
	star_timer.start()
	
	# Planet timer
	planet_timer = Timer.new()
	planet_timer.wait_time = planet_delay
	planet_timer.connect("timeout", self, "spawn_planet")
	self.add_child(planet_timer)
	planet_timer.start()

# Spawns a star with a random Y value, speed value, and Z index value
func spawn_star():
	# Instance
	var star = Star.instance()
	# Set position
	star.transform.origin.x = 180
	star.transform.origin.y = max(24, randi() % 144)
	# Set speed
	star.speed = max(20, randi() % 120)
	# Set Z index
	if (randi() % 2 == 0):
		star.z_index = 0
	else:
		star.z_index = 2
	# Initialize
	self.add_child(star)
	# Reset timer
	star_timer.start()

# Spawns a random planet with a random Y value and speed value
func spawn_planet():
	# Shuffle and Instance
	Planets.shuffle()
	var planet = Planets[0].instance()
	# Set position
	planet.transform.origin.x = 220
	planet.transform.origin.y = max(24, randi() % 144)
	# Set speed
	planet.speed = max(3, randi() % 20)
	# Initialize
	self.add_child(planet)
	# Reset timer
	planet_timer.start() 
