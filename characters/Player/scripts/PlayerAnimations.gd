extends AnimatedSprite

var player: KinematicBody2D

# for determining flip
var last_position: Vector2 = Vector2.ZERO
var current_position: Vector2 = Vector2.ZERO
var last_flip_h: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	last_position = player.position
	current_position = player.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	determine_flip_h()
	pass

func determine_flip_h():
	current_position = player.position

	if (current_position.x == last_position.x):
		flip_h = last_flip_h
	elif (current_position.x >= last_position.x):
		flip_h = false
	elif (current_position.x <= last_position.x):
		flip_h = true

	last_flip_h = flip_h
	# flip_h = current_position.x < last_position.x
	last_position = current_position
	# print(current_position, last_position)
	pass
