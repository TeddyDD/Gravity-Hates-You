
extends Node2D


func _ready():
	pass

func _on_credits_pressed():
	get_node("credits_window").popup()

func _on_select_pressed():
	get_tree().change_scene( "res://scenes/select.xml" )


func _on_exit_pressed():
	get_tree().quit()
	

func _on_credits_buttorns_button_selected( button ):
	if button == 0:
		OS.shell_open( "http://2weeksgame.tumblr.com/" ) # website
	elif button == 1:
		OS.shell_open( "https://github.com/TeddyDD/Gravity-Hates-You" ) #repo url
	elif button == 2:
		OS.shell_open( "https://github.com/TeddyDD/Gravity-Hates-You/blob/master/LICENSE.md" ) #license url
