extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 10
const BASE_GRAVITY = 10
onready var state_machine = $StateMachine2
onready var speed = 20
var use_gravity = true
var friction = 100

# Declare member variables here. Examples:
# var a = 2
# var b = "text"'
func _ready():
	set_up_states()

func apply_gravity(yes):
	if(yes):
		velocity.y += gravity

func _physics_process(delta):
	apply_gravity(use_gravity)
	print(velocity)
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = clamp(velocity.x, -300, 300)

func set_up_states():
	if(state_machine != null):
		state_machine.setup(self, velocity, gravity, BASE_GRAVITY)
		for child in state_machine.get_children():
			child.setup(self, velocity, speed, friction)
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
