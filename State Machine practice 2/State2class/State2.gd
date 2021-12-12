extends Node


var fsm: StateMachine2
var animated_sprite
var persistent_state


func enter():
	print("Hello from State 1!")
	# Exit 2 seconds later
	yield(get_tree().create_timer(2.0), "timeout")
	exit("State22")

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	# Add handler code here
	return delta

func physics_process(delta):
	return delta

func input(event):
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event

func notification(what, flag = false):
	return [what, flag]
