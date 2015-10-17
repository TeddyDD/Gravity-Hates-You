extends Node

var music_pos = 1

var current_level # path to scene
var level_data = [
	{"name" :"Tutorial", "file": "res://levels/tutorial.xml", "time": null},
	{"name" :"First steps", "file": "res://scenes/level.xml", "time": null},
]

func _ready():
	load_level_data()
	
func finish(state, time):
	load_level_data()
	#if reset then reload
	if state == "reset":
		get_tree().change_scene(current_level)
	#if esc then load menu / level menu #TODO
	if state == "menu":
		get_tree().change_scene("res://scenes/select.xml")
	
	#if finished then save score and load next level
	if state == "finish":
		var file = ConfigFile.new()
		var err = file.load( "user://save.bin" )
		var l = get_current_level_data()
		file.set_value( l.name, "time", time )
		load_level_data()
		err = file.save( "user://save.bin" )
	pass
	
func get_current_level_data():
	for l in level_data:
			if l.file == current_level:
				return l

func load_level_data():

	var file = ConfigFile.new()
	var err = file.load( "user://save.bin" )
	if (err):
		file.save("user://save.bin")
	for level in level_data:
		prints( level.name )
		level.time =  file.get_value( level.name, "time" )