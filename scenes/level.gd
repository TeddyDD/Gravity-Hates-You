
extends Node2D

var global

var time = 0.0
var stars = 0
var finished = false

var time_label
var stars_label


func _ready():
	global = get_node("/root/globals")
	time_label = get_node( "hud/time" )
	stars_label = get_node( "hud/stars")
	
	set_process( true )
	
	stars = get_tree().get_nodes_in_group( "star" ).size()
	global.current_level = get_filename()
	prints( get_filename() )
func _process(delta):
	if !finished:
		time += delta
		time_label.set_text( "Time: " + str(time) )
		stars_label.set_text( "Stars: " + str(stars) )
	if Input.is_action_pressed("reset"):
		prints("reset")
		global.finish( "reset", null)
	if Input.is_action_pressed("ui_cancel"):
		global.finish( "menu", null)
	#TODO If space and finished then next lvl
	
func finish():
	finished = true
	var l = global.get_current_level_data()
	if  l.time != null and time < l.time:
		global.finish("finish", time)
		get_node("hud/finished").show()
	elif l.time == null:
		global.finish("finish", time)
		get_node("hud/finished").show()
	else:
		get_node("hud/not_record").show()
		
#func set_stars(newvalue):
#	stars = newvalue
#	stars_label.set_text( stars )