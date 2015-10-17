
extends Node2D

var global

func _ready():
	global = get_node("/root/globals")
	get_node("StreamPlayer").play(global.music_pos)
	for l in global.level_data:
		if !l.time:
			get_node("ItemList").add_item( l.name, load("res://textures/star_gs.png"))
		else:
			get_node("ItemList").add_item( l.name + " " + "Time: " + str(l.time), load("res://textures/star.png"))

func _exit_tree():
	global.music_pos = get_node("StreamPlayer").get_pos()

func _on_Button_pressed():
	get_tree().change_scene( "res://scenes/menu.xml" )

func _on_ItemList_item_selected( index ):
	get_node("loading").show()
	get_tree().change_scene( global.level_data[index].file )
