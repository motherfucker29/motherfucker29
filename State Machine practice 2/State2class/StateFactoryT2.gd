class_name StateFactoryT2

#This class will manage and track all of the states an object has and their type
#I'll just instance the states as new on the player and manipulatea them by using the data from here to get that shit

var states = {
		"idle": [IdleStateT2, "ground"],
		"run": [MoveStateT2, "ground"],
		"jump": [JumpStateT2, "air" ],
		"fall": [FallStateT2, "air"]
}

func _init():
	states = {
		"idle": [IdleStateT2, "ground"],
		"run": [MoveStateT2, "ground"],
		"jump": [JumpStateT2, "air" ],
		"fall": [FallStateT2, "air"]
}

func get_state(state_name):
	if states.has(state_name):
		return states.get(state_name[0])
	else:
		printerr("No state ", state_name, " in state factory!")
