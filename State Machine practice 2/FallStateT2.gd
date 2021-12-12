extends StateT2

class_name FallStateT2

func enter():
	pass

func exit(next_state):
	velocity = Vector2.ZERO
	fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
	return delta


func physics_process(delta):
	if(persistent_state != null):
		if(persistent_state.is_on_floor()):
			move(delta)
			fsm.change_to("IdleStateT2")
			
			print("on floor")

func move(delta):
	if(h_input != 0):
		velocity.x += h_input * speed * delta
		velocity.x = clamp(velocity.x, -400, 400)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)

func input(event):
	process_hinput(event)

func unhandled_input(event):
	return event

func unhandled_key_input(event):
	return event

func notification(what, flag = false):
	return [what, flag]
