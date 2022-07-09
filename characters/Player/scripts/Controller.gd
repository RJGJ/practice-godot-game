extends Node

const MOVE_SPEED = 75
const ACCELERATION = 10
const DECELERATION = 0.5

var player: KinematicBody2D
var player_animations: AnimatedSprite
var velocity: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent()
	player_animations = $"../PlayerAnimations"

func _physics_process(_delta):
	move()

# func _process(delta):
#   move(delta)

func move():
	velocity = Vector2.ZERO

	# detect input
	if Input.is_action_pressed("move_right"):
		velocity += Vector2.RIGHT
	
	elif Input.is_action_pressed("move_left"):
		velocity += Vector2.LEFT
	
	if Input.is_action_pressed("move_up"):
		velocity += Vector2.UP
	
	elif Input.is_action_pressed("move_down"):
		velocity += Vector2.DOWN
	
	velocity = velocity.normalized()
	set_state()

func set_state():
	if (velocity == Vector2.ZERO):
		player_animations.animation = 'idle'
		return
	player_animations.animation = 'running'
	velocity = player.move_and_slide(velocity * MOVE_SPEED, Vector2.ZERO)
