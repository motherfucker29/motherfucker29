extends KinematicBody2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(200, 0)
var rotation_speed = 0.35
var cha = 1

# Called when the node enters the scene tree for the first time.

func _ready():
		#Set velocity
	velocity *= cha	#Set scale
	scale *= cha
	#Set rotation speed
	rotation_speed *= cha
	print(rotation)

func _physics_process(delta):
	velocity = move_and_slide(velocity)
	rotation += rotation_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
