
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass




func _on_credits_pressed():
	get_node("credits_window").popup()

func _on_select_pressed():
	get_tree().change_scene( "res://scenes/select.xml" )


func _on_exit_pressed():
	get_tree().quit()
