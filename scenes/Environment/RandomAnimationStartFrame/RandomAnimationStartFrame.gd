extends Node


export(NodePath) var animated_sprite_path
onready var animated_sprite: AnimatedSprite = get_node(animated_sprite_path)

var animation_frames: int
var current_animation: String
 
# Called when the node enters the scene tree for the first time.
func _ready():
	current_animation = animated_sprite.animation
	animation_frames = animated_sprite.frames.get_frame_count(current_animation)
	animated_sprite.frame = randi() % animation_frames
