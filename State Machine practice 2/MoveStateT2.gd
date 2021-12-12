extends StateT2

class_name MoveStateT2
var trans_speed_tresh = 0.0004


func enter_state():
	print("this happened" + name)

func exit(next_state):
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	return delta

func physics_process(delta):
	if(persistent_state != null):
		move(delta)

func move(delta):
	if(h_input != 0):
		velocity.x += h_input * speed * delta
		velocity.x = clamp(velocity.x, -400, 400)
	else:
		velocity.x += move_toward(velocity.x, 0, friction)

func input(event):
	process_hinput(event)

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event

func notification(what, flag = false):
	return [what, flag]
