
extends Node2D


func _ready():
	set_process( true )
	
func _process(delta):
	if Input.is_action_pressed("ui_select") or Input.is_action_pressed("ui_accept"):
		to_menu()

func to_menu():
	get_tree().change_scene( "res://scenes/menu.xml" )
