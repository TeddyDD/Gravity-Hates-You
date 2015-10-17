
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


func _on_ItemList_item_activated( index ):
	get_tree().change_scene( global.level_data[index].file )
