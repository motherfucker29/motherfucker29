extends State

class_name ChargeState
var charge_timer
var ch_multiplier
var fireball = preload("res://Fireball.tscn")

func _ready():
	animated_sprite.play("idle")
	charge_timer = Timer.new()
	get_parent().add_child(charge_timer)
	charge_timer.one_shot = true
	charge_timer.connect("timeout", self, "on_timeout")
	charge_timer.start(1.5)
	print("entered charge")

func _process(delta):
	if(Input.is_action_just_released("ui_accept")):
		if(!charge_timer.is_stopped()):
			ch_multiplier = (1 - (charge_timer.time_left / charge_timer.wait_time)) + 1
			print("charge_released " + str(ch_multiplier))
			charge_timer.stop()
		else:
			print("charge_released " + str(ch_multiplier))
		create_fireball()
		change_state.call_func("idle")

func create_fireball():
	var fire_ball = fireball.instance()
	var pos = get_parent().get_child(2)
	fire_ball.cha = ch_multiplier
	get_parent().add_child(fire_ball)
	fire_ball.global_position = pos.global_position
	print(str(pos.global_position) + " parent position " + str(fire_ball.global_position) + " fireball position" + str(fire_ball.get_parent().rotation)) 
	fire_ball.rotation = 0
	

func move_left():
	pass

func move_right():
	pass

func on_timeout():
	ch_multiplier = 2.75
