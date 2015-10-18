
extends Area2D

var taken = false

func _ready():
	# Initialization here
	pass
	

func _on_Flag_body_enter( body ):
	var lvl = get_tree().get_current_scene()
	if (not taken and lvl.stars == 0 and body extends preload("res://scenes/Player2.gd")):
		get_node("anim").play("taken")
		get_node("SamplePlayer2D").play("Pickup_Flag")
		taken=true
		lvl.finish()
