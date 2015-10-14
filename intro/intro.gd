
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	pass

func to_menu():
	get_tree().change_scene( "res://scenes/menu.xml" )

