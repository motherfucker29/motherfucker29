extends Node2D

class_name StateMachine2

const DEBUG = true

var state: Object
var history = []

var animated_sprite
var persistent_state : KinematicBody2D
var velocity
var gravity
var BASE_GRAVITY

func setup(pstate, vel, grav, bgrav):
	# For the future I can just turn this into an array and then just loop through it
	self.persistent_state = pstate
	self.velocity = vel
	self.gravity = grav
	self.BASE_GRAVITY = bgrav
	print("setup called " + self.name)


func _ready():
	# Set the initial state to the first child node
	state = get_child(0)
	_enter_state()
	print(state.name)
	
func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()

func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()

func _enter_state():
	if DEBUG:
		print("Entering state: ", state.name)
	# Give the new state a reference to this state machine script
	state.fsm = self
	state.enter()

# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta):
	if state.has_method("process"):
		
		#I'll probably just use the variable in the state or something. I just don't want to have to specify whether or not I'm applying ravity or not
		#Make velocity one thing that every state uses instead of putting velocity in the parent, put it in the state machien?
		state.process(delta)

func _physics_process(delta):
	persistent_state.velocity = state.velocity
	persistent_state.use_gravity = state.app_grav
	if state.has_method("physics_process"):
		state.physics_process(delta)

func _input(event):
	if(event.is_action("ui_accept")):
		print(state.name)
	if state.has_method("input"):
		state.input(event)

func _unhandled_input(event):
	if state.has_method("unhandled_input"):
		state.unhandled_input(event)

func _unhandled_key_input(event):
	if state.has_method("unhandled_key_input"):
		state.unhandled_key_input(event)

#What to do with teh persistent state?
#Reference it in every
