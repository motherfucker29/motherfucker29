extends Node

class_name StateT2


var fsm : StateMachine2
var animated_sprite
var persistent_state : KinematicBody2D
var velocity
var max_speed = 50
var gravity
var BASE_GRAVITY
var speed
var friction = 0.35
var h_input : int
var app_grav : bool = true

func setup(pstate, vel, sped, fric):
	# For the future I can just turn this into an array and then just loop through it
	self.persistent_state = pstate
	self.velocity = vel
	self.speed = sped
	self.friction = fric
	print("setup called")

func enter():
	pass

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	return delta

func physics_process(delta):
	return delta

func process_hinput(event):
	h_input = int(event.is_action_pressed("ui_right", true)) - int(event.is_action_pressed("ui_left", true))
	print(h_input)

func do_movement(delta):
	if(h_input != 0 or null):
		velocity.x += h_input * speed * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func _input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event

func notification(what, flag = false):
	return [what, flag]
	
#func apply_gravity(yes):
#	if(yes):
#		velocity.y += gravity
	
func manipulate_gravity(modifier_var):
	gravity = gravity + modifier_var

func reset_gravity():
	gravity = BASE_GRAVITY
	pass

#Stops player's y velocity basically stopping them from rising or falling
func reset_y_vel():
	velocity.y = 0
	pass

func reset_condition():
	#If this is true, reset state
	return null

