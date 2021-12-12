extends StateT2

class_name AirState
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Maybe add a bool to apply ygravity for on teh fly switching
func apply_gravity(yes):
	if(yes):
		velocity.y += gravity
	
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
#If state.get_class
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
