extends KinematicBody2D

class_name PersistentState

var state
var state_factory

var velocity = Vector2()

func _ready():
	state_factory = StateFactory.new()
	change_state("idle")

# Input code was placed here for tutorial purposes.
func _process(_delta):
	if Input.is_action_pressed("ui_left"):
		move_left()
	elif Input.is_action_pressed("ui_right"):
		move_right()
	elif Input.is_action_just_pressed("ui_accept"):
		charge_fireball()

func move_left():
	state.move_left()

func move_right():
	state.move_right()
	
func charge_fireball():
	if(state.has_method("charge_fireball")):
		state.charge_fireball()
	else:
		return

func change_state(new_state_name):
	if state != null:
		state.queue_free()
	state = state_factory.get_state(new_state_name).new()
	state.setup(funcref(self, "change_state"), $AnimatedSprite, self)
	state.name = "current_state"
	add_child(state)
