extends StateT2

class_name IdleStateT2


func enter():
	print("hi")
	print(velocity)
	if(persistent_state != null):
		print("kekw")
#If you want there to a be a process before exiting the state
func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	return delta

func physics_process(delta):
	if(persistent_state != null):
		if(!persistent_state.is_on_floor()):
			fsm.change_to("FallStateT2")
		if(h_input != 0):
			fsm.change_to("MoveStateT2")

func input(event):
	process_hinput(event)
	print(h_input)
	return event

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event
