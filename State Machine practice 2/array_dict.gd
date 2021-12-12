extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var array_dict = {
	"dog":["basketball", 520],
	"aids":["Aldis", "nuts"],
}

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if(Input.is_action_just_pressed("ui_down")):
		print(array_dict["dog"])
	if(Input.is_action_just_pressed("ui_left")):
		print(array_dict["dog"][1])
	if(Input.is_action_just_pressed("ui_right")):
		print(array_dict["dog"][0])
	if(Input.is_action_just_pressed("ui_right")):
		print(array_dict["dog"][0])
func random_element(dict):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
