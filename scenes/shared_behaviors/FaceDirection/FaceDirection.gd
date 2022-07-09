extends Node

export(NodePath) var character_path = ''
export(NodePath) var animated_sprite_path = ''

var character: KinematicBody2D
var animated_sprite: AnimatedSprite
var last_position: Vector2
var current_position: Vector2
var last_flip_h: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	character = get_node(character_path)
	animated_sprite = get_node(animated_sprite_path)
	
	last_position = character.position
	current_position = character.position

func _process(_delta):
	determine_flip()
	
func determine_flip():
	current_position = character.position
	
	if (current_position.x == last_position.x):
		animated_sprite.flip_h = last_flip_h
	elif (current_position.x >= last_position.x):
		animated_sprite.flip_h = false
	elif (current_position.x <= last_position.x):
		animated_sprite.flip_h = true

	last_flip_h = animated_sprite.flip_h
	last_position = current_position
