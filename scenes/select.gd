
extends Node2D

var global

func _ready():
	global = get_node("/root/globals")
	for l in global.level_data:
		if !l.time:
			get_node("ItemList").add_item( l.name, load("res://textures/star_gs.png"))
		else:
			get_node("ItemList").add_item( l.name + " " + "Time: " + str(l.time), load("res://textures/star.png"))



func _on_Button_pressed():
	get_tree().change_scene( "res://scenes/menu.xml" )
