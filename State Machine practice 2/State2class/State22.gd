extends Node2D

var fsm: StateMachine2

func enter():
	print("Hello from State 2!")
	yield(get_tree().create_timer(2.0), "timeout")
	exit()

func exit():
	fsm.back()
