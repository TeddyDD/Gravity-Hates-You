
extends Node2D

var global

func _ready():
	global = get_node("/root/globals")
	set_process( true )
	
func _process(delta):
	if Input.is_action_pressed("ui_select") or Input.is_action_pressed("ui_accept"):
		to_menu()

func to_menu():
	get_tree().change_scene( "res://scenes/menu.xml" )

func _exit_tree():
	prints("EXIT Tree", get_node("StreamPlayer").get_pos())
	global.music_pos = get_node("StreamPlayer").get_pos()
	