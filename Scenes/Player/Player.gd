extends KinematicBody2D

var direction_up: Vector2
var direction_right: Vector2
var direction_down: Vector2
var direction_left: Vector2
var velocity: float = 5

func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	# Move
	var direction = direction_up + \
		direction_right + \
		direction_down + \
		direction_left

	var _move = move_and_collide(direction*velocity)

# Code to move player up
func move_up():
	direction_up = Vector2(0, -1)
func cancel_up():
	direction_up = Vector2(0, 0)
	
# Code to move player right
func move_right():
	direction_right = Vector2(1, 0)
func cancel_right():
	direction_right = Vector2(0, 0)
	
# Code to move player down
func move_down():
	direction_down = Vector2(0, 1)
func cancel_down():
	direction_down = Vector2(0, 0)

# Code to move player left
func move_left():
	direction_left = Vector2(-1, 0)
func cancel_left():
	direction_left = Vector2(0, 0)