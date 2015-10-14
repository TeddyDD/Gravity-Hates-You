
extends Area2D

var taken = false

func _ready():
	# Initialization here
	pass

func _on_Area2D_body_enter( body ):
	if (not taken and body extends preload("res://scenes/Player2.gd")):
		get_node("anim").play("taken")
		taken=true


func _on_Flag_body_enter( body ):
	if (not taken and body extends preload("res://scenes/Player2.gd")):
		get_node("anim").play("taken")
		taken=true
