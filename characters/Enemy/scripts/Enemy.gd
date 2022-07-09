extends KinematicBody2D

export(NodePath) var target_path
export(NodePath) var nav_2d_path
export(float) var MOVE_SPEED = 0.5

onready var line_2d: Line2D = $Line2D
onready var nav_2d: Navigation2D = get_node(nav_2d_path)
onready var target: KinematicBody2D = get_node(target_path)

var paths: PoolVector2Array
var target_position: Vector2
var start_point: Vector2
var distance: float

const ATTACK_RANGE = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	line_2d.width = 0.5
	line_2d.antialiased = true
	pass

func _process(_delta):
	
	target_position = target.global_position
	paths = nav_2d.get_simple_path(global_position, target_position)

	# copy path and transform
	var transformed_paths = []
	for path in paths:
		transformed_paths.push_front(path - global_position)
	line_2d.points = transformed_paths

func _physics_process(_delta):
	move()
	detect_colide()

func move():
	distance = start_point.distance_to(target_position)
	
	if distance > 30:
		var should_be_position = global_position.linear_interpolate(target_position, 0.5 / distance)
		var target_vector = global_position.direction_to(target_position)
		var move_vector = target_vector.normalized() * MOVE_SPEED
		move_and_collide(move_vector)

func detect_colide():
	
	pass
