
extends Area2D

var taken = false

func _ready():
	pass
	
func _on_Flag_body_enter( body ):
	if (not taken and body extends preload("res://scenes/Player2.gd")):
		get_node("anim").play("taken")
		taken=true
		var lvl = get_tree().get_current_scene()
		lvl.stars -= 1
